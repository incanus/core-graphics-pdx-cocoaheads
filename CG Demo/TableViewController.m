//
//  TableViewController.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "TableViewController.h"

#import "DrawRectViewController.h"
#import "ResponsiveDrawRectViewController.h"
#import "WatermarkViewController.h"
#import "AdvancedDrawRectViewController.h"
#import "TiledViewController.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *basicViewControllers;
@property (nonatomic, strong) NSArray *advancedViewControllers;

@end

#pragma mark -

@implementation TableViewController

@synthesize basicViewControllers;
@synthesize advancedViewControllers;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"CG Demo";
    
    self.basicViewControllers    = [NSArray arrayWithObjects:@"DrawRectViewController", @"ResponsiveDrawRectViewController", @"WatermarkViewController", nil];
    self.advancedViewControllers = [NSArray arrayWithObjects:@"AdvancedDrawRectViewController", @"TiledViewController", nil];
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return @"Basic";
        }
        case 1: 
        {
            return @"Advanced";
        }
    }
    
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return [self.basicViewControllers count];
        }
        case 1:
        {
            return [self.advancedViewControllers count];
        }
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if ( ! cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ #%i", [tableView.dataSource tableView:tableView titleForHeaderInSection:indexPath.section], indexPath.row + 1]; 
    
    return cell;
}

#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class ViewControllerClass = NSClassFromString(indexPath.section == 0 ? [self.basicViewControllers    objectAtIndex:indexPath.row] 
                                                                         : [self.advancedViewControllers objectAtIndex:indexPath.row]);
    
    id viewController = [[ViewControllerClass alloc] init];
            
    [self.navigationController pushViewController:viewController animated:YES];
}

@end