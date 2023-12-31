# MOOD
#### Video Demo:  <URL HERE>
#### Description:
##### Summary

Mood is an iOS app inspired by existing health and mental wellness apps. It is designed and developed by Daniel Roos from Germany mainly using Xcode, Swift, SwiftUI, SQLite for data management, and SwiftCharts for data visualization.

Mood has **three main features:**
1. Users can log how they have felt overall from very pleasant to very unpleasant on a daily basis with an intuitive slider.
2. Users can track their mood over time by weeks, months, and years to understand their progress.
3. User can use analytics-based insights and recommendations to improve their mood over time (this feature will come in the next version of my app).

The app has **5 main views** and a separate **DatabaseManager file** to manage everything related to the SQL database.

Detailed descriptions of the views and the DatabaseManager file follow below.

##### Views

###### ContentView

ContentView is an app launch view with a pulsating animation of the apps main graphical element, a blurred sphere.
The launch view invites users to focus on their breathing and to calm down by asking them to breathe in and to breathe out.

This view was great to get familiar with SwiftUI's main UI principles ZStack, VStack, and HStack as well as with animations.

###### HomeView

HomeView continues using the blurred sphere for graphical reference and has **two main purposes:**

First, it provides the user with information about the app and its main features.

Second, it shows highlights around the users' mood in the current week using a simplified SwiftChart as well as two placeholder cards supposed to show analytics-based insights and recommendations on how to improve users' moods (once this feature is added). Users can tap on the highlights cards to jump directly to the respective features in the app.

HomeView also introduces a toolbar at the top and one at the bottom. The bottom toolbar has three elements allowing users to navigate throughout the apps main views and features. It was a great way to get familiar with SwiftUI's navigation and toolbar logic.

###### LogMoodView

LogMoodView allows users to indicate how they have felt overall on any given day from very pleasant to very unpleasant using a SwiftUI slider. The blurred sphere changes its color based on the selected mood providing an additional graphical clue for how the users might feel. 

When users tap the "Log mood" button, the selected moods gets inserted into a SQL database table along with a unique ID, a default user ID (i.e. 1), a timestamp of the current date and time, as well as the mood being an integer from 1 (very unpleasant) to 5 (very pleasant).

LogMoodView was great to get familiar with additional SwiftUI elements like the slider, @State variables and functions to control the color of the blurred sphere depending on the mood. 

###### MoodLogView

MoodLogView has **three main purposes:**

First, it uses SwiftCharts to visulize moods logged by users in a chart using point and line marks (in the next version of this app, the point marks will be colored in the respective moods colors from the LogMoodView). The chart fetches data from the SQL database and populates the chart with a "For each" loop. The chart allows users to see how their mood has developed over time. The current version visualizes mood data for a full week by days (visualizing mood data for a full month by weeks and for a full year by month will come in the next version of this app). The functionality to switch between these different time horizons has already been put in place with a picker. The chart currently displays data for the week of 25-31 Dec 2023. Functionality to scroll through the chart horizontally to display additional weeks has already been put in place (the required database-related functions to fetch data for a longer time period will come in the next version of this app).

Second, it also shows the two placeholder highlights cards supposed to show analytics-based insights and recommendations on how to improve users' moods (once this feature is added). The ideas is to use statictics (and later machine learning) to understand a user's mood patterns over time and provide recommendations on how to improve their mood.

Third, when users tap the "View data" button, a sheet showing the DataView slides up from the bottom in a modal presentation on top of MoodLogView either covering 50% of MoodLogView or the entire view (DataView is explained in more detail below).

MoodLogView was great to get familiar with SwiftCharts for data visualization as well as additional SwiftUI elements like pickers and modal sheets.

###### DataView

DataView has **three main purposes:**

First, it shows users a list of the mood data logged in the SQL database including the date and the mood integer to quickly browse through. Users can also delete individual rows in the list, if data was logged incorrectly.

Second and primarly for app testing purposes, it provides the ability to delete all mood data from the SQL database that has been stored so far. When the "Delete all data button" is tapped, an alert is being shown to double-check users' intention in order to prevent users from accidentally deleting all data.

Third and again primarily for app testing purposes, it provides the ability to create a test mood data set. When tapping the "Create new data set" button, any previously stored mood data is deleted first and then randomized mood data is stored in the SQL database for the full month of December 2023. Both  MoodLogView as well as HomeView automatically update the SwiftCharts when a new data set has been created.

DataView was great to get familiar with building lists with "For each" loops, as well as with handling SQL database queries that allow to delete or create data.

##### DatabaseManager file

Everything related to the SQL database is managed in the DatabaseManager file.
Main functions include:
1. Opening the database, creating a moodTracker table with the columns outlined under LogMoodView, and initializing the database connection.
2. Defining the struct MoodData.
3. Logging a mood to the database table based on users' input.
4. Fetching mood data from the database table to display it in the charts and the list.
5. Creating a test data set with random mood integers.
6. Deleting individual rows from the table, all data from the table, and the entire table.

It was great to strengthen my SQL knowledge acquired through CS50.

##### Conclusion & acknowledgements

Overall, designing and developing Mood was a lot of fun and a great additional learning experience enabled by CS50.

Apart from great resources for and the help from other Apple developers as well as help from the Stack Overflow community two special shoutouts go to: The people behind SQLite.swift and Karin Prater for great youtube tutorials on using SwiftCharts.
