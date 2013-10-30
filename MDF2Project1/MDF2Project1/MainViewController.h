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

@interface MainViewController : UITableViewController <UITableViewDelegate>

//Declare refresh, add, and profile buttons
@property (strong, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *profileButton;

@property (strong, nonatomic) NSArray *testArray;

//Declare methods for refresh and add buttons
-(IBAction)onRefreshClick:(id)sender;
-(IBAction)onAddClick:(id)sender;
@end
