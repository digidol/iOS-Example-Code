//
//  MasterViewController.m
//  SQLiteTable
//
//  Created by Neil Taylor on 23/05/2014.
//  Copyright (c) 2014 Aberystwyth University. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "DataAccess.h"
#import "Event.h"

@interface MasterViewController () {
    NSArray *events;
}
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	DataAccess *data = [[DataAccess alloc] init];
    if(![data startup]) {
        NSLog(@"Error here");
    }
    else {
        events = [data loadEvents];
        for (Event *event in events) {
            NSLog(@"Event: %@", event);
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Event *event = events[indexPath.row];
    cell.textLabel.text = [event title];
    cell.detailTextLabel.text = [event detail];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailItem: events[indexPath.row]];
    }
}

@end
