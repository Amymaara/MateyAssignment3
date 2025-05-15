using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;
using Ink.Runtime;
using Unity.VisualScripting;
using UnityEngine.UI;
using TMPro;
using UnityEngine.EventSystems;


// this is the sequence of events for the Captains Room
public class CaptainsRoomSequence : MonoBehaviour
{
    [Header("Ink Files")]
    [SerializeField] private TextAsset First; 
    [SerializeField] private TextAsset Second;
    [SerializeField] private TextAsset Third;


    [Header("Game Objects")]
    [SerializeField] private GameObject NamePanel; //player name input window
    public Sprite[] CvList; //list of Cvs
    [SerializeField] private GameObject CVS;
    [SerializeField] private GameObject CVImage;
    [SerializeField] private GameObject Book;
    [SerializeField] private Button settings;

    private int currentCV = 0;

    private void Start()
    {
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds; // add listener for a story ending
        StoryManager.Instance.StartStory(First, "First"); // load first ink file, will start up dialogue system
        NamePanel.SetActive(false); //hide name input window
        CVS.SetActive(false); //hide cvs panel
        RemoveTrigger(Book); //make book non clickable
        settings = GameObject.Find("Settings icon").GetComponent<Button>();
        settings.enabled = true;
        settings.interactable = true;

    }

    // Makes all items in a game objects children, non interactable
    private void RemoveTrigger(GameObject obj)
    {
        // goes through every image (characters) in the game components children
        // technically not necessary since there is only one item in this scene, but this way it can be expanded on
        foreach (var item in obj.GetComponentsInChildren<Image>())
        {
            EventTrigger trigger = item.GetComponent<EventTrigger>(); //get the event triggers from the Image
            if (trigger != null) //checks that there are triggers to disable
            {
                trigger.enabled = false; // disable the triggers
                Debug.Log("items click false");
            }
        }
    }

    // Makes all items in a game objects children, interactable
    public void addTrigger(GameObject obj)
    {
        // goes through every image (book) in the game components children
        // technically not necessary since there is only one item in this scene, but this way it can be expanded on
        foreach (var item in obj.GetComponentsInChildren<Image>())
        {
            EventTrigger trigger = item.GetComponent<EventTrigger>(); //get the event triggers from the Image
            if (trigger != null) //checks that there are triggers to activate
            {
                trigger.enabled = true; //activates the triggers
                Debug.Log("items click true");
            }
        }
    }

    // what should happen after each story has completed
    private void AfterStoryEnds(string finishedStory)
    {
        if (finishedStory == "First")
        {
            Debug.Log("story 1 finished");
            NamePanel.SetActive(true); //panel that asks for the players name
        }
        else if (finishedStory == "Second")
        {
            Debug.Log("story 2 finished");
            addTrigger(Book); //make the book interactable again
        }
        else if (finishedStory == "Third")
        {
            Debug.Log("story 3 finished");
            StoryManager.Instance.OnStoryEnd -= AfterStoryEnds; //stop listening for stories that have ended
        }
        Debug.Log("all stories in scene have finished");
    }

    // UIInputField function that gets the string that the player has typed in and confirmed
    public void ReadName(string x)
    {
        StoryManager.Instance.SetVarState("Name", x); // save the players name to the globals.ink file, makes it accesible later on.
    }

    // what happens when the players clicks the confirm button on their name
    public void OnNameConfirm()
    {
        string name = NamePanel.GetComponentInChildren<TMP_InputField>().text; //get reference to the text field
        ReadName(name); // gets player input
        NamePanel.SetActive(false); //close the name input panel
        StoryManager.Instance.StartStory(Second, "Second"); // start the second ink story

    }
    
    // when book object is clicked, open the cvs panel
    public void OnBookPress()
    {
        CVS.SetActive(true); 
        RemoveTrigger(Book);
    }

    // when the player clicks on the next cv button
    public void OnCVNext()
    {
        currentCV++; // increase the index
        if(currentCV >= CvList.Length) // checks if the index is greater than the array length
        {
            currentCV = 0; //reset index position
        }
        CVImage.GetComponentInChildren<Image>().sprite = CvList[currentCV]; // change sprite to the one at index
    }

   // there should also be a OnCVPrev() function when there are more cvs, but for now its fine


    // when player exits the cv panel
    public void OnCVExit()
    {
        CVS.SetActive(false); // disable Cv panel
        StoryManager.Instance.StartStory(Third, "Third"); // play the third story
    }
}