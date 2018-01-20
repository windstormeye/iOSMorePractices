//
//  ViewController.m
//  audioPractices
//
//  Created by pjpjpj on 2018/1/20.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@end

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
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
