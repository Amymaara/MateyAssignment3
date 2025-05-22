using UnityEngine;
using TMPro;
using UnityEngine.UI;
using Ink.Runtime;
using System.Collections.Generic;
using UnityEngine.EventSystems;
using Unity.VisualScripting;
using UnityEngine.SceneManagement;
using System.Runtime.CompilerServices;
using UnityEngine.Rendering;
using System;
using System.Collections;
using System.Linq;
using DG.Tweening;

using static Unity.VisualScripting.Member;
using static GameStateManager;


// this code is a little scary, it combines aspects from a few online tutorials, as well as some adjustments i made


public class StoryManager : MonoBehaviour
{
    public static StoryManager Instance { get; private set; }

    [Header("UI Elements")]
    public GameObject dialoguePanel;
    public TMP_Text dialogueBox;
    public TMP_Text nameTag;
    public Button continueButton;
    public bool canContinue;
    public GridLayoutGroup choicesGrid;
    public Button choicePrefab;
    //public Canvas dialogueCanvas;
    public GameObject CGPanel;

    [Header("Story Objects")]
    public Story runningStory;
    public event Action<string> OnStoryEnd;
    public string storyID;
    public float typeSpeed;
    private Coroutine displayLineCouroutine;
    private bool cv;

    [Header("Character Handling")]
    public float BigWidth = 1.4f;
    public float SmallWidth = 1.2f;
    private StoryItem RoomObject;
    public GameObject charactersInScene;
    private Dictionary<string, StoryCharacter> characterLookup = new Dictionary<string, StoryCharacter>();
    string speakerName = "???";
    //[SerializeField] private Animator animator;



    [Header("Global Variable Handling")]
    [SerializeField] public DialogueVariables variablesInDialogue { get; private set; }
    [SerializeField] private TextAsset loadGlobalsFile;
   



    // Title: How to persist variables across multiple Ink stories (Variable Observer) | Unity + Ink tutorial
    // Author: Shaped by Rain Studios
    // Date: 8 December 2021
    // Code Version: ?
    // Avaliability: https://www.youtube.com/watch?v=fA79neqH21s&list=PL3viUl9h9k78KsDxXoAzgQ1yRjhm7p8kl&index=5 
    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
        if (loadGlobalsFile != null)
        {
            variablesInDialogue = new DialogueVariables(loadGlobalsFile);
        }
        else
        {
            Debug.LogError("Globals file is missing!");
        }

        foreach (var character in charactersInScene.GetComponentsInChildren<StoryCharacter>(true))
        {
            characterLookup[character.characterName.ToLower()] = character;
        }

