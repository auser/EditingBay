//
//  MainWindowController.m
//  EditingBay
//
//  Created by Ari Lerner on 12/6/09.
//  Copyright 2009 AT&T Interactive. All rights reserved.
//

#import "MainWindowController.h"
#import "SoundTrackController.h"

@implementation MainWindowController

@synthesize soundTrackWindow;

- (id) init {
	[self loadSoundTrackWindow];
	return self;
}

- (void) loadSoundTrackWindow
{
	[NSBundle loadNibNamed:@"SoundTrack" owner:self];
	[soundTrackWindow release];
}

@end
