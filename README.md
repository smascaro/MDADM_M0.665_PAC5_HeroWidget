# Hero widget 🦸🏻‍♀️

## What is the Hero widget?

The Hero widget, as stated in the official documentation, is

>a widget that marks its child as being a candidate for hero animations.

## But, what is a hero animation?

A hero animation can happen in a transition between two screens that share a visual element. If there is one (or more) shared elements that fly from first to second screen, is considered to be a hero animation. 
For example in the following video (click on the image) we can see that every time an image is clicked, it flies to the new screen and changes the necessary properties on the fly (i.e. the size).

[![Hero widget demo](https://img.youtube.com/vi/tHD5WEEqcS4/0.jpg)](https://www.youtube.com/watch?v=tHD5WEEqcS4)

## Very cool, but show me the code!!

Okay, easy. It is fairly simple to implement a hero transition. All you need is the ✨ Hero widget ✨. In order to tell it which is the view in the initial screen and where it needs to fly in the end screen, you just need to wrap the view inside this widget and set the `tag` property. The `tag` property needs to be unique in each screen (initial and end screens), as every view with a tag will fly to the view with the same tag in the end screen.

The wrapped widget should be as much identical in both screens as possible to ensure a smoother animation.

In the initial screen we have:
```dart
child: Hero(
  child: Image.network(album.coverUrl),
  tag: album.tag,
)
```

And in the end screen the following:
```dart
children: [
  Hero(
    child: Image.network(arguments.album.coverUrl),
    tag: arguments.album.tag,
  ),
  (...)
```

## But wait, there's more!

Sharp borders are boring, I'm sure you will set some material-ish borders to your images. And when it comes to borders, the `Hero` widget is there to help you. Actually, you don't need to do anything else than wrapping your hero'ed widget within a `ClipXXXX` widget and customize the borders as you like.

In this demo we'll see the two most usual ones: `ClipRRect` and `ClipOval`.

### Hero animation with curved bordered images

As mentioned before, all you need to do is wrap your image or your widget inside a `ClipRRect` widget and set the desired border radius like so:

```dart
child: Hero(
  child: ClipRRect(
    borderRadius: BorderRadius.circular(32),
    child: Image.network(album.coverUrl)
  ),
  tag: album.tag,
)
```

Check out the demo video:

[![Hero widget demo with ClipRRect](https://img.youtube.com/vi/OlY3aCAm_QE/0.jpg)](https://www.youtube.com/watch?v=OlY3aCAm_QE)

### Hero animation with circular images

In this case the only difference is the wrapping widget, instead of `ClipRRect` we will be using `ClipOval`:

```dart
child: Hero(
  child: ClipOval(
    child: Image.network(album.coverUrl)
  ),
  tag: album.tag,
)
```

Check out the demo video:

[![Hero widget demo with ClipOval](https://img.youtube.com/vi/i2iqlb9Fh7Q/0.jpg)](https://www.youtube.com/watch?v=i2iqlb9Fh7Q)

## Some useful links

- [Hero widget class (Official docs)](https://api.flutter.dev/flutter/widgets/Hero-class.html)
- [Hero animation behind the scenes (Official docs)](https://flutter.dev/docs/development/ui/animations/hero-animations)
- [Cookbook: Animate a widget between screens (Official docs)](https://flutter.dev/docs/cookbook/navigation/hero-animations)
