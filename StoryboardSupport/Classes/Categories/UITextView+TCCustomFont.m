//
//  UITextView+TCCustomFont.m
//  StoryboardSupport
//
//  Created by Maximilian Tagher on 5/5/13.
//  Copyright (c) 2013 Tagher. All rights reserved.
//

#import "UITextView+TCCustomFont.h"

@implementation UITextView (TCCustomFont)

- (NSString *)fontName {
    return self.font.fontName;
}

- (void)setFontName:(NSString *)fontName {
    self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
}

@end
