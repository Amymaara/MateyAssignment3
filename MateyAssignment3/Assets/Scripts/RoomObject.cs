using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class StoryItem : MonoBehaviour
{
    public TextAsset inkFile;
    public GameObject roomObjects;
    public GameObject itemImage;
    public int clickCounter = 0;
    public string postDialogue;
    public string Speaker;
    

    private void Start()
    {
        clickCounter = 0;
    }

    // what happens when player clicks on a character or item in a room
    public void OnItemClick()
    {
        if (inkFile != null)
        {
            clickCounter++;

            if (clickCounter == 1) // only plays the whole ink file on the first click
            {
                StoryManager.Instance.StartStory(inkFile, this); // loads the ink story
            }
            else 
            {
                StoryManager.Instance.postDialogueText(this); // loads a single line
            }
            if (roomObjects != null)
            {
                RemoveTrigger(roomObjects); // make objects non-clickable when in dialogue
            }
        }
    }

    // makes items non, clickable, this code is alos in DaySystemSequence script
    private void RemoveTrigger(GameObject obj)
    {
        foreach( var item in obj.GetComponentsInChildren<Image>())
        {
            EventTrigger trigger = item.GetComponent<EventTrigger>();
            if (trigger != null)
            {
                trigger.enabled = false;
                Debug.Log("items click true");
            }
        }
        
    }


    //Makes items interactable again
    public void addTrigger()
    {
        foreach (var item in roomObjects.GetComponentsInChildren<Image>())
        {
            EventTrigger trigger = item.GetComponent<EventTrigger>();
            if (trigger != null)
            {
                trigger.enabled = true;
                Debug.Log("items click false");
            }
        }
    }
}