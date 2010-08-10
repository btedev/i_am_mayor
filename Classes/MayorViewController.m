//
//  MayorViewController.m
//  NowIAmMayor
//
//  Created by Barry Ezell on 8/3/10.
//  Copyright Dockmarket LLC 2010. All rights reserved.
//

#import "MayorViewController.h"
#import "LoginAlertView.h"

@implementation MayorViewController

@synthesize locationTextField, spentField, messageLabel, charsLabel;

- (void)dealloc {
	[locationTextField release];
	[spentField release];
	[messageLabel release];
	[charsLabel release];	
	[username release];
	[password release];
    [super dealloc];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {	
    [super viewDidLoad];
	
	//register for text field change notifications
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(formatTweet) 
												 name:UITextFieldTextDidChangeNotification 
											   object:nil];
}

#pragma mark -
#pragma mark UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

#pragma mark -
#pragma mark UIAlertViewDelegate and auth methods

- (void)showAuthenticationDialog {
	LoginAlertView *login = [[LoginAlertView alloc] initWithTitle:@"Twitter" delegate:self];
	[login show];
	[login release];	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 1) {
		LoginAlertView *login = (LoginAlertView *)alertView;
		
		if ([login.usernameTextField.text length] > 0 && [login.passwordTextField.text length] > 0) {
			username = login.usernameTextField.text;
			password = login.passwordTextField.text;	
			[username retain];
			[password retain];
						
			[self postMayoralStatus];
		}									  
	}
}

#pragma mark -
#pragma mark IBAction and Tweet methods

- (IBAction) sendButtonWasPressed {
	[self postMayoralStatus];
}

//Create the text that will be tweeted based on the location and money spent text fields
//along with today's date.
- (void)formatTweet {
	
	NSString *location = self.locationTextField.text;	
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4]; //means "set formatter behavior to OS 10.4+ behavior"
	[dateFormatter setDateStyle:NSDateFormatterShortStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	NSDate *date = [NSDate date];	
	NSString *formattedDateString = [dateFormatter stringFromDate:date];
	[dateFormatter release];
	
	NSString *spent = [self formatAsCurrency:([self.spentField.text length] > 0 ? self.spentField.text : @"0.0")];
	
	NSString *tweet = [NSString stringWithFormat:NSLocalizedString(@"Tweet",nil), location, formattedDateString, spent];
		
	self.messageLabel.text = tweet;
	self.charsLabel.text = [NSString stringWithFormat:@"%i", [tweet length]];	
}

//Given a valid numeric string, return a locale-specific currency string.
//Examples: "5.23" in en_US will return "$5.23"
//"5,23" in sv_SE will return "5,23 sk"
- (NSString *)formatAsCurrency:(NSString *)string {
	
	//Note: Apple's docs are incorrect on NSDecimalNumber on iOS.  Docs state that locale doesn't need to be explicitly
	//set unless you need to override.  In my tests, it does not accept comma as a valid NSDecimalSeparator unless the locale
	//is passed as an argument.  Other devs have confirmed this behavior.
	NSDecimalNumber *amount = [NSDecimalNumber decimalNumberWithString:string locale:[NSLocale currentLocale]];		
	
	//The above method won't throw an exception if a non-decimal is entered but amount will be NaN.  
	if (amount == [NSDecimalNumber notANumber]) {
		amount = [NSDecimalNumber decimalNumberWithString:@"0.0" locale:[NSLocale currentLocale]];
	}
	
	//iOS4 has a newer and shorter method for formatting localized numbers.
	//Both the newer and older formats are available below:
	NSString *formattedString;
	
#ifdef __IPHONE_4_0
	formattedString = [NSNumberFormatter localizedStringFromNumber:amount 
													   numberStyle:NSNumberFormatterCurrencyStyle];
#else
	NSNumberFormatter *curFormat = [[NSNumberFormatter alloc] init];
	[curFormat setFormatterBehavior:NSNumberFormatterBehavior10_4];
	[curFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
	NSString *formattedString = [curFormat stringFromNumber:amount];
	[curFormat release];
#endif	
	
	return formattedString;
}

- (void)postMayoralStatus {
	if (username == nil || password == nil) {
		[self showAuthenticationDialog];
		return;
	}
	
	NSURL *url = [NSURL URLWithString:@"https://twitter.com/statuses/update.json"];
	ASIFormDataRequest *request = [[[ASIFormDataRequest alloc] initWithURL:url] autorelease];
	[request setUsername:username];
	[request setPassword:password];
	[request setPostValue:self.messageLabel.text forKey:@"status"];
	[request setDelegate:self];
	[request setDidFinishSelector:@selector(requestDone:)];
	[request setDidFailSelector:@selector(requestWentWrong:)];
	[request start];	
}

- (void)requestDone:(ASIHTTPRequest *)request {
	NSString *response = [request responseString];
	NSLog(@"Status update succeeded: %@", response);
}

- (void)requestWentWrong:(ASIHTTPRequest *)request {
	NSError *error = [request error];
	NSLog(@"Status update failure: %@",[error localizedDescription]);
	
	if ([[error localizedDescription] isEqualToString:@"Authentication needed"]) {
		[username release];
		[password release];
		username = nil;
		password = nil;
		[self showAuthenticationDialog];
	}
}

@end
