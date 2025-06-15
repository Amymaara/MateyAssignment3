using DG.Tweening;
using Ink.Runtime;
using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using static GameStateManager;
using static UnityEditor.Progress;




// this code is a little scary, it combines aspects from a few online tutorials, as well as some adjustments i made


public class StoryManager : MonoBehaviour
{
    public static StoryManager Instance { get; private set; }

    [Header("UI Elements")]
    public GameObject dialoguePanel;
    public TMP_Text dialogueBox;
    public TMP_Text nameTag;
    public NameTagChange nameTagImage;
    public Button continueButton;
    public bool canContinue;
    public GridLayoutGroup choicesGrid;
    public Button choicePrefab;
    //public Canvas dialogueCanvas;
    public GameObject CGPanel;
    private bool waitingForContinue = false;

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
    public AffectionUI affectionUI;
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
        HandleRoomExampleScene();
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
        if (choicesGrid != null)
        {
            //choicesGrid.gameObject.SetActive(false);
        }
        if(affectionUI != null)
        {
            GetCurrentAffection();
            AffectionMeterSet(PearlAffectionOld, "Pearl");
            AffectionMeterSet(RoryAffectionOld, "Rory");
            AffectionMeterSet( RavynnAffectionOld, "Ravynn");
            AffectionMeterSet(ShadAffectionOld, "Shad");
           
        }
    }

    private void AffectionMeterSet(int affection, string name)
    {
        affectionUI.UpdateAffectionUI(name, affection);
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

    void Update()
    {
        if (waitingForContinue && Input.GetKeyDown(KeyCode.Space))
        {
            OnContinueButton(); // or whatever method you're already using
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


            if (speakerName != null && Pose != null )
            {
                if (speakerName.ToLower() == "master porthole")
                {
                    SpriteChange("Rory", Pose, Expression);
                }
                else
                {
                    SpriteChange(speakerName, Pose, Expression);
                }
                    
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
        waitingForContinue = false;
        dialogueBox.text = "";


        foreach (char letter in line.ToCharArray())
        {
            dialogueBox.text += letter;
            yield return new WaitForSeconds(typeSpeed);
        }
        waitingForContinue = true;
        continueButton.gameObject.SetActive(true);
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
        if (string.IsNullOrEmpty(expStr))
        {
            expStr = "Neutral"; // or any default
        }

        if (string.IsNullOrEmpty(speaker) || string.IsNullOrEmpty(poseStr) || string.IsNullOrEmpty(expStr))
        {
            Debug.LogWarning("SpriteChange called with null or empty values.");
            return;
        }

        if (!characterLookup.TryGetValue(speaker.ToLower(), out StoryCharacter character))
        {
            
            return;
        }
        switch (speaker.ToLower())
        {
            case "stu":
                if (character is StuCharacter stu &&
                    Enum.TryParse(poseStr, true, out StuCharacter.StuPose stuPose) &&
                    Enum.TryParse(expStr, true, out StoryCharacter.Expression stuExp))
                {
                    stu.SetSprite(stuPose, stuExp);
                }
                break;

            case "pearl":
                if (character is PearlCharacter pearl &&
                    Enum.TryParse(poseStr, true, out PearlCharacter.PearlPose pearlPose) &&
                    Enum.TryParse(expStr, true, out StoryCharacter.Expression pearlExp))
                {
                    pearl.SetSprite(pearlPose, pearlExp);
                }
                break;

            case "kraken":
                if (character is KrakenCharacter kraken &&
                    Enum.TryParse(poseStr, true, out KrakenCharacter.KrakenPose krakenPose) &&
                    Enum.TryParse(expStr, true, out KrakenCharacter.KrakenExpression krakenExp))
                {
                    kraken.SetSprite(krakenPose, krakenExp);
                }
                break;

            default:
                if (Enum.TryParse(poseStr, true, out StoryCharacter.Pose pose) &&
                    Enum.TryParse(expStr, true, out StoryCharacter.Expression exp))
                {
                    character.SetSprite(pose, exp);
                }
                break;
        }

    }


    /*
   Title: Unity Ink Audio Manager Integration via Tag Parsing
   Author: Adapted by ChatGPT (based on user-provided structure and YouTube tutorials by Stellar Studio)
   Date: 19 May 2025
   Code Version: Custom integration
   Availability: Based on concepts from:
   https://www.youtube.com/watch?v=mKVWQLXlfP0 (Episode 15  SFX in Visual Novels)

   Research Guides: Computer Science & Computer Engineering: Citing Programming Code. 2022
   */

    // Looks for audio related tags from the ink scrip
    void HandleTags(List<string> tags)
    {
        if (NewAudioManager.instance == null)
        {
            Debug.LogError("NewAudioManager is STILL NULL when HandleTags runs!");
            return;
        }

        foreach (string tag in tags)
        {
            if (tag.StartsWith("sfx_"))
                NewAudioManager.instance.PlaySFX(tag.Substring(4));
            else if (tag.StartsWith("music_"))
                NewAudioManager.instance.PlayMusic(tag.Substring(6));
            else if (tag == "music_stop")
                NewAudioManager.instance.StopMusic();
            else if (tag == "sfx_stop")
                NewAudioManager.instance.StopSFX();
        }
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
                nameTagImage.UpdateNameTag(speakerName);
                currentTalkingCharacter(speakerName);
            }

            else if (tag.StartsWith("speaker:"))
            {
                speakerName = tag.Substring("speaker:".Length).Trim();
                nameTag.text = speakerName;
                nameTagImage.UpdateNameTag(speakerName);
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
            
            else if (tag.StartsWith("activate:"))
            {
                string active = tag.Substring("activate:".Length).Trim();

                foreach (var item in charactersInScene.GetComponentsInChildren<StoryCharacter>())
                {
                    string imageName = item.GetDisplayName();

                    if (imageName.Equals(active, System.StringComparison.OrdinalIgnoreCase))
                    {
                        item.characterImage.DOFade(1f, 0.3f).SetEase(Ease.OutQuad); // make opaque
                    }
                }
            }

            else if (tag.StartsWith("disable:"))
            {
                string active = tag.Substring("disable:".Length).Trim();

                foreach (var item in charactersInScene.GetComponentsInChildren<StoryCharacter>())
                {
                    string imageName = item.GetDisplayName();

                    if (imageName.Equals(active, System.StringComparison.OrdinalIgnoreCase))
                    {
                        item.characterImage.DOFade(0f, 0.3f).SetEase(Ease.OutQuad); // make invisible
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
        

            if (GameStateManager.CurrentState == gameState.Argument || GameStateManager.CurrentState == gameState.Argument2)
        {
            foreach (var item in charactersInScene.GetComponentsInChildren<StoryCharacter>())
            {
                string imageName = item.characterName;

                if (imageName.Equals(CurrentSpeaker, System.StringComparison.OrdinalIgnoreCase))
                {
                    if (imageName != "Stu")
                    {
                        item.characterImage.transform.DOScale(new Vector3(BigWidth, BigWidth, 1f), 0.3f).SetEase(Ease.OutQuad);
                    }
                    
                }
                else
                {
                    if (imageName != "Stu")
                    {
                        item.characterImage.transform.DOScale(new Vector3(SmallWidth, SmallWidth, 1f), 0.3f).SetEase(Ease.OutQuad);
                    }
                        
                }
            }
        }
        /*
        else if (GameStateManager.CurrentState == gameState.Day0 || GameStateManager.CurrentState == gameState.Day1 || GameStateManager.CurrentState == gameState.Day2)
        {
            foreach (var item in charactersInScene.GetComponentsInChildren<StoryCharacter>())
            {
                string imageName = item.GetDisplayName();

                    item.characterImage.transform.DOScale(new Vector3(BigWidth, BigWidth, 1f), 0.3f).SetEase(Ease.OutQuad);
                
            }
        }
        */

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
        //choicesGrid.gameObject.SetActive(true);
        choicesGrid.enabled = true;
        RemoveChoices();
        continueButton.gameObject.SetActive(false);

        GetCurrentAffection();
        TagHandler();

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

        Debug.Log($"[Affection - NEW] Pearl: {PearlAffectionNew}, Rory: {RoryAffectionNew}, Ravynn: {RavynnAffectionNew}, Shad: {ShadAffectionNew}");
       
         // Get this reference in advance
       
        AffectionCompare(PearlAffectionNew, PearlAffectionOld, "Pearl");
        AffectionCompare(RoryAffectionNew, RoryAffectionOld, "Rory");

        AffectionCompare(RavynnAffectionNew, RavynnAffectionOld, "Ravynn");
        AffectionCompare(ShadAffectionNew, ShadAffectionOld, "Shad");
    }

    private void AffectionCompare(int newVal, int oldVal, string characterName)
    {
        
        if (newVal == oldVal)
        {
            // idk

        }
        else
        {
            bool increased = newVal > oldVal;
            
            PlayCharacterParticle(characterName, increased);

            affectionUI.UpdateAffectionUI(characterName, newVal);
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
        TagHandler();
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
        var dialogueAnimation = dialoguePanel.GetComponent<UIPanelAnimation>();
        dialogueAnimation.SlideOutAndDisable();
        //dialoguePanel.SetActive(false);
        continueButton.gameObject.SetActive(false);
        variablesInDialogue.SaveVariables();

        //CheckAffectionChange();



        foreach (Transform child in charactersInScene.transform)
        {
            if (child.gameObject.name != "Stu")
            {
                child.DOScale(new Vector3(SmallWidth, SmallWidth, 1f), 0.3f).SetEase(Ease.OutQuad);
            }
                
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

    // used when getting the player name from the input
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

    private bool isSkipping = false;

    public void OnSkipButton()
    {
        //StopAllCoroutines(); 
        // EndStory();
        if (!isSkipping)
        {
            StartCoroutine(SkipToNextChoice());
        }
    }

    private IEnumerator SkipToNextChoice()
    {
        GetCurrentAffection();
        isSkipping = true;
        continueButton.gameObject.SetActive(false);
        

        // Stop typewriter effect mid-line, if needed
        //isTyping = false;

        while (runningStory.canContinue && runningStory.currentChoices.Count == 0)
        {
            string nextLine = runningStory.Continue();
            dialogueBox.text = nextLine;
            yield return null; // just wait a frame
        }

        if (runningStory.currentChoices.Count > 0)
        {
            CheckAffectionChange();
            ShowChoices();
        }
        else if (!runningStory.canContinue)
        {
            CheckAffectionChange();
            EndStory();
        }
        
        isSkipping = false;
        continueButton.gameObject.SetActive(true);
    }

}