using UnityEngine;
using UnityEngine.Video;

public class BeforeFightLogic : MonoBehaviour
{
    public SceneChanger SceneChanger;
    public TextAsset beforeFight;
    public VideoPlayer videoPlayer;
    public string nextScene;
    

    private void Start()
    {
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
        SceneChanger.OnSceneStart();
        videoPlayer.loopPointReached += OnVideoFinished;
        
    }
    private void OnVideoFinished(VideoPlayer vp)
    {
        Debug.Log("Video finished!");
        StartDialogue();
    }

    private void StartDialogue()
    {
        StoryManager.Instance.StartStory(beforeFight, "beforeFight");
    }
    private void AfterStoryEnds(string finishedStory)
    {
        if (finishedStory == "beforeFight")
        {

            Debug.Log("pre fight finished");
            StoryManager.Instance.OnStoryEnd -= AfterStoryEnds; //stop listening for stories that have ended
            SceneChanger.LoadNextScene(nextScene);
        }
    }

}
