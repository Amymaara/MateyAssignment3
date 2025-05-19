using System;
using System.Collections.Generic;
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


    public static gameState CurrentState { get; private set; } = gameState.MainMenu;
    public static event Action<gameState> OnGameStateChanged;

    public static void SetState(gameState newState)
    {
        if (CurrentState == newState) return;

        CurrentState = newState;
        Debug.Log("Game State now: " + newState);
        OnGameStateChanged?.Invoke(newState);
    }

}
