//
//  MainViewController.m
//  Testing
//
//  Created by Joel West on 1/9/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "MainViewController.h"
#import "JJWTableViewCell.h"
#import "JJWTableViewCellAlt.h"
#import "JJWSpecailsLoader.h"
#import "JJWSpecial.h"

@interface MainViewController ()
@property (nonatomic,strong) JJWSpecailsLoader *loader;
@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSBundle *main = [NSBundle mainBundle];
    [self.tableView registerNib:[UINib nibWithNibName:@"JJWTableViewCell" bundle:main] forCellReuseIdentifier:@"Cell1"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JJWTableViewCellAlt" bundle:main] forCellReuseIdentifier:@"Cell2"];

    self.loader = [[JJWSpecailsLoader alloc] init];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.loader.specials count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JJWTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell1"];
   
    NSDictionary *dictToDisplay = [self.loader.specials valueForKey:[NSString stringWithFormat:@"%lu",indexPath.row+1]];
    JJWSpecial *special = [[JJWSpecial alloc] initWithSpecial:dictToDisplay];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"h:mm a"];
    
    cell.specialTitle.text = special.specialTitle;
    cell.specialStartTime.text = [dateFormatter stringFromDate:special.specialStartTime];
    cell.specialEndTime.text = [dateFormatter stringFromDate:special.specialEndTime];
        
    return cell;
    
}
@end
