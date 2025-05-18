using UnityEngine;
using static GameStateManager;
using UnityEngine.SceneManagement;
using DG.Tweening;

public class SceneChanger : MonoBehaviour
{
    public string nextScene;

    // loads in a new scene based on the next scene name
    private void LoadNextScene(string sceneName)
    {
        DOTween.KillAll();
        SceneManager.LoadScene(sceneName);
    }

    // for the buttons that load inthe next scene
    public void onStartGame()
    {
        SetState(gameState.Day0);
        LoadNextScene(nextScene);
    }

   
}
