//
//  MayorViewController.h
//  NowIAmMayor
//
//  Created by Barry Ezell on 8/3/10.
//  Copyright Dockmarket LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MayorViewController : UIViewController <UITextFieldDelegate> {
	NSString *baseMessageString;
}

@property (nonatomic, retain) IBOutlet UITextField *locationTextField;
@property (nonatomic, retain) IBOutlet UILabel *spentLabel;
@property (nonatomic, retain) IBOutlet UILabel *messageLabel;

- (IBAction) spentChangeButtonWasPressed;
- (IBAction) sendButtonWasPressed;

@end

