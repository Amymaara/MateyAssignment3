using UnityEngine;
using UnityEngine.EventSystems;
using System.Collections.Generic;

public class UIHoverDebugger : MonoBehaviour
{
    void Update()
    {
        PointerEventData pointerData = new PointerEventData(EventSystem.current)
        {
            position = Input.mousePosition
        };

        List<RaycastResult> results = new List<RaycastResult>();
        EventSystem.current.RaycastAll(pointerData, results);

        foreach (RaycastResult result in results)
        {
            Debug.Log("UI Element Hit: " + result.gameObject.name);
        }
    }
}
