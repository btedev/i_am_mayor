//
//  NowIAmMayorAppDelegate.h
//  NowIAmMayor
//
//  Created by Barry Ezell on 8/3/10.
//  Copyright Dockmarket LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MayorViewController;

@interface NowIAmMayorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MayorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MayorViewController *viewController;

@end

