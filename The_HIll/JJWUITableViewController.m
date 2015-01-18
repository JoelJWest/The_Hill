//
//  JJWUITableViewController.m
//  The_HIll
//
//  Created by Joel J. West on 1/18/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWUITableViewController.h"
#import "JJWTableViewCell.h"
#import "JJWTableViewCellAlt.h"
#import "JJWSpecailsLoader.h"
#import "JJWSpecial.h"
#import "JJWDetailUIViewController.h"

@interface JJWUITableViewController ()
@property (nonatomic, strong) JJWSpecailsLoader *loader;
@end

@implementation JJWUITableViewController


-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.title = @"Today's Specials";

}

-(void)viewDidLoad {
    
    [super viewDidLoad];
    NSBundle *main = [NSBundle mainBundle];
    [self.tableView registerNib:[UINib nibWithNibName:@"JJWTableViewCell" bundle:main] forCellReuseIdentifier:@"Cell1"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JJWTableViewCellAlt" bundle:main] forCellReuseIdentifier:@"Cell2"];
    
    self.loader = [[JJWSpecailsLoader alloc] init];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.loader.specials count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JJWTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    
    NSDictionary *dictToDisplay = [self.loader.specials valueForKey:[NSString stringWithFormat:@"%ld",indexPath.row+1]];
    JJWSpecial *special = [[JJWSpecial alloc] initWithSpecial:dictToDisplay];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"h:mm a"];
    
    cell.specialTitle.text = special.specialTitle;
    cell.specialStartTime.text = [dateFormatter stringFromDate:special.specialStartTime];
    cell.specialEndTime.text = [dateFormatter stringFromDate:special.specialEndTime];
    cell.barImage.image = [special loadImage];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JJWDetailUIViewController *detailedView = [[JJWDetailUIViewController alloc] initWithNibName:@"JJWDetailUIViewController" bundle:[NSBundle mainBundle]];

    [self.navigationController pushViewController:detailedView animated:YES];
   
}

@end
