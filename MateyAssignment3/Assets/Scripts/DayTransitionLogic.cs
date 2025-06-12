using UnityEngine;
using UnityEngine.Video;
using UnityEngine.UI;
using DG.Tweening;
using System.Collections;
using static GameStateManager;
using UnityEngine.SceneManagement;

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
    
    public VideoPlayer videoPlayer; // Assign in Inspector
    public Image blackScreenImage;  // Fullscreen black UI image
    public GameObject canvas;
    public SceneChanger sceneChanger;


    private void Start()
    {
        
        DayTransition.SetActive(true);
       
        StartCoroutine(PlayDayTransition());
        
        
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
}