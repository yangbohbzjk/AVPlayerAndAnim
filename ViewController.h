//
//  ViewController.h
//  page
//
//  Created by David on 13-5-3.
//  Copyright (c) 2013年 David. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+SplitImageIntoTwoParts.h"
#import "NextViewController.h"

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic,strong) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) UIImageView *left;
@property (nonatomic,strong) UIImageView *right;

@property (retain, nonatomic) IBOutlet UIScrollView *pageScroll;
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)gotoMainView:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *gotoMainViewBtn;

@end
