# My CV - implemented in `SwiftUI`

<img width="1399" alt="header" src="https://github.com/vincefried/CV-SwiftUI/assets/19791346/67918d85-39d2-4fc5-b324-d563ae61433d">


When recently updating my CV, I noticed that its design looked a bit outdated.
When trying to find a new design, I had the idea to make it look like an app design,
so I fired up Sketch. After having finished a design, I thought why not actually make an app?
Since I've had much fun working with `SwiftUI` lately, I figured it might be a perfect project to try out some new stuff I learned,
including `anchorPreferences` or custom alignments. And I also wanted to make it exportable to PDF.
So here's the first finished version of the app!
It currently contains hardcoded data and a very basic MVVM architecture, but it does its job.

## Functionality

* Views hardcoded data in a scrollable view
    * Idea: Data could be coming from a REST API or at least from a local SQLite DB to make maintenance easier
* Supports basic PDF share option
    * Currently lays out pages based on the device's screen, can still be optimized for layouting the pages in different DIN formats
* Supports dark mode

## Result

[CV_Vincent_Friedrich.pdf](https://github.com/vincefried/CV-SwiftUI/files/14705135/CV_Vincent_Friedrich.pdf)

## 🛠 Minimum Requirements

* iPad only (yet)
* iPadOS 17.0+
