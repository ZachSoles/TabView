# TabView Swift Package

This packages's purpose is to add tabbed functionality to all SwiftUI applications.

Below is an image of the functionality.

![image of tabs](./Sources/viewExample.png)

Below is a snapshot of an example implementation of the tabs.

![image of code example for the tabs](./Sources/codeExample.png)


The tabs interface is shown below

![image of tabs interface](./Sources/interface.png)

**Required Vars**

- The *tabs* var takes in an array of strings, this is used to display each tab

- The *selectedTabIndex* var is a @Binding var, changing dependent on the tab that is selected. This is also used within the example to display
different views dependent on the selected tab.

**Optional Vars**

- activeColor, inactiveColor change the the color of the selected tab's text. This is currently set to the device's accent color if no
value is passed through to the view.

- activeTabColor, inactiveTabColor change the color of the underline of the tab. This is currently set to the device's accent color as well if no
value is passed through to the view.

ToDo:
1) Implement reorganizing and dragging of tabs
2) Add animations for selecting a tab
if any feedback please reach out to my email zacsoles@gmail.com

