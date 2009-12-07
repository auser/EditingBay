//
//  MainWindowController.h
//  EditingBay
//
//  Created by Ari Lerner on 12/6/09.
//  Copyright 2009 AT&T Interactive. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MainWindowController : NSWindowController {
	NSWindow *soundTrackWindow;
}

@property(retain) IBOutlet NSWindow *soundTrackWindow;

- (void)loadSoundTrackWindow;

@end
