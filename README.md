# Toolkit

A Swift Package which consists of a large amount of extensions & models for simplified and added functionality.

## Color 
Easily convert between color formats, HSBA, RGBA, UIColor & CGColor. Also includes methods to increase brightness, interpolating color & higlighting 
- Color (Protocol)
- HSBA 
- RGBA
- DynamicColor

Simplify support dark/light mode:
``` swift
static var backgroundColor: DynamicColor = .init(
    .dark(RGBA(r255: 44, g255: 44, b255: 46)),
    .light(.white))
    
view.backgroundColor = backgroundColor.uiColor()
```

## Date 
Big help for creating calendar apps through a library of calendar structs with quite a lot of helper methods.
- Day
- DayOfWeek
- Time
- Timespan
- Week

Easier to move between weeks, days & months:
```swift
var nextWeek = Day.today.week.nextWeek()
print("Next week is week: ", nextWeek.weekOfYear)
print("The year is: ", nextWeek.year)
```

Handling of timespans:
```swift
let swimmingEvent = Timespan(
    from: .init(hour: 15, minute: 30),
    to: .init(hour: 16, minute: 30))
let bowlingEvent = Timespan(
    from: .init(hour: 16, minute: 0),
    to: .init(hour: 16, minute: 30))

if swimmingEvent.isClipping(bowlingEvent) {
    print("Events are overlapping")
}
```

## Animate CALayer 
Makes it quicker and easier to animate CALayer. All properties otherwise animatable through traditional methods are accessible through this approach. 

```swift
// Animate Opacity
CALayer.animate(layer: view.layer, valueKey: \.opacity,
                to: 0, duration: 0.4, option: .easeIn)

// Animate Corner Radius
CALayer.animate(layer: view.layer, valueKey: \.cornerRadius,
                to: 10, duration: 0.3, option: .easeInQuad)

// Animate Background Color
let color = CGColor(gray: 1, alpha: 0)
CALayer.animate(layer: view.layer, valueKey: \.backgroundColor,
                to: color, duration: 0.5, option: .easeInQuad)
                
// Animate Gradient
let gradientLayer = CAGradientLayer()
let newColors: [CGColor] = [.red, .green]
CALayer.animate(layer: gradientLayer, valueKey: \.colors,
                to: newColors, duration: 1.2, option: .easeOut)
```
## Enums
A large amount of enums which helps in making code easier to read & helps when dealing with math, axis, color profiles & graphics/design apps
- Axis
- AxisLine
- RectangleAnchor 
- Side
-  SideHorizontal
- SideVertical
- MathSymbol
- SpecialMathSymbol
... and a bunch more

## Fonts
Easier creation of scalable fonts & SF Fonts: 
- UIFont.rounded for SF Pro Rounded, parameters for weight exists
- UIFont.display for SF Pro Rounded, parameters for weight exists

```swift
label.font = .display(ofSize: .largeTitle, weight: .bold)
label.font = UIFont(name: "Helvetica", size: 20).with(style: .caption1, maxPointSize: 15)
        
label.font = .rounded(ofSize: .heading, maxPointSize: 20)
label.font = .rounded(ofSize: 20, weight: .black)
```

## UITableView & UICollectionView
Methods have for easier register & getter for UITableViewCell & UICollectionViewCell. No need to spesify identifier, identifier is automatically set to the name of the cellClass or headerClass

New:
- register(cell cellClass: AnyClass)
- register(header headerClass: AnyClass) 
- dequeueReusableCell<T>(for indexPath: IndexPath) -> T?

Old:
- register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String)
- register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String)
- dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell


```swift
// Register
collectionView.register(cell: CustomCollectionCell.self)

// Getter
func collectionView(_ collectionView: UICollectionView,
                    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: CustomCollectionCell = collectionView.dequeueReusableCell(for: indexPath)!
    return cell
}
```

## Task Delay
Helper methods for creating a delay for number of seconds. There is no difference between delay & sleep, only a matter of preference. 
- Task.sleep(seconds: Double)
- Task.delay(seconds: Double)

```swift
await Task.delay(seconds: 2)
await Task.sleep(seconds: 5)
```
## Views
Simplifiers, utility views & Subclasses of all UIKit views have been made which automatically sets translatesAutoresizingMaskIntoConstraints to false. Usefull when not using Storyboards. 


## Symbols & SF Symbols
Easier creation of SF Symbol and custom symbol UIImage´s. 

###### SF Symbol initalizers
- init?(systemName: String, pointSize: CGFloat)
- init?(systemName: String, pointSize: CGFloat, weight: UIImage.SymbolWeight)
- init?(systemName: String, pointSize: CGFloat, weight: UIImage.SymbolWeight, scale: UIImage.SymbolScale)

###### Custom Symbol initalizers
Equivalent initalizers to the ones listed above exists for custom symbols. The initalizer for custom symbol instead starts with:
- init?(symbolName: String...


```swift
// Without Toolkit
let image = UIImage(systemName: "person.2.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))

// With ToolKit
let image = UIImage(systemName: "person.2.fill", pointSize: 14)
```


## Text to Image
Quickly convert image to text, quite useful when wanting to display emojis or other symbols on a UIImageView. 

```swift
let emojiText = "🎉"
let emojiImage = emojiText.toImage()
```

## Localizations
Easier access and management of localizations. Easier transfer from swift localizations into other languages like javascript & typescript.

Safer & easier access:
```swift
// Old
let hello = NSLocalizedString("hello", comment: " ")
        
// New
let hello = Localizations.hello
```

###### Setup:
1. Localize your app as usual (https://medium.com/swift-productions/localizing-your-ios-app-xcode-12-swift-5-3-74559a431e79)
2. Run  String.printLocalizationsSwift() at the start of the app
```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        String.printLocalizationsSwift()
        ...
```
3. Copy the output from the printLocalizationsSwift() in the console 
4. Create a file named Localizations.swift
5. Paste the copied output (it should look something like below)
```swift
import Foundation
import Toolkit

class Localizations {
    static var acceptAndJoin: String {get {"acceptAndJoin".localized}}
    static var admin: String {get {"admin".localized}}
    static var cancel: String {get {"cancel".localized}}
    static var `continue`: String {get {"`continue`".localized}}
    static var createYourOwn: String {get {"createYourOwn".localized}}
    static var dismiss: String {get {"dismiss".localized}}
    ...
```

###### Transfer to Javascript (ex: website): 
1. Run String.printLocalizationsJson() at the start of the app
2. Copy the output from the printLocalizationsJson() in the console 
3. Paste the output into the localization .json files of the javascript application
4. Run String.printLocalizationsJavascript() at the start of the app
```swift
// In the starter methods of SceneDelegate or AppDelegate
String.printLocalizationsJavascript() 
```
5. Copy the output from the printLocalizationsJavascript() in the console 
6. Create a file named Localizations.js in the Javascript application
7. Paste the copied output into the Localizations.js file 

Localizations can now in the Javascript application be accessed like below:
```javascript
// Old
var invalidEmail = localize("invalidEmail")

// New
var invalidEmail = Localizations.invalidEmail
```










