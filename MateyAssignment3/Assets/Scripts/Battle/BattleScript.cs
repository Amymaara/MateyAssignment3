using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

public enum Ending
{
    Pearl,
    Shad,
    Ravynn,
    Rory,
    Kraken,
    NoAffection,
    Death
}

public class EndScene : MonoBehaviour
{
    public TextAsset EndingScene;
    public SceneChanger sceneChanger;
    public GameObject endCard;

    public TextMeshProUGUI endingsDislay;
    private const int TotalEndings = 7;

    public Ending selectedEnding;

    private const string PrefsKey = "UnlockedEndings";

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        sceneChanger.OnSceneStart();
        endCard.SetActive(false);
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
        StoryManager.Instance.StartStory(EndingScene, "EndScene");

        bool isNew = UnlockEnding(selectedEnding);

        int unlockedCount = GetUnlockedEndingCount();

        Debug.Log($"Endings unlocked: {unlockedCount}/{TotalEndings}");

        if (endingsDislay != null)
        {
            endingsDislay.text = $"Endings Unlocked: {unlockedCount}/{TotalEndings}";
        }

        if (isNew)
        {
            
        }
    }

    private void AfterStoryEnds(string finishedStory)
    {
        endCard.SetActive(true);

    }

    
    public void OnEndCardClose()
    {
        sceneChanger.LoadNextScene("GameEnd");
    }



    // Title: Unified Ending Tracking and Unlock System in Unity
    //Author: ChatGPT(OpenAI)
    //Date: 10 June 2025
    //Code Version: 1.0
    //Availability: Generated via ChatGPT(https://chat.openai.com)
    bool UnlockEnding(Ending ending)
    {
        string key = $"EndingUnlocked_{ending}";

        if (PlayerPrefs.GetInt(key, 0) == 1)
        {
            return false; // Already unlocked
        }

        PlayerPrefs.SetInt(key, 1);
        PlayerPrefs.Save();
        return true;
    }

    // Title: Unified Ending Tracking and Unlock System in Unity
    //Author: ChatGPT(OpenAI)
    //Date: 10 June 2025
    //Code Version: 1.0
    //Availability: Generated via ChatGPT(https://chat.openai.com)
    int GetUnlockedEndingCount()
    {
        int count = 0;
        foreach (Ending e in System.Enum.GetValues(typeof(Ending)))
        {
            if (PlayerPrefs.GetInt($"EndingUnlocked_{e}", 0) == 1)
            {
                count++;
            }
        }
        return count;
    }
}
