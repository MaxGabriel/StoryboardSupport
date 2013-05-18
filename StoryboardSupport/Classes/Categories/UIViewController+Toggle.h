//
//  UIViewController+Toggle.h
//  StoryboardSupport
//
//  Created by Maximilian Tagher on 5/4/13.
//  Copyright (c) 2013 Tagher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Toggle)

@property (nonatomic, strong) UIViewController *toggleViewController;

- (void)setToggleViewControllerID:(NSString *)toggleViewControllerID;

- (IBAction)toggleViewControllers:(id)sender;

@end
