//
//  AppDelegate.m
//  AVPlayerDemo
//
//  Created by qianfeng on 13-4-1.
//  Copyright (c) 2013年 PK. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate
@synthesize button = _button;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    
    //视频添加
    playerView = [[PlayerView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self.window addSubview:playerView];
    [player addPeriodicTimeObserverForInterval:CMTimeMake(1, 30) queue:nil usingBlock:^(CMTime  finish){
        NSLog(@"sdkf");
    }];
    //视频播放
    [self start];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:player];
    
    //关闭视频按钮
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setImage:[UIImage imageNamed:@"closebreakingnews"] forState:UIControlStateNormal];
    [self.button setFrame:CGRectMake(200 ,130, 50, 50)];
    [self.button setTag:100];
    [self.button addTarget:self action:@selector(Button:) forControlEvents:UIControlEventTouchUpInside];
   // [self.button setTitle:@"进入" forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor clearColor]];
    [self.window addSubview:self.button];
   
    // Override point for customization after application launch.
        [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
    sleep(30);
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
 
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//播放
- (void)start{
    if (player) {
        [player play];
        return;
    }
    
    //本地
    NSString* str = [[NSBundle mainBundle] pathForResource:@"bsm" ofType:@"mp4"];
    NSURL* url = [NSURL fileURLWithPath:str];
    //
    //    NSString* str = @"http://pk.local/web/bsm.mp4";
    //    NSURL* url = [NSURL URLWithString:str];
    //
    //媒体资源
    AVURLAsset* asset = [AVURLAsset assetWithURL:url];
    
    //准备播放
    [asset loadValuesAsynchronouslyForKeys:[NSArray arrayWithObject:@"tracks"] completionHandler:^{
        //得到状态
        AVKeyValueStatus status = [asset statusOfValueForKey:@"tracks" error:nil];
        //判断状态
        if (status == AVKeyValueStatusLoaded) {
            AVPlayerItem* item = [AVPlayerItem playerItemWithAsset:asset];
            player = [AVPlayer playerWithPlayerItem:item];
            //对播放屏幕设置一个播放器
            [playerView setPlayer:player];
            [player play];
        }
    }];
}

- (void)Button:(UIButton *)sender
{
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    UINavigationController *Nav = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    
    self.window.rootViewController = Nav;
   
   // [self.window addSubview:Nav.view];
    [self.button setHidden:YES];
    
}


- (void)playItemDidReachEnd:(AVPlayerItem *)sender
{
    [self Button:self.button];
}


@end
