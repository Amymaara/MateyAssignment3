using UnityEngine;

public class NewAudioManager : MonoBehaviour
{
    [Header("-----Audio Source-----")]
    [SerializeField] AudioSource musicSource;
    [SerializeField] AudioSource sfxSource;

    public static NewAudioManager instance { get; private set; }

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
            transform.SetParent(null);
            DontDestroyOnLoad(gameObject); 
        }
        else
        {
            Destroy(gameObject);
        }
    }
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

    public void StopMusic()
    {
        musicSource.Stop();
        musicSource.clip = null;
    }

    public void StopSFX()
    {
        sfxSource.Stop();
        sfxSource.clip = null;
    }
}
