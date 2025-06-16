using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using System.Collections.Generic;

public class UIButtonSounds : MonoBehaviour
{
    private void Awake()
    {
        // Persist across scenes
        DontDestroyOnLoad(gameObject);

        // Initial hookup
        HookAllButtons();

        // Hook new buttons on scene load
        SceneManager.sceneLoaded += (s, m) => HookAllButtons();
    }

    void HookAllButtons()
    {
        // grab every active button in the scene
        Button[] buttons = Object.FindObjectsByType<Button>(FindObjectsSortMode.None);

        foreach (var btn in buttons)
        {
            // make sure it has an EventTrigger
            var trig = btn.gameObject.GetComponent<EventTrigger>();
            if (trig == null) trig = btn.gameObject.AddComponent<EventTrigger>();

            // pointer-enter = hover
            AddEntryIfMissing(trig, EventTriggerType.PointerEnter, data =>
                NewAudioManager.instance?.PlaySFX("hoverFX")
            );

            // pointer-click = pressed
            AddEntryIfMissing(trig, EventTriggerType.PointerClick, data =>
                NewAudioManager.instance?.PlaySFX("pressedFX")
            );
        }
    }

    void AddEntryIfMissing(EventTrigger trig, EventTriggerType type,
                           UnityEngine.Events.UnityAction<BaseEventData> callback)
    {
        // avoid duplicates
        foreach (var e in trig.triggers)
            if (e.eventID == type) return;

        var entry = new EventTrigger.Entry { eventID = type };
        entry.callback.AddListener(callback);
        trig.triggers.Add(entry);
    }
}
