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
//Import detail view
#import "DetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Synthesize for getters/setters
@synthesize myTableView, theaterNameLabel, theaterInfoLabel, theaterImageView, moviesArray1, moviesArray2, moviesArray3, theaterArray;

- (void)viewDidLoad
{
    //Create movie theater array
    theaterArray = [NSMutableArray arrayWithCapacity:3];
    //Theater 1
    //Allocate theater info object
    TheaterInfo *theaterInfo = [[TheaterInfo alloc] init];
    theaterInfo.theaterName = @"Metrolux 14 Theatres";
    theaterInfo.theaterInfo = @"Loveland, CO";
    theaterInfo.theaterImage = [UIImage imageNamed:@"metrolux.jpg"];
    [theaterArray addObject:theaterInfo];
    //Theater 2 with new theater info object
    theaterInfo = [[TheaterInfo alloc] init];
    theaterInfo.theaterName = @"Cinemark 16";
    theaterInfo.theaterInfo = @"Fort Collins, CO";
    theaterInfo.theaterImage = [UIImage imageNamed:@"cinemark.jpg"];
    [theaterArray addObject:theaterInfo];
    //Theater 3 with new theater info object
    theaterInfo = [[TheaterInfo alloc] init];
    theaterInfo.theaterName = @"UA Twin Peaks 10";
    theaterInfo.theaterInfo = @"Longmont, CO";
    theaterInfo.theaterImage = [UIImage imageNamed:@"twin_peaks.jpg"];
    [theaterArray addObject:theaterInfo];
    
    
    //Create first movie array using MovieInfo object
    moviesArray1 = [NSMutableArray arrayWithCapacity:5];
    //Movie 1
    //Allocate movie info object
    MovieInfo *movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"Best Man Down";
    movieInfo.playTimeString = @"6:30pm, 9:18pm, 10:00pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"best_man_down.jpg"];
    [moviesArray1 addObject:movieInfo];
    //Movie 2 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"RoboCop";
    movieInfo.playTimeString = @"8:10pm, 9:30pm, 11:06pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"robocop.jpg"];
    [moviesArray1 addObject:movieInfo];
    //Movie 3 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"Need for Speed";
    movieInfo.playTimeString = @"8:00pm, 9:21pm, 11:00pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"need_for_speed.jpg"];
    [moviesArray1 addObject:movieInfo];
    //Movie 4 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"Maleficent";
    movieInfo.playTimeString = @"11:30am, 3:00pm, 5:30pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"maleficent.jpg"];
    [moviesArray1 addObject:movieInfo];
    //Movie 5 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"Narco Cultura";
    movieInfo.playTimeString = @"8:50pm, 9:51pm, 11:15pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"narco_cultura.jpg"];
    [moviesArray1 addObject:movieInfo];
    
    //Create second movie array using MovieInfo object
    moviesArray2 = [NSMutableArray arrayWithCapacity:5];
    //Movie 1 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"The Past";
    movieInfo.playTimeString = @"7:30pm, 9:08pm, 10:20pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"the_past.jpg"];
    [moviesArray2 addObject:movieInfo];
    //Movie 2 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"The Invisible Woman";
    movieInfo.playTimeString = @"5:00pm, 6:15pm, 8:52pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"the_invisible_woman.jpg"];
    [moviesArray2 addObject:movieInfo];
    //Movie 3 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"Divergent";
    movieInfo.playTimeString = @"9:15pm, 9:35pm, 10:50pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"divergent.jpg"];
    [moviesArray2 addObject:movieInfo];
    //Movie 4 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"Sunlight Jr.";
    movieInfo.playTimeString = @"1:30pm, 3:18pm, 5:35pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"sunlight_jr.jpg"];
    [moviesArray2 addObject:movieInfo];
    //Movie 5 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"The Hunger Games: Catching Fire";
    movieInfo.playTimeString = @"8:40pm, 9:55pm, 11:18pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"the_hunger_games_catching_fire.jpg"];
    [moviesArray2 addObject:movieInfo];
    
    //Create third movie array using MovieInfo object
    moviesArray3 = [NSMutableArray arrayWithCapacity:5];
    //Movie 1 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"A Journey To Planet Sanity";
    movieInfo.playTimeString = @"8:32pm, 9:20pm, 10:10pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"a_journey_to_planet_sanity.jpg"];
    [moviesArray3 addObject:movieInfo];
    //Movie 2 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"Geography Club";
    movieInfo.playTimeString = @"5:09pm, 6:17pm, 8:36pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"geography_club.jpg"];
    [moviesArray3 addObject:movieInfo];
    //Movie 3 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"These Birds Walk";
    movieInfo.playTimeString = @"9:05pm, 9:45pm, 11:10pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"these_birds_walk.jpg"];
    [moviesArray3 addObject:movieInfo];
    //Movie 4 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"Noah";
    movieInfo.playTimeString = @"1:45pm, 4:15pm, 7:07pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"noah.jpg"];
    [moviesArray3 addObject:movieInfo];
    //Movie 5 with new movie info alloc
    movieInfo = [[MovieInfo alloc] init];
    movieInfo.movieTitleString = @"The Book Thief";
    movieInfo.playTimeString = @"8:31pm, 9:17pm, 10:15pm";
    movieInfo.moviePosterImage = [UIImage imageNamed:@"the_book_thief.jpg"];
    [moviesArray3 addObject:movieInfo];
    
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
    return [theaterArray count];
}

