using UnityEngine;
using UnityEngine.Video;

public class BeforeFightLogic : MonoBehaviour
{
    public SceneChanger SceneChanger;
    public TextAsset beforeFight;
    public VideoPlayer videoPlayer;
    public string nextScene;
    public GameObject MapButton;
    

    private void Start()
    {
        GameStateManager.SetState(GameStateManager.gameState.Combat);
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
        SceneChanger.OnSceneStart();
       if (MapButton != null)
        {
            MapButton.SetActive(false);
        }
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

            StoryManager.Instance.OnStoryEnd -= AfterStoryEnds; //stop listening for stories that have ended

            if (nextScene != null)
            {
                SceneChanger.LoadNextScene(nextScene);
            }
            else
            {
                MapButton.SetActive(true);
            }
        }
    }

}
