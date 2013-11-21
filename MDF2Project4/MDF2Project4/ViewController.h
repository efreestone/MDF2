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

//Declare movie arrays
@property (strong, nonatomic) NSMutableArray *moviesArray1;
@property (strong, nonatomic) NSMutableArray *moviesArray2;
@property (strong, nonatomic) NSMutableArray *moviesArray3;

//Declare theater array
@property (strong, nonatomic) NSMutableArray *theaterArray;

@end
