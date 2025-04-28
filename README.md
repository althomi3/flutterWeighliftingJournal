# Flutter Weighlifting Journal
This is a mobile app developed with Flutter. The main use case is to add and view weightlifting sets to track progress.

# How to Run the App and Understand the Widget Hierarchy
## Atomic Design
The widget folder is structured following the atomic design approach. It categoirzed the widgets according to their complexity, e.g., molcules for simpler widgets or organism for views that integrate mutliple widgets.
## Run the App
The app is available under the folllwing URL: TBA
It is best to open the app on a smartphone for best look and feel. The app is optimized for dimensions 390 x 844 which represents an iPhone 12 Pro. Adjust your browser window or choose the device demo in your browser's dev tools.
If you want to run the app via code, navigate to the src folder and start the app with <flutter run>.

# Assignment Requirements
## Clear Purpose
Building muscle strength for female climbers.
This app is build to support building muscle. Other training apps which overload users with tracking options and o not provide guidance towards specific training goals. This app focuses specifically on muscle growth through hypertrophy which is an established scientifically supported mechanism to grow muscle. It focuses on tracking training parameters which are then used to display statistics to the user that help monitoring the training volumne (reps x weight). Volumne is one of the key drivers for hypertrophy. Hypertrophy is the professional term that describes a muscle state where muscle growth > muscle breakdown.

The theme and visual language connect to the target group of female climbers and support a clear understanding of the app purpose.

The theme and visual language were chosen to keep a balance between a fresh and relaxed style especially through the green mint colors and the friendly illustrations. At the same time, the black aspects add a certain sportive and amd ambition factor. In addition, this combines common color themes used both in the gym world (often darker and black) and the climbing world (nature-driven and colorful).


## Architecture: 4 Screens and CRUD Pattern
There are 4 distinct views as required in the assignment.
1. HomeScreen
2. CreateScreen
3. ViewScreen
4. EditScreen

The screens contain content and functionality that follows the CRUD pattern as a best practice approach in software development.

Create: a global floating action button provides a quick action for the user to add a tracked item from anymore in the app. The button navigates to the view CreateScreen where the user finds a form to create a new entry.

Read: two tabs in the bottom navigation bar provide pattern that read allow the user to view certain content that was created. The first tab and initial path shows the HomeScreen. The HomeScreen serves as a progress dashboard and shows statistics of the created content. The second tab navigates to a ViewScreen allows the user to view all entries created. From the ViewScreen, the user can manipulate the entries as requirement in the assignment. 

Update: From the ViewScreen, the user can edit entries. The button trigger navigates the user to the view EditScreen where the user can manipulate the content and update it.

Delete: The ViewScreen contains functionality to delete an entry.

