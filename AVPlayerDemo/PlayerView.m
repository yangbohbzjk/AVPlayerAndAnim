//
//  PlayerView.m
//  AVPlayerDemo
//
//  Created by qianfeng on 13-4-1.
//  Copyright (c) 2013年 PK. All rights reserved.
//

#import "PlayerView.h"

//UIView - layer ->CALayer
//AVPlayerLayer H.264
@implementation PlayerView

//
+ (Class)layerClass{
    return [AVPlayerLayer class];
}

- (void)setPlayer:(AVPlayer *)player{
    AVPlayerLayer* playerLayer = (AVPlayerLayer*)self.layer;
    [playerLayer setPlayer:player];
}


@end
