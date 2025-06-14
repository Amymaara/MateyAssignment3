using UnityEngine;

public class KrakenCharacter : StoryCharacter
{
    public enum KrakenPose
    {
        Default,
        Human
        
    }

    public enum KrakenExpression
    {
        Neutral,
        Blush
    }

    private int GetKrakenIndex(KrakenPose pose, KrakenExpression expression)
    {
        return ((int)pose * 2) + (int)expression;
    }

    public void SetSprite(KrakenPose pose, KrakenExpression expression)
    {
        int index = GetKrakenIndex(pose, expression);
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
}
