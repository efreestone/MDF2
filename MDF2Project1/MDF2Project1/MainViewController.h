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

@interface MainViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

//Declare refresh, add, and profile buttons
@property (strong, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *profileButton;

@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;

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

//Declare methods for refresh, add, and profile buttons
-(IBAction)onRefreshClick:(id)sender;
-(IBAction)onAddClick:(id)sender;
-(IBAction)onProfileClick:(id)sender;
//Declare progress bar method
-(IBAction)animateProgressBar:(id)sender;

//Declare method to get twitter timeline (feed)
-(void)getTwitterTimeline;

@end
