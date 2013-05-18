//
//  UIViewController+StoryboardActions.h
//  StoryboardSupport
//
//  Created by Maximilian Tagher on 5/4/13.
//  Copyright (c) 2013 Tagher. All rights reserved.
//

#import <UIKit/UIKit.h>

/** `IBAction`s to hook up from your Storyboard. Hold Control and drag to hook up UI to `IBAction`s. You can either drag to the orange View Controller bubble in the Storybard, or open the Assistant Editor (Tuxedo in the top right) and drag directly to the code.
    
 Because these actions are in a category, they are available to all `UIViewController`s.
 */
@interface UIViewController (StoryboardActions)

#pragma mark - UINavigationController

/** Equivalent to tapping the back button. */
- (IBAction)backButton;

#pragma mark - Modal View Controller

/** Dismisses a modally presented controller. You can call this method on either the presenting view controller, or the view controller that was modally presented.
 */
- (IBAction)dismissModal;

@end
