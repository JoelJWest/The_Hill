//
//  MainViewController.h
//  Testing
//
//  Created by Joel West on 1/9/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
