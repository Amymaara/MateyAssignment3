using UnityEngine;

public class BeforeFightLogic : MonoBehaviour
{
    public SceneChanger SceneChanger;
    public TextAsset beforeFight;
    public string nextScene;
    

    private void Start()
    {
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
        SceneChanger.OnSceneStart();
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
