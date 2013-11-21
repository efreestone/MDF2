// Elijah Freestone
// MDF2 1311
// Project 4
// November 19th, 2013

//
//  MovieViewController.h
//  MDF2Project4
//
//  Created by Elijah Freestone on 11/20/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>
//Import media player
#import <MediaPlayer/MediaPlayer.h>

@interface MovieViewController : UIViewController {
    //Declare media player
    MPMoviePlayerController *moviePlayer;
    
    IBOutlet UIView *movieView;
}

-(IBAction)onPlay:(id)sender;
-(IBAction)onStop:(id)sender;

@end
