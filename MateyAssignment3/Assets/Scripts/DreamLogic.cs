using TMPro;
using UnityEngine;
using static UnityEngine.InputSystem.LowLevel.InputStateHistory;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;



public class DreamLogic : MonoBehaviour
{
    [Header("Ink Files")]
    [SerializeField] private TextAsset Dream;

    [Header("Game Objects")]
    [SerializeField] private GameObject NamePanel; //player name input window
    public GameObject PronounPanel;

    public GameObject CCWindow;

    public SceneChanger SceneChanger;

    public GameObject toolTip;

    private void Start()
    {
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
        toolTip.SetActive(false);

        //SceneChanger.OnSceneStart();
    }

    private void AfterStoryEnds(string finishedStory)
    {
        if (finishedStory == "Dream")
        {
            
            Debug.Log("dream finished");
            StoryManager.Instance.OnStoryEnd -= AfterStoryEnds; //stop listening for stories that have ended
            SceneChanger.LoadNextScene("CaptainsRoom");
        }
    }

    // UIInputField function that gets the string that the player has typed in and confirmed
    public void ReadName(string x)
    {
        StoryManager.Instance.SetVarState("Name", x); // save the players name to the globals.ink file, makes it accesible later on.
    }

    // what happens when the players clicks the confirm button on their name
    public void OnNameConfirm()
    {
        string name = NamePanel.GetComponentInChildren<TMP_InputField>().text; //get reference to the text field
        ReadName(name); // gets player input
        //NamePanel.SetActive(false); //close the name input panel
        //StoryManager.Instance.StartStory(Second, "Second"); // start the second ink story

    }
    /* VAR PronounHe = ""
        VAR PronounHim = ""
        VAR PronounHisApple = ""
        VAR PronounHis = ""
    */
    public void PronounChoice(int pronoun)
    {
        if (pronoun == 0)
        {
            StoryManager.Instance.SetVarState("PronounHe", "they");
            StoryManager.Instance.SetVarState("PronounHim", "them");
            StoryManager.Instance.SetVarState("PronounHisApple", "their");
            StoryManager.Instance.SetVarState("PronounHis", "theirs");
        }
        if (pronoun == 1)
        {
            StoryManager.Instance.SetVarState("PronounHe", "she");
            StoryManager.Instance.SetVarState("PronounHim", "her");
            StoryManager.Instance.SetVarState("PronounHisApple", "her");
            StoryManager.Instance.SetVarState("PronounHis", "hers");
        }
        if (pronoun == 2)
        {
            StoryManager.Instance.SetVarState("PronounHe", "he");
            StoryManager.Instance.SetVarState("PronounHim", "him");
            StoryManager.Instance.SetVarState("PronounHisApple", "his");
            StoryManager.Instance.SetVarState("PronounHis", "his");
        }
    }
    /*
VAR Pearl_Affection = 0
VAR Shad_Affection = 0
VAR Rory_Affection = 0
VAR Ravynn_Affection = 0
*/
    public void OnCCDone()
    {
        OnNameConfirm();
        int pronoun = PronounPanel.GetComponentInChildren<TMP_Dropdown>().value;
        PronounChoice(pronoun);
        toolTip.SetActive(true);
        
    }

    public void OnToolTipClose()
    {
        StoryManager.Instance.StartStory(Dream, "Dream");
        StoryManager.Instance.SetVarState("Pearl_Affection", 0);
        StoryManager.Instance.SetVarState("Shad_Affection", 0);
        StoryManager.Instance.SetVarState("Rory_Affection", 0);
        StoryManager.Instance.SetVarState("Ravynn_Affection", 0);
    }
}
