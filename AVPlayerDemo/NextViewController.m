//
//  NextViewController.m
//  AVPlayerDemo
//
//  Created by David on 13-5-3.
//  Copyright (c) 2013年 PK. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

-(void)viewWillAppear:(BOOL)animated
{
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       self.title = @"Next ViewController";
    }
    return self;
}

- (void)viewDidLoad
{
     [self.navigationController setNavigationBarHidden:NO];
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
