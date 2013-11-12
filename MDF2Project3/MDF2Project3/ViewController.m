// Elijah Freestone
// MDF2 1311
// Project 3
// November 9th, 2013

//
//  ViewController.m
//  MDF2Project3
//
//  Created by Elijah Freestone on 11/9/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//onClick method fired by all three buttons on toolbar
-(IBAction)onClick:(id)sender {
    //UIBarButtonItem *buttonClicked = (UIBarButtonItem *)sender;
    UIButton *buttonClicked = (UIButton *)sender;
    if (buttonClicked.tag == 0) {
        NSLog(@"Camera button clicked");
    } else if (buttonClicked.tag == 1) {
        NSLog(@"Album button clicked");
    } else if (buttonClicked.tag == 2) {
        NSLog(@"Video button clicked");
    }
}

@end
