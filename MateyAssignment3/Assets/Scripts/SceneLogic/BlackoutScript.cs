using UnityEngine;

public class BlackoutScript : MonoBehaviour
{
    public GameObject blackScreen;
    public int clicks;
    private int clicksCounter;
    private bool canAdvanceVideo = false;
    private bool previousWaitingForContinue = false;

    public StoryManager storyManager;
    private void Start()
    {
       
        //blackScreen.SetActive(true);
    }

    void Update()
    {

        if (!previousWaitingForContinue && storyManager.waitingForContinue)
        {
            canAdvanceVideo = true;
        }

        previousWaitingForContinue = storyManager.waitingForContinue;


        if (canAdvanceVideo && Input.GetKeyDown(KeyCode.Space))
        {
            continueButton();
            canAdvanceVideo = false;
        }
    }

    public void skipbutton()
    {
        blackScreen.SetActive(false);
    }

    public void continueButton()
    {
        clicksCounter++;
        if(clicksCounter == clicks)
        {
            blackScreen.SetActive(false);
        }
    }

}
