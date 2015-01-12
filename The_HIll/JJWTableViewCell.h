//
//  JJWTableViewCell.h
//  Test
//
//  Created by Joel West on 1/8/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJWTableViewCell : UITableViewCell

@property IBOutlet UIImageView *barImage;
@property IBOutlet UILabel *specialTitle;
@property IBOutlet UILabel *specialStartTime;
@property IBOutlet UILabel *specialEndTime;

@end
