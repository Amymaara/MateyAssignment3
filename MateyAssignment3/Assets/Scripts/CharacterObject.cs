
using UnityEngine;
using UnityEngine.UI;

using System.Collections;

public class StoryCharacter : MonoBehaviour
{
    public string characterName;
    public Image characterImage;
    public enum Pose
    {
        Default,
        Pose2,
        Pose3
    }

    public enum Expression
    {
        Neutral,
        Blush,
        Angry,
        Sad
    }

    [Tooltip("Order: Default (Neutral, Blush, Angry, Sad) Pose1 (neutral, blush, angry, sad) Pose2 (neutral, blush, angry, sad)")]
    public Sprite[] sprites = new Sprite[12];

    private void Start()
    {
        characterImage.alphaHitTestMinimumThreshold = 0.1f;
    }

    private int GetIndex(Pose pose, Expression expression)
    {
        return ((int)pose * 4) + (int)expression;
    }

    /*
     Title: Smooth Sprite Transition in Unity Using Coroutine Fade(CanvasGroup and Image.CrossFadeAlpha)
    Author: ChatGPT(OpenAI)
    Date: 2025-05-19
    Code version: 1.0 (custom example)
    Availability: Generated in conversation with ChatGPT, OpenAI platform
    */
    public void SetSprite(Pose pose, Expression expression)
    {
        int index = GetIndex(pose, expression);
        if (index >= 0 && index < sprites.Length && sprites[index] != null)
        {
            StartCoroutine(CrossFadeToSprite(sprites[index]));
        }
        else
        {
            Debug.LogWarning($"Sprite missing for {characterName} at index {index}");
        }
    }

    /*
     Title: Smooth Sprite Transition in Unity Using Coroutine Fade(CanvasGroup and Image.CrossFadeAlpha)
    Author: ChatGPT(OpenAI)
    Date: 2025-05-19
    Code version: 1.0 (custom example)
    Availability: Generated in conversation with ChatGPT, OpenAI platform
    */
    private IEnumerator CrossFadeToSprite(Sprite newSprite)
    {
        characterImage.CrossFadeAlpha(0f, 0.5f, false); // Fade out over 0.5s
        yield return new WaitForSeconds(0.5f);
        characterImage.sprite = newSprite;
        characterImage.SetNativeSize();
        characterImage.CrossFadeAlpha(1f, 0.5f, false); // Fade in over 0.5s
    }
}