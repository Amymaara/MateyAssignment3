using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;
using UnityEngine.UIElements;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using Unity.VisualScripting;


public class ScriptReader : MonoBehaviour

{
    // Rivertune games tutorial
    [SerializeField]
    private TextAsset inkFile;
    private Ink.Runtime.Story script;

    // Dialogue box
    public GameObject dialoguePanel;
    public TMP_Text dialogueBox;
    public TMP_Text nameTag;

    // inputs
    public bool clicked;

    // Object (room system)
    public UnityEngine.UI.Image roomObject;
    public UnityEngine.UI.Button ContinueButton;

    // Displaying text after dialogue is finished 
    public string postDialogue;
    private int clickCounter = 0;


    // For handling choices
    [SerializeField]
    private GridLayoutGroup Choices;

    [SerializeField]
    private UnityEngine.UI.Button choicePrefab;



    private void Start()
    {
        LoadStory();

        dialoguePanel.SetActive(false);
        clicked = false;



    }

    public void OnItemClick()
    {

        print("clicked");
        clicked = true;
        clickCounter++;

        removeTrigger(roomObject);

        DisplayNextLine();
        dialoguePanel.SetActive(true);
        ContinueButton.gameObject.SetActive(true);


    }

    // chatgpt
    public void removeTrigger(UnityEngine.UI.Image Object)
    {
        EventTrigger trigger = Object.GetComponent<EventTrigger>();
        if (trigger != null) // makes sure there is an event
        {
            trigger.enabled = false;
            Debug.Log("EventTrigger disabled.");
        }
    }

    // chatgpt
    public void addTrigger(UnityEngine.UI.Image Object)
    {
        EventTrigger trigger = Object.GetComponent<EventTrigger>();
        if (trigger != null)
        {
            trigger.enabled = true;
            Debug.Log("EventTrigger re-enabled.");
        }
    }


    public void LoadStory()
    {
        script = new Story(inkFile.text);
        //script.BindExternalFunction("Name", (string charName) => ChangeName(charName));

    }

    public void NoText()
    {
        dialogueBox.text = "";
        dialoguePanel.SetActive(false);
        ContinueButton.gameObject.SetActive(false);
        addTrigger(roomObject);
        roomObject.rectTransform.localScale = new Vector3(1, 1, 1);
    }

    public void DisplayNextLine()
    {
        if (clickCounter >= 1)
        {
            if (script.canContinue) // checks if there is more dialogue
            {
                string text = script.Continue(); // gets line
                List<string> currentTags = script.currentTags;

                text = text?.Trim(); // remove white space
                dialogueBox.text = text; // display text


                // find a reference
                foreach (string tag in currentTags)
                {
                    if (tag.StartsWith("speaker:"))
                    {
                        string speakerName = tag.Substring("speaker:".Length).Trim();
                        // Use this to update UI
                        Debug.Log("The Speaker is " + speakerName);

                        nameTag.text = speakerName;
                    }
                }

            }
            else if (script.currentChoices.Count > 0)
            {
                ShowChoices();
            }
            else
            {

                NoText();
            }
        }
        else
        {
            if (dialoguePanel.activeInHierarchy)

            {
                NoText();


            }
            else
            {
                dialogueBox.text = postDialogue;

            }


        }
    }

    // rivertune tutorial on choices
    private void ShowChoices()
    {
        if (Choices.GetComponentsInChildren<UnityEngine.UI.Button>().Length > 0) return; // check if there are buttons

        for (int i = 0; i < script.currentChoices.Count; i++)
        {
            var choice = script.currentChoices[i];
            var button = ChoiceButtonCreate(choice.text); // creates choice button

            button.onClick.AddListener(() => OnChoiceClick(choice));
        }
    }

    //Rivertune
    UnityEngine.UI.Button ChoiceButtonCreate(string text)
    {
        // adds the button prefab to the grid layout
        var choiceButton = Instantiate(choicePrefab);
        choiceButton.transform.SetParent(Choices.transform, false);

        // changes choice button text
        var buttonText = choiceButton.GetComponentInChildren<TMP_Text>();
        buttonText.text = text;

        return choiceButton;
    }

    //rivertune
    void OnChoiceClick(Choice choice)
    {
        script.ChooseChoiceIndex(choice.index);
        RemoveChoices();
        DisplayNextLine();
    }

    void RemoveChoices()
    {
        if (Choices != null)
        {
            foreach (var button in Choices.GetComponentsInChildren<UnityEngine.UI.Button>())
            {
                Destroy(button.gameObject);
            }
        }
    }
        

  
}
