//
//  ViewController.h
//  TableViewDelayedDelegateBug
//
//  Created by Eric Silverberg on 10/5/13.
//  Copyright (c) 2013 Eric Silverberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@end
