using Unity.VisualScripting;
using UnityEngine;

public class NewAudioManager : MonoBehaviour
{
    // Title: Unity AUDIO MANAGER Tutorial
    // Author: Rehope Games, edited by Ammaarah Cassim
    // Date: 20 August 2022 
    // Code Version: unknown
    // Avaliability: https://www.youtube.com/watch?v=rdX7nhH6jdM&ab_channel=RehopeGames

    [Header("-----Audio Source-----")]
    [SerializeField] AudioSource musicSource;
    [SerializeField] AudioSource sfxSource;

    public static NewAudioManager instance { get; private set; }

    private void Awake()
    {
        // Check if an instance already exists
        if (instance == null)
        {
            instance = this;
            transform.SetParent(null);
            // Keep this AudioManager alive when changing scenes
            DontDestroyOnLoad(gameObject); 
        }
        else
        {
            // If another instance exists, destroy this one
            Destroy(gameObject);
        }
    }
    // Plays a sound effect (SFX) by name from the "Resources/Audio/SFX/" folder
    public void PlaySFX(string clipName)
    {
        AudioClip clip = Resources.Load<AudioClip>("Audio/SFX/" + clipName);

        if (clip == null)
        {
            Debug.LogWarning("SFX not found: " + clipName);
            return;
        }

        sfxSource.PlayOneShot(clip);
    }
    // Plays music by name from the "Resources/Audio/Music/" folder
    public void PlayMusic(string clipName)
    {
        AudioClip clip = Resources.Load<AudioClip>("Audio/Music/" + clipName);

        if (clip == null)
        {
            Debug.LogWarning("Music not found: " + clipName);
            return;
        }

        musicSource.clip = clip;
        musicSource.Play();
    }

    // Stops any currently playing music and clears the clip reference
    public void StopMusic()
    {
        musicSource.Stop();
        musicSource.clip = null;
    }

    // Stops any currently playing SFX and clears the clip reference
    public void StopSFX()
    {
        sfxSource.Stop();
        sfxSource.clip = null;
    }
}
