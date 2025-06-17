using UnityEngine;
using UnityEngine.UI;
using TMPro;



public class PearlDay4Logic : MonoBehaviour
{
    public GameObject blackout;
    public Image Pearl;
    public Sprite Mermaid;

    public SparklesManager SparklesManager;
    public TMP_Text Dialogue;
    public string Line;
    private int clicks;

    private void Start()
    {
        if (GameStateManager.CurrentState == GameStateManager.gameState.Day2)
        {
            blackout.SetActive(true);
            Pearl.sprite = Mermaid;
            Pearl.SetNativeSize();
            clicks = 0;
            Line = "This Kraken thing...it's not like the sea beasts I'm used to. It's ancient, primal and I feel like it knows we're coming.";

        }
        else
        {
            blackout.SetActive(false);
        }
    }

    private void Update()
    {
        if ((GameStateManager.CurrentState == GameStateManager.gameState.Day2) && (clicks == 0)) 
        {
           if(Dialogue.text.Contains(Line))
            {
                SparklesManager.ParticleObject.SetActive(true);
                SparklesManager.sparkles.Play();
                clicks++;
            }

        }
    }
}
