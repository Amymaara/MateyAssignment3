using UnityEngine;

public class PearlCharacter : StoryCharacter
{
    [Tooltip("Sprite for Pearl's special pose (no expressions)")]
    public Sprite specialPoseSprite; // just one sprite for the special pose

    public enum PearlPose
    {
        Default,
        Pose2,
        Pose3,
        SpecialPose
    }

    private int GetPearlIndex(PearlPose pose, Expression expression)
    {
        if (pose == PearlPose.SpecialPose)
        {
          
            return -1;
        }
        else
        {
            return ((int)pose * 6) + (int)expression;
        }
    }

    public void SetSprite(PearlPose pose, Expression expression)
    {
        if (pose == PearlPose.SpecialPose)
        {
            if (specialPoseSprite != null)
            {
                characterImage.sprite = specialPoseSprite;
                characterImage.SetNativeSize();
            }
        }
        else
        {
            base.SetSprite((Pose)pose, expression);
        }
    }
}
