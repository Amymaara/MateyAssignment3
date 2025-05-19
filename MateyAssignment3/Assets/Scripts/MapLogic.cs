using UnityEngine;

public class MapLogic : MonoBehaviour
{
    public GameObject map;

    [Header("rooms")]
    public GameObject Deck;
    public GameObject Study;
    public GameObject Pearl;
    public GameObject Galley;
    public GameObject MessHall;
    public GameObject Charting;
    public GameObject Captains;

    public GameObject[] rooms;

    private void OnEnable()
    {
        GameStateManager.OnGameStateChanged += OnGameStateChanged;
    }

    private void OnDisable()
    {
        GameStateManager.OnGameStateChanged -= OnGameStateChanged;
    }

    private void Start()
    {
        map.SetActive(false);
        rooms = new GameObject[] { Deck, Study, Pearl, Galley, MessHall, Charting, Captains };
        foreach (GameObject room in rooms)
        {
            room.SetActive(false);
        }

        // Also call once in case GameState is already set
        OnGameStateChanged(GameStateManager.CurrentState);
    }

    private void OnGameStateChanged(GameStateManager.gameState newState)
    {
        Debug.Log("MapLogic reacting to game state: " + newState);

        foreach (GameObject room in rooms)
        {
            room.SetActive(false);
        }

        switch (newState)
        {
            case GameStateManager.gameState.Day0:
                if (GameStateManager.numRoomsVisited == 4)
                {
                    Captains.SetActive(true);
                    GameStateManager.SetState(GameStateManager.gameState.Argument);
                }
                else
                {
                    foreach (GameObject room in rooms)
                    {
                        bool visited = GameStateManager.RoomsVisited.Contains(room);
                        bool blocked = room == MessHall || room == Charting || room == Captains;

                        if (!visited && !blocked)
                        {
                            Debug.Log("Room activated: " + room.name);
                            room.SetActive(true);
                        }
                    }
                }
                break;

            case GameStateManager.gameState.Argument:
                foreach (GameObject room in rooms)
                {
                    if (!GameStateManager.RoomsVisited.Contains(room))
                    {
                        room.SetActive(true);
                    }
                }
                Captains.SetActive(false);
                break;

            case GameStateManager.gameState.Day1:
                Captains.SetActive(true);
                break;
        }
    }

    public void OnMapIcon()
    {
        map.SetActive(true);
    }
}
