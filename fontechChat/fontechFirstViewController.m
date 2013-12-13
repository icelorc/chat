//
//  fontechFirstViewController.m
//  fontechChat
//
//  Created by Robert Huang on 12/13/13.
//  Copyright (c) 2013 Robert Huang. All rights reserved.
//

#import "fontechFirstViewController.h"

@interface fontechFirstViewController ()

@end

@implementation fontechFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [QBAuth createSessionWithDelegate:self];
    [QBUsers logInWithUserLogin:@"fontech" password:@"computer1"  delegate:self];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)completedWithResult:(Result *)result{
    if(result.success && [result isKindOfClass:QBAAuthSessionCreationResult.class]){
        // Success, You have got Application session, now READ something
    } else if (result.success && [result isKindOfClass:QBUUserLogInResult.class]) {
        QBUUserLogInResult *userResult = (QBUUserLogInResult *)result;
        NSLog(@"Logged In user=%@", userResult.user);
    }
}

@end
