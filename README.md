# My CV - Made with `SwiftUI`

<img width="1399" alt="header" src="https://github.com/user-attachments/assets/77bbc8ea-d028-4cbe-a53c-ca23e22e86f7">

When recently updating my CV, I noticed that its design looked a bit outdated.
When trying to find a new design, I had the idea to make it look like an app design,
so I fired up Sketch. After having finished a design, I thought why not actually make an app?
Since I've had much fun working with `SwiftUI` lately, I figured it might be a perfect project to try out some new stuff I learned,
including `anchorPreferences` or custom alignments. And I also wanted to make it exportable to PDF.
So here's the first finished version of the app!
It currently contains hardcoded data and a very basic MVVM architecture, but it does its job.

## Functionality

* Views hardcoded data in a scrollable view
* Supports basic PDF share option
    * Currently lays out pages based on the device's screen, can still be optimized for layouting the pages in different DIN formats
* Supports dark mode & a11y

## Result

[CV_Vincent_Friedrich.pdf](https://github.com/user-attachments/files/18386521/CV_Vincent_Friedrich.pdf)

## 🛠 Minimum Requirements

* iPad only (yet)
* iPadOS 18.0+
