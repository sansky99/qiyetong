//
//  LoginViewController.m
//  qiyetong
//
//  Created by khuang on 14-4-29.
//  Copyright (c) 2014年 servyou. All rights reserved.
//

#import "LoginViewController.h"

NSString *const kQytUser = @"kQytUser";
NSString *const kQytPassword = @"kQytPassword";
NSString *const kQytServer = @"kQytServer";

@interface LoginViewController ()

@end

@implementation LoginViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    self.txtName.text = [ud stringForKey:kQytUser];
    self.txtPassword.text = [ud stringForKey:kQytPassword];
    self.txtServer.text = [ud stringForKey:kQytServer];
    if (0 == [self.txtName.text length])
    {
        self.txtName.text = @"user1";
        self.txtPassword.text = @"123";
        self.txtServer.text = @"192.168.70.192";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didEndOnExit:(id)sender {
    [sender resignFirstResponder];
}

#pragma mark - Segue
-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"presentMainTabBar"])
    {
        NSString *name = [self.txtName.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
        NSString *pwd = self.txtPassword.text;
        NSString *server = [self.txtServer.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if ([self validateWithUser: name andPass:pwd andServer:server])
        {
            NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
            [ud setValue:name forKey:kQytUser];
            [ud setValue:pwd forKey:kQytPassword];
            [ud setValue:pwd forKey:kQytServer];
           return YES;
        }
    }
    return NO;
}

#pragma mark - validate User Password
-(BOOL)validateWithUser:(NSString *)userText andPass:(NSString *)passText andServer:(NSString *)serverText
{
    if (userText.length > 0 && passText.length > 0 && serverText.length > 0) {
        return YES;
    }
    return NO;
}
@end
