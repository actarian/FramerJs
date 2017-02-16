var setup;

Events.Click = 'click';

Framer.Device = new Framer.DeviceComponent();

Framer.Device.deviceType = "apple-iphone-7-silver";

Framer.Device.setupContext();

Framer.Device.contentScale = 1;

Screen.backgroundColor = "#ffffff";

Canvas.backgroundColor = "#f0f0f0";

Framer.Info = {
  title: "Fico",
  author: "Websolute",
  twitter: "websolute",
  description: "Fico Eataly World App."
};

setup = function() {
  var animationPosts, animationSideMenu, assets, indicator, scroll;
  assets = Framer.Importer.load("imported/fico@1x");
  assets.scroll.x = 0;
  assets.posts.opacity = 0;
  assets.posts.x = 640;
  assets.mainMenu.opacity = 1;
  assets.sideMenu.opacity = 0;
  assets.sideMenu.y = 522;
  assets.sideMenu.parent = assets.background;
  assets.sideMenu.index = 0;
  animationPosts = new Animation(assets.posts, {
    properties: {
      opacity: 1,
      time: .5,
      x: 416
    },
    options: {
      curve: "spring(100, 30, -20)"
    }
  });
  animationSideMenu = new Animation(assets.sideMenu, {
    y: 322,
    opacity: 1,
    options: {
      curve: "spring(100, 30, -20)"
    }
  });
  Utils.delay(1.2, function() {
    animationSideMenu.start();
    return animationPosts.start();
  });
  assets.scrollbarIndicator.parent = assets.scrollbarTrack;
  assets.scrollbarIndicator.x = 56;
  assets.scrollbarIndicator.y = 0;
  scroll = ScrollComponent.wrap(assets.scroll);
  scroll.mouseWheelEnabled = true;
  scroll.scrollVertical = false;
  scroll.contentInset = {
    top: 0,
    right: -200,
    bottom: 0,
    left: 0
  };
  scroll.speedX = 0.8;
  indicator = function() {
    var X;
    X = 56 + Math.max(0, Math.min(1, scroll.scrollX / 1720)) * (750 - 130);
    return assets.scrollbarIndicator.animate({
      x: X,
      options: {
        time: 0.1,
        curve: "ease"
      }
    });
  };
  assets.scroll.onSwipe(function(event, layer) {
    return indicator();
  });
  assets.scroll.onSwipeEnd(function(event, layer) {
    return indicator();
  });
  assets.scroll.onSwipeLeft(function(event, layer) {
    return assets.sideMenu.animate({
      opacity: 0,
      options: {
        time: 0.1,
        curve: "ease"
      }
    });
  });
  return assets.scroll.onSwipeRightEnd(function(event, layer) {
    if (scroll.scrollX < 500) {
      return assets.sideMenu.animate({
        opacity: 1,
        options: {
          time: 0.5,
          curve: "ease"
        }
      });
    }
  });
};

setup();
