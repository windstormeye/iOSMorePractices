//
//  ViewController.m
//  audioPractices4
//
//  Created by pjpjpj on 2018/1/28.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <AVSpeechSynthesizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 语音识别控制器
    AVSpeechSynthesizer* speechManager = [[AVSpeechSynthesizer alloc] init];
    speechManager.delegate = self;
    // 语音识别单元
    AVSpeechUtterance* uts = [[AVSpeechUtterance alloc] initWithString:@"23333"];
    uts.rate = 0.5;
    [speechManager speakUtterance:uts];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"开始语音识别");
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"结束语音识别");
}



@end
