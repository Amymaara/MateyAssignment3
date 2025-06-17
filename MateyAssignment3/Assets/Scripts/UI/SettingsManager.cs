using UnityEngine;
using UnityEngine.UI;


public class SettingsManager : MonoBehaviour
{
    public GameObject pauseMenu;
    public GameObject settingsPanel;
    public GameObject choiceHelpPanel;
    public GameObject exitGameWarning;
    public Button pauseExit;

    //public Slider volumeSlider;
    // add the other sliders here if you need owo
    
    public Slider textSpeedSlider;
    public float typeSpeed;

    //public Slider TextSpeedSlider;
    void Start()
    {
        settingsPanel.SetActive(false);
        choiceHelpPanel.SetActive(false);
        pauseMenu.SetActive(false);
        exitGameWarning.SetActive(false);

        if (PlayerPrefs.HasKey("typeSpeed"))
        {
            LoadTextSpeed();
        }
             
         else
            {
               PlayerPrefs.SetFloat("typeSpeed", 0.04f);
           }

        //if (PlayerPrefs.HasKey("soundVolume"))
            //LoadVolume();
        //else
        //{
        //    PlayerPrefs.SetFloat("soundVolume", 1);
        //    LoadVolume();
       // }
    }

    public void SetTextSpeed()
    {
        typeSpeed = textSpeedSlider.value;
        SaveTextSpeed();
    }

     public void SaveTextSpeed()
    {
        PlayerPrefs.SetFloat("typeSpeed", textSpeedSlider.value);
    }

     public void LoadTextSpeed()
     {
         textSpeedSlider.value = PlayerPrefs.GetFloat("typeSpeed");
     }

    public void OnPauseButton()
    {
        pauseMenu.SetActive(true);
        pauseExit.enabled = true;
        pauseExit.GetComponent<UIHover>().enabled = true;
    }

    public void OnSettingsButton()
    {
        //pauseMenu.SetActive(false);
        settingsPanel.SetActive(true);
        pauseExit.GetComponent<UIHover>().enabled = false;
        pauseExit.enabled = false;

    }

    public void OnExitButton() 
    { 
        exitGameWarning.SetActive(true);
        pauseExit.GetComponent<UIHover>().enabled = false;
        pauseExit.enabled = false;
    }
    

    public void OnChoiceHelpButton()
    {
        choiceHelpPanel.SetActive(true);
        pauseExit.GetComponent<UIHover>().enabled = false;
        pauseExit.enabled = false;
    }

    public void EnablePauseExit()
    {
        pauseExit.enabled = true;
        pauseExit.GetComponent<UIHover>().enabled = true;
    }

    public void OpenGoogleDoc()
    {
        Application.OpenURL("https://docs.google.com/document/d/1OGZ23cGp_fBu_g8hrKWMcZtVLPoSU4CQP8e6yHiGsFQ/edit?tab=t.0");
    }

    //Title:VOLUME SLIDER IN UNITY
    //Author: Solo Game Dev
    //Date: 24 April 2024
    //Code version: unknown
    //Availability: https://www.youtube.com/watch?v=prT-PMl4JSA&ab_channel=SoloGameDev

    //public void SetVolume()
       // {
       //     AudioListener.volume = volumeSlider.value;
        //    SaveVolume();
       // }

       // public void SaveVolume()
       // {
       //     PlayerPrefs.SetFloat("soundVolume", volumeSlider.value);
       // }

       // public void LoadVolume()
       // {
        //    volumeSlider.value = PlayerPrefs.GetFloat("soundVolume");
       // }
    

}
