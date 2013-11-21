// Elijah Freestone
// MDF2 1311
// Project 4
// November 19th, 2013

//
//  MovieViewController.m
//  MDF2Project4
//
//  Created by Elijah Freestone on 11/20/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "MovieViewController.h"
//Import media player
#import <MediaPlayer/MediaPlayer.h>

@interface MovieViewController ()

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    /*//NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test video" ofType:@"m4v"];
    //NSString *urlString = @"http://movietrailers.apple.com/movies/dreamworks/needforspeed/needforspeed-tlr2_480p.mov";
    //Dropbox public link
    //NSString *urlString = @"https://www.dropbox.com/sc/a66xho2o0whxk1k/C5SWMnX3xU";
    //Dropbox share link
    NSString *urlString = @"https://dl.dropboxusercontent.com/u/101537341/Best_Man_Down.m4v";
    //NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    NSURL *fileUrl = [NSURL fileURLWithPath:urlString];
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:fileUrl];
    if (moviePlayer != nil) {
        
        [self.view addSubview:moviePlayer.view];
        
        moviePlayer.fullscreen = true;
        moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        
        [moviePlayer play];
    }*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onPlay:(id)sender {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Best_Man_Down" ofType:@"m4v"];
    //NSString *urlString = @"http://movietrailers.apple.com/movies/dreamworks/needforspeed/needforspeed-tlr2_480p.mov";
    
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    //NSURL *fileUrl = [NSURL fileURLWithPath:urlString];
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:fileUrl];
    if (moviePlayer != nil) {
        
        [movieView addSubview:moviePlayer.view];
        
        moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, movieView.frame.size.width, movieView.frame.size.height);
        moviePlayer.fullscreen = false;
        moviePlayer.controlStyle = MPMovieControlStyleNone;
        
        [moviePlayer play];
    }
}

-(IBAction)onStop:(id)sender {
    [moviePlayer stop];
}

@end
