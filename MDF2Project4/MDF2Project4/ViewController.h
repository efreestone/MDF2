// Elijah Freestone
// MDF2 1311
// Project 4
// November 19th, 2013

//
//  ViewController.h
//  MDF2Project4
//
//  Created by Elijah Freestone on 11/19/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

//Declare table view
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

//Declare header elements
@property (strong, nonatomic) UILabel *theaterNameLabel;
@property (strong, nonatomic) UILabel *theaterInfoLabel;
@property (strong, nonatomic) UIImageView *theaterImageView;

@end
