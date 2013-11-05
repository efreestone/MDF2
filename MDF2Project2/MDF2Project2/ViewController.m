// Elijah Freestone
// MDF2 1311
// Project 2
// November 2nd, 2013

//
//  ViewController.m
//  MDF2Project2
//
//  Created by Elijah Freestone on 11/2/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "ViewController.h"
//Import custom cell
#import "CustomCollectionCell.h"

@interface ViewController ()

@end

@implementation ViewController

//Synthesize for getters/setters
@synthesize myCollectionView;

- (void)viewDidLoad
{
    UINib *cellNib = [UINib nibWithNibName:@"CustomCollectionCell" bundle:nil];
    if (cellNib != nil) {
        [myCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"CustomCell"];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Built in function to set number of cells in a section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 51;
}

//Built in function to set number of sections in collection view
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//Built in function to allocate and reuse collection view cells
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionCell *cell = [myCollectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    //NSLog(@"celForItem is working");
    if (cell != nil) {
        NSLog(@"cell is created");
        NSString *imageName = [NSString stringWithFormat:@"test_image%d", ((indexPath.row % 4) + 1)];
        [cell refreshCellData:[UIImage imageNamed:imageName] titleString:[NSString stringWithFormat: @"cell %ld", (long)indexPath.row]];
        return cell;
    }
    
    return nil;
}





@end
