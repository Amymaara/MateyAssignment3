using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

using DG.Tweening;

public class MainMenuScript : MonoBehaviour
{
    public GameObject credits;
    public Button creditButton;
    public Button startButton;
    public Button settingsButton;
    

    private void Start()
    {
        credits.SetActive(false);
    }

    public void OnCreditButton()
    {
        credits.SetActive(true);
        creditButton.interactable = false;
        startButton.interactable = false;
        settingsButton.interactable = false;
    }

    public void OnCreditButtonExit()
    {
     credits.SetActive(false);
        creditButton.interactable = true;
        startButton.interactable = true; 
        settingsButton.interactable = true;
    }

    
}
