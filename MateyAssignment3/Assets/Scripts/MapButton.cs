using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using static GameStateManager;


public class MapButton : MonoBehaviour
{
    public string roomID;
    public GameObject Map;
    public RoomLogic roomLogic;
    public SceneChanger sceneChanger;
    public string roomSceneName;
    private TextAsset inkFile;

    void Awake()
    {
        if (string.IsNullOrEmpty(roomID))
        {
            roomID = gameObject.name; 
        }
    }
    public void onRoomButtonPress()
    {
        UIPanelAnimation uiPanelAnimation = Map.GetComponent<UIPanelAnimation>();
        uiPanelAnimation.SlideOutAndDisable();

        
        
        if (!GameStateManager.RoomsVisited.Contains(roomID))
        {
            GameStateManager.MarkRoomVisited(roomID);
            
        }

        if (CurrentState == gameState.Day0)
        {
            if (roomLogic != null)
            {
                roomLogic.Blackscreen.SetActive(true);
                roomLogic.Stu.SetActive(true);
                inkFile = roomLogic.Day0PostScript;
                StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
                StoryManager.Instance.StartStory(inkFile, "Day0Script");
            }
            else
            {
                sceneChanger.LoadNextScene(roomSceneName);
            }
            
        }

        else if (CurrentState == gameState.Argument)
        {
            GameStateManager.SetState(gameState.Day1);
            sceneChanger.LoadNextScene(roomSceneName);
        }

        else if (CurrentState == gameState.Day1)
        {
            
            inkFile = roomLogic.Day1PostScript;
            roomLogic.Blackscreen.SetActive(true);
            roomLogic.Stu.SetActive(true);
            StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
            StoryManager.Instance.StartStory(inkFile, "Day1Script");

            if (numRoomsVisited >= 5)
            {
                GameStateManager.SetState(gameState.Argument);
                sceneChanger.LoadNextScene(roomSceneName);
            }
            else
            {
                GameStateManager.SetState(gameState.Combat);
                sceneChanger.LoadNextScene(roomSceneName);
            }  
        }
    }

    private void AfterStoryEnds(string finishedStory)
    {
        if (finishedStory == "Day0Script")
        {
            SceneManager.LoadScene(roomSceneName);

        }
        else if (finishedStory == "Day1Script")
        {

            SceneManager.LoadScene(roomSceneName);
        }
        
         Debug.Log("all stories in scene have finished");
         
        
         
    }

    private void OnDestroy()
    {
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
    }
}
