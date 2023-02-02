# Unreal-Batch-Cleanup
Batch script for cleaning up Unreal Engine Binary and Intermediate folders in multiple projects, with the option of cleaning plugins and building the project directly after cleaning. Used in a multiproject Perforce server

# How To
## Single projects
Place the cleanup-single.bat script at the same level as your .uproject file.
## Multiple projects
Place the cleanup-multiple.bat script in the folder above your project folders (the .uproject file has to be one level below the batch file), and rename every occurence of "project1" or "project2" in the script with your folder name. 
