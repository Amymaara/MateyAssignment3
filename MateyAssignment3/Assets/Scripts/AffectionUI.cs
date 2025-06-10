using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class AffectionUI : MonoBehaviour
{
    [System.Serializable]
    public class CharacterMeter
    {
        public string characterName;
        public Image heartImage;
    }

    public Sprite[] heartSprites; 
    public List<CharacterMeter> meters;
    public GameObject AffectionPanel;

    // Call this whenever affection changes
    public void UpdateAffectionUI( string name, int affectionAmount)
    {
        foreach (var meter in meters)
        {
            if (meter.characterName == name)
            {
                if(affectionAmount < 0) // if negative show 0 hearts
                {
                    meter.heartImage.sprite = heartSprites[0];
                }
                else if(affectionAmount > 50)
                {
                    meter.heartImage.sprite = heartSprites[11]; // if affection higher than 50, show filled hearts
                }
                else
                {
                    meter.heartImage.sprite = heartSprites[affectionAmount / 5];
                }
            }
        }
    }

    public void OnAffectionExit()
    {
        AffectionPanel.SetActive(false);
    }

    public void OnAffectionButton()
    {
        AffectionPanel.SetActive(true);
    }
}    

