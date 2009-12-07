//
//  MyDocument.h
//  EditingBay
//
//  Created by Ari Lerner on 12/3/09.
//  Copyright AT&T Interactive 2009 . All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import <QTKit/QTKit.h>

@interface MyDocument : NSDocument
{
	// Outlets
	IBOutlet QTMovieView  *mOutputMovieView;
	
	QTMovie *outputMovie;
}

@property(retain) QTMovie *outputMovie;

@end
