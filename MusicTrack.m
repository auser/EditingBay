//
//  MusicTrack.m
//  EditingBay
//
//  Created by Ari Lerner on 12/6/09.
//  Copyright 2009 AT&T Interactive. All rights reserved.
//

#import "MusicTrack.h"


@implementation MusicTrack

- (void) dealloc
{
	[tracks release];
	[super dealloc];
}


@end
