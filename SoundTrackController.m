//
//  SoundTrackController.m
//  EditingBay
//
//  Created by Ari Lerner on 12/6/09.
//  Copyright 2009 AT&T Interactive. All rights reserved.
//

#import "SoundTrackController.h"

@implementation SoundTrackController

-(void) awakeFromNib {
	if (playlists == nil) {
		playlists = [[NSMutableArray alloc] init];
		[self openPlaylistLoader];

		iTunes = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
		NSLog(@"Current song is %@", [[iTunes currentTrack] name]);
		[iTunes stop];
	}
}

-(NSMutableArray *)getTracksForPlaylist:(NSString *)thePlaylist {
	//
	// Takes a playlist name as an argument, and returns a regular mutable array with iTunesTrack * pointers.
	//
	NSMutableArray *trackList = [[NSMutableArray alloc] init];
	
	iTunes = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
	if (!iTunes || ![iTunes isRunning])
		return nil;
	
	SBElementArray *pls = [[[iTunes sources] objectAtIndex:0] playlists];
	
	for (iTunesPlaylist *pl in pls) {
		if ([[pl name] isEqualToString:thePlaylist]) {
			for (iTunesTrack *t in [pl tracks]) {
				[trackList addObject:t];
			}
		}
	}
	
	return trackList;
}

-(void)openPlaylistLoader {
	//
	// Initialize and fetch the list of playlists
	//
	iTunes = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
	if (!iTunes || ![iTunes isRunning])
		return;
	
	if (playlists)
		[playlists removeAllObjects];
	else
		playlists = [[NSMutableArray alloc] init];
	
	SBElementArray *pls = [[[iTunes sources] objectAtIndex:0] playlists];
	
	for (iTunesPlaylist *pl in pls) {
		if (pl && [pl specialKind] == iTunesESpKNone)
			[playlists addObject:[pl name]];
	}
	
	[playlistView reloadData];
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
	return (playlists != nil) ? [playlists count] : 0;
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex {
	return [playlists objectAtIndex:rowIndex];
}


- (IBAction)play:(id)sender {
	[iTunes playpause];
}


@end
