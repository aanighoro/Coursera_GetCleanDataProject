# Coursera_GetCleanDataProject
Coursera Getting and Cleaning Data Course Project

## Original data:

Human Activity Recognition Using Smartphones Dataset - Version 1.0

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Worflow Description:

The original data were extracted and processed. A new dataset was generated (final_dataset.txt).

The original data set included measurments of human activity (walking, walking upstairs, walking downstairs, sitting, standing, laying) collected for 30 subjects.

Processing step included:

1. Training set and tet set were merged

2. Only columns including the mean and standard deviation of each measurment were selected

3. Activity names were explicitly added

4. Column names were edited to be more descriptive

5. Averages were calculated for each subject/activity combination and then added in the final data set (final_dataset.txt)

## Data processing

All data processing steps as described above were carried out with the script run_analysis.R


## Data set

The generated data set includes the averages calulated for each activity measured for each subject

The data set is available in the file final_dataset.txt

Data and variables are explained in CodeBook.md
