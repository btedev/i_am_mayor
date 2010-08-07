//
//  MayorViewController.h
//  NowIAmMayor
//
//  Created by Barry Ezell on 8/3/10.
//  Copyright Dockmarket LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"

@interface MayorViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate> {	
	NSString *username;
	NSString *password;
}

@property (nonatomic, retain) IBOutlet UITextField *locationTextField;
@property (nonatomic, retain) IBOutlet UITextField *spentField;
@property (nonatomic, retain) IBOutlet UILabel *messageLabel;
@property (nonatomic, retain) IBOutlet UILabel *charsLabel;

- (IBAction) sendButtonWasPressed;
- (void)showAuthenticationDialog;
- (void)formatTweet;
- (NSString *)formatAsCurrency:(NSString *)string;
- (void)postMayoralStatus;
- (void)requestDone:(ASIHTTPRequest *)request;
- (void)requestWentWrong:(ASIHTTPRequest *)request;

@end

