//
//  UIViewController+Toggle.m
//  StoryboardSupport
//
//  Created by Maximilian Tagher on 5/4/13.
//  Copyright (c) 2013 Tagher. All rights reserved.
//

#import "UIViewController+Toggle.h"
#import <objc/runtime.h>
#import "UIStoryboard+MainStoryboard.h"

@implementation UIViewController (Toggle)

- (void)setToggleViewControllerID:(NSString *)toggleViewControllerID
{
    UIStoryboard *storyboard = [UIStoryboard probableStoryboardForViewController:self];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:toggleViewControllerID];
    [self setToggleViewController:controller];
}

- (void)setToggleViewController:(UIViewController *)toggleViewController
{
    objc_setAssociatedObject(self, @selector(toggleViewController), toggleViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIViewController *)toggleViewController
{
    return objc_getAssociatedObject(self, @selector(toggleViewController));
}

- (IBAction)toggleViewControllers:(id)sender;
{
//    if (!self.toggleViewController) {
//        NSLog(@"WARNING: There wasn't a view controller to toggle to. \nFrom code, you can set the view controller to toggle to by calling setToggleViewController: or by calling setToggleViewControllerID:. \nAlternatively, from the Storyboard, go to the Identity Inspector of the contained view controller and setup the User Defined Runtime Attributes as follows: \nKey Path = toggleViewControllerID \nType = String \nValue = Storyboard ID of the controller to toggle to");
//        return;
//    }
    
    if (self.toggleViewController && self.parentViewController) {
        
        UIViewController *parent = self.parentViewController;
        
        UIViewController *toggle = self.toggleViewController;
        toggle.view.frame = self.view.frame;
        
        toggle.toggleViewController = self;
        self.toggleViewController = nil;
        
        [parent addChildViewController:toggle];
        [self willMoveToParentViewController:nil];
        
        [parent transitionFromViewController:self
                            toViewController:toggle
                                    duration:0
                                     options:UIViewAnimationOptionTransitionNone
                                  animations:nil
                                  completion:^(BOOL finished){
                                      [self didMoveToParentViewController:nil];
                                  }];
        
        
    } else {
        // toggle child
        BOOL validChild = NO;
        for (UIViewController *child in self.childViewControllers) {
            if (child.toggleViewController) {
                validChild = YES;
                [child toggleViewControllers:nil];
            }
        }
        if (!validChild) {
            NSLog(@"WARNING: There wasn't a view controller to toggle to. \nFrom code, you can set the view controller to toggle to by calling setToggleViewController: or by calling setToggleViewControllerID:. \nAlternatively, from the Storyboard, go to the Identity Inspector of the contained view controller and setup the User Defined Runtime Attributes as follows: \nKey Path = toggleViewControllerID \nType = String \nValue = Storyboard ID of the controller to toggle to");
        }
    }
}

@end
