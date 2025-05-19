using UnityEngine;
using static GameStateManager;
using UnityEngine.SceneManagement;
using DG.Tweening;
using UnityEngine.UI;

public class SceneChanger : MonoBehaviour
{
    public string nextScene;
    public  Image screenFader;
    public GameObject blackScreen;
    public float fadeDuration = 1f;

    // loads in a new scene based on the next scene name
    public void LoadNextScene(string sceneName)
    {
        DOTween.KillAll();
        blackScreen.SetActive(true);
        screenFader.DOFade(1f, fadeDuration).OnComplete(() =>
        {
            SceneManager.LoadScene(sceneName);
        });
    }

    public void OnSceneStart()
    {
        screenFader.color = new Color(0, 0, 0, 1);
        screenFader.DOFade(0f, fadeDuration);
        screenFader.DOFade(0f, fadeDuration).OnComplete(() =>
        {
            blackScreen.SetActive(false); 
        });

        
        
    }

    // for the buttons that load inthe next scene
    public void onStartGame()
    {
        SetState(gameState.Day0);
        LoadNextScene(nextScene);
    }

 
    private void Start()
    {
        OnSceneStart();
    }

}
