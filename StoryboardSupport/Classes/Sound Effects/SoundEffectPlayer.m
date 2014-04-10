//
//  SoundEffectPlayer.m
//  StoryboardSupport
//
//  Created by Maximilian Tagher on 2/6/13.
//  Copyright (c) 2013 Smart Balloon, Inc. All rights reserved.
//

#import "SoundEffectPlayer.h"
#import <AudioToolbox/AudioToolbox.h>

@interface SoundEffectPlayer()

@property (nonatomic, strong) NSMutableDictionary *systemSoundIds;
@property (nonatomic, getter = isPlayingSound) BOOL playingSound;

@end

@implementation SoundEffectPlayer

+ (instancetype)sharedPlayer
{
    static SoundEffectPlayer *sharedPlayer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPlayer = [[SoundEffectPlayer alloc] init];
    });
    return sharedPlayer;
}

// Even if 
- (NSMutableDictionary *)systemSoundIds
{
    if (!_systemSoundIds) {
        _systemSoundIds = [@{} mutableCopy];
    }
    return _systemSoundIds;
}

//#warning Double check memory management here! Also, is there a better way than relying on the underlying storage type of SystemSoundID remaning unsigned long? Also reference static analytic on what happens if system sound ID is not made non-nil in the if statement.

- (void)playSoundNamed:(NSString *)fileName fileExtension:(NSString *)extension
{
    NSString *key = [fileName stringByAppendingString:extension];
    SystemSoundID audioEffect;
    
    NSNumber *systemSoundID = [self.systemSoundIds objectForKey:key];
    if (!systemSoundID) {
        NSString *path  = [[NSBundle mainBundle] pathForResource:fileName ofType:extension];
        if ([[NSFileManager defaultManager] fileExistsAtPath : path]) {
            NSURL *pathURL = [NSURL fileURLWithPath: path];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef) pathURL, &audioEffect);
            
            AudioServicesAddSystemSoundCompletion(audioEffect, NULL, NULL, completionCallback, (__bridge_retained void *)self);
            
            [self.systemSoundIds setObject:@(audioEffect) forKey:key];
        } else {
            NSAssert(NO, @"There wasn't a sound file");
        }
    } else {
        audioEffect = [systemSoundID unsignedIntValue];
    }
    
    if (!self.isPlayingSound) {
        self.playingSound = YES;
        AudioServicesPlaySystemSound(audioEffect);
    }
}

static void completionCallback (SystemSoundID  mySSID, void *myself)
{
    SoundEffectPlayer *thisInstance = (__bridge SoundEffectPlayer *)myself;
    thisInstance.playingSound = NO;
}



@end
