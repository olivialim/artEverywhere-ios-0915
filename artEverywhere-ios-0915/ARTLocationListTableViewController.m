//
//  ARTLocationListTableViewController.m
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim on 10/27/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import "ARTLocationListTableViewController.h"
#import "ARTInfoViewController.h"
#import "ARTInfo.h"
#import <MapKit/MapKit.h>

@interface ARTLocationListTableViewController ()

@end

@implementation ARTLocationListTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.store = [ARTInfoDataStore sharedArtInfoDataStore];
    NSLog(@"Navframe Height=%f",
          self.navigationController.navigationBar.frame.size.height);
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.store.artworks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artLocation" forIndexPath:indexPath];
    
    // Configure the cell...
    
    ARTInfo *currentArtwork = self.store.artworks[indexPath.row];
    
    cell.textLabel.text = currentArtwork.title;
    cell.detailTextLabel.text = currentArtwork.artist;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ARTInfoViewController *infoVC = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
    
    
    ARTInfo *artworkAtIndex = self.store.artworks[selectedIndexPath.row];
    
    infoVC.artwork = artworkAtIndex;
}

@end
