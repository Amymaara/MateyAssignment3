using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.SceneManagement;

// this code was made following a tutorial, ive only made very minor changes, like checking for nulls.

// Title: How to persist variables across multiple Ink stories (Variable Observer) | Unity + Ink tutorial
// Author: Shaped by Rain Studios
// Date: 8 December 2021
// Code Version: ?
// Avaliability: https://www.youtube.com/watch?v=fA79neqH21s&list=PL3viUl9h9k78KsDxXoAzgQ1yRjhm7p8kl&index=5 


public class DialogueVariables 
{
    
    public Dictionary<string, Ink.Runtime.Object> variables { get; private set; }

    private Story globalVariablesStory;
    private const string saveVariablesKey = "INK_VARIABLES";


    // creates dictionary with all variables
    public DialogueVariables(TextAsset loadGlobalsJSON)
    {
        globalVariablesStory = new Story(loadGlobalsJSON.text);

        if (!string.IsNullOrEmpty(GlobalInkMemory.SavedStateJSON))
        {
            globalVariablesStory.state.LoadJson(GlobalInkMemory.SavedStateJSON);
        }

        // Initialize dictionary
        variables = new Dictionary<string, Ink.Runtime.Object>();
        foreach (string name in globalVariablesStory.variablesState)
        {
            Ink.Runtime.Object value = globalVariablesStory.variablesState.GetVariableWithName(name);
            variables.Add(name, value);
        }

        
    }

    // saves variables to global file 
    public void SaveVariables()
    {
        if (globalVariablesStory != null)
        {
            //loads current values of variables to listener
            VariablesToStory(globalVariablesStory);
            PlayerPrefs.SetString(saveVariablesKey, globalVariablesStory.state.ToJson()); 
        }
    }

    // listens for if a variable changes in story
    public void StartListening(Story story)
    {
        VariablesToStory(story);
        story.variablesState.variableChangedEvent += VariableChanged;
    }

    // stops listening for variables in story
    public void StopListening(Story story)
    {
        if (story == null)
        {
            
            return;
        }

        if (story.variablesState == null)
        {
            
            return;
        }
        story.variablesState.variableChangedEvent -= VariableChanged;
    }


    // removes old variable and adds new variable and value
    private void VariableChanged(string name, Ink.Runtime.Object value)
    {
        // variables from global variables file
        if (variables.ContainsKey(name))
        {
            variables.Remove(name);
            variables.Add(name, value);
        }
    }

    // lets you access the variables outside of the ink code, not using at the moment, but im keeping it in for the future
    public void ObserveVariable(string variableName, System.Action<Ink.Runtime.Object> callback)
    {
        if (variables.ContainsKey(variableName))
        {
            
            Story tempStory = globalVariablesStory;
            tempStory.variablesState.variableChangedEvent += (string name, Ink.Runtime.Object value) =>
            {
                if (name == variableName)
                {
                    callback(value);
                }
            };
        }
    }


    private void VariablesToStory(Story story)
    {
        foreach (KeyValuePair<string, Ink.Runtime.Object> variable in variables)
        {
            story.variablesState.SetGlobal(variable.Key, variable.Value);
        }
    }
}
