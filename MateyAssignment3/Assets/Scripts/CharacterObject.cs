using UnityEngine;
using UnityEngine.UI;
using static UnityEditor.Progress;

public class StoryCharacter : MonoBehaviour
{
    public string characterName;
    public Image characterImage;
    public enum Pose
    {
        Default,
        Pose1,
        Pose2
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

    public void SetSprite(Pose pose, Expression expression)
    {
        int index = GetIndex(pose, expression);
        if (index >= 0 && index < sprites.Length && sprites[index] != null)
        {
            characterImage.sprite = sprites[index];
        }
        else
        {
            Debug.LogWarning($"Sprite missing for {characterName} at index {index}");
        }
    }
}