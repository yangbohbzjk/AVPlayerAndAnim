//
//  ViewController.m
//  page
//
//  Created by David on 13-5-3.
//  Copyright (c) 2013年 David. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView = _imageView;
@synthesize pageControl = _pageControl;
@synthesize pageScroll = _pageScroll;
@synthesize gotoMainViewBtn = _gotoMainViewBtn;

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pageControl.numberOfPages = 5;
    self.pageControl.currentPage = 0;
    self.pageScroll.delegate = self;
    [self.pageScroll setShowsHorizontalScrollIndicator:NO];
    self.pageScroll.contentSize = CGSizeMake(self.view.frame.size.width * 5, self.view.frame.size.height);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)gotoMainView:(id)sender {
    
    NextViewController *nextView = [[NextViewController alloc]init];
    [self.navigationController pushViewController:nextView animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.view.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}
@end
