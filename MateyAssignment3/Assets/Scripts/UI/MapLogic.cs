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
    public GameObject GalleyDay;
    public GameObject DeckDay;

    public GameObject[] rooms;
    public string[] roomIDs;

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
        rooms = new GameObject[] { Deck, Study, Pearl, Galley, MessHall, Charting, Captains, GalleyDay, DeckDay };
        roomIDs = new string[] { "Deck", "Study", "Pearl", "Galley", "MessHall", "Charting", "Captains" , "GalleyDay" , "DeckDay"};
        foreach (GameObject room in rooms)
        {
            room.SetActive(false);
        }

        // Also call once in case GameState is already set
        OnGameStateChanged(GameStateManager.CurrentState);
    }

    private void OnGameStateChanged(GameStateManager.gameState newState)
    {
        //Debug.Log("MapLogic reacting to game state: " + newState);

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
                    
                }
                if (GameStateManager.numRoomsVisited > 4)
                {
                    
                    GameStateManager.SetState(GameStateManager.gameState.Argument);
                }
                else
                {
                    for (int i = 0; i < rooms.Length; i++)
                    {
                        string id = roomIDs[i];
                        GameObject room = rooms[i];

                        bool visited = GameStateManager.RoomsVisited.Contains(id);
                        bool blocked = room == MessHall || room == Charting || room == Captains || room == DeckDay || room == GalleyDay;

                        if (!visited && !blocked)
                        {
                            room.SetActive(true);
                        }
                    }
                }
                break;

            case GameStateManager.gameState.Argument:
                for (int i = 0; i < rooms.Length; i++)
                {
                    string id = roomIDs[i];
                    GameObject room = rooms[i];

                    bool visited = GameStateManager.RoomsVisited.Contains(id);
                    bool blocked = room == DeckDay || room == GalleyDay;

                    if (!visited && !blocked)
                    {
                        room.SetActive(true);
                    }
                }
                Captains.SetActive(false);
                break;

            case GameStateManager.gameState.Day1:
                Captains.SetActive(true);
                break;

            case GameStateManager.gameState.Argument2:
                for (int i = 0; i < rooms.Length; i++)
                {
                    string id = roomIDs[i];
                    GameObject room = rooms[i];

                    if (!GameStateManager.RoomsVisited.Contains(id))
                    {
                        room.SetActive(true);
                    }
                }
                Captains.SetActive(false);
                break;

            case GameStateManager.gameState.Day2:
                Captains.SetActive(true);
                break;
        }
    }

    public void OnMapIcon()
    {
        map.SetActive(true);
        OnGameStateChanged(GameStateManager.CurrentState);
    }
}
