
using UnityEngine;
using UnityEngine.UI;

using System.Collections;
using DG.Tweening;
using UnityEditor.SceneManagement;

public class StoryCharacter : MonoBehaviour
{
    public string characterName;
    public Image characterImage;
    public ParticleSystem affectionGainParticles;
    public ParticleSystem affectionLossParticles;
    

    public virtual string GetDisplayName()
    {
        return characterName;
    }

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
        Smile,
        Sad
    }


    [Tooltip("Order: Default (Neutral, Blush, Angry, Smile, Sad) Pose1 (neutral, blush, angry, smile, sad) Pose2 (neutral, blush, angry, smile, sad)")]
    public Sprite[] sprites = new Sprite[15];

    private void Start()
    {
        characterImage.alphaHitTestMinimumThreshold = 0.1f;
    }

    private int GetIndex(Pose pose, Expression expression)
    {
        return ((int)pose * 5) + (int)expression;
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
            characterImage.sprite = sprites[index];
            characterImage.SetNativeSize();
            //StartCoroutine(CrossFadeToSprite(sprites[index]));
        }
        else
        {
            Debug.LogWarning($"Sprite missing for {characterName} at index {index}");
        }
    }


    public void PlayAffectionChange(bool isPositive)
    {
        if (isPositive && affectionGainParticles != null)
            affectionGainParticles.Play();
        else if (!isPositive && affectionLossParticles != null)
            affectionLossParticles.Play();
    }
}