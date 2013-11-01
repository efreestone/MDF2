// Elijah Freestone
// MDF2 1311
// Project 1
// October 28th, 2013

//
//  MainViewController.h
//  MDF2Project1
//
//  Created by Elijah Freestone on 10/29/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    float currentProgress;
}

//Declare refresh, add, and profile buttons
@property (strong, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *profileButton;

//@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityWheel;
//Declare loading alert view. Displays on initial load and refresh
@property (strong, nonatomic) UIAlertView *loadingAlert;

//Declare table view
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
//Declare twitter timeline array
@property (strong, nonatomic) NSArray *twitterFeedArray;
//Declare dictionary of user object from twitterFeedArray
@property (strong, nonatomic) NSDictionary *userDictionary;
//Declare UIImage to hold profile image
@property (strong, nonatomic) UIImage *profileImage;
//Declare second UIImage to fix display issue on detail view.
@property (strong, nonatomic) UIImage *profileImageLarge;

//Declare methods for refresh and add buttons
-(IBAction)onRefreshClick:(id)sender;
//Method used to dismiss loading alert view. Called in cellForRowAtIndexPath
-(void)dismissLoadingAlert;
-(IBAction)onAddClick:(id)sender;

//Declare progress bar method
//-(void)animateProgressBar:(id)sender;

//Declare method to get twitter timeline (feed)
-(void)getTwitterTimeline;

@end
