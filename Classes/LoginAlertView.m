    //
//  LoginAlertView.m
//  NowIAmMayor
//
//  Created by Barry Ezell on 8/5/10.
//  Copyright 2010 Dockmarket LLC. All rights reserved.
//

#import "LoginAlertView.h"


@implementation LoginAlertView

@synthesize usernameTextField, passwordTextField;

- (id)initWithTitle:(NSString *)title delegate:(id)del {

	self = [super initWithTitle:title 
						message:@"\n\n\n" 
					   delegate:del
			  cancelButtonTitle:@"Cancel" 
			  otherButtonTitles:@"Enter", nil];
	
	if (self) {
		usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 50.0, 260.0, 25.0)]; 
		[usernameTextField setBackgroundColor:[UIColor whiteColor]];
		[usernameTextField setPlaceholder:@"username"];
		[usernameTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
		[self addSubview:usernameTextField];
		
		passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 85.0, 260.0, 25.0)]; 
		[passwordTextField setBackgroundColor:[UIColor whiteColor]];
		[passwordTextField setPlaceholder:@"password"];
		[passwordTextField setSecureTextEntry:YES];
		[self addSubview:passwordTextField];	
	}
	
	return self;
}

- (void)dealloc {
    [super dealloc];
}


@end
