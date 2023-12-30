# MOOD iOS APP
#### Video Demo:  <URL HERE>
#### Description:
##### Summary

Mood is a CS50 final project inspired by existing health and mental wellness apps. It is designed and developed by Daniel Roos from Germany mainly using Xcode, SwiftUI, SQLite for data management, and SwiftCharts for data visualization.

Apart from SQLite, I never used any of the aforementioned tools before, so it was a great additional learning experience that taking CS50 enabled.

Mood has **three main features:**
1. Users can log how they have felt overall from very pleasant to very unpleasant on a daily basis with an intuitive slider.
2. Users can track their mood over time by weeks, months, and years to understand your progress.
3. User can use analytics-based insights and recommendations to improve their mood over time (this feature will come in the next version of my app).

The app has **5 main views** and a separate **DatabaseManager file** to manage everything related to the SQL database.

Detailed descriptions of the views and the DatabaseManager file follow below.

##### Views

###### ContentView

ContentView is an app launch view with a pulsating animation of the apps main graphical element, a blurred sphere.
The launch view invites users to focus on their breathing and to calm down by asking them to breathe in and to breathe out.

This view was great to get familiar with SwiftUI's main UI principles ZStack, VStack, and HStack as well as with animations.

###### HomeView

HomeView continues using the blurred sphere as a graphical continuation and has two main purposes.
First, it provides the user with information about the app and its main features.
Second, it shows highlights around the users' mood in the current week using a simplified SwiftChart as well as two placeholder cards supposed to show analytics-based insights and recommendations on how to improve users' moods (once this feature is added). Users can tap on the highlights cards to jump directly to the respective features in the app.

HomeView also introduces a toolbar at the top and one at the bottom. The bottom toolbar has three elements allowing users to navigate throughout the apps main views and features. It was a great way to get familiar with SwiftUI's navigation and toolbar logic.

###### LogMoodView

LogMoodView allows users to indicate how they have felt overall on any given day from very pleasant to very unpleasant using a SwiftUI slider. The blurred sphere changes its color based on the selected mood providing an additional graphical clue for how the users might feel. 

When users tap the "Log mood" button, the selected moods gets inserted into a SQL database table along with a unique ID, a default user ID (i.e. 1), a timestampe of the current date and time, as well as the mood being an integer from 1 (very unpleasant) to 5 (very pleasant).

This view was great to get familiar with additional SwiftUI elements like the slider, @State variables and functions to control the color of the blurred sphere depending on the mood. 

###### MoodLogView



###### DataView

##### DatabaseManager file
