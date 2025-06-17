using UnityEngine;

public class PearlCharacter : StoryCharacter
{
    [Tooltip("Sprite for Pearl's special pose (no expressions)")]
    public Sprite MermaidSprite; // just one sprite for the special pose

    public enum PearlPose
    {
        Default,
        Pose2,
        Pose3,
        Mermaid
    }

    private int GetPearlIndex(PearlPose pose, Expression expression)
    {
        if (pose == PearlPose.Mermaid)
        {
          
            return -1;
        }
        else
        {
            return ((int)pose * 5) + (int)expression;
        }
    }

    public void SetSprite(PearlPose pose, Expression expression)
    {
        if (pose == PearlPose.Mermaid)
        {
            if (MermaidSprite != null)
            {
                characterImage.sprite = MermaidSprite;
                characterImage.SetNativeSize();
            }
        }
        else
        {
            base.SetSprite((Pose)pose, expression);
        }
    }
}
