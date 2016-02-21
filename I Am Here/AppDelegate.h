//
//  AppDelegate.h
//  I Am Here
//
//  Created by Mayur Phadte on 30/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>
@property (strong, nonatomic) UIWindow *window;


@end

