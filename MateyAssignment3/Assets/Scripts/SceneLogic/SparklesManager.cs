using UnityEngine;

public class SparklesManager : MonoBehaviour
{
    public GameObject ParticleObject;
    public ParticleSystem sparkles;
    public int clicks;
    private int clicksCounter;
   
    private bool canAdvance = false;
    private bool previousWaitingForContinue = false;

    public StoryManager storyManager;
    private void Start()
    {
        if(GameStateManager.CurrentState == GameStateManager.gameState.Day2 || GameStateManager.CurrentState == GameStateManager.gameState.Combat)
        {
            ParticleObject.SetActive(true);
        }
        else
        {
            ParticleObject.SetActive(false);
        }
    }

    void Update()
    {

        if (!previousWaitingForContinue && storyManager.waitingForContinue)
        {
            canAdvance = true;
        }

        previousWaitingForContinue = storyManager.waitingForContinue;


        if (canAdvance&& Input.GetKeyDown(KeyCode.Space))
        {
            continueButton();
            canAdvance = false;
        }
    }

    public void skipbutton()
    {
        if (clicks > clicksCounter)
        {
            sparkles.Play();
        }
        else
        {
            ParticleObject.SetActive(false);
        }
    }

    public void continueButton()
    {
        clicksCounter++;
        if (clicksCounter == clicks)
        {
            sparkles.Play();
        }
        if (clicks < clicksCounter)
        {
            ParticleObject.SetActive(false);
        }
    }

}
