//
//  LoginAlertView.h
//  NowIAmMayor
//
//  Created by Barry Ezell on 8/5/10.
//  Copyright 2010 Dockmarket LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginAlertView : UIAlertView {

}

@property (nonatomic, retain) UITextField *usernameTextField;
@property (nonatomic, retain) UITextField *passwordTextField;

- (id)initWithTitle:(NSString *)title delegate:(id)del;


@end
