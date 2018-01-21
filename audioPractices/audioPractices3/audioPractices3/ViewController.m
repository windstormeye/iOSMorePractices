//
//  ViewController.m
//  audioPractices3
//
//  Created by pjpjpj on 2018/1/21.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    AVAudioPlayer *audioPlayer;
    NSTimer *timer;
}
- (IBAction)playerBtnClick:(id)sender;
- (IBAction)pauseBtnClick:(id)sender;
- (IBAction)stopBtnClick:(id)sender;
- (IBAction)muteSwitchClick:(id)sender;
- (IBAction)volSliderClick:(id)sender;
- (IBAction)timeSliderClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIProgressView *musicProgress;
@property (weak, nonatomic) IBOutlet UITextView *audioInfo;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UIStepper *cyc;


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
}

- (IBAction)pauseBtnClick:(id)sender {
}

- (IBAction)stopBtnClick:(id)sender {
}

- (IBAction)muteSwitchClick:(id)sender {
}

- (IBAction)volSliderClick:(id)sender {
}

- (IBAction)timeSliderClick:(id)sender {
}
@end
