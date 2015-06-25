class AppDelegate
	def applicationDidFinishLaunching(notification)
		buildMenu
		buildWindow
	end

	def buildWindow
		@mainWindow = NSWindow.alloc.initWithContentRect([[240, 180], [480, 360]], styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask, backing: NSBackingStoreBuffered, defer: false)
		@mainWindow.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
		@mainWindow.orderFrontRegardless
		id = CGMainDisplayID()
		img = CGDisplayCreateImage(id)
		NSLog("ID is %@", id)
		NSLog("img is %@", img)
		outURL = NSURL.alloc.initFileURLWithPath("~/Desktop/hoge/") 
		dr = CGImageDestinationCreateWithURL(outURL, "hoge.png", 1, nil)
		CGImageDestinationAddImage(dr, img, nil)
		CGImageDestinationFinalize(dr)
	end
end
