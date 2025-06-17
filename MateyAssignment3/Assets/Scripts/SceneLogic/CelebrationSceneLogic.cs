using UnityEngine;

public class CelebrationSceneLogic : MonoBehaviour
{
    public TextAsset EndingScene;
    public SceneChanger sceneChanger;
    

    private void Start()
    {
        sceneChanger.OnSceneStart();
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
        StoryManager.Instance.StartStory(EndingScene, "EndScene");

      

        
    }


    private void AfterStoryEnds(string finishedStory)
    {
        int pearl = (int)(StoryManager.Instance.GetVarState("Pearl_Affection") as Ink.Runtime.IntValue).value;
        int shad = (int)(StoryManager.Instance.GetVarState("Shad_Affection") as Ink.Runtime.IntValue).value;
        int rory = (int)(StoryManager.Instance.GetVarState("Rory_Affection") as Ink.Runtime.IntValue).value;
        int ravynn = (int)(StoryManager.Instance.GetVarState("Ravynn_Affection") as Ink.Runtime.IntValue).value;

        string ending = GetHighestAffectionEnding(pearl, shad, ravynn, rory);


        sceneChanger.LoadNextScene(ending);

    }


   

       private string GetHighestAffectionEnding(int pearl, int shad, int ravynn, int rory)
    {
        int max = Mathf.Max(pearl, shad, ravynn, rory);

        if (max < 50) return "NoAffectionEnding"; // If all affection less than 50
        if (pearl == max) return "PearlEnding";
        if (shad == max) return "ShadEnding";
        if (ravynn == max) return "RavynnEnding";
        if (rory == max) return "RoryEnding";

        return "NoAffectionEnding"; 
    }
    

}
