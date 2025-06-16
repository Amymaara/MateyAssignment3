using UnityEngine;

public class BlackoutScript : MonoBehaviour
{
    public GameObject blackScreen;
    public int clicks;
    private int clicksCounter;

    private void Start()
    {
        blackScreen.SetActive(true);
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
