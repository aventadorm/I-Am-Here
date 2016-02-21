//
//  AppDelegate.m
//  I Am Here
//
//  Created by Mayur Phadte on 30/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSError* configureError;
    [[GGLContext sharedInstance] configureWithError: &configureError];
    NSAssert(!configureError, @"Error configuring Google services: %@", configureError);
    
    [GIDSignIn sharedInstance].delegate = self;
    UIViewController *viewController;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"isloggedin"]){
        viewController = [storyboard instantiateViewControllerWithIdentifier:@"loggedInController"];
    }else{
        viewController = [storyboard instantiateViewControllerWithIdentifier:@"imageController"];
    }
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    navigationController.navigationBar.translucent = NO;
    
    //self.window.rootViewController = viewController;
    self.window.rootViewController = navigationController;
    navigationController.navigationBar.barTintColor = [UIColor colorWithRed:64.0/255.0 green:64.0/255.0 blue:64.0/255.0 alpha:1.0];
    [navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //navigationController.navigationBar.barTintColor = [UIColor colorWithRed:64.0f green:64.0f blue:64.0f alpha:1.0];
    [self.window makeKeyAndVisible];
    
    return YES;
}
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                      annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    NSDictionary *options = @{UIApplicationOpenURLOptionsSourceApplicationKey: sourceApplication,
                              UIApplicationOpenURLOptionsAnnotationKey: annotation};
    return [self application:application
                     openURL:url
                     options:options];
}

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *name = user.profile.name;
    NSString *email = user.profile.email;
    [[NSUserDefaults standardUserDefaults] setValue:userId forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults] setValue:name forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setValue:email forKey:@"email"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isloggedin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"loggedInController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    navigationController.navigationBar.translucent = NO;
    
    //self.window.rootViewController = viewController;
    self.window.rootViewController = navigationController;
    navigationController.navigationBar.barTintColor = [UIColor colorWithRed:64.0/255.0 green:64.0/255.0 blue:64.0/255.0 alpha:1.0];
    [navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //navigationController.navigationBar.barTintColor = [UIColor colorWithRed:64.0f green:64.0f blue:64.0f alpha:1.0];
    [self.window makeKeyAndVisible];
    // ...
}
- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
    // ...
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
