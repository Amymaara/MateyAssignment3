using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;
using Ink.Runtime;
using Unity.VisualScripting;
using UnityEngine.UI;
using TMPro;
using UnityEngine.EventSystems;
using System.IO;
using static GameStateManager;


// this is the sequence of events for the Captains Room
public class CaptainsRoomSequence : MonoBehaviour
{
    [Header("Ink Files")]
    [SerializeField] private TextAsset StuIntro;
    [SerializeField] private TextAsset CVText;



    [Header("Item")]
    [SerializeField] private GameObject File;
    public GameObject MapButton;
    public GameObject Map;
    public SceneChanger sceneChanger;
    

    [Header("Tool tips")]
    public GameObject ObjectToolTip;
    public GameObject MapToolTip;
    


    private void Start()
    {
        sceneChanger.OnSceneStart();
        GameStateManager.SetState(gameState.Day0);
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds; // add listener for a story ending
        StoryManager.Instance.StartStory(StuIntro, "StuIntro"); // load first ink file, will start up dialogue system
        
        RemoveTrigger(File); //make book non clickable
        ObjectToolTip.SetActive(false);
        MapToolTip.SetActive(false);
        MapButton.SetActive(false);
        Map.SetActive(false);

        

}

    // Makes all items in a game objects children, non interactable
    private void RemoveTrigger(GameObject obj)
    {
        
            EventTrigger trigger = obj.GetComponent<EventTrigger>(); //get the event triggers from the Image
            if (trigger != null) //checks that there are triggers to disable
            {
                trigger.enabled = false; // disable the triggers
                Debug.Log("items click false");
            }
        
    }

    // Makes all items in a game objects children, interactable
    public void addTrigger(GameObject obj)
    {
        
            EventTrigger trigger = obj.GetComponent<EventTrigger>(); //get the event triggers from the Image
            if (trigger != null) //checks that there are triggers to activate
            {
                trigger.enabled = true; //activates the triggers
                Debug.Log("items click true");
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
        else if (finishedStory == "CV")
        {
            MapToolTip.SetActive(true);
            MapButton.SetActive(true);
            Debug.Log("Cvs Finished");
            
        }

        
    }

    
    
    
    
    

   
}