using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.Audio;

public class AudioManager : MonoBehaviour
{
    public static AudioManager instance {  get; private set; }  
    
    public AudioMixerGroup musicMixer;
    public AudioMixerGroup sfxMixer;
    public AudioMixerGroup voiceMixer;

    private Transform sfxRoot;
    private AudioSource musicSource;

    private void Awake()
    {
        if (instance == null)
        {
            transform.SetParent(null);
            DontDestroyOnLoad(gameObject);
            instance = this;
        }

        else
        {
            DestroyImmediate(gameObject);
            return;
        }

        sfxRoot = new GameObject("SFX").transform;
        sfxRoot.SetParent(transform);

        GameObject musicObj = new GameObject("Music Source");
        musicObj.transform.SetParent(transform);
        musicSource = musicObj.AddComponent<AudioSource>();
        musicSource.loop = true;
        musicSource.spatialBlend = 0;
        musicSource.outputAudioMixerGroup = musicMixer;

    }

   public void PlaySFX(string fileName)
    {
        AudioClip clip = Resources.Load<AudioClip>("Audio/" + fileName);
        if (clip == null)
        {
            Debug.LogWarning("SFX not found: " + fileName);
            return;
        }

        AudioSource sfxSource= new GameObject("SFX -" + clip.name).GetComponent<AudioSource>();
        sfxSource.transform.SetParent(sfxRoot);
        sfxSource.clip = clip;
        sfxSource.playOnAwake = false;
        sfxSource.spatialBlend = 0; // 2D sound
        sfxSource.Play();

        Destroy(sfxSource.gameObject, clip.length + 0.5f);
    }

    public void PlayMusic(string fileName)
    {
        AudioClip clip = Resources.Load<AudioClip>("Audio/" + fileName);
        if (clip == null)
        {
            Debug.LogWarning("Music not found: " + fileName);
            return;
        }
        AudioSource musicSource = new GameObject("Music -" + clip.name).GetComponent<AudioSource>();
        musicSource.clip = clip;
        musicSource.spatialBlend = 0; // 2D sound
        musicSource.Play();
        musicSource.loop = true;

        if (musicSource.clip == clip && musicSource.isPlaying)
            return;

    }
    public void StopMusic()
    {
        musicSource.Stop();
        musicSource.clip = null;
    }


}
