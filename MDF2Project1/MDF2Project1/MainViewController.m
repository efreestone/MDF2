// Elijah Freestone
// MDF2 1311
// Project 1
// October 28th, 2013

//
//  MainViewController.m
//  MDF2Project1
//
//  Created by Elijah Freestone on 10/29/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "MainViewController.h"
//Import twitter cell
#import "TwitterCell.h"
//Import details view controller
#import "DetailsViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

//Synthesize for getters/setters
@synthesize refreshButton, addButton;

@synthesize testArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    testArray = [[NSArray alloc] initWithObjects: @{@"Tweet":@"Test 1", @"Time":@"7:55pm Oct 29th, 2103"}, @{@"Tweet":@"Test 2", @"Time":@"7:57pm Oct 29th, 2103"}, @{@"Tweet":@"Test 3", @"Time":@"8:10pm Oct 29th, 2103"}, nil];
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [testArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Allocate and reuse cells
    TwitterCell *cell = (TwitterCell *)[tableView dequeueReusableCellWithIdentifier:@"TwitterCell"];
    //Apply text to tweet text label
    cell.tweetTextLabel.text = (NSString *) [[testArray objectAtIndex:indexPath.row] objectForKey:@"Tweet"];
    //Apply text to tweet time label
    cell.tweetTimeLabel.text = (NSString *) [[testArray objectAtIndex:indexPath.row] objectForKey:@"Time"];
    //Apply icon image
    //cell.iconImage.image = ;
    
    return cell;
}

//Built in function to pass data with segue to display in DetailsViewContoller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Verify identifier of push segue to Details view
    if ([segue.identifier isEqualToString:@"DetailView"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //Grab destination view controller
        DetailsViewController *detailsViewController = segue.destinationViewController;
        //Send tweet text to NSString in DetailViewController for display
        detailsViewController.tweetTextString = [[testArray objectAtIndex:indexPath.row] objectForKey:@"Tweet"];
        //Send tweet time/date to NSString in DetailViewController for display
        detailsViewController.tweetTimeString = [[testArray objectAtIndex:indexPath.row] objectForKey:@"Time"];
    }
}

//Method for refresh button click
-(IBAction)onRefreshClick:(id)sender {
    
}

//Method for add button click
-(IBAction)onAddClick:(id)sender {
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
