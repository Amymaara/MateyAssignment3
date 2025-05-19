
using UnityEngine;

public static class GlobalInkMemory
{
    public static string SavedStateJSON
    {
        get => PlayerPrefs.GetString("INK_VARIABLES", string.Empty);
        set => PlayerPrefs.SetString("INK_VARIABLES", value);
    }
}
