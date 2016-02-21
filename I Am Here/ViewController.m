//
//  ViewController.m
//  I Am Here
//
//  Created by Mayur Phadte on 30/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO(developer) Configure the sign-in button look/feel
    self.navigationItem.title = @"Merchant Sign In";
    
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    // Uncomment to automatically sign in the user.
    //[[GIDSignIn sharedInstance] signInSilently];
    
    // Do any additional setup after loading the view, typically from a nib.
    /*Beaconstac *beaconstacInstance = [Beaconstac sharedInstanceWithOrganizationId:1059 developerToken:@"c3db4c036668b550814c3dbf2b4c5ad8d779b25a"];
    beaconstacInstance.delegate = self;
    [beaconstacInstance startRangingBeaconsWithUUIDString:@"F94DBB23-2266-7822-3782-57BEAC0952AC" beaconIdentifier:@"MobstacRegion" filterOptions:nil];*/
}
- (IBAction)printEmail:(id)sender {
    NSString *email = [[NSUserDefaults standardUserDefaults] valueForKey:@"email"];
    NSLog(@"%@",email);
}


- (IBAction)didTapSignOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
    NSLog(@"Signed out");
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isloggedin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


- (void)beaconstac:(Beaconstac *)beaconstac rangedBeacons:(NSDictionary *)beaconsDictionary
{
    NSLog(@"Beacons around %@",beaconsDictionary);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
