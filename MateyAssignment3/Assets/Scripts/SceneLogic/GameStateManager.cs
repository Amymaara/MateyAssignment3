using System;
using System.Collections.Generic;
using System.Linq;
using Unity.Collections;
using Unity.VisualScripting;
using UnityEngine;


public static class GameStateManager 
{
    public enum gameState
    {
        MainMenu,
        Day0,
        Argument,
        Day1,
        Day2,
        Argument2,
        Combat,
        
    }

 
    public static int numRoomsVisited => RoomsVisited.Count;

    public static int DayCount = 0;

    public static HashSet<string> RoomsVisited = new HashSet<string>();

    public static void MarkRoomVisited(string roomID)
    {
        if (!RoomsVisited.Contains(roomID))
        {
            RoomsVisited.Add(roomID);
            Debug.Log($"Room visited: {roomID} | Total: {RoomsVisited.Count}");
        }
    }

    public static List<string> AllRoomIDs = new List<string> 
    {
    "Deck", "Study", "Pearl", "Galley", "MessHall", "Charting", "Captains" , "GalleyDay" , "DeckDay"
    };

    public static bool AllRoomsVisited()
    {
        //return AllRoomIDs.All(id =>  RoomsVisited.Contains(id));
       return AllRoomIDs.Count == RoomsVisited.Count;
       

    }

    public static gameState CurrentState { get; private set; } = gameState.MainMenu;
    public static event Action<gameState> OnGameStateChanged;

    public static void SetState(gameState newState)
    {
        if (CurrentState == newState) return;

        // Increase the day counter
        if (newState == gameState.Argument ||
            newState == gameState.Argument2 ||
            newState == gameState.Combat)
        {
            if (newState == gameState.Argument && DayCount == 2)
            {
                DayCount = 2;
            }
            else if (newState == gameState.Argument2 && DayCount == 4)
            {
                DayCount = 4;
            }
            else if (newState == gameState.Combat)
            {
                DayCount = 5;
            }
            else
            {
                DayCount++;
            }
                
            Debug.Log("Day Count increased to: " + DayCount);
        }

        CurrentState = newState;
        Debug.Log("Game State now: " + newState);
        OnGameStateChanged?.Invoke(newState);
    }

}
