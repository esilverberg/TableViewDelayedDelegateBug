//
//  ViewController.m
//  TableViewDelayedDelegateBug
//
//  Created by Eric Silverberg on 10/5/13.
//  Copyright (c) 2013 Eric Silverberg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
    // This will cause a 35-px space to appear at the top
    [self performSelector:@selector(updateDelegate) withObject:nil afterDelay:0.0];
    
    // This will not cause a space to appear at the top
    // self.tableView.delegate = self;
}

- (void) updateDelegate
{
    self.tableView.delegate = self;
    [self.tableView reloadData];
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(0,0,self.view.frame.size.width, 50);
    return redView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionNum
{
    return 50;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:@"TestCell"];
    }
    
    cell.textLabel.text = @"Test";
    return cell;
}

@end
