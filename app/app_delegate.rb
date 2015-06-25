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
		outURL = NSURL.alloc.initFileURLWithPath("/Users/stk/Desktop/hoge.png") 
		dr = CGImageDestinationCreateWithURL(outURL, "public.png", 1, nil)
		CGImageDestinationAddImage(dr, img, nil)
		CGImageDestinationFinalize(dr)
	end
end
