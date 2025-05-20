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
            //return;
        }

        UIPanelAnimation uiPanelAnimation = Map.GetComponent<UIPanelAnimation>();
        uiPanelAnimation.SlideOutAndDisable();

        // Mark room as visited
        if (!GameStateManager.RoomsVisited.Contains(roomID))
        {
            GameStateManager.MarkRoomVisited(roomID);
            
        }

        // Handle Captain's Quarters entry trigger
        if (GameStateManager.CurrentState == GameStateManager.gameState.Day0 )
        {
            if (GameStateManager.numRoomsVisited > 4)
            {
                GameStateManager.SetState(GameStateManager.gameState.Argument);
                
            }
            
        }

       

        // Continue room transition logic
        if (roomLogic != null)
        {
            roomLogic.Blackscreen.SetActive(true);
            roomLogic.Stu.SetActive(true);
            StoryManager.Instance.OnStoryEnd += AfterStoryEnds;

            if (GameStateManager.CurrentState == GameStateManager.gameState.Day0)

            {
                inkFile = roomLogic.Day0PostScript;
                
                StoryManager.Instance.StartStory(inkFile, "Day0Script");
            }
            else if (GameStateManager.CurrentState == GameStateManager.gameState.Day1)
            {
                inkFile = roomLogic.Day1PostScript;
                GameStateManager.SetState(gameState.Argument);
           
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
            if (GameStateManager.numRoomsVisited >= 4)
            {
                SceneManager.LoadScene("DayTransition");

            }
            else
            {
                SceneManager.LoadScene(roomSceneName);
            }
                

        }
        else if (finishedStory == "Day1Script")
        {
            Debug.Log("Checking room visit completion...");
            Debug.Log("Rooms visited: " + string.Join(", ", GameStateManager.RoomsVisited));

            if (GameStateManager.AllRoomsVisited())
            {
                Debug.Log("All rooms visited. Loading BeforeKraken scene...");
                GameStateManager.SetState(GameStateManager.gameState.Combat);
                sceneChanger.LoadNextScene("BeforeKraken");
            }
            else
            {
                Debug.Log("Not all rooms visited yet. Loading " + roomSceneName);
                SceneManager.LoadScene(roomSceneName);
            }

        }
        
         Debug.Log("all stories in scene have finished");
         
        
         
    }

    private void OnDestroy()
    {
        StoryManager.Instance.OnStoryEnd -= AfterStoryEnds;
    }
}
