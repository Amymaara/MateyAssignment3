using UnityEngine;
using UnityEngine.UI;


public class SettingsManager : MonoBehaviour
{
    public GameObject settingsPanel;
    public Slider volumeSlider;
    public Slider textSpeedSlider;
    public float typeSpeed;

    //public Slider TextSpeedSlider;
    void Start()
    {
        settingsPanel.SetActive(false);
        if (PlayerPrefs.HasKey("typeSpeed"))
        {
            LoadTextSpeed();
        }
             
         else
            {
               PlayerPrefs.SetFloat("typeSpeed", 0.4f);
           }

        if (PlayerPrefs.HasKey("soundVolume"))
            LoadVolume();
        else
        {
            PlayerPrefs.SetFloat("soundVolume", 1);
            LoadVolume();
        }
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

    public void OnSettingsButton()
    {
        settingsPanel.SetActive(true);

    }

    

    //Title:VOLUME SLIDER IN UNITY
    //Author: Solo Game Dev
    //Date: 24 April 2024
    //Code version: unknown
    //Availability: https://www.youtube.com/watch?v=prT-PMl4JSA&ab_channel=SoloGameDev
       
        public void SetVolume()
        {
            AudioListener.volume = volumeSlider.value;
            SaveVolume();
        }

        public void SaveVolume()
        {
            PlayerPrefs.SetFloat("soundVolume", volumeSlider.value);
        }

        public void LoadVolume()
        {
            volumeSlider.value = PlayerPrefs.GetFloat("soundVolume");
        }
    

}
