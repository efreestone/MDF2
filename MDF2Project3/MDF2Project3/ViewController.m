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
    //Cast button sender into UIButton
    UIButton *buttonClicked = (UIButton *)sender;
    //Create instance of image picker
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    if (pickerController != nil) {
        //Camera button
        if (buttonClicked.tag == 0) {
            NSLog(@"Camera button clicked");
        //Album button
        } else if (buttonClicked.tag == 1) {
            //Set source type to photo library
            pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            //Set delegate
            pickerController.delegate = self;
            
            //Set editing
            pickerController.allowsEditing = false;
            
            //Present picker controller
            [self presentViewController:pickerController animated:true completion:nil];
            NSLog(@"Album button clicked");
        //Video button
        } else if (buttonClicked.tag == 2) {
            NSLog(@"Video button clicked");
        }
    }
}

@end
