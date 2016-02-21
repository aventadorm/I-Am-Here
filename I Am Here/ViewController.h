//
//  ViewController.h
//  I Am Here
//
//  Created by Mayur Phadte on 30/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<Beaconstac/Beaconstac.h>
#import <Google/SignIn.h>

@interface ViewController : UIViewController<BeaconstacDelegate,GIDSignInUIDelegate>
@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;
@property GIDGoogleUser *guser;

@end

