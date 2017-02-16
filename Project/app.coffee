Events.Click = 'click' # eventi touchend convertiti in click

# Incolla da qui

Framer.Device = new Framer.DeviceComponent()
# Framer.Device.deviceType = "apple-watch-38mm-black-steel-black-closed"
Framer.Device.deviceType = "apple-iphone-7-silver"
Framer.Device.setupContext()
Framer.Device.contentScale = 1

Screen.backgroundColor = "#ffffff"
Canvas.backgroundColor = "#f0f0f0"

# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info
Framer.Info =
	title: "Fico"
	author: "Websolute"
	twitter: "websolute"
	description: "Fico Eataly World App."

# Setup
setup = ->
	assets = Framer.Importer.load("imported/fico@1x")
	
	# {SVGLayer} = require "SVGLayer"	
	# layerLine = new SVGLayer
	# 	strokeWidth: 4
	# 	dashOffset: 0
	# 	width: 750
	# 	height: 1334
	# 	stroke: "#ff0000"
	# 	path: '<path d="M0,658 L1048,1"></path>'
	# 	parent: assets.background
	# 	index:0 
	
    	
#setup initial state
#	assets.scroll.y = 210	
	assets.scroll.x = 0 # 416	
	assets.posts.opacity = 0
	assets.posts.x = 640
	assets.mainMenu.opacity = 1
	assets.sideMenu.opacity = 0
	assets.sideMenu.y = 522
	assets.sideMenu.parent = assets.background
	assets.sideMenu.index = 0
#	assets.tabs.opacity = 0
#	assets.background2.x = 0
#	assets.background2.opacity = 0	


# setup animation
	animationPosts = new Animation assets.posts,	
		properties:
			opacity: 1
			time: .5
			x: 416
		options:
			curve: "spring(100, 30, -20)"

	animationSideMenu = new Animation assets.sideMenu,
		y: 322
		opacity: 1
		options:
			curve: "spring(100, 30, -20)"

#	animationLine = new Animation layerLine,
#		properties:
#			dashOffset: 1  
#			time: 2
#	  
#	animationTabs = new Animation assets.tabs,
#		opacity: 1
#		options:
#			curve: "spring(100, 30, -20)"
#	   
#	animationtextavatar = new Animation assets.background2,
#		properties:
#			opacity: 1 
#		options:
#			curve: "spring(100, 30, -20)"
#	       
#	animationLine.start()
            
	Utils.delay 1.2, ->
		animationSideMenu.start()
		animationPosts.start()
#		animationTabs.start()
	
	assets.scrollbarIndicator.parent = assets.scrollbarTrack	
	assets.scrollbarIndicator.x = 56
	assets.scrollbarIndicator.y = 0
	
	scroll = ScrollComponent.wrap assets.scroll
	scroll.mouseWheelEnabled = true
	scroll.scrollVertical = false
	scroll.contentInset =
		top: 0
		right: -200
		bottom: 0
		left: 0
	scroll.speedX = 0.8
	
	indicator = ->
		X = 56 + Math.max(0, Math.min(1, scroll.scrollX / 1720)) * (750 - 130)
		assets.scrollbarIndicator.animate
			x: X
			options:
				time: 0.1
				curve: "ease"

	assets.scroll.onSwipe (event, layer) ->
		indicator()
				
	assets.scroll.onSwipeEnd (event, layer) ->
		indicator()
				
#	assets.scroll.on "change:scrollX" (event, layer) ->
#		indicator()
	
	assets.scroll.onSwipeLeft (event, layer) ->
		assets.sideMenu.animate
			opacity: 0
			options:
				time: 0.1
				curve: "ease"
	
	assets.scroll.onSwipeRightEnd (event, layer) ->
		if scroll.scrollX < 500
			assets.sideMenu.animate
				opacity: 1
				options:
					time: 0.5
					curve: "ease"
						
#	assets.Pic4.onClick (event, layer) ->
#		if not scroll.isMoving
#			currentImage = layer.copy()
#			currentImage.placeBehind(assets.tabs)
#			currentImage.frame = layer.screenFrame
#			layer.visible = false
#			currentImage.ignoreEvents 
#							
#			currentImage.animate
#				properties:
#					scale: Screen.width / currentImage.width
#					midY: Screen.height / 2
#					midX: Screen.width / 2
#					y:-90
#					borderRadius:0
#					curve: "spring(100, 30, -20)"
				
#			currentImage.center
#			Utils.delay 0.7, ->
#				animationtextavatar.start()
			
#			assets.closebutton.on Events.Click, ->
#					currentImage.animate
#						properties:
#							opacity: 0
#							y:-250
#							curve: "spring(150, 130, 0)"
						
#					assets.background2.animate
#						properties:
#							opacity: 0
#							y:100
#							curve: "spring(150, 130, 0)"
						
#					currentImage.on Events.AnimationEnd, ->
#						layer.visible = true
#						currentImage.destroy()
						
#					Utils.delay 1.2, ->	
#						Framer.CurrentContext.reset()
#						setup() 	
								
#			layerLine.animate
#				opacity: 0
#				options:
#					time: 0.2	
#					curve: "ease"
#			assets.mainMenu.animate
#				opacity: 0
#				options:
#					time: 0.2
#					curve: "ease"
#			assets.posts.animate
#				opacity: 0
#				options:
#					time: 0.2
#					curve: "ease"	
#			assets.tabs.animate
#				opacity: 0
#				options:
#					time: 0.2	
#					curve: "ease"	

setup()	
	#Framer.CurrentContext.reset()
		