## Max Width
The main use case of the app is mobile and design focus is for mobile use. Still, weightlifters might want to review their progress at home on their laptop. Therefore, the max width is set to 1200 following the common breakpoint definition for laptop devices by W3C (https://www.w3schools.com/howto/howto_css_media_query_breakpoints.asp).

## Breakpoints and Responsive Widget
Min 2 breakpoints are required which trigger changes in the interface behaviour. The W3C definition for device breakpoints is used as a reference (https://www.w3schools.com/howto/howto_css_media_query_breakpoints.asp).

Breakpoint 1: 600 px (max width for extra small devices, min width for small devices like smartphones)
Breakpoint 2: 768 px (min width for medium devices such as landscape tablets)

The main use case for this app lies between the two breakpoints. Edge cases are devices < breakpoint 1 and > breakpoint 2. The breakpoints affect the display of the list of entries in the ViewScreen.

The behaviour triggered by the breakpoints is defined via a generic responsive widget using the LayoutBuilder class. The generic responsive widget takes 3 widgets that are displayed depending on the parent widget width. In the app, the responsive widget is wrapped insides the Column of the MainLayout in the ViewScreen. Thereby, the widget's behaviour is controlled by the detected width of the MainLayout widget.

Screens are set as scrollable with SingleChildScrollView to prevent overflowing content issues cause by narrow screens which might lengthen the content more than expected.

## Statistics
Homescreen: general volume and volume per muscle group -> serves app prupose to help guiding muscle growth over exercises

## Persistent Data
When running the app with the local machine, e.g., MacOS, the data is treated as persistent. You can test this by running the app, adding some entries, closing and restarting the app. 
The persistent data were implemented with a Hive storage by using hive_ce. Since browsers like Chrome treat data a bit differently, the persistent state is not visible when you run the app with a browser such as Chrome.

## Easy to use and intuitive
Navigation is kept minimalistic and actions are designed to serve the main goal of the user: tracking training sets.
Navigation icons and labels are chosen to support the understanding of the usage of each view. It is semantically goal-focused: understanding progress and logging activities.
The screens contain instructive elements which support the user in understanding how the app and the current step work.
Form validators.
App title in browser tab.

An empty state of the ViewScreen helps the user understand what to do and what they will see once they started tracking.

## Outlook and Improvement Opportunities
- add time and date perspective
    - allows users to track date and time or training
    - provide time-bases statistics and thereby improve the quality of insights on hypertrophy. Because training breaks play and important role for muscle breakdown.
- allow filtering
- allow custom exercise types the user generates
- provide data visualization for quick and understandable insights 
- Standard UX improvements
    - accessibility
    - copywriting
    - visual language 

- Provide more educational support to help users get started
    - provide explanations for different muscle groups
    - provide video instructions and exercises for each muscle group 

- Outlyering some of the homescreen content to a temporary welcome screen the user sees on app start. Thereby, the main screen focuses on functional content. This increase UX for loyal users who don't want to see static content they already learned over a long time.

- Improved form functionality: 
    - additional form validators can help users enter useful data.
    - on edit, the form is pre-filled with user data and user can simply only adapt the fields they want to edit

- Advanced custom form validator for double (weight) and parse comma entries as dot entries for correct calculations.

- App already teasers a exercise guide: this guide would provide exercise variants based on muscle group. 
- App already teaseres a visual dashboard which can help assess progress on a timeline. 
- Allow for advanced muscle group selection. E.g. a dropdown for big muscle group and a dropdown with sub muscle groups.
- Options to save muscle groups to avoid repetitive entries.
- Time-based entries and advanced layout structure of list based on time. E.g. grouping by month. 



# Implementation Decisions

## Navigation bar
The navigation bar was implemented with the NavigationBar class. Following best practices from the Flutter documentation on that class, the destinations were directly defined within the widget by using the NavigationDestination class. This is the recommended implementation for using the MUI3 navigation bar. This differs slightly from the Google Tutorial but seems to be the most updated way to implement the navigation bar.

Navigation was implemented with GetX to follow the approach taught at class.

## Layout
Global layout widgets such as appBar, or body are wrapped in a separate widget to reduce code repetition and separating concerns. Additionaly, max width is defined in the global layout.

## Accessibility
Although the app is designed for mobile use, mouse interaction was enabled for accessibility reasons.

## No separate service class 
The data service is integrated in the form controller. Due to the simplicity of the data handling, the decision was made to keep everything in the form controller. If the app were to be expanded, it would be wise to separate concerns and isolate the data handling in an own service class and / or service file.

## Navigation and Flow
- automatic navigation after certain actions

## ViewScreen
- Cards are sorted so that newest entry is always on top
- Breakpoints trigger layout changes so that buttons are positioned in a way that supports usability
- Empty state with instructions helps new users getting kickstarted with the tracking
- Primary action is designed in a way that it promotes tracking and is easy to access

## Responsive Illustration
The visual is an svg to provide a high quality illustration. The illustration represents a climber so that the climber community as the target group can identify with the purpose of growing muscle strength. The illustration is responsive until it reached a defined maximum height to present infinite scaling.

## Using Wrap
-- 2 buttons on homescreen

## Widget Architecture in Code Base with Atomic Design
---

# Limitations and Learnings
## Model for Training Set Entries
It was attmepted to create a model that represents the variables used for each form entry. However, due to more sophisticated handling of the card in the edit screen, working with the model escalated complexity to a level where the downsides overweighted the benefit. A learning is that there are limits of global handling in terms of complexity.




