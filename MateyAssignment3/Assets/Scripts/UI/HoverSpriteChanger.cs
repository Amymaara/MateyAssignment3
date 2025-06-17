using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class HoverSpriteChanger : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    public Sprite normalSprite;
    public Sprite hoverSprite;

    private Image buttonImage;

    void Awake()
    {
        buttonImage = GetComponent<Image>();
        buttonImage.sprite = normalSprite;
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        buttonImage.sprite = hoverSprite;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        buttonImage.sprite = normalSprite;
    }
}
