//
//  LoggedinViewController.m
//  I Am Here
//
//  Created by Mayur Phadte on 31/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import "LoggedinViewController.h"

@interface LoggedinViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *qrImageView;
@end

@implementation LoggedinViewController
- (IBAction)logout:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
    NSLog(@"Signed out");
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isloggedin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"imageController"];
    [self presentViewController:viewController animated:YES completion:nil];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *email = [[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    _qrImageView.image = [UIImage mdQRCodeForString:email size:_qrImageView.bounds.size.width fillColor:[UIColor darkGrayColor]];
    //CGFloat size1 = self.view.bounds.size.width/4;
    //_qrImageView.bounds = CGRectMake(size1, 2*size1, 2*size1, 2*size1);
    //_qrImageView.frame = CGRectMake(size1, 2*size1, 2*size1, 2*size1);
    //_qrImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationController.title = @"Merchant QR Code";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
