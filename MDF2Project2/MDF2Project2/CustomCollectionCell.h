//
//  CustomCollectionCell.h
//  MDF2Project2
//
//  Created by Elijah Freestone on 11/4/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionCell : UICollectionViewCell

//Declare profile image view and username label
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;

//Declare custom method to refresh cell data
-(void)refreshCellData:(UIImage *)image titleString:(NSString *)titleString;

@end
