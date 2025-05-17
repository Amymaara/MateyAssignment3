using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class StoryItem : MonoBehaviour
{
    public string itemID;
    public TextAsset inkFile;
    public GameObject roomObjects;
    public GameObject itemImage;
    public Material defaultMaterial;
    

    public float BigWidth;
    public float BigHeight;

    private int clickCounter = 0;

    public GameObject popupPanel;
    


    private void Start()
    {
        clickCounter = ClickTracker.GetClickCount(itemID);
        GetComponent<Image>().alphaHitTestMinimumThreshold = 0.1f;
    }

    public void OnItemClick()
    {
        if (inkFile != null)
        {
            clickCounter++;
            ClickTracker.IncrementClickCount(itemID);

            Image temp = itemImage.GetComponent<Image>();
            temp.material = defaultMaterial;
            
            temp.rectTransform.localScale = new Vector3(1, 1, 1);

            if (clickCounter == 1)
            {
                popupPanel.SetActive(true);
                StoryManager.Instance.StartStory(inkFile, this);
            }

            if (roomObjects != null)
            {
                RemoveTrigger(roomObjects);
            }
        }
    }

    private void RemoveTrigger(GameObject obj)
    {
        foreach (var item in obj.GetComponentsInChildren<Image>())
        {
            EventTrigger trigger = item.GetComponent<EventTrigger>();
            if (trigger != null)
            {
                trigger.enabled = false;
                Debug.Log("items click true");
            }
        }
    }

    public void addTrigger()
    {
        foreach (var item in roomObjects.GetComponentsInChildren<Image>())
        {
            EventTrigger trigger = item.GetComponent<EventTrigger>();
            StoryItem storyItem = item.GetComponent<StoryItem>();
            if (storyItem != null && ClickTracker.GetClickCount(storyItem.itemID) == 0)
            {
                if (trigger != null)
                {
                    trigger.enabled = true;
                    Debug.Log("items click false");
                }
            }
        }
    }

    

    // when player holds their mouse over a room item, item should increase in size
    public void OnHover()
    {
        Image interactableObject = itemImage.GetComponent<Image>();
        interactableObject.rectTransform.localScale = new Vector3(BigWidth, BigHeight, 1);
        // in the future maybe add an outline, or have an existing outline change colour
    }

    // when player takes their mouse off a room item, item should decrease in size
    public void OnExit()
    {
        Image interactableObject = itemImage.GetComponent<Image>();
        interactableObject.rectTransform.localScale = new Vector3(1, 1, 1);
        // remove the outline or colour change if implemented OnHover
    }

   
}
