# Flutter Weighlifting Journal
This is a mobile app developed with Flutter. The main use case is to add and view weightlifting sets to track progress.

# Assignment Requirements
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



# Implementation Decisions

## Navigation bar
The navigation bar was implemented with the NavigationBar class. Following best practices from the Flutter documentation on that class, the destinations were directly defined within the widget by using the NavigationDestination class. This is the recommended implementation for using the MUI3 navigation bar. This differs slightly from the Google Tutorial but seems to be the most updated way to implement the navigation bar.

Navigation was implemented with GetX to follow the approach taught at class.

## Layout
Global layout widgets such as appBar, or body are wrapped in a separate widget to reduce code repetition and separating concerns. Additionaly, max width is defined in the global layout.

## Accessibility
Although the app is designed for mobile use, mouse interaction was enabled for accessibility reasons.




