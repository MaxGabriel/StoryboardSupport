//
//  UITextField+TCCustomFont.h
//  StoryboardSupport
//
//  Created by Maximilian Tagher on 4/25/13.
//
//

#import <UIKit/UIKit.h>
/** Adds support for setting a custom font from a Storyboard. In the Storyboard, choose the `UITextField`, go to its Identity Inspector, and setup the User Defined Runtime Attributes as follows:
 Key Path = fontName
 Type = String
 Value = PostScript name of the Font
 
 For directions on adding a custom font, see:
 */
@interface UITextField (TCCustomFont)

/** PostScript name of the font. */
@property (nonatomic, copy) NSString* fontName;

@end
