//
//  AppDelegate.h
//  AVPlayerDemo
//
//  Created by qianfeng on 13-4-1.
//  Copyright (c) 2013年 PK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMedia/CoreMedia.h>
#import <AVFoundation/AVFoundation.h>
#import "PlayerView.h"
#import "ViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIScrollViewDelegate>
{
    PlayerView* playerView;
    AVPlayer * player;
    UISlider* proSlider;
    
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic, strong)UIButton *button;

@end
