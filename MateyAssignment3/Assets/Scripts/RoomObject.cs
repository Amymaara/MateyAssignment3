using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using DG.Tweening;

public class StoryItem : MonoBehaviour
{
    [Header("Item")]
    public string itemID;
    public TextAsset inkFile;
    public GameObject roomObjects;
    public GameObject itemImage;
    public Material defaultMaterial;

    [Header("Scale")]
    public float BigWidth;
    public float BigHeight;

    private int clickCounter = 0;

    [Header("Pop Ups")]
    public GameObject popupPanel;
    public GameObject[] popupImages; 
    private int currentImageIndex = 0;


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
        RectTransform rt = itemImage.GetComponent<RectTransform>();
        rt.DOKill(); // Cancel tween
        rt.DOScale(new Vector3(BigWidth, BigHeight, 1), 0.3f)
          .SetEase(Ease.OutBack);
    }

    // when player takes their mouse off a room item, item should decrease in size
    public void OnExit()
    {
        RectTransform rt = itemImage.GetComponent<RectTransform>();
        rt.DOKill(); // Cancel tween
        rt.DOScale(Vector3.one, 0.2f)
          .SetEase(Ease.InOutSine);
    }

   

    public void ShowNextPopupImage()
    {
        if (popupImages == null || popupImages.Length == 0) return;

        // Disable all
        foreach (var img in popupImages)
            img.SetActive(false);

        // Enable current
        popupImages[currentImageIndex].SetActive(true);

        // Move to next
        currentImageIndex++;
    }
}

   

