//
//  UIViewController+StoryboardActions.m
//  StoryboardSupport
//
//  Created by Maximilian Tagher on 5/4/13.
//  Copyright (c) 2013 Tagher. All rights reserved.
//

#import "UIViewController+StoryboardActions.h"

@implementation UIViewController (StoryboardActions)

#pragma mark - UINavigationController

- (IBAction)backButton;
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Modals

- (IBAction)dismissModal;
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
