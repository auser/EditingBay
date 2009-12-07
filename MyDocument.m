//
//  MyDocument.m
//  EditingBay
//
//  Created by Ari Lerner on 12/3/09.
//  Copyright AT&T Interactive 2009 . All rights reserved.
//

#import "MyDocument.h"

@implementation MyDocument

- (id)init
{
    self = [super init];
    if (self) {
    
        // Add your subclass-specific initialization here.
        // If an error occurs here, send a [self release] message and return nil.
			[self loadOtherWindows];
    
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *) aController
{
	[super windowControllerDidLoadNib:aController];
	// shows resizeable
	[mOutputMovieView setShowsResizeIndicator:YES];
	[[mOutputMovieView window] setShowsResizeIndicator:NO];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If the given outError != NULL, ensure that you set *outError when returning nil.

    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.

    // For applications targeted for Panther or earlier systems, you should use the deprecated API -dataRepresentationOfType:. In this case you can also choose to override -fileWrapperRepresentationOfType: or -writeToFile:ofType: instead.

    if ( outError != NULL ) {
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
	}
	return nil;
}

- (BOOL)readFromURL:(NSURL *)absoluteURL ofType:(NSString *)typeName error:(NSError **)outError
{
	QTMovie *newMovie = [QTMovie movieWithURL:absoluteURL error:outError];
	if (newMovie) {
		[newMovie setAttribute:[NSNumber numberWithBool:YES] forKey:QTMovieEditableAttribute];
		[self setOutputMovie:newMovie];
	}
	return (newMovie != nil);
}


@synthesize outputMovie;

@end