//Built in method to apply custom view for header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //Create header label view. The size and possition of view are set by the elements contained and heightForHeaderInSection below
    UIView *headerView = [[UIView alloc] init];
    //Allocate labels and image view
    theaterNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70.0f, 5.0f, myTableView.frame.size.width, 20.0f)];
    theaterInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(70.0f, 25.0f, myTableView.frame.size.width, 20.0f)];
    theaterImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 5.0f, 55.0f, 40.0f)];
    if (headerView != nil) {
        //Set text color
        theaterNameLabel.textColor = [UIColor whiteColor];
        theaterInfoLabel.textColor = [UIColor whiteColor];
        //Set background color
        headerView.backgroundColor = [UIColor blackColor];
        //Add labels and image view to header view
        [headerView addSubview:theaterNameLabel];
        [headerView addSubview:theaterInfoLabel];
        [headerView addSubview:theaterImageView];
        //Set text/image based on section number
        if (section == 0) {
            //Grab instance of theater info object for section
            TheaterInfo *theaterInfo = [theaterArray objectAtIndex:section];
            //Set text and image from theater array
            theaterNameLabel.text = theaterInfo.theaterName;
            theaterInfoLabel.text = theaterInfo.theaterInfo;
            theaterImageView.image = theaterInfo.theaterImage;
        } else if (section == 1) {
            //Grab instance of theater info object for section
            TheaterInfo *theaterInfo = [theaterArray objectAtIndex:section];
            //Set text and image from theater array
            theaterNameLabel.text = theaterInfo.theaterName;
            theaterInfoLabel.text = theaterInfo.theaterInfo;
            theaterImageView.image = theaterInfo.theaterImage;
        } else if (section == 2) {
            //Grab instance of theater info object for section
            TheaterInfo *theaterInfo = [theaterArray objectAtIndex:section];
            //Set text and image from theater array
            theaterNameLabel.text = theaterInfo.theaterName;
            theaterInfoLabel.text = theaterInfo.theaterInfo;
            theaterImageView.image = theaterInfo.theaterImage;
        }
    }
    return headerView;
}

//Built in function to set header height. My header view heght is set without this but the section below it defaults to standard header height, covering half my header view.
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

//Built in method to set number of rows in table view section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Dynamically set number of rows based on array lengths
    if (section == 0) {
        return [moviesArray1 count];
    } else if (section == 1) {
        return [moviesArray2 count];
    }else if (section == 2) {
        return [moviesArray3 count];
    }
    return 0;
}

//Built in method to allocate and reuse table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Allocate and reuse cells
    CustomTableViewCell *cell = (CustomTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    if (cell != nil) {
        //Section 1
        if (indexPath.section == 0) {
            //Grab instance of movie info object for row
            MovieInfo *movieInfo = [self.moviesArray1 objectAtIndex:indexPath.row];
            //Apply text and image to cell
            cell.movieTitleLabel.text = movieInfo.movieTitleString;
            cell.playTimesLabel.text = movieInfo.playTimeString;
            cell.posterImageView.image = movieInfo.moviePosterImage;
        //Section 2
        } else if (indexPath.section == 1) {
            //Grab instance of movie info object for row
            MovieInfo *movieInfo = [self.moviesArray2 objectAtIndex:indexPath.row];
            //Apply text and image to cell
            cell.movieTitleLabel.text = movieInfo.movieTitleString;
            cell.playTimesLabel.text = movieInfo.playTimeString;
            cell.posterImageView.image = movieInfo.moviePosterImage;
        //Section 3
        } else if (indexPath.section == 2) {
            //Grab instance of movie info object for row
            MovieInfo *movieInfo = [self.moviesArray3 objectAtIndex:indexPath.row];
            //Apply text and image to cell
            cell.movieTitleLabel.text = movieInfo.movieTitleString;
            cell.playTimesLabel.text = movieInfo.playTimeString;
            cell.posterImageView.image = movieInfo.moviePosterImage;
        }
    }
    return cell;
}

//Built in method to grab cell selected and pass info
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Segue

//Built in method to pass data during segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Verify identifier of push segue to Details view
    if ([segue.identifier isEqualToString:@"DetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //Grab destination view controller
        DetailsViewController *detailsViewController = segue.destinationViewController;
        
        if (detailsViewController != nil) {
            //Section 1
            if (indexPath.section == 0) {
                //Grab instance of movie info object for row
                MovieInfo *movieInfo = [self.moviesArray1 objectAtIndex:indexPath.row];
                //Apply text and image to cell
                detailsViewController.passedMovieTitle = movieInfo.movieTitleString;
                detailsViewController.passedPlayTimes = movieInfo.playTimeString;
                detailsViewController.passedPosterImage = movieInfo.moviePosterImage;
                //Section 2
            } else if (indexPath.section == 1) {
                //Grab instance of movie info object for row
                MovieInfo *movieInfo = [self.moviesArray2 objectAtIndex:indexPath.row];
                //Apply text and image to cell
                detailsViewController.passedMovieTitle = movieInfo.movieTitleString;
                detailsViewController.passedPlayTimes = movieInfo.playTimeString;
                detailsViewController.passedPosterImage = movieInfo.moviePosterImage;
                //Section 3
            } else if (indexPath.section == 2) {
                //Grab instance of movie info object for row
                MovieInfo *movieInfo = [self.moviesArray3 objectAtIndex:indexPath.row];
                //Apply text and image to cell
                detailsViewController.passedMovieTitle = movieInfo.movieTitleString;
                detailsViewController.passedPlayTimes = movieInfo.playTimeString;
                detailsViewController.passedPosterImage = movieInfo.moviePosterImage;
            }
            //Send screen name to NSString in DetailViewController for display
            //detailsViewController.passedMovieTitle = [moviesArray1 objectAtIndex:indexPath.row];
        }
    }
}


@end
