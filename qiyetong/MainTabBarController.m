//
//  MainTabBarController.m
//  qiyetong
//
//  Created by khuang on 14-4-29.
//  Copyright (c) 2014年 servyou. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

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
    
    NSArray* views = self.viewControllers;
    if (views.count == 4)
    {
        ((UIViewController*)[views objectAtIndex:0]).tabBarItem.title = NSLocalizedString(@"Message", nil);
        ((UIViewController*)[views objectAtIndex:1]).tabBarItem.title = NSLocalizedString(@"Orgnization", nil);
        ((UIViewController*)[views objectAtIndex:2]).tabBarItem.title = NSLocalizedString(@"Addon", nil);
        ((UIViewController*)[views objectAtIndex:3]).tabBarItem.title = NSLocalizedString(@"Group", nil);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
