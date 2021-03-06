//
//  JJWSpecial.m
//  Testing
//
//  Created by Joel West on 1/11/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWSpecial.h"

@implementation JJWSpecial

-(instancetype)initWithSpecial:(NSDictionary *)specialDict{
    
    self = [super init];
    if (self){
        
        self.barNumber = [[specialDict objectForKey:@"BarNumber"] integerValue];
        self.specialTitle = [specialDict objectForKey:@"Special Title"];
        self.specialStartTime = [self getTimeFromString:[specialDict objectForKey:@"SpecialStartTime"]];
        self.specialEndTime = [self getTimeFromString:[specialDict objectForKey:@"SpecialEndTime"]];
       
    }
    return self;
}

-(instancetype)init{
    
    [NSException raise:@"INIT NOT ALLOWED" format:@"!!!"];
    return NULL;
}

-(NSDate *)getTimeFromString:(NSString *)originalString{

    NSArray *timeParts = [originalString componentsSeparatedByString:@":"];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [gregorian dateBySettingHour:[timeParts[0] integerValue] minute:[timeParts[1] integerValue] second:0 ofDate:[NSDate date] options:0];

    return date;
}

-(UIImage *)loadImage{
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://uni.edu/westjae/The_Hill/Mobile_Scripts/Images/BarLogoBarNumber_%li.png",self.barNumber]]];
    UIImage *barImage = [[UIImage alloc] initWithData:data];
    
    return barImage;
}

@end