        //DontDestroyOnLoad(gameObject);
        //DontDestroyOnLoad(dialogueCanvas.gameObject);
    }

    private void OnEnable()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    private void OnDisable()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    // determines what the state of the dialogue system should be when a new scene is loaded in.
    private void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        if (scene.name.StartsWith("Captains Room"))
        {
            HandleIntroScene();
        }
        else 
        {
            HandleRoomExampleScene();
        }
    }

    //start state of intro scene
    private void HandleIntroScene()
    {
        if (dialoguePanel != null)
        {
            dialoguePanel.SetActive(true);

        }

        if (CGPanel != null)
        {
            CGPanel.SetActive(true);

        }

        
        runningStory = null;

        if (continueButton != null)
        {
            continueButton.gameObject.SetActive(true);
            continueButton.onClick.RemoveAllListeners();

        }

        if (charactersInScene == null)
        {
            charactersInScene = GameObject.Find("CharactersInScene");
            
        }
    }

    //start state of all other scenes (for now), can add more cases if needed
    private void HandleRoomExampleScene()
    {

        if (dialoguePanel != null)
        {
            dialoguePanel.SetActive(false);

        }

        if (CGPanel != null)
        {
            CGPanel.SetActive(false);

        }

        
        runningStory = null;

        if (continueButton != null)
        {
            continueButton.gameObject.SetActive(false);
            continueButton.onClick.RemoveAllListeners();

        }

        //if (charactersInScene == null)
        //{
           // charactersInScene = GameObject.Find("CharactersInScene");
        //}

        
    }

    // for in the rooms/clicking
    public void StartStory(TextAsset inkJSON, StoryItem item)
    {
        runningStory = new Story(inkJSON.text);
        RoomObject = item;
       if(item.itemID == "CV")
        {
            cv = true;
            storyID = item.itemID;
        }
        else
        {
            cv = false;
            storyID = null;
        }
           


        variablesInDialogue.StartListening(runningStory);
        dialoguePanel.SetActive(true);
        continueButton.gameObject.SetActive(true);
    
        DisplayNextLine();
    }

    // for other types of dialogue
    public void StartStory(TextAsset inkJSON, string storyName)
    {
        runningStory = new Story(inkJSON.text);
        storyID = storyName;
        cv = false;
      
        variablesInDialogue.StartListening(runningStory);
        dialoguePanel.SetActive(true);
        continueButton.gameObject.SetActive(true);

        DisplayNextLine();
    }

    //what happens when the player presses the continue button
    public void OnContinueButton()
    {
        Debug.Log("Continue button pressed");
            if (runningStory != null)
            {
                if (cv)
                {
                RoomObject.ShowNextPopupImage();
                }
                DisplayNextLine();
            }
    }

    // watched two videos on this one and merged them to work for our game
    
    // Title: (Part 1) Dialogue: Unity Visual Novel.
    // Author: Rivertune Games
    // Date: 4 November 2021
    // Code Version: ?
    // Avaliability: https://www.youtube.com/watch?v=oxxF05hy2E4&list=PL3437trshXv_w0GW7bqzgbDqmOkl9htiw&index=11

    // Title: Unity typing text effect for dialogue | Unity tutorial
    // Author: Shaped by Rain Studios
    // Date: 15 November 2021
    // Code Version: ?
    // Avaliability: https://www.youtube.com/watch?v=2I92egFvC80&list=PL3viUl9h9k78KsDxXoAzgQ1yRjhm7p8kl&index=4
    
    //displays the next line in the dialogue
    private void DisplayNextLine()
    {
        if (runningStory == null)
        {
            Debug.Log("there is no story");
            return;
        }

        if (runningStory.canContinue)
        {
            GetCurrentAffection();
            if (displayLineCouroutine != null)
            {
                StopCoroutine(displayLineCouroutine);
            }

           

            displayLineCouroutine = StartCoroutine(TypeEffect(runningStory.Continue()));
            
            CheckAffectionChange();

            TagHandler();

            // Handles audio tags
            HandleTags(runningStory.currentTags);

            

            if (speakerName != null && Pose != null && Expression != null)
            {
                SpriteChange(speakerName, Pose, Expression);
            }
        }
        else if (runningStory.currentChoices.Count > 0)
        {
            Debug.Log("showing choices");
            ShowChoices();
        }
        else
        {
            Debug.Log("story ended");
            EndStory();
        }

        // Handles audio tags
        //HandleTags(runningStory.currentTags);

    }

    

    /*
    Title: Unity Ink Character Sprite Management via Tag Parsing and Enum Mapping
    Author: Adapted by ChatGPT (based on user-provided structure and YouTube tutorials by Shaped by Rain Studios)
    Date: 19 May 2025
    Code Version: Custom integration
    Availability: Based on concepts from:
    https://www.youtube.com/watch?v=tVrxeUIEV9E (Ink Tags Tutorial)
    https://www.youtube.com/watch?v=2I92egFvC80 (Typewriter Text Tutorial)

    Research Guides: Computer Science & Computer Engineering: Citing Programming Code. 2022
    */
    private void SpriteChange(string speaker, string poseStr, string expStr)
    {
        if (string.IsNullOrEmpty(speaker) || string.IsNullOrEmpty(poseStr) || string.IsNullOrEmpty(expStr))
        {
            Debug.LogWarning("SpriteChange called with null or empty values.");
            return;
        }

        if (!characterLookup.TryGetValue(speaker.ToLower(), out StoryCharacter character))
        {
            Debug.LogWarning($"Character '{speaker}' not found in scene.");
            return;
        }

        if (System.Enum.TryParse(poseStr, true, out StoryCharacter.Pose pose) &&
            System.Enum.TryParse(expStr, true, out StoryCharacter.Expression expression))
        {
            character.SetSprite(pose, expression);
        }
        else
        {
            Debug.LogWarning($"Failed to parse pose or expression: Pose='{poseStr}', Expression='{expStr}'");
        }
    }


    /*
   Title: Unity Ink Audio Manager Integration via Tag Parsing
   Author: Adapted by ChatGPT (based on user-provided structure and YouTube tutorials by Stellar Studio)
   Date: 19 May 2025
   Code Version: Custom integration
   Availability: Based on concepts from:
   https://www.youtube.com/watch?v=mKVWQLXlfP0 (Episode 15 – SFX in Visual Novels)

   Research Guides: Computer Science & Computer Engineering: Citing Programming Code. 2022
   */

    void HandleTags(List<string> tags)
    {
        foreach (string tag in tags)
        {
            if (tag.StartsWith("sfx_"))
                AudioManager.instance.PlaySFX(tag.Substring(4));

            else if (tag.StartsWith("music_"))
                AudioManager.instance.PlayMusic(tag.Substring(6));

            else if (tag == "music_stop")
                AudioManager.instance.StopMusic();
        }
    }


    //Types out letters one at a time
    // Title: Unity typing text effect for dialogue | Unity tutorial
    // Author: Shaped by Rain Studios
    // Date: 15 November 2021
    // Code Version: ?
    // Avaliability: https://www.youtube.com/watch?v=2I92egFvC80&list=PL3viUl9h9k78KsDxXoAzgQ1yRjhm7p8kl&index=4 

        //Types out letters one at a time
    private IEnumerator TypeEffect(string line)
    {
        typeSpeed = PlayerPrefs.GetFloat("typeSpeed", 0.4f); // default if not set
        continueButton.gameObject.SetActive(false);
        dialogueBox.text = "";
        

        foreach (char letter in line.ToCharArray())
        {
            dialogueBox.text += letter;
            yield return new WaitForSeconds(typeSpeed);
        }
        continueButton.gameObject.SetActive(true);
    }

    

    // Title: Unity2D Dialogue System - Names, Portraits, and Layouts using Ink Tags | Unity + Ink tutorial
    // Author: Shaped by Rain Studios
    // Date: 21 October 2021
    // Code Version: ?
    // Avaliability: https://www.youtube.com/watch?v=tVrxeUIEV9E&list=PL3viUl9h9k78KsDxXoAzgQ1yRjhm7p8kl&index=3

    string Pose;
    string Expression;
    //determines what to do based on the tag that is read in from the unity file
    private void TagHandler()
    {
        // Handle tags like speaker
        foreach (string tag in runningStory.currentTags)
        {
            if (tag.StartsWith("Speaker:"))
            {
                speakerName = tag.Substring("speaker:".Length).Trim();
                nameTag.text = speakerName;
                currentTalkingCharacter(speakerName);
            }

            else if (tag.StartsWith("speaker:"))
            {
                speakerName = tag.Substring("speaker:".Length).Trim();
                nameTag.text = speakerName;
                currentTalkingCharacter(speakerName);
            }

            else if (tag.StartsWith("pose:"))
            {
                Pose = tag.Substring("pose:".Length).Trim();
            }

            else if (tag.StartsWith("expression:"))
            {
                Expression = tag.Substring("expression:".Length).Trim();
            }

            else if (tag.StartsWith("CGPanel:"))
            {
                string cg = tag.Substring("CGPanel:".Length).Trim();
                bool cgBool = Convert.ToBoolean(cg);
                if (cgBool)
                {
                    CGPanel.SetActive(true);
                }
                else
                {
                    CGPanel.SetActive(false);
                }
            }
            //else if (tag.StartsWith("animation:"))
            // {
            //string animation = tag.Substring("animation:".Length).Trim();
            //animator = charactersInScene.GetComponent<Animator>();
            //animator.Play(animation);

            //}
            else if (tag.StartsWith("activate:"))
            {
                string active = tag.Substring("activate:".Length).Trim();

                foreach (var item in charactersInScene.GetComponentsInChildren<Image>())
                {
                    string imageName = item.gameObject.name;

                    if (item.name.Equals(active, System.StringComparison.OrdinalIgnoreCase))
                    {
                        item.gameObject.SetActive(true);
                    }

                }

            }
            
        }
    }



    

    public int GetIntVar(string nameOfVariable)
    {
        Ink.Runtime.Object varObject = GetVarState(nameOfVariable);

        if (varObject == null)
        {
            Debug.LogWarning($"Variable '{nameOfVariable}' was null.");
            return 0; 
        }

        if (varObject is Ink.Runtime.IntValue intValue)
        {
            return intValue.value;
        }
        else
        {
            Debug.LogWarning($"Variable '{nameOfVariable}' is not an int. Actual type: {varObject.GetType()}");
            return 0; 
        }
    }

    // makes the character that is currently talking bigger
    private void currentTalkingCharacter(string CurrentSpeaker)
    {
        if (GameStateManager.CurrentState == gameState.Argument)
        {
            foreach (var item in charactersInScene.GetComponentsInChildren<Image>())
            {
                string imageName = item.gameObject.name;

                if (imageName.Equals(CurrentSpeaker, System.StringComparison.OrdinalIgnoreCase))
                {
                    item.transform.DOScale(new Vector3(BigWidth, BigWidth, 1f), 0.3f).SetEase(Ease.OutQuad);
                }
                else
                {
                    item.transform.DOScale(new Vector3(SmallWidth, SmallWidth, 1f), 0.3f).SetEase(Ease.OutQuad);
                }
            }
        }
        
       
    }

    /*
VAR Pearl_Affection = 0
VAR Shad_Affection = 0
VAR Rory_Affection = 0
VAR Ravynn_Affection = 0
get varstate(nameofvariable)
*/
    int PearlAffectionNew;
    int PearlAffectionOld;
    int RoryAffectionNew;
    int RoryAffectionOld;
    int RavynnAffectionNew;
    int RavynnAffectionOld;
    int ShadAffectionNew;
    int ShadAffectionOld;
    // will optimize for the final

    

    // Title: (Part 3) Choices: Unity Visual Novel.
    // Author: Rivertune Games
    // Date: 16 February 2022
    // Code Version: ?
    // Avaliability:https://www.youtube.com/watch?v=aBZvivlq4vY&list=PL3O3s_uSvQxGcUR2E6vjxBTWqA-xT05AK&index=5
    private void ShowChoices()
    {

        RemoveChoices();
        continueButton.gameObject.SetActive(false);

        GetCurrentAffection();

        foreach (Choice choice in runningStory.currentChoices)
        {
            var choiceButton = Instantiate(choicePrefab, choicesGrid.transform);
            choiceButton.GetComponentInChildren<TMP_Text>().text = choice.text;
            choiceButton.onClick.AddListener(() => OnChoiceSelected(choice));
        }
    }

    

    private void GetCurrentAffection()
    {
        PearlAffectionOld = GetIntVar("Pearl_Affection");
        RoryAffectionOld = GetIntVar("Rory_Affection");
        RavynnAffectionOld = GetIntVar("Ravynn_Affection");
        ShadAffectionOld = GetIntVar("Shad_Affection");
    }

   

    private void CheckAffectionChange()
    {
        PearlAffectionNew = GetIntVar("Pearl_Affection");
        RoryAffectionNew = GetIntVar("Rory_Affection");
        RavynnAffectionNew = GetIntVar("Ravynn_Affection");
        ShadAffectionNew = GetIntVar("Shad_Affection");

        AffectionCompare(PearlAffectionNew, PearlAffectionOld, "Pearl");
        AffectionCompare(RoryAffectionNew, RoryAffectionOld, "Master Porthole");
        AffectionCompare(RavynnAffectionNew, RavynnAffectionOld, "Ravynn");
        AffectionCompare(ShadAffectionNew, ShadAffectionOld, "Shad");
    }

    private void AffectionCompare(int newVal, int oldVal, string characterName)
    {
        if (newVal == oldVal)
        {
            Debug.Log($"{characterName} affection stayed the same");
        }
        else
        {
            bool increased = newVal > oldVal;
            Debug.Log($"{characterName} affection {(increased ? "increased" : "decreased")}");
            PlayCharacterParticle(characterName, increased);
        }
    }



    private void PlayCharacterParticle(string characterName, bool isPositive)
    {
        StoryCharacter[] characters = charactersInScene.GetComponentsInChildren<StoryCharacter>();

        foreach (StoryCharacter character in characters)
        {
            if (character.characterName.Equals(characterName, System.StringComparison.OrdinalIgnoreCase))
            {
                character.PlayAffectionChange(isPositive);
                return;
            }
        }

        Debug.LogWarning("StoryCharacter not found: " + characterName);
    }

    // Title: (Part 3) Choices: Unity Visual Novel.
    // Author: Rivertune Games
    // Date: 16 February 2022
    // Code Version: ?
    // Avaliability:https://www.youtube.com/watch?v=aBZvivlq4vY&list=PL3O3s_uSvQxGcUR2E6vjxBTWqA-xT05AK&index=5
    private void OnChoiceSelected(Choice choice)
    {

        runningStory.ChooseChoiceIndex(choice.index);
        continueButton.gameObject.SetActive(true);
        RemoveChoices();
        CheckAffectionChange();
        if (runningStory.canContinue)
        {
            DisplayNextLine();
        }
    }


    // Title: (Part 3) Choices: Unity Visual Novel.
    // Author: Rivertune Games
    // Date: 16 February 2022
    // Code Version: ?
    // Avaliability:https://www.youtube.com/watch?v=aBZvivlq4vY&list=PL3O3s_uSvQxGcUR2E6vjxBTWqA-xT05AK&index=5
    private void RemoveChoices()
    {
        foreach (var button in choicesGrid.GetComponentsInChildren<Button>())
        {
            Destroy(button.gameObject);
        }
    }


    private void EndStory()
    {
        dialogueBox.text = "";
        dialoguePanel.SetActive(false);
        continueButton.gameObject.SetActive(false);
        variablesInDialogue.SaveVariables();
        foreach (Transform child in charactersInScene.transform)
        {
            child.DOScale(new Vector3(SmallWidth, SmallWidth, 1f), 0.3f).SetEase(Ease.OutQuad);
        }
        
        if (RoomObject != null)
        {
            RoomObject.addTrigger();
            RoomObject.itemImage.transform.localScale = new Vector3(1, 1, 1);
            if (RoomObject.popupPanel != null)
            {
                var panelAnimation = RoomObject.popupPanel.GetComponent<UIPanelAnimation>();
                if (panelAnimation != null)
                {
                    panelAnimation.SlideOutAndDisable();
                }
            }
            RoomObject = null; 
        }

     

        if (storyID != null)
        {
            Debug.Log(storyID + "is ending");
            OnStoryEnd?.Invoke(storyID);

        }

        if (runningStory != null && variablesInDialogue != null)
        {
            variablesInDialogue.StopListening(runningStory);
        }

        runningStory = null;
        storyID = null;

    }


    // Title: How to persist variables across multiple Ink stories (Variable Observer) | Unity + Ink tutorial
    // Author: Shaped by Rain Studios
    // Date: 8 December 2021
    // Code Version: ?
    // Avaliability: https://www.youtube.com/watch?v=fA79neqH21s&list=PL3viUl9h9k78KsDxXoAzgQ1yRjhm7p8kl&index=5 

    //this code also isnt being used at the moment, but maybe in further versions.
    public Ink.Runtime.Object GetVarState(string nameOfVariable)
    {
        Ink.Runtime.Object valueOfVariable = null;
        variablesInDialogue.variables.TryGetValue(nameOfVariable, out valueOfVariable);
        if (valueOfVariable == null)
        {
            Debug.LogWarning(nameOfVariable + "is null");
        }
        return valueOfVariable;
    }

    // used when getting the player name from the inpu
    public void SetVarState(string nameOfVariable, object value)
    {
        if (variablesInDialogue == null)
        {
            Debug.LogError("GlobalVariables not initialized when trying to set: " + name);
            return;
        }
        if (variablesInDialogue.variables.ContainsKey(nameOfVariable))
        {
            variablesInDialogue.variables[nameOfVariable] = Ink.Runtime.Value.Create(value);
        }
        if (runningStory != null)
        {
            runningStory.variablesState.SetGlobal(name, Ink.Runtime.Value.Create(value));
        }
    }



    //Allows other scripts to access current ink Story
    public Story GetStory()
    {
        return runningStory;
    }

}