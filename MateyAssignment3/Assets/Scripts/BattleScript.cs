using UnityEngine;
using UnityEngine.SceneManagement;

public class BattleScript : MonoBehaviour
{
    public TextAsset BattleFile;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
        StoryManager.Instance.StartStory(BattleFile, "BattleFile");
    }

    private void AfterStoryEnds(string finishedStory)
    {
        SceneManager.LoadScene("GameEnd");

    }

}
