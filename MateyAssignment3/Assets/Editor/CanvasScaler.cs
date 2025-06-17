using UnityEngine;
using UnityEditor;
using UnityEngine.UI;
using UnityEditor.SceneManagement;
using UnityEngine.SceneManagement;

public class CanvasScalerSetter : EditorWindow
{
    [MenuItem("Tools/Set Canvas Scaler Settings")]
    public static void SetCanvasScalerSettings()
    {
        // Prompt to save any dirty (unsaved) open scenes first
        if (!EditorSceneManager.SaveCurrentModifiedScenesIfUserWantsTo())
        {
            Debug.LogWarning("Operation canceled. Unsaved scenes were not saved.");
            return;
        }

        // Save the currently open scene so we can reopen it later
        string activeScenePath = SceneManager.GetActiveScene().path;

        // Find all scene assets in the project
        string[] sceneGuids = AssetDatabase.FindAssets("t:Scene");

        foreach (string guid in sceneGuids)
        {
            string scenePath = AssetDatabase.GUIDToAssetPath(guid);

            // Skip read-only scenes from Unity packages
            if (scenePath.StartsWith("Packages/"))
            {
                Debug.Log($" Skipping read-only scene in package: {scenePath}");
                continue;
            }

            // Open the scene in the editor
            var scene = EditorSceneManager.OpenScene(scenePath);

            // Find all Canvas objects (including inactive ones)
            Canvas[] canvases = Object.FindObjectsByType<Canvas>(FindObjectsSortMode.None);
            int updatedCount = 0;

            foreach (Canvas canvas in canvases)
            {
                CanvasScaler scaler = canvas.GetComponent<CanvasScaler>();
                if (scaler != null)
                {
                    scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
                    scaler.referenceResolution = new Vector2(1920, 1080);
                    scaler.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight;
                    scaler.matchWidthOrHeight = 0.5f;
                    updatedCount++;
                }
            }

            // If changes were made, mark and save the scene
            if (updatedCount > 0)
            {
                EditorSceneManager.MarkSceneDirty(scene);
                EditorSceneManager.SaveScene(scene);
                Debug.Log($" Updated {updatedCount} CanvasScaler(s) in scene: {scenePath}");
            }
        }

        // Restore the original scene
        if (!string.IsNullOrEmpty(activeScenePath))
        {
            EditorSceneManager.OpenScene(activeScenePath);
        }

        Debug.Log("CanvasScaler settings applied to all canvases in all editable scenes.");
    }
}
