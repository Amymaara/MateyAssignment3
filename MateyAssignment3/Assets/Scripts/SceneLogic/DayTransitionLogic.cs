using DG.Tweening;
using System.Collections;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using UnityEngine.Video;
using static GameStateManager;

/*
Title: DayTransitionLogic Unity Script Example
Author: ChatGPT (OpenAI)
Date Accessed: May 19, 2025
Code Version: 1.0
Availability: https://chat.openai.com/
*/

public class DayTransitionLogic : MonoBehaviour
{
    public GameObject DayTransition;
    
    public VideoPlayer videoPlayer; 
    public Image blackScreenImage;  
    public GameObject canvas;
    public SceneChanger sceneChanger;
    public TextMeshProUGUI dayText; 
    public float letterDelay = 0.05f; // Delay between letters


    private void Start()
    {
        
        DayTransition.SetActive(true);
       
        StartCoroutine(PlayDayTransition());
        StartCoroutine(ShowTypedDayTextAfterDelay(3f)); 


    }

    private IEnumerator PlayDayTransition()
    {
        
        // Play the video
        videoPlayer.Play();

        // Wait until the video is done
        while (videoPlayer.isPlaying)
        {
            yield return null;
        }

        // Fade in to black (alpha = 1)
        yield return blackScreenImage.DOFade(1f, 1f).WaitForCompletion();

        // Switch scenes or do other logic here if needed
        DayTransition.SetActive(false);
        canvas.SetActive(false);


        // Fade out from black (alpha = 0)
        yield return blackScreenImage.DOFade(0f, 1f).WaitForCompletion();

        
        canvas.SetActive(false);

        
    }

    private IEnumerator ShowTypedDayTextAfterDelay(float delay)
    {
        Debug.Log("Day type effect");
        yield return new WaitForSeconds(delay);

        int day = GameStateManager.DayCount;
        string fullText = $"Day {day}";
        dayText.text = "";

        
        dayText.alpha = 0;
        dayText.DOFade(1f, 1f);

        
        foreach (char c in fullText)
        {
            dayText.text += c;
            yield return new WaitForSeconds(letterDelay);
        }

        yield return new WaitForSeconds(1f); //stayvisible

        // Fade out 
        dayText.DOFade(0f, 1f);
    }
}