//
//  UIStoryboard+MainStoryboard.m
//  StoryboardSupport
//
//  Created by Maximilian Tagher on 5/5/13.
//  Copyright (c) 2013 Tagher. All rights reserved.
//

#import "UIStoryboard+MainStoryboard.h"

@implementation UIStoryboard (MainStoryboard)

+ (UIStoryboard *)mainStoryboard
{
    return [UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"] bundle:nil];
}

+ (UIStoryboard *)probableStoryboardForViewController:(UIViewController *)viewController
{
    if (viewController.storyboard) {
        return viewController.storyboard;
    } else if ([UIStoryboard mainStoryboard]) {
        return [UIStoryboard mainStoryboard];
    } else {
        NSLog(@"Warning -- tried to create a storyboard but could not.");
        return nil;
    }
}

@end
