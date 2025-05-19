using UnityEngine;

public class BattleScript : MonoBehaviour
{
    public TextAsset BattleFile;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        StoryManager.Instance.StartStory(BattleFile, "BattleFile");
    }

    
}
