<h1>Getting and Cleaning Data</h1> 
<h2Project 1</h2>

<p>Wearable computing has become the recent technology and marketing craze. Will it last?
This project captures and cleans data from Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.</p> 

<p>I first captured the training and test data sets and merged them together. This project required us to work only with the mean and standard deviation values from the observations of 30 volunteers. </p>

<p>I next added the descriptive names for the variables and the 6 activities measured.</p>

<p>The final data set includes one observation for each of the six activities and indepentdent measurements from the variables. The final data set has 180 rows and 81 variables that include a Subject ID and Activity title.<p>

<p><strong>These functions were performed using a single R script file <em>run_analysis.R</em></strong></p>

<ul>
<li>import test, add descriptive variable names</li>
<li>import train, add descriptive variable names</li>
<li>merge two data sets together with rbind</li>
<li>extract mean and std variables</li>
<li>summarize and order</li>
<li> <strong>write to file</strong></li>
</ul>
