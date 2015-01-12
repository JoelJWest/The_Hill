//
//  JJWSpecial.h
//  Testing
//
//  Created by Joel West on 1/11/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JJWSpecial : NSObject

@property (nonatomic) long barNumber;
@property (nonatomic) NSString *specialTitle;
@property (nonatomic) NSDate *specialStartTime;
@property (nonatomic) NSDate *specialEndTime;
@property (nonatomic) NSString *specialDescription;
@property (nonatomic) BOOL sunday;
@property (nonatomic) BOOL monday;
@property (nonatomic) BOOL tuesday;
@property (nonatomic) BOOL wednesday;
@property (nonatomic) BOOL thursday;
@property (nonatomic) BOOL friday;
@property (nonatomic) BOOL saturday;

-(instancetype)initWithSpecial:(NSDictionary *)specialDict;
-(UIImage *)loadImage;

@end
