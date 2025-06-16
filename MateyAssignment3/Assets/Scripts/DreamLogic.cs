using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;
using UnityEngine.Video;
using System.Collections;



public class DreamLogic : MonoBehaviour
{
    [Header("Ink Files")]
    [SerializeField] private TextAsset Dream;

    [Header("Game Objects")]
    [SerializeField] private GameObject NamePanel; //player name input window
    public GameObject PronounPanel;

    public GameObject CCWindow;

    public SceneChanger SceneChanger;


    [Header("Pop Ups")]
    public GameObject popupPanel;
    public GameObject[] popupImages;
    public GameObject toolTip;
    public Sprite[] lightingTransitionSprites;
    public float frameDuration = 0.05f; // Duration of each lighting frame

    [Header("Video Logic")]
    public GameObject video;
    public VideoPlayer videoPlayer;
    public VideoClip[] videoClips;
    public float pauseBetweenVideos = 1.5f;
    private int currentVideoIndex = 0;
    private int dialogueClicks = 0;
    private Coroutine replayCoroutine;
    
    

    private void Start()
    {
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
        //videoPlayer.loopPointReached += OnVideoEnd;
        
        toolTip.SetActive(false);
        RenderTexture rt = (RenderTexture)videoPlayer.targetTexture;
        RenderTexture.active = rt;
        GL.Clear(true, true, Color.black);
        RenderTexture.active = null;


        //SceneChanger.OnSceneStart();
    }



    public void SkipToNextVideo()
    {
        if (currentVideoIndex < videoClips.Length - 1)
        {
           
            currentVideoIndex++;
            videoPlayer.Stop();
            videoPlayer.clip = videoClips[currentVideoIndex];
            videoPlayer.frame = 0;
            videoPlayer.Play();
        }
    }

    private void AfterStoryEnds(string finishedStory)
    {
        if (finishedStory == "Dream")
        {
            
            Debug.Log("dream finished");
            StoryManager.Instance.OnStoryEnd -= AfterStoryEnds; //stop listening for stories that have ended
            SceneChanger.LoadNextScene("CaptainsRoom");
        }
    }



    private void PlayVideoAtIndex(int index)
    {
        if (index >= videoClips.Length) return;

        video.SetActive(true);
        videoPlayer.Stop();

        videoPlayer.clip = videoClips[index];
        videoPlayer.frame = 0;
        videoPlayer.Play();

        if (replayCoroutine != null)
        {
            StopCoroutine(replayCoroutine);
        }
            

        replayCoroutine = StartCoroutine(ReplayWithDelay());
    }

   
    private IEnumerator ReplayWithDelay()
    {
        while (true)
        {
            // Wait until video starts playing
            while (!videoPlayer.isPlaying)
                yield return null;

            // Wait until video finishes playing
            while (videoPlayer.isPlaying)
                yield return null;

            // Disable the video GameObject (for blink or transition)
            RenderTexture rt = (RenderTexture)videoPlayer.targetTexture;
            RenderTexture.active = rt;
            GL.Clear(true, true, Color.black);
            RenderTexture.active = null;

            // Wait for the defined pause
            yield return new WaitForSeconds(pauseBetweenVideos);

            // Re-enable the video GameObject
            

            // Prepare and play the video again
            videoPlayer.Stop();
           
            videoPlayer.frame = 0;
            videoPlayer.Play();
        }
    }

    public void ShowNextPopupVideo()
    {
        dialogueClicks++;
        Debug.Log("Dialogue Clicks: " + dialogueClicks);
        if (dialogueClicks == 1 || dialogueClicks == 5 || dialogueClicks == 9 || dialogueClicks == 22 || dialogueClicks == 24 || dialogueClicks == 33 || dialogueClicks == 40)
        {
            currentVideoIndex++;
            PlayVideoAtIndex(currentVideoIndex);
        }
    }




    public void OnSkip()
    {
        if (dialogueClicks < 12)
        {
            dialogueClicks = 8;
            currentVideoIndex = 3;
            ShowNextPopupVideo();
            dialogueClicks = 12;
        }
        else 
        {
            dialogueClicks = 23;
            currentVideoIndex = 4;
            ShowNextPopupVideo();
            dialogueClicks = 26;
        }
    }

    // UIInputField function that gets the string that the player has typed in and confirmed
    public void ReadName(string x)
    {
        StoryManager.Instance.SetVarState("Name", x); // save the players name to the globals.ink file, makes it accesible later on.
    }

    // what happens when the players clicks the confirm button on their name
    public void OnNameConfirm()
    {
        string name = NamePanel.GetComponentInChildren<TMP_InputField>().text; //get reference to the text field
        ReadName(name); // gets player input
        //NamePanel.SetActive(false); //close the name input panel
        //StoryManager.Instance.StartStory(Second, "Second"); // start the second ink story

    }
    /* VAR PronounHe = ""
        VAR PronounHim = ""
        VAR PronounHisApple = ""
        VAR PronounHis = ""
    */
    public void PronounChoice(int pronoun)
    {
        if (pronoun == 0)
        {
            StoryManager.Instance.SetVarState("PronounHe", "they");
            StoryManager.Instance.SetVarState("PronounHim", "them");
            StoryManager.Instance.SetVarState("PronounHisApple", "their");
            StoryManager.Instance.SetVarState("PronounHis", "theirs");
        }
        if (pronoun == 1)
        {
            StoryManager.Instance.SetVarState("PronounHe", "she");
            StoryManager.Instance.SetVarState("PronounHim", "her");
            StoryManager.Instance.SetVarState("PronounHisApple", "her");
            StoryManager.Instance.SetVarState("PronounHis", "hers");
        }
        if (pronoun == 2)
        {
            StoryManager.Instance.SetVarState("PronounHe", "he");
            StoryManager.Instance.SetVarState("PronounHim", "him");
            StoryManager.Instance.SetVarState("PronounHisApple", "his");
            StoryManager.Instance.SetVarState("PronounHis", "his");
        }
    }
    /*
VAR Pearl_Affection = 0
VAR Shad_Affection = 0
VAR Rory_Affection = 0
VAR Ravynn_Affection = 0
*/
    public void OnCCDone()
    {
        OnNameConfirm();
        int pronoun = PronounPanel.GetComponentInChildren<TMP_Dropdown>().value;
        PronounChoice(pronoun);
        toolTip.SetActive(true);
        
    }

    public void OnToolTipClose()
    {
        StoryManager.Instance.StartStory(Dream, "Dream");
        StoryManager.Instance.SetVarState("Pearl_Affection", 0);
        StoryManager.Instance.SetVarState("Shad_Affection", 0);
        StoryManager.Instance.SetVarState("Rory_Affection", 0);
        StoryManager.Instance.SetVarState("Ravynn_Affection", 0);
    }
}
