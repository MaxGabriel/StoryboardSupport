//
//  UIStoryboard+MainStoryboard.h
//  StoryboardSupport
//
//  Created by Maximilian Tagher on 5/5/13.
//  Copyright (c) 2013 Tagher. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Extensions to `UIStoryboard` to make all possible attempts to access a Storyboard. */
@interface UIStoryboard (MainStoryboard)

/** Returns the storyboard specified in the App's info.plist file. This value can also be set from by selecting your Project in the file navigator > Select your target > Select the Summary tab > set the storyboard files for iPhone and/or iPad.
 @return The storyboard, or `nil` if it didn't exist.
 */
+ (UIStoryboard *)mainStoryboard;

/** Returns the storyboard of the view controller, if one was present. Otherwise, returns the Storyboard specified in the info.plist file (see `mainStoryboard`). Otherwise, logs a warning message and returns `nil`.
 @param viewController The view controller to check for a storyboard property.
 @return A storyboard, or `nil`.
 */
+ (UIStoryboard *)probableStoryboardForViewController:(UIViewController *)viewController;

@end
