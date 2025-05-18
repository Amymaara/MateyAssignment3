using System.Linq;
using UnityEngine;
using static GameStateManager;


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

    private void Start()
    {
        map.SetActive(false);
        rooms = new GameObject[] { Deck, Study, Pearl, Galley, MessHall, Charting, Captains };
        foreach (GameObject room in rooms)
        {
            room.SetActive(false);
        }

        if (CurrentState == gameState.Day0)
        {
            if (GameStateManager.numRoomsVisited == 4)
            {
                Captains.SetActive(true);
                SetState(gameState.Argument);
            }

            if (GameStateManager.numRoomsVisited < 4)
            {
                foreach (GameObject room in rooms)
                {
                    if (GameStateManager.RoomsVisited.Contains(room))
                    {
                        room.SetActive(false);
                    }
                    else if (room == MessHall)
                    {
                        room.SetActive(false);
                    }
                    else if (room == Charting)
                    {
                        room.SetActive(false);
                    }
                    else
                    {
                        room.SetActive(true);
                    }
                }
            }
        }

        if (CurrentState == gameState.Argument)
        {
             foreach (GameObject room in rooms)
             {
               if (GameStateManager.RoomsVisited.Contains(room))
               {
                   room.SetActive(false);
               }
               
                    
               else
               {
                   room.SetActive(true);
               }

                Captains.SetActive(false);
            }
        }

        if (CurrentState == gameState.Day1)
        {
            foreach (GameObject room in rooms)
            {
                room.SetActive(false) ;
            }

            Captains.SetActive(true) ;
        }
    }

    public void OnMapIcon()
    {
        map.SetActive(true);
    }

}
