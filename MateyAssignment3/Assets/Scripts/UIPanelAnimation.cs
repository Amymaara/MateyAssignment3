using DG.Tweening;
using UnityEngine;

public class UIPanelAnimation : MonoBehaviour
{
    private RectTransform rectTransform;
    private Vector2 originalPosition;

    public float animationDuration = 0.5f;
    public Ease easing = Ease.OutBack;

    private void Awake()
    {
        rectTransform = GetComponent<RectTransform>();
        originalPosition = rectTransform.anchoredPosition;
    }

    private void OnEnable()
    {
        // Move panel above screen 
        rectTransform.anchoredPosition = new Vector2(originalPosition.x, Screen.height);

        // Tweeens back to og position
        rectTransform.DOAnchorPos(originalPosition, animationDuration).SetEase(easing);
    }

    public void SlideOutAndDisable()
    {
        rectTransform
            .DOAnchorPos(new Vector2(originalPosition.x, Screen.height), animationDuration)
            .SetEase(Ease.InBack)
            .OnComplete(() => gameObject.SetActive(false));
    }
}
