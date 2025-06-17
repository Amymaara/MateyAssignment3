using System.Collections.Generic;
using Unity;

public static class ClickTracker
{
    private static Dictionary<string, int> clickCounts = new Dictionary<string, int>();

    public static int GetClickCount(string itemID)
    {
        return clickCounts.ContainsKey(itemID) ? clickCounts[itemID] : 0;
    }

    public static void IncrementClickCount(string itemID)
    {
        if (clickCounts.ContainsKey(itemID))
        {
            clickCounts[itemID]++;
        }
        else
        {
            clickCounts[itemID] = 1;
        }
    }
}