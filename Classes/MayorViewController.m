//
//  MayorViewController.m
//  NowIAmMayor
//
//  Created by Barry Ezell on 8/3/10.
//  Copyright Dockmarket LLC 2010. All rights reserved.
//

#import "MayorViewController.h"

@implementation MayorViewController

@synthesize locationTextField, spentLabel, messageLabel;

- (void)dealloc {
	[locationTextField release];
	[spentLabel release];
	[messageLabel release];
	[baseMessageString release];
    [super dealloc];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	baseMessageString = @"I became mayor of %@ on %@ where I spent %@";
	[baseMessageString retain];
	
    [super viewDidLoad];
}

#pragma mark -
#pragma mark UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	
	
	
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

#pragma mark -
#pragma mark IBAction methods

- (IBAction) spentChangeButtonWasPressed {

}

- (IBAction) sendButtonWasPressed {
	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


@end
