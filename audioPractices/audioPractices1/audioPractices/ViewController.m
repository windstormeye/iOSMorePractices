//
//  ViewController.m
//  audioPractices
//
//  Created by pjpjpj on 2018/1/20.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

#import <MediaPlayer/MediaPlayer.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()
- (IBAction)soundBtnClick1:(id)sender;
- (IBAction)soundBtnClick2:(id)sender;
- (IBAction)soundBtnClick3:(id)sender;

@end

void soundFinishPlaying(SystemSoundID soundID, void* userData) {
    AudioServicesRemoveSystemSoundCompletion(soundID);
    AudioServicesDisposeSystemSoundID(soundID);
}

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp3"];
    NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
    // 打开音频
    AudioFileID audioFile;
    AudioFileOpenURL((__bridge CFURLRef)audioURL, kAudioFileReadPermission, 0, &audioFile);
    // 读取
    UInt32 dictionarySize = 0;
    AudioFileGetPropertyInfo(audioFile, kAudioFilePropertyInfoDictionary, &dictionarySize, 0);
    CFDictionaryRef dictionary;
    AudioFileGetProperty(audioFile, kAudioFilePropertyInfoDictionary, &dictionarySize, &dictionary);
    NSDictionary *audioDic = (__bridge NSDictionary *)dictionary;
    for (int i = 0; i < [audioDic allKeys].count; i++) {
        NSString *key = [[audioDic allKeys] objectAtIndex:i];
        NSString *value = [audioDic valueForKey:key];
        NSLog(@"%@-%@", key, value);
    }
    CFRelease(dictionary);
    AudioFileClose(audioFile);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)soundBtnClick1:(id)sender {
    NSString *deviceType = [[UIDevice currentDevice] model];
    if ([deviceType isEqualToString:@"iPhone"]) {
        // 调用正常的震动模块，静音后无效
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    } else {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"注意" message:@"您的设备不支持震动" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertVC animated:true completion:^{
            
        }];
    }
}

- (IBAction)soundBtnClick2:(id)sender {
    
    NSURL *systemSoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp3"]];
    // 创建ID
    SystemSoundID systemSoundID;
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(systemSoundURL), &systemSoundID);
    // 注册callBack
    AudioServicesAddSystemSoundCompletion(systemSoundID, nil, nil, soundFinishPlaying, nil);
    // 播放系统声音
    AudioServicesPlaySystemSound(systemSoundID);
}

- (IBAction)soundBtnClick3:(id)sender {
    NSURL *systemSoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp3"]];
    // 创建ID
    SystemSoundID systemSoundID;
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(systemSoundURL), &systemSoundID);
    // 注册callBack
    AudioServicesAddSystemSoundCompletion(systemSoundID, nil, nil, soundFinishPlaying, nil);
    // 播放系统声音
    AudioServicesPlayAlertSound(systemSoundID);
}
@end
