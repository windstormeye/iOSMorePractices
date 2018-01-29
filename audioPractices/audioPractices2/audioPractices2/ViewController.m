//
//  ViewController.m
//  audioPractices2
//
//  Created by pjpjpj on 2018/1/21.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController () <MPMediaPickerControllerDelegate>

@end

@implementation ViewController {
    MPMediaPickerController* musicVC;
    MPMusicPlayerController* musicPlayVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 取资源
    musicVC = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    musicVC.delegate = self;
    musicVC.prompt = @"选择一首歌曲";
    [self.navigationController pushViewController:musicVC animated:true];
}

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
    
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
    [mediaPicker dismissViewControllerAnimated:true completion:^{
        
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
