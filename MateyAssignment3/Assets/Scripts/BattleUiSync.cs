using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using UnityEngine.SceneManagement;

public class BattleUiSync : MonoBehaviour
{
    public Slider playerHPSlider;
    public Slider krakenHPSlider;

    private Story inkStory;

    private void Start()
    {
        // This finds the story manager in scene and gets active ink story
        inkStory = FindFirstObjectByType<StoryManager>().GetStory();

        //sets the sliders values

        playerHPSlider.maxValue = 80;
        krakenHPSlider.maxValue = 100;
    }

    private void Update()
    {
        if (inkStory != null)
        {
            //reads the HP from ink and applies it to the slider
            playerHPSlider.value = (float)(int)inkStory.variablesState["playerHP"];

            krakenHPSlider.value = (float)(int)inkStory.variablesState["KrakenHP"];

        }

        if (inkStory != null && !inkStory.canContinue)
        {
            //checks for  scene ending tags to load the appropirate next scene
            if (inkStory.currentTags.Contains("win"))
                SceneManager.LoadScene("CelebrationScene");
            else if (inkStory.currentTags.Contains("lose"))
                SceneManager.LoadScene("KrakenDefeatScene");
            else if (inkStory.currentTags.Contains("krakenEnd"))
                SceneManager.LoadScene("KrakenSecretEnd");
        }
    }
}
