using UnityEngine;
using Ink.Runtime;

public class RoryCharacter : StoryCharacter
{
    public bool trueNameRevealed = false;



    public override string GetDisplayName()
    {
        var globalVars = StoryManager.Instance.variablesInDialogue;

        if (globalVars != null &&
            globalVars.variables.TryGetValue("roryTrueName", out Ink.Runtime.Object value) &&
            value is Ink.Runtime.BoolValue boolValue &&
            boolValue.value)
        {
            return "Rory";
        }

        return "Master Porthole";
    }
}
