//
//  SoundEffectPlayer.h
//  StoryboardSupport
//
//  Created by Maximilian Tagher on 2/6/13.
//  Copyright (c) 2013 Smart Balloon, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/** `SoundEffectPlayer` provides an interface for easily playing sound effects. If it is currently playing a sound, it will ignore requests to play another sound to prevent overlap. 
    
 Example Use:
 
 [[SoundEffectPlayer sharedPlayer] playSoundNamed:@"coolTune" fileExtension:@"aif"];
 */
@interface SoundEffectPlayer : NSObject

/** The shared instance. The singleton implementation allows for the caching and one-sound-at-a-time behavior. */
+ (instancetype)sharedPlayer;

/** Plays the sound with the designated `fileName` and `extension`. The sound files must be under 30 seconds and are subject to other (minor) restrictions listed in Apple's docs.
 @param fileName The file name, e.g. `sound-delete`
 @param extension The file extension, e.g. `aif`. Valid file extensions are aif, caf, and wav
 */
- (void)playSoundNamed:(NSString *)fileName fileExtension:(NSString *)extension;


@end
