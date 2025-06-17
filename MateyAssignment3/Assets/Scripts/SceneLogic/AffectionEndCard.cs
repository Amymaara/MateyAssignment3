using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class AffectionEndCard : MonoBehaviour
{
    public Image heartImage;
    public Sprite[] heartSprites; 
    public float animationDelay = 0.3f; 

    private int targetIndex;
    public string Character_Affection;

    public int TestVariable;

    private void OnEnable()
    {
        ShowEndcard();
    }


    public void StartHeartAnimation(int affection)
    {
        targetIndex = Mathf.Clamp(affection / 10, 0, heartSprites.Length - 1);
        StartCoroutine(AnimateHearts());
    }

    private IEnumerator AnimateHearts()
    {
        for (int i = 0; i <= targetIndex; i++)
        {
            heartImage.sprite = heartSprites[i];
            yield return new WaitForSeconds(animationDelay);
        }
    }

    void ShowEndcard()
    {
        int affection;

        if (Character_Affection == null) 
        {
            affection = 100;
        }
        else
        {
            affection = StoryManager.Instance.GetIntVar(Character_Affection);
        }
            
        //int affection = TestVariable;
       StartHeartAnimation(affection);
    }


}
