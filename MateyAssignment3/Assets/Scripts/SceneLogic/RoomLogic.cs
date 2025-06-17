using UnityEngine;
using static GameStateManager;
using UnityEngine.UI;
using UnityEngine.EventSystems;


public class RoomLogic : MonoBehaviour
{
    [Header("Ink Files")]
    [SerializeField] private TextAsset Day0Script;
    [SerializeField] public TextAsset Day0PostScript;
    [SerializeField] private TextAsset Day1Script;
    [SerializeField] public TextAsset Day1PostScript;
    [SerializeField] private TextAsset Day2Script;
    [SerializeField] public TextAsset Day2PostScript;


    [Header("Game Objects")]
    public GameObject Blackscreen;
    public GameObject MainCharcater;
    public GameObject Stu;
    public GameObject Map;

    
    [SerializeField] private GameObject item1;
    [SerializeField] private GameObject item2;
    [SerializeField] private GameObject item3;
    [SerializeField] private GameObject item4;
    [SerializeField] private GameObject item5;
    private GameObject[] items;


    private void Start()
    {
        
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
        items = new GameObject[] { item1, item2, item3, item4, item5 };
        Stu.SetActive(false);

        if (GameStateManager.CurrentState == gameState.Day0)
        {
            Blackscreen.SetActive(false);
            Map.SetActive(false);
            item1.SetActive(true);
            item2.SetActive(true);
            item3.SetActive(true);
            item4.SetActive(false);
            item5.SetActive(false);
            foreach (GameObject item in items)
            {
                RemoveTrigger(item);
            }
            StoryManager.Instance.StartStory(Day0Script, "Day0Script");

        }
        if (GameStateManager.CurrentState == gameState.Day1)
        {
            Blackscreen.SetActive(false);
            item1.SetActive(true);
            item2.SetActive(true);
            item3.SetActive(true);
            item4.SetActive(true);
            item5.SetActive(false);
            foreach (GameObject item in items)
            {
                RemoveTrigger(item);
            }
            StoryManager.Instance.StartStory(Day1Script, "Day1Script");
        }
        if (GameStateManager.CurrentState == gameState.Day2)
        {
            Blackscreen.SetActive(false);
            item1.SetActive(true);
            item2.SetActive(true);
            item3.SetActive(true);
            item4.SetActive(true);
            item5.SetActive(true);
            foreach (GameObject item in items)
            {
                RemoveTrigger(item);
            }
            StoryManager.Instance.StartStory(Day2Script, "Day2Script");
        }
    } 

   

    
    private void AfterStoryEnds(string finishedStory)
    {
        if (finishedStory == "Day0Script")
        {
            foreach (GameObject item in items)
            {
                addTrigger(item);
                Map.SetActive(true);
            }
            Debug.Log("Day 0 story finished");
            StoryManager.Instance.OnStoryEnd -= AfterStoryEnds;
        }
        else if (finishedStory == "Day1Script")
        {
            foreach (GameObject item in items)
            {
           
                addTrigger(item);
                Map.SetActive(true);
            }
            Debug.Log("Day 1 story finished");
            StoryManager.Instance.OnStoryEnd -= AfterStoryEnds;
        }
        else if (finishedStory == "Day2Script")
        {
            foreach (GameObject item in items)
            {

                addTrigger(item);
                Map.SetActive(true);
            }
            Debug.Log("Day 2 story finished");
            StoryManager.Instance.OnStoryEnd -= AfterStoryEnds;
        }
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

    public void addTrigger(GameObject obj)
    {
            EventTrigger trigger = obj.GetComponent<EventTrigger>();
            StoryItem storyItem = obj.GetComponent<StoryItem>();
            if (storyItem != null && ClickTracker.GetClickCount(storyItem.itemID) == 0)
            {
                if (trigger != null)
                {
                    trigger.enabled = true;
                    Debug.Log("items click true");
                }
            }
    }
    

    private void OnDestroy()
    {
        
    }
}
