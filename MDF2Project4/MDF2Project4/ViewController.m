// Elijah Freestone
// MDF2 1311
// Project 4
// November 19th, 2013

//
//  ViewController.m
//  MDF2Project4
//
//  Created by Elijah Freestone on 11/19/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "ViewController.h"
//Import custom table view cell
#import "CustomTableViewCell.h"
//Import theater inf
#import "TheaterInfo.h"
//Import movie info
#import "MovieInfo.h"

@interface ViewController ()

@end

@implementation ViewController

//Synthesize for getters/setters
@synthesize myTableView, theaterNameLabel, theaterInfoLabel, theaterImageView;

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

#pragma mark - Table view data source

//Built in method to set number of sections in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

//Built in method to apply custom view for header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //Create header label
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, myTableView.frame.size.width, 30.0f)];
    if (headerLabel != nil) {
        //Set text color
        headerLabel.textColor = [UIColor whiteColor];
        //Set background color
        headerLabel.backgroundColor = [UIColor blackColor];
        //Set text based on section number
        if (section == 0) {
            headerLabel.text = @"Section 1";
        } else if (section == 1) {
            headerLabel.text = @"Section 2";
        } else if (section == 2) {
            headerLabel.text = @"Section 3";
        }
    }
    return headerLabel;
}

//Built in method to set number of rows in table view section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    } else if (section == 1) {
        return 5;
    }else if (section == 2) {
        return 5;
    }
    return 0;
}

//Built in method to allocate and reuse table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Allocate and reuse cells
    CustomTableViewCell *cell = (CustomTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    if (cell != nil) {
        //Apply text to cell labels
        cell.movieTitleLabel.text = [NSString stringWithFormat:@"Row %ld", (long)indexPath.row];
        cell.playTimesLabel.text = @"Test";
        
    }
    
    return cell;
}



@end
