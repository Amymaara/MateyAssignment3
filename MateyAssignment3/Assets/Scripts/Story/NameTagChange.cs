using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class NameTagChange : MonoBehaviour
{
    [System.Serializable]
    public class NameTag
    {
        public string characterName;
        public Sprite nameTagSprite;
    }

    public List<NameTag> nameTags;
    public Image NameTagImage;

    public void UpdateNameTag(string speaker)
    {
        foreach (var tag in nameTags)
        {
            if (tag.characterName == speaker)
            {
                NameTagImage.sprite = tag.nameTagSprite;
                return;
            }
            
        }
       
            NameTagImage.sprite = nameTags[0].nameTagSprite;
        
    }
}
