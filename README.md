# Flutter App: Muscle Strength Tracker for Female Climbers
This is a mobile app developed with Flutter. The main purpose is to support female climbers growing body strength through tracking their muscle-targeted weight lifting. The app focuses on hobby climbers who have a basic understanding of exercising.

## How to Run the App 

### Access

For a human-friendly formatted ReadMe and the source code, open the Github project: https://github.com/althomi3/flutterWeighliftingJournal

The app is available in the browser under the following URL: https://muscle-growth-tracker-171aa.web.app/

It is recommended to open the app on a smartphone for best look and feel. The app is optimized for dimensions 390 x 844 which represents an iPhone 12 Pro. For testing app responsiveness, it is recommended to use the dev tools in a browser.

If you want to run the app via your local IDE, navigate to the root folder. Rename the "src" folder to "lib". Then start the app with <flutter run>. If dependencies need to be updated, run "flutter pub get" and try restarting the app with "flutter run".

### Key Use Cases for Testing
- navigate between both tabs in the navigation bar. In the log book you should see an empty state UI.
- scroll through the home screen to understand educational and promotional components
- add an entry for a muscle group, use a high weight and high repititions and navigate to the home screen to check the dashboard. 
- add another entry for the same muscle with low weight and low repititons and navigate to the home screen to check the dashboard to see the averages 
- navigate to the log book and test both functions to edit and delete an entry. navigate to the home screen to see effects on the dashboard

## Widget Code Structure with Atomic Design 
The widget folder is structured following the atomic design approach by Brad Frost. Widgets are categorized according to their component complexity, e.g., molecules for simpler widgets or organism for views that integrate multiple widgets.

# Assignment Requirements
## Clear Idea and Purpose 
In today's Fitfluencer fog, it is challenging to understand how to train effectively for one's individual goals. In addition, sport apps often overload users with mainstream options and lack of intentional guidance.

The idea and purpose of this app is to support female amateur climbers growing body strength through intentional, muscle-targeted weight lifting. The goal is achieved by educational elements, a training tracker which focuses on muscle instead of exercise as well as statistics focusing on training volume per muscle group.

The app supports intentional training to build strength over form or muscle mass. The focus group of female climbers was chosen because there are a lot of stereotypes about the need for looking muscled-up in climbing. However, looking muscled-up is not a reliable indicator for strength. Due to this glass barrier, female climbers often plateau and believe they cannot get better without looking pumped or simply won't be able to gain the required strength at all and lose interest.
Especially the educational components in the app help to understand advantages of the female body when it comes to strength and guide female climbers to set a healthy focus on themselves. The statistics help to make progress in building strength visible.

The focus on muscle training volume, which is the number of repetitions * weight, was chosen as it is one key factor in building muscle strength. It focuses on achieving hypertrophy which describes the state of muscle growth > muscle breakdown. In addition, training volume provides the freedom to design the training for individual needs when it comes to weight and repetitions as the same training volume can be achieved through various combinations. E.g., less weight and more reps or more weight and less reps. This makes training fit different time availabilities and personal preferences. More details can be found in the app.

The idea and purpose are supported by the theme and visual language. It keeps a balance between a fresh and relaxed style especially through green mint colors and friendly, yet activating illustrations. At the same time, the dark aspects add a certain sport and ambition factor. In addition, the visual style is present in both worlds, the gym world (often darker and black) and the climbing world (nature-driven and colorful/green).


## Screen Architecture 
### 1 Main Screen and 3 Sub Screens
There are 4 distinct views as required in the assignment.
1. HomeScreen (main screen and a destination in the navigation bar)
2. CreateScreen (subscreen and the second navigation in the navigation bar)
3. ViewScreen (subscreen and navigation integrated in the flow in other screens)
4. EditScreen (subscreen and navigation integrated in the flow in other screens)

### CRUD Pattern and Path Variable
The screens contain content and functionality that follows the CRUD pattern as a best practice approach in software development.

- Create: creating a new entry is possible from any screen through primary buttons except in the edit mode.

- Read: two tabs in the bottom navigation bar provide pattern that allow the user to view created content. The first tab navigates to the HomeScreen. The HomeScreen serves as a progress dashboard and shows statistics of the created content. The second tab navigates to a ViewScreen which allows the user to view all entries created.

- Update: On the ViewScreen, the user can enter the edit mode for individual entries through an action which navigates users to the EditScreen. To achieve this, the entry ID is passed as a path variable for calling the entry data and updating the entry data in the Hive database.

- Delete: The ViewScreen contains functionality to delete an entry.

