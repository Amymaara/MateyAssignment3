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
    

    [Header("Character Handling")]
    public float BigWidth = 1.4f;
    public float SmallWidth = 1.2f;
    private StoryItem RoomObject;
    public GameObject charactersInScene;
    string speakerName = "???";
    //[SerializeField] private Animator animator;



    [Header("Global Variable Handling")]
    [SerializeField] public DialogueVariables variablesInDialogue;
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
        storyID = null;

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
           if (displayLineCouroutine != null)
            {
                StopCoroutine(displayLineCouroutine);
            }
            displayLineCouroutine = StartCoroutine(TypeEffect(runningStory.Continue()));
            
            TagHandler();
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
        
        continueButton.gameObject.SetActive(false);
        dialogueBox.text = "";
        

        foreach (char letter in line.ToCharArray())
        {
            dialogueBox.text += letter;
            yield return new WaitForSeconds(typeSpeed);
        }
        continueButton.gameObject.SetActive(true);
    }

    //public Slider TextSpeedSlider;
    void Start()

    {
       //if (PlayerPrefs.HasKey("typeSpeed"))
       //     LoadTextSpeed();
       // else
        //    {
        //        PlayerPrefs.SetFloat("typeSpeed", 0.4f);
         //   }
    }

    //public void SetTextSpeed()
    //{
    //    typeSpeed = TextSpeedSlider.value;
    //    SaveTextSpeed();
    //}

   // public void SaveTextSpeed()
    //{
    //    PlayerPrefs.SetFloat("typeSpeed", TextSpeedSlider.value);
    //}

   // public void LoadTextSpeed()
   // {
   //     TextSpeedSlider.value = PlayerPrefs.GetFloat("typeSpeed");
   // }

    // Title: Unity2D Dialogue System - Names, Portraits, and Layouts using Ink Tags | Unity + Ink tutorial
    // Author: Shaped by Rain Studios
    // Date: 21 October 2021
    // Code Version: ?
    // Avaliability: https://www.youtube.com/watch?v=tVrxeUIEV9E&list=PL3viUl9h9k78KsDxXoAzgQ1yRjhm7p8kl&index=3

    //determines what to do based on the tag that is read in from the unity file
    private void TagHandler()
    {
        // Handle tags like speaker
        foreach (string tag in runningStory.currentTags)
        {
            if (tag.StartsWith("speaker:"))
            {
                speakerName = tag.Substring("speaker:".Length).Trim();
                nameTag.text = speakerName;
                currentTalkingCharacter(speakerName);
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

    // makes the character that is currently talking bigger
    private void currentTalkingCharacter(string CurrentSpeaker)
    {
        foreach( var item in charactersInScene.GetComponentsInChildren<Image>())
        {
            string imageName = item.gameObject.name;

            if (imageName.Equals(CurrentSpeaker, System.StringComparison.OrdinalIgnoreCase))
            {
                
                item.transform.localScale = new Vector3(BigWidth, BigWidth, 1f); // Makes image larger Slightly bigger
                

            }
            else
            {
                // Dim or normalize other characters
                item.transform.localScale = new Vector3(SmallWidth, SmallWidth, 1f);
                
            }
        }
       
    }



    // Title: (Part 3) Choices: Unity Visual Novel.
    // Author: Rivertune Games
    // Date: 16 February 2022
    // Code Version: ?
    // Avaliability:https://www.youtube.com/watch?v=aBZvivlq4vY&list=PL3O3s_uSvQxGcUR2E6vjxBTWqA-xT05AK&index=5
    private void ShowChoices()
    {

        RemoveChoices();
        continueButton.gameObject.SetActive(false);

        foreach (Choice choice in runningStory.currentChoices)
        {
            var choiceButton = Instantiate(choicePrefab, choicesGrid.transform);
            choiceButton.GetComponentInChildren<TMP_Text>().text = choice.text;
            choiceButton.onClick.AddListener(() => OnChoiceSelected(choice));
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
  

        if (RoomObject != null)
        {
            RoomObject.addTrigger();
            RoomObject.itemImage.transform.localScale = new Vector3(1, 1, 1);
            if (RoomObject.popupPanel != null)
            {
                RoomObject.popupPanel.SetActive(false);
            }
            RoomObject = null; 
        }

        

        if (storyID != null)
        {
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
        if (variablesInDialogue.variables.ContainsKey(nameOfVariable))
        {
            variablesInDialogue.variables[nameOfVariable] = Ink.Runtime.Value.Create(value);
        }
    }

    //Allows other scripts to access current ink Story
    public Story GetStory()
    {
        return runningStory;
    }

}