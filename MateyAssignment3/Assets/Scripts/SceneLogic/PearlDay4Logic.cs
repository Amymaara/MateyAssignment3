using UnityEngine;
using UnityEngine.UI;



public class PearlDay4Logic : MonoBehaviour
{
    public GameObject blackout;
    public Image Pearl;
    public Sprite Mermaid;

    private void Start()
    {
        if (GameStateManager.CurrentState == GameStateManager.gameState.Day2)
        {
            blackout.SetActive(true);
            Pearl.sprite = Mermaid;
            Pearl.SetNativeSize();
        }
        else
        {
            blackout.SetActive(false);
        }
    }

}
