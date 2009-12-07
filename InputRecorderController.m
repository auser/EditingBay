//
//  InputRecorderController.m
//  EditingBay
//
//  Created by Ari Lerner on 12/3/09.
//  Copyright 2009 AT&T Interactive. All rights reserved.
//

#import "InputRecorderController.h"

@implementation InputRecorderController
- (void)awakeFromNib
{
	mCaptureSession = [[QTCaptureSession alloc] init];
	BOOL success = NO;
	NSError *error;
	QTCaptureDevice *device = [QTCaptureDevice defaultInputDeviceWithMediaType:QTMediaTypeVideo];
	if (device) {
		success = [device open:&error];
		if (!success) {
		}
		mCaptureDeviceInput = [[QTCaptureDeviceInput alloc] initWithDevice:device];
		success = [mCaptureSession addInput:mCaptureDeviceInput error:&error];
		if (!success) {
			// Handle error
		}
    mCaptureMovieFileOutput = [[QTCaptureMovieFileOutput alloc] init];
    success = [mCaptureSession addOutput:mCaptureMovieFileOutput error:&error];
    if (!success) {
    }
    [mCaptureMovieFileOutput setDelegate:self];
		NSEnumerator *connectionEnumerator = [[mCaptureMovieFileOutput connections] objectEnumerator];
		QTCaptureConnection *connection;
		
		while ((connection = [connectionEnumerator nextObject])) {
			NSString *mediaType = [connection mediaType];
			QTCompressionOptions *compressionOptions = nil;
			if ([mediaType isEqualToString:QTMediaTypeVideo]) {
				compressionOptions = [QTCompressionOptions compressionOptionsWithIdentifier:@"QTCompressionOptions240SizeH264Video"];
			} else if ([mediaType isEqualToString:QTMediaTypeSound]) {
				compressionOptions = [QTCompressionOptions compressionOptionsWithIdentifier:@"QTCompressionOptionsHighQualityAACAudio"];
			}
			
			[mCaptureMovieFileOutput setCompressionOptions:compressionOptions forConnection:connection];
			[inputCaptureView setCaptureSession:mCaptureSession];
			[mCaptureSession startRunning];			
}
				
@end
