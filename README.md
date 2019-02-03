# AppContainerKit

AppContainerKit is reusable component that allows make smoothy transitions beetwen two minor views flow (Authorization and Main flow when user is logged or Authorization and Some walkthrought etc.).

# How do I contribute?

### How do I get set up?

##### Bundler

* clone repo
* install Xcode Command line Tools
* install latest ruby version
* install bundler `[sudo] gem install bundler`
* install gems `bundle` (within project folder)

### How do I use Bundler

Instead of using local versions of Cocoapods use:

* `bundle exec pod install`

### How do I open the project

* `open AppContainerKit.xcworkspace`

# Installation

add `pod 'AppContainerKit'` to your Podfile

use :
```sh
$ pod install
```
or if you are familiar with `bundler`:
```sh
$ bundle exec pod install 
```

# Featuers

Create class in my Example with `Swinject` it is `WindowController`
Class have to extend `AKPWindowController` there is important function.

Implement protocol `ACKDelegate` with criteria for presenting primary container:
- `func shouldPresentPrimaryViewController() -> Bool`

Implement protocol `ACKUIDelegate` where you provide for App Container your view controllers:
- `func launchScreenViewController() -> UIViewController?` - allows for keep your brand during the transitions
- `func primaryViewController() -> UIViewController?` - returns view controller for primary container
- `func secondaryViewController() -> UIViewController?` - returns view controller for secondary container

# Example

For this moment project contains example with my favorite dependency injection [Swinject]. Check in `AppContainerKitDISwiftExample` how do I used dependency injection and `AppDelegate.swift` for integration AppContainerKit with the example application.

### Todos

- Add Example without dependecy injection

License
----

MIT

[swinject]: <https://github.com/Swinject/Swinject>
