using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;
using UnityEngine.EventSystems; //to change sprites

// Changing UI Image after many clicks in Unity by Unity Mechanics
public class npcClick : MonoBehaviour
{

    public GameObject dialoguePanel;
    public bool clicked;
    public UnityEngine.UI.Image NPC;



    public void OnClick()
    {

        print("clicked");
        clicked = true;
        dialoguePanel.SetActive(true);


        // chatgpt
        EventTrigger trigger = NPC.GetComponent<EventTrigger>();

        // Example: Disable just the PointerClick event
        trigger.triggers.RemoveAll(entry => entry.eventID == EventTriggerType.PointerClick);


    }
}
