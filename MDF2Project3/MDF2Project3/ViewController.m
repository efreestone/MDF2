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
//Import photos view controller
#import "PhotosViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    //Declare photos view controller locally
    PhotosViewController *photosViewController;
    //BOOL used for shouldPerformSegueWithIdentifier
    BOOL shouldPushSegueOccur;
}

//Synthesize for getters/setters
@synthesize cameraButton, albumButton, videoButton, selectedImage, editedImage;

- (void)viewDidLoad
{
    //Initialize/allocate photos view controller
    
    photosViewController = [[PhotosViewController alloc] init];
    //Set default of BOOL used for shouldPerformSegueWithIdentifier
    shouldPushSegueOccur = YES;
    
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
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                //Set source type to camera
                pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                //Set delegate
                pickerController.delegate = self;
                //Set editing
                pickerController.allowsEditing = false;
                //Present picker controller
                [self presentViewController:pickerController animated:true completion:nil];
                NSLog(@"Camera button clicked");
            } else {
                //Set BOOL to NO to stop segue to photos view
                shouldPushSegueOccur = NO;
                //[self noCameraAlertView];
                NSLog(@"Camera not available");
            }
        //Album button
        } else if (buttonClicked.tag == 1) {
            //Set source type to saved photos album. "Camera Roll" in the case of my iPad
            pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            //Set delegate
            pickerController.delegate = self;
            //Set editing
            pickerController.allowsEditing = true;
            //Present picker controller
            [self presentViewController:pickerController animated:true completion:nil];
            NSLog(@"Album button clicked");
        //Video button
        } else if (buttonClicked.tag == 2) {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                NSLog(@"Video button clicked");
            } else {
                //Set BOOL to NO to stop segue to photos view
                shouldPushSegueOccur = NO;
                NSLog(@"Camera not available");
            }
        }
    }
}

#pragma mark - picker delegate

//Built in method to capture media selection
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //Cast selected image into a UIImage
    selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //photosViewController = [[PhotosViewController alloc] init];
    if (selectedImage != nil) {
        //Pass image to UIImage in photos view
        photosViewController.passedSelectedImage = selectedImage;
    }
    //Cast edited image into a UIImage
    editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (editedImage != nil) {
        //Pass image to UIImage in photos view
        photosViewController.passedEditedImage = editedImage;
    }
    //Dismiss picker view
    [picker dismissViewControllerAnimated:true completion:nil];
}

//Built in method to capture cancel button selection in picker
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //Dismiss picker view
    [picker dismissViewControllerAnimated:true completion:nil];
    //Override push to photos view. Because I am using storyboards, data pass to photos view doesn't work without prepareForSegue and the push is initiated with the albums button. Segue already occured so shouldPerformSegue won't work here.
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - alert 

-(void)noCameraAlertView {
    //Create alert
    UIAlertView *noCameraAlert = [[UIAlertView alloc] initWithTitle:@"No Camera!" message:@"We're sorry, but your device does not have a camera available to take pictures or movies." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //Show alert
    [noCameraAlert show];
}

#pragma mark - segue

//Built in method to cancel/allow a segue to occur
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    //Check if segue is from camera or video
    if ([identifier isEqualToString:@"CameraView"] || [identifier isEqualToString:@"VideoView"]) {
        //shouldPushOccur is BOOL set to NO if camera is not available
        if (shouldPushSegueOccur == NO) {
            //Show no camera alert
            [self noCameraAlertView];
            //Cancel segue to photos view
            return NO;
        }
    }
    //Allow segue if camera is available
    return YES;
}

//Built in method to pass data with segue to another view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Verify identifier of push segue to photos view from album
    if ([segue.identifier isEqualToString:@"PhotoView"]) {
        //Grab destination view controller
        photosViewController = segue.destinationViewController;
        
        if (photosViewController != nil) {
            //These are set in didFinishPickingMediaWithInfo
            //photosViewController.passedSelectedImage = selectedImage;
            //photosViewController.passedEditedImage = editedImage;
        }
    }
    //Verify identifier of push segue to photos view from camera
    if ([segue.identifier isEqualToString:@"CameraView"]) {
        //Grab destination view controller
        photosViewController = segue.destinationViewController;
        
        if (photosViewController != nil) {
            //These are set in didFinishPickingMediaWithInfo
            //photosViewController.passedSelectedImage = selectedImage;
        }
    }
}

@end
