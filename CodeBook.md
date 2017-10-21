# Code book

## Worflow Description

The data set final_dataset.txt was created by running the script run_analysis.R on the data extracted from "Human Activity Recognition Using Smartphones Dataset - Version 1.0".

Processing step included:

1. Training set and tet set were merged

2. Only columns including the mean and standard deviation of each measurment were selected

3. Activity names were explicitly added

4. Column names were edited to be more descriptive

5. Averages were calculated for each subject/activity combination and then added in the final data set (final_dataset.txt)


## Variables

* subject: integer unique subject identifier

* activity: string representing the name of the recorded activity

* measurements: {domain}\_{measurement}-{value}-{axis}\_avg

  **domain** denotes whether the time (**time**) or frequency (**freq**) domain signal
 
  **measurment** denotes the body (**Body**) or gravity (**Grav**) signals coming from the accelerometer (**Acc**)and gyroscope (**Gyro**). Jerk signals are noted with **Jerk** and calculated magnitude with **Mag**
  
  **value** denote mean (**mean**) or standard deviation (**stdev**)

  **axis** is used to denote 3-axial signals in the **X**, **Y** and **Z** directions
