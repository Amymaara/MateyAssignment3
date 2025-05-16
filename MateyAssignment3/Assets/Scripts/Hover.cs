using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine.EventSystems;





public class Hover : MonoBehaviour
{
    public Image interactableObject;
    public float BigWidth;
    public float BigHeight;

    // when player holds their mouse over a room item, item should increase in size
    public void OnHover()
    {
        interactableObject.rectTransform.localScale = new Vector3(BigWidth, BigHeight,1);
        // in the future maybe add an outline, or have an existing outline change colour
    }

    // when player takes their mouse off a room item, item should decrease in size
    public void OnExit()
    {
        interactableObject.rectTransform.localScale = new Vector3(1, 1, 1);
        // remove the outline or colour change if implemented OnHover
    }
}
