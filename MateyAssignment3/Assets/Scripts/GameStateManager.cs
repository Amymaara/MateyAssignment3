using System;
using System.Collections.Generic;
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

    public static int numRoomsVisited = 0;
    public static int DayCount = 0;
    public static List<GameObject> RoomsVisited = new List<GameObject>();


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
