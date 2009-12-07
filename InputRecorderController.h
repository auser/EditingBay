//
//  InputRecorderController.h
//  EditingBay
//
//  Created by Ari Lerner on 12/3/09.
//  Copyright 2009 AT&T Interactive. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QTKit/QTKit.h>

@interface InputRecorderController : NSObject {
	IBOutlet QTCaptureView *inputCaptureView;
	
	// Capture
	QTCaptureSession           *mCaptureSession;
	QTCaptureMovieFileOutput   *mCaptureMovieFileOutput;
	QTCaptureDeviceInput       *mCaptureDeviceInput;
}

-(IBAction)startRecording:(id)sender;
-(IBAction)stopRecording:(id)sender;

@end