## Responsive 
### Breakpoints
Two breakpoints were introduced following the W3C standards (https://www.w3schools.com/howto/howto_css_media_query_breakpoints.asp).

- Breakpoint 1: 600 px (max width for extra small devices, min width for small devices like smartphones)
- Breakpoint 2: 768 px (min width for medium devices such as landscape tablets)

The main use case for this app lies between the two breakpoints. Edge cases are devices < breakpoint 1 and > breakpoint 2. The breakpoints affect the action layout in the list of entries in the ViewScreen.

### Responsive Widget 
The behaviour triggered by the breakpoints is defined through a generic responsive widget using the LayoutBuilder class. The generic responsive widget takes 3 widgets that are displayed depending on the parent widget width. In the app, the responsive widget is wrapped inside the Column of the MainLayout in the ViewScreen. Thereby, the widget's behaviour is controlled by the detected width of the MainLayout widget as its parent.

### Flexible Scroll
In addition, screens are set as scrollable with SingleChildScrollView to prevent overflowing content issues caused by narrow screens.

### Responsive Graphics
The visuals are svg to provide a high quality illustration. The illustration scales responsively up until it reached a defined maximum height which maintains a reasonable proportion between graphics and other content.

### Max Width
The max width is set to 1200 following the common breakpoint definition for laptop devices by W3C (https://www.w3schools.com/howto/howto_css_media_query_breakpoints.asp). The reasoning is that users might want to review their progress at home on their laptop despite the main use case on mobile during the training session. 

## Form and Persistent Data 
The app has a form for entering and manipulating data. The application remembers the entered data as form entries and statistics calculated based on the entries. The persistent data logic was implemented with a Hive storage.

## Statistics 
Based on the form entries, multiple calculations are conducted and presented as statistics in a dashboard to the user. Statistics are: overall average volume and average volume per muscle group which result in 6 individual measures. The dashboard serves the main goal of the app to build muscle strength by making progress visible.

## Easy to Use and Intuitive 
There were multiple measures taken to make the app easy to use. Some examples are:

- Navigation in the navigation bar contains the major areas users navigate between. Other navigation actions are embedded in the user flow within the screens. This supports a navigation that fits to the user scenario. Overall, the navigation objective is to guide the user towards the main goal: tracking a training set. In addition, automatic navigation has been implemented after certain steps, e.g., navigating the user to a screen where they see the submitted form entry.

- Navigation icons and labels are chosen to support the understanding of the usage of each view. 
Button sizes and font styles are designed to represent a helpful information and action hierarchy which supports the user in intentional app understanding.

- An empty state is used including visual support and copy that help users getting kickstarted adding content.

- The screens contain contextual elements which support the user in understanding how the app and the current step work.

- Form validators support the user in submitting data efficiently.

- The browser tab contains the app title for recognizability between other tabs.

- entries are sorted so that the newest entry is always on top



# Implementation Decisions
In this section, some implementation decisions are explained:

## Navigation Bar
The navigation bar was implemented with the NavigationBar class. Following best practices from the Flutter documentation on that class, the destinations were directly defined within the widget by using the NavigationDestination class. This is the recommended implementation for using the MUI3 navigation bar. This differs slightly from the Google Tutorial provided in class but seems to be the most updated way to implement the navigation bar.

## Global Layout
There is a separate layout widget that wraps widgets such as appBar or body to reduce code repetition and separating concerns. Additionally, max width is defined in the global layout.

## Accessibility
Although the app is designed for mobile use, mouse interaction was enabled for accessibility reasons.

## No Separate Service Class 
The data service is integrated in the form controller and a separate data model. Due to the simplicity of the data handling, the decision was made to not create a separate service. If the app were to be expanded, it would be wise to separate concerns and separate the data handling into its own service class.

## Outlook and Improvement Opportunities
Due to the limited scope of this project, there are improvement opportunities. Some examples are:

- Time and date dimension
    - allows users to track date and time of training
    - provide time-based statistics and thereby improve the quality of insights on progress as well as incorporate the impact of timing on muscle strength development

- allow filtering the list by muscle group

- provide data visualization for quick and understandable insights 

- provide more educational support to help users get started
    - provide explanations for different muscle groups
    - provide video instructions and exercises for each muscle group 

- separating some of the home screen content to a temporary welcome screen the user sees on app start. Thereby, the main screen focuses on functional content, e.g., dashboard. This increases UX for loyal users who don't want to see static content they already learned over a long time.

- prefill form with data in edit mode to avoid users needing to repeat data that doesn't change

- advanced form validator for weight field which is a double and parse comma entries as dot entries for correct calculations. There isn't a built-in validator for double which requires a custom validator.

- Exercise guide for muscle groups

- allow for advanced muscle group selection, e.g., a dropdown for big muscle groups and a dropdown with sub muscle groups for more targeted training

- options to lock favorite groups for future form entries to avoid repetitive entries

- Standard UX improvements
    - accessibility
    - copywriting
    - visual language 


Credentials: Project in scope of the course Device-Agnostic Design at Aalto University, 2025, by Alischa Thomas




