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
                else if(affectionAmount > 100)
                {
                    meter.heartImage.sprite = heartSprites[11]; // if affection higher than 100, show filled hearts
                }
                else
                {
                    int index = Mathf.Clamp(affectionAmount / 10, 0, heartSprites.Length - 1);
                    meter.heartImage.sprite = heartSprites[index];
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

