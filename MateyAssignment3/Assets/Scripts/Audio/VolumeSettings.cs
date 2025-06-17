using UnityEngine;
using UnityEngine.Audio;
using UnityEngine.UI;

public class VolumeSettings : MonoBehaviour
{
    // Title:Unity AUDIO Volume Settings Menu Tutorial
    // Author: Rehope Games, edited by Ammaarah Cassim
    // Date: 7 March 2022
    // Code Version: unknown
    // Avaliability: https://www.youtube.com/watch?v=G-JUp8AMEx0&ab_channel=RehopeGames

    [SerializeField] private AudioMixer audioMixer;
    [SerializeField] private Slider musicSlider;
    [SerializeField] private Slider sfxSlider;

    private void Start()
    {
        if (PlayerPrefs.HasKey("music"))
        {
            LoadVolume();
        }
        else
        {
            SetMusicVolume();
            SetSFXVolume();
        }

    }
    public void SetMusicVolume()
    {
        float volume = musicSlider.value;
        audioMixer.SetFloat("music", Mathf.Log10(volume) * 20);
        PlayerPrefs.SetFloat("music", volume);
    }

    public void SetSFXVolume()
    {
        float volume = sfxSlider.value;
        audioMixer.SetFloat("sfx", Mathf.Log10(volume) * 20);
        PlayerPrefs.SetFloat("sfx", volume);
    }
    private void LoadVolume()
    {
        musicSlider.value = PlayerPrefs.GetFloat("music");
        sfxSlider.value = PlayerPrefs.GetFloat("sfx");

        SetMusicVolume();
        SetSFXVolume(); 
    }
}
