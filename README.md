# My CV - implemented in `SwiftUI`

<img width="1399" alt="header" src="https://github.com/vincefried/CV-SwiftUI/assets/19791346/67918d85-39d2-4fc5-b324-d563ae61433d">


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
* iPadOS 16.1+

## Know issues

* PDF export doesn't fully work on iOS 17. Update is in the works!
    * Also, the whole scroll view handling and layouting can be optimized using iOS 17's new SwiftUI ScrollView functionalities!
