
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
    public float fadeDuration = 1.0f;
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
            characterImage.sprite = sprites[index];
            characterImage.SetNativeSize();
            //StartCoroutine(CrossFadeToSprite(sprites[index]));
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
    
    private IEnumerator CrossFadeToSprite(Sprite newSprite)
    {
       
        transitionImage.sprite = characterImage.sprite;
        transitionImage.SetNativeSize();
        transitionImage.color = new Color(1f, 1f, 1f, 1f); // fully visible

        
        characterImage.sprite = newSprite;
        characterImage.SetNativeSize();
        characterImage.color = new Color(1f, 1f, 1f, 0f); // fully transparent

        float fadeInPartialDuration = fadeDuration * 0.6f;
        float fadeOverlapDuration = fadeDuration * 0.4f;

       
        yield return characterImage
            .DOFade(0.8f, fadeInPartialDuration)
            .SetEase(Ease.Linear)
            .WaitForCompletion();

        
        Tween finalFadeIn = characterImage
            .DOFade(1f, fadeOverlapDuration)
            .SetEase(Ease.Linear);

        Tween fadeOutOld = transitionImage
            .DOFade(0f, fadeOverlapDuration)
            .SetEase(Ease.Linear);

        yield return DOTween.Sequence()
            .Join(finalFadeIn)
            .Join(fadeOutOld)
            .WaitForCompletion();

        
        characterImage.color = new Color(1f, 1f, 1f, 1f);
        transitionImage.color = new Color(1f, 1f, 1f, 0f);
    }

    */

    public void PlayAffectionChange(bool isPositive)
    {
        if (isPositive && affectionGainParticles != null)
            affectionGainParticles.Play();
        else if (!isPositive && affectionLossParticles != null)
            affectionLossParticles.Play();
    }
}