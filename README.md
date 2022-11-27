# My CV - implemented in `SwiftUI`

![header](https://user-images.githubusercontent.com/19791346/204149440-634e824f-3210-4946-a487-fafb3441f86f.png)

When recently updating my CV, I noticed that its design looked a bit outdated.
When trying to find a new design, I had the idea to make it look like an app design,
so I fired up Sketch. After having finished a design, I thought why not actually make an app?
Since I've had much fun working with `SwiftUI` lately, I figured it might be a perfect project to try out some new stuff I learned,
including `anchorPreferences` or custom alignments. And I also wanted to make it exportable to PDF.
So here's the first finished version of the app!
It currently contains hardcoded data and a very basic MVVM architecture, but it does its job.

## Functionality

* Views hardcoded data in a scrollable view
    * Data could be coming from a REST API or at least from a local SQLite DB to make maintenance easier
* Supports basic PDF share option
    * Currently lays out pages based on the device's screen, can still be optimized for layouting the pages in different DIN formats
* Supports dark mode

## Result

[CV_Vincent_Friedrich.pdf](https://github.com/vincefried/CV-SwiftUI/files/10098785/CV_Vincent_Friedrich.pdf)

## 🛠 Requirements

* iPad only (yet)
* iPadOS 16.1+
