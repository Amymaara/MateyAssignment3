using UnityEngine;

public class StuCharacter : StoryCharacter
{
    public enum StuPose
    {
        Pose1,
        Pose2
      
    }

    private int GetIndex(StuPose pose, Expression expression)
    {
        if (pose == StuPose.Pose1)
        {

            return 1;
        }
        else
        {
            return 2;
        }
    }

    public void SetSprite(StuPose pose, Expression expression)
    {
        if (pose == StuPose.Pose1)
        {
                characterImage.sprite = base.sprites[0];
                characterImage.SetNativeSize();
            
        }
        else
        {
            characterImage.sprite = base.sprites[1];
            characterImage.SetNativeSize();
        }
    }
}
