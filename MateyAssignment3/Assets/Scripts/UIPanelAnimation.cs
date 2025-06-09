using DG.Tweening;
using UnityEngine;

public class UIPanelAnimation : MonoBehaviour
{
    private RectTransform rectTransform;
    private Vector2 originalPosition;

    public float animationDuration = 0.5f;
    public Ease easing = Ease.OutBack;

    public bool introOn = true;

    public bool FromTop;

    private void Awake()
    {
        rectTransform = GetComponent<RectTransform>();
        originalPosition = rectTransform.anchoredPosition;
        if (gameObject.name == "DialoguePanel")
        {
            FromTop = false;
        }
        else
        {
            FromTop = true;
        }
    }

    private void OnEnable()
    {
        if (introOn)
        {
            SlideIn();
        }
    }
    public void SlideIn()
    {
        if (FromTop)
        {
            // Move panel above screen 
            rectTransform.anchoredPosition = new Vector2(originalPosition.x, (Screen.height));
        }
        else
        {
            rectTransform.anchoredPosition = new Vector2(originalPosition.x, -(Screen.height));
        }
            // Tweeens back to og position
            rectTransform.DOAnchorPos(originalPosition, animationDuration).SetEase(easing);
    }
    public void SlideOutAndDisable()
    {
        if (FromTop)
        {
            rectTransform
            .DOAnchorPos(new Vector2(originalPosition.x, (Screen.height)), animationDuration)
            .SetEase(Ease.InBack)
            .OnComplete(() => gameObject.SetActive(false));
        }
        else
        {
            rectTransform
                .DOAnchorPos(new Vector2(originalPosition.x, -(Screen.height)), animationDuration)
                .SetEase(Ease.InBack)
                .OnComplete(() => gameObject.SetActive(false));
        }
      
    }

   
}
