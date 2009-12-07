//
//  SoundTrackController.h
//  EditingBay
//
//  Created by Ari Lerner on 12/6/09.
//  Copyright 2009 AT&T Interactive. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "iTunes.h"

@interface SoundTrackController : NSObject {
	iTunesApplication *iTunes;
	NSMutableArray *playlists;
	// Table views
	IBOutlet NSTableView *playlistView;
}
-(void)openPlaylistLoader;
- (IBAction)play:(id)sender;

@end
