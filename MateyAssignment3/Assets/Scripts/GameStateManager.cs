using System;
using UnityEngine;


public static class GameStateManager 
{
    public enum gameState
    {
        MainMenu,
        Day0,
        Argument,
        Combat,
        
    }

    public static int roomsVisited = 0;
    public static int DayCount = 0;

 
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
