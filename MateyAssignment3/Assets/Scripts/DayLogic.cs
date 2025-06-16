using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using static GameStateManager;

public class DayLogic : MonoBehaviour
{
    [SerializeField] private TextAsset Fight; // ink file for the scene
    [SerializeField] private GameObject AllChars; // group of all the characters in the scene
    public SceneChanger sceneChanger;

    public Material defaultMaterial;
    




    void Start()
    {

        StoryManager.Instance.OnStoryEnd += AfterStoryEnds; // listen for story ending
        
        RemoveTrigger(AllChars); //characters are not interactable

        

        StoryManager.Instance.StartStory(Fight, "Fight");


    }

    // this is what happens after the ink story has finished running.

    private void AfterStoryEnds(string finishedStory)
    {
        if (finishedStory == "Fight") // looks for if the story is finished
        {
            Debug.Log("story finished");
            addTrigger(AllChars); // make characters interactable again

            // makes sure the character scaling is correct
            Image[] images = AllChars.GetComponentsInChildren<Image>();
            foreach (Image img in images)
            {
                img.SetNativeSize();
            }

        }

        StoryManager.Instance.OnStoryEnd -= AfterStoryEnds; // stop listening for AfterStoryEnds
    }

    

    // if the player clicks on Pearl, Pearls room scene will load
    public void OnPearlClick()
    {
        GameStateManager.SetState(GameStateManager.gameState.Day1);
        sceneChanger.LoadNextScene("PearlRoom");
    }

    public void OnPearl2Click()
    {
        GameStateManager.SetState(GameStateManager.gameState.Day2);
        sceneChanger.LoadNextScene("PearlRoom");
    }

    public void OnRoryClick()
    {
        GameStateManager.SetState(GameStateManager.gameState.Day1);
        sceneChanger.LoadNextScene("RoryRoom");
    }

    public void OnRory2Click()
    {
        GameStateManager.SetState(GameStateManager.gameState.Day2);
        sceneChanger.LoadNextScene("RoryRoom");
    }
    public void OnShadClick()
    {
        GameStateManager.SetState(GameStateManager.gameState.Day1);
        sceneChanger.LoadNextScene("ShadRoom");
    }

    public void OnShad2Click()
    {
        GameStateManager.SetState(GameStateManager.gameState.Day2);
        sceneChanger.LoadNextScene("ShadRoom");
    }

    public void OnRavynnClick()
    {
        GameStateManager.SetState(GameStateManager.gameState.Day1);
        sceneChanger.LoadNextScene("RavynnRoom");
    }

    public void OnRavynn2Click()
    {
        GameStateManager.SetState(GameStateManager.gameState.Day2);
        sceneChanger.LoadNextScene("RavynnRoom");
    }


    // Makes all items in a game objects children, non interactable
    private void RemoveTrigger(GameObject obj)
    {
        // goes through every image (characters) in the game components children
        foreach (var item in obj.GetComponentsInChildren<Image>())
        {
            EventTrigger trigger = item.GetComponent<EventTrigger>(); //get the event triggers from the Image
            if (trigger != null) //checks that there are triggers to disable
            {
                trigger.enabled = false; // disable the triggers
                Debug.Log("items click false");
            }
        }
        foreach (var item in obj.GetComponentsInChildren<UIHover>())
        {
            item.enabled = false;
        }
    }

    // Makes all items in a game objects children, interactable
    public void addTrigger(GameObject obj)
    {
        // goes through every image (characters) in the game components children
        foreach (var item in obj.GetComponentsInChildren<Image>())
        {
            Image temp = item.GetComponent<Image>();
            temp.material = defaultMaterial;

            EventTrigger trigger = item.GetComponent<EventTrigger>(); //get the event triggers from the Image
            if (trigger != null) //checks that there are triggers to activate
            {
                trigger.enabled = true; //activates the triggers
                Debug.Log("items click true");
            }
        }
        foreach (var item in obj.GetComponentsInChildren<UIHover>())
        {
            item.enabled = true;
        }
    }
}

