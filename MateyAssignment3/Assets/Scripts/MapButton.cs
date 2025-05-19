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
        if (string.IsNullOrEmpty(roomID))
        {
            Debug.LogError("RoomID is not set!");
            return;
        }

        UIPanelAnimation uiPanelAnimation = Map.GetComponent<UIPanelAnimation>();
        uiPanelAnimation.SlideOutAndDisable();

        // Mark room as visited
        if (!GameStateManager.RoomsVisited.Contains(roomID))
        {
            GameStateManager.MarkRoomVisited(roomID);
            
        }

        // Handle Captain's Quarters entry trigger
        if (GameStateManager.CurrentState == GameStateManager.gameState.Day0 && roomID == "Captains")
        {
            if (GameStateManager.numRoomsVisited > 4)
            {
                GameStateManager.SetState(GameStateManager.gameState.Argument);
            }
            else
            {
                Debug.Log("Captain's Quarters is locked until you've visited 4 rooms.");
                return; // Optionally block entry
            }
        }

        // Continue room transition logic
        if (roomLogic != null)
        {
            roomLogic.Blackscreen.SetActive(true);
            roomLogic.Stu.SetActive(true);

            if (GameStateManager.CurrentState == GameStateManager.gameState.Day0)
            {
                inkFile = roomLogic.Day0PostScript;
                StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
                StoryManager.Instance.StartStory(inkFile, "Day0Script");
            }
            else if (GameStateManager.CurrentState == GameStateManager.gameState.Day1)
            {
                inkFile = roomLogic.Day1PostScript;
                StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
                StoryManager.Instance.StartStory(inkFile, "Day1Script");
            }
        }
        else
        {
            sceneChanger.LoadNextScene(roomSceneName);
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
