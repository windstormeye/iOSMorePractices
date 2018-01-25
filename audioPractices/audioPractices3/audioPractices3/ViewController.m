//
//  ViewController.m
//  audioPractices3
//
//  Created by pjpjpj on 2018/1/21.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <AVAudioPlayerDelegate> {
    AVAudioPlayer *audioPlayer;
    NSTimer *timer;
}
- (IBAction)playerBtnClick:(id)sender;
- (IBAction)pauseBtnClick:(id)sender;
- (IBAction)stopBtnClick:(id)sender;
- (IBAction)muteSwitchClick:(id)sender;
- (IBAction)volSliderClick:(id)sender;
- (IBAction)timeSliderClick:(id)sender;
- (IBAction)cycBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIProgressView *musicProgress;
@property (weak, nonatomic) IBOutlet UITextView *audioInfo;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UIStepper *cyc;
@property (weak, nonatomic) IBOutlet UISlider *volSlider;
@property (weak, nonatomic) IBOutlet UISlider *timeSlider;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)playerBtnClick:(id)sender {
    NSString *playMusicPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp3"];
    if (playMusicPath) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        NSURL *musicURL = [NSURL fileURLWithPath:playMusicPath];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
        audioPlayer.delegate = self;
        audioPlayer.meteringEnabled = true;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(monitor) userInfo:nil repeats:true];
        [audioPlayer play];
    }
}

- (IBAction)pauseBtnClick:(id)sender {
    // 再次点击暂停才会播放
    if ([audioPlayer isPlaying]) {
        [audioPlayer pause];
    } else {
        [audioPlayer play];
    }
}

- (IBAction)stopBtnClick:(id)sender {
    self.volSlider.value = 0;
    self.timeSlider.value = 0;
    [audioPlayer stop];
}

- (IBAction)muteSwitchClick:(id)sender {
    // 实际上音量为0即静音
    // 刚好这还是个Switch开关
    audioPlayer.volume = [sender isOn];
}

- (IBAction)volSliderClick:(id)sender {
    audioPlayer.volume = self.volSlider.value;
}

- (IBAction)timeSliderClick:(id)sender {
    [audioPlayer pause];
    // 防止归一化（都是0~1，转化为实际值）
    [audioPlayer setCurrentTime:(NSTimeInterval)self.timeSlider.value * audioPlayer.duration];
    [audioPlayer play];
}

- (IBAction)cycBtnClick:(id)sender {
    audioPlayer.numberOfLoops = self.cyc.value;
}

- (void)monitor {
    // numberOfChannels声道数，一般都是2吧，代表左右双声道
    NSUInteger channels = audioPlayer.numberOfChannels;
    NSTimeInterval duration = audioPlayer.duration;
    [audioPlayer updateMeters];
    NSString *peakValue = [NSString stringWithFormat:@"%f, %f\n channels=%lu duration=%lu\n currentTime=%f", [audioPlayer peakPowerForChannel:0], [audioPlayer peakPowerForChannel:1], (unsigned long)channels, (unsigned long)duration, audioPlayer.currentTime];
    self.audioInfo.text = peakValue;
    self.musicProgress.progress = audioPlayer.currentTime / audioPlayer.duration;
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"finish");
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error {
    
}

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player {
    
}

@end
