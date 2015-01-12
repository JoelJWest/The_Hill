//
//  JJWSpecailsLoader.m
//  Testing
//
//  Created by Joel West on 1/11/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWSpecailsLoader.h"

@interface JJWSpecailsLoader()

@end

@implementation JJWSpecailsLoader

-(instancetype)init{
    
    self = [super init];
    
    if (self){
        
        NSURL *url = [[NSURL alloc] initWithString:@"http://uni.edu/westjae/TheHill/TestJSON/Untitled-11.php"];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        NSError *e = nil;
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&e];
        self.specials = [[NSMutableDictionary alloc] init];
        
        for (NSDictionary *dict in array){
            
            [self.specials setObject:dict forKey:[dict objectForKey:@"SpecialNumber"]];
        }
        
    }
    
    return self;
}


@end
