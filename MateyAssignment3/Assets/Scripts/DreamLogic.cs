using TMPro;
using UnityEngine;

public class DreamLogic : MonoBehaviour
{
    [Header("Ink Files")]
    [SerializeField] private TextAsset Dream;

    [Header("Game Objects")]
    [SerializeField] private GameObject NamePanel; //player name input window
    public GameObject CCWindow;

    private void Start()
    {
        StoryManager.Instance.OnStoryEnd += AfterStoryEnds;
    }

    private void AfterStoryEnds(string finishedStory)
    {
        if (finishedStory == "Dream")
        {
            Debug.Log("story 1 finished");
            StoryManager.Instance.OnStoryEnd -= AfterStoryEnds; //stop listening for stories that have ended
            
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
        NamePanel.SetActive(false); //close the name input panel
        //StoryManager.Instance.StartStory(Second, "Second"); // start the second ink story

    }


}
