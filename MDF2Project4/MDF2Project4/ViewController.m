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

@interface ViewController ()

@end

@implementation ViewController

//Synthesize for getters/setters
@synthesize myTableView;

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

//Built in method to set header titles
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Section 1";
    } else if (section == 1) {
        return @"Section 2";
    }else if (section == 2) {
        return @"Section 3";
    }
    return @"hello";
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
