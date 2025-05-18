using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;
using Ink.Runtime;
using Unity.VisualScripting;
using UnityEngine.UI;
using TMPro;
using UnityEngine.EventSystems;
using System.IO;


// this is the sequence of events for the Captains Room
public class CaptainsRoomSequence : MonoBehaviour
{
    [Header("Ink Files")]
    [SerializeField] private TextAsset StuIntro;
    [SerializeField] private TextAsset CVText;



    [Header("Item")]
    [SerializeField] private GameObject File;
    public GameObject MapButton;

    [Header("Tool tips")]
    public GameObject ObjectToolTip;
    public GameObject MapToolTip;
    


    private void Start()
    {
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds; // add listener for a story ending
        StoryManager.Instance.StartStory(StuIntro, "StuIntro"); // load first ink file, will start up dialogue system
        File.SetActive(false); //hide cvs panel
        RemoveTrigger(File); //make book non clickable
        ObjectToolTip.SetActive(false);
        MapToolTip.SetActive(false);
        MapButton.SetActive(false);
       
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
        if (finishedStory == "StuIntro")
        {
            Debug.Log("StuIntro finished");
            ObjectToolTip.SetActive(true);
            addTrigger(File);
        }
        else
        {
            MapToolTip.SetActive(true);
            MapButton.SetActive(true);
            Debug.Log("Cvs Finished");
            
        }

        Debug.Log("all stories in scene have finished");
    }

    

    
    
    

   
}