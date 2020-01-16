# FaviconPublishPlugin

Add Favicons to your links.

# Install

Add this to your `style.css:`
```
.wrapper a[href^="http"] {
  padding-left: 19px;
  background-size: 16px 16px;
  background-repeat: no-repeat;
  background-position: left center;
}

.wrapper a  {
  display: block;
  margin: 10px;
  text-decoration: none;
}
```

In your Package.swift add:
```swift
.package(url: "https://github.com/TG908/FaviconPublishPlugin.git", from: "0.0.1")
```

# Setup

To load the plugin simply add these lines:

```swift

import FaviconPublishPlugin

...

try MyWebsite().publish(
    ...
    plugins: [.addFaviconsToLinks(in: ".wrapper")]
])
```
