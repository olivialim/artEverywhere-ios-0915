//
//  ARTLocationListTableViewController.m
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import "ARTLocationListTableViewController.h"
#import "ARTInfoViewController.h"
#import "ARTInfo.h"
#import "ARTMapAnnotation.h"
#import "ARTMapOverlay.h"
#import "ARTMapOverlayView.h"
#import "NSMutableArray+Enumeration.h"


@interface ARTLocationListTableViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation ARTLocationListTableViewController

#pragma mark - View set up

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.store = [ARTInfoDataStore sharedArtInfoDataStore];
    
    [self.mapView setShowsUserLocation:YES];
    [self.mapView setShowsPointsOfInterest:NO];
    self.mapView.delegate = self;
    
    ARTMapOverlay *dimOverlay = [[ARTMapOverlay alloc] initWithMapView:self.mapView];
    [self.mapView addOverlay: dimOverlay];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    
    
    // ask for permission to user's location data
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager startUpdatingLocation];
    


}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - Map set up

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    // Stop updating location to prevent snap back to user location
    [self.locationManager stopUpdatingLocation];
    
    
    // Establish users location
    CLLocation *location = locations.lastObject;
    
    
    // Zoom to users location
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, .8*1609.344, .8*1609.344);
    [self.mapView setRegion:viewRegion animated:YES];
    
    
    // Determine distance of location from user
    [self.store.artworks loopLocations:^id(id object) {
        
        [object setupDistanceFromUserPropertyForArtwork:object withLocation:location];
        return object;
        
    }];
    
    
    // Sort locations by distance from user
    NSSortDescriptor *sortByDistance = [NSSortDescriptor sortDescriptorWithKey:@"distanceFromUser"
                                                                     ascending:YES];
    
    [self.store.artworks sortUsingDescriptors:@[ sortByDistance ]];
    
    // Add number to annotation based on proximity to user
    __block NSUInteger locationNumber = 0;
    [self.store.artworks loopLocations:^id(id object) {
        
        ARTInfo *editObject = object;
        locationNumber += 1;
        editObject.annotation.proximityNumber = [NSString stringWithFormat:@"%li",locationNumber];
        return object;
        
    }];
    
    // Add annotations to map
    for (ARTInfo *place in self.store.artworks) {
        [self.mapView addAnnotation:place.annotation];
    }
    
    [self.tableView reloadData];    
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(nonnull id<MKAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[ARTMapAnnotation class]])
    {
        
        ARTMapAnnotation *myLocation = (ARTMapAnnotation *)annotation;
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"MyCustomAnnotation"];
        if (annotationView == nil) {
            annotationView = myLocation.annotationView;
        } else {
            annotationView.annotation = annotation;
        }
        return annotationView;
    }
    else
    {
        return nil;
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    if (![view.annotation isKindOfClass:[ARTMapAnnotation class]])
        return;
    
    ARTMapAnnotation *passTappedInfo = (ARTMapAnnotation *)view.annotation;
    
    [self performSegueWithIdentifier:@"" sender:passTappedInfo];
}

-(ARTMapOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    if([overlay isMemberOfClass:[ARTMapOverlay class]]) {
        ARTMapOverlayView *dimOverlayView = [[ARTMapOverlayView alloc] initWithOverlay:overlay];
        dimOverlayView.overlayAlpha = 0.25;
        dimOverlayView.overlayColor = [[UIColor alloc] initWithRed:217.0/255
                                                             green:147.0/255
                                                              blue:66.0/255
                                                             alpha:1.0];
        return dimOverlayView;
    }
    return nil;
}


#pragma mark - Tableview list set up

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.store.artworks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artLocation" forIndexPath:indexPath];
    
    ARTInfo *currentArtwork = self.store.artworks[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@",currentArtwork.annotation.proximityNumber,currentArtwork.title];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ mi",currentArtwork.distanceFromUser];
    
    // set tableview cell selection color
    UIView *customColorView = [[UIView alloc] init];
    customColorView.backgroundColor = [UIColor colorWithRed:217/255.0
                                                      green:147/255.0
                                                       blue:66/255.0
                                                      alpha:0.5];
    cell.selectedBackgroundView =  customColorView;
    
    // set color of navigation controller chevron
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"";
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([sender isMemberOfClass:[ARTMapAnnotation class]]) {
        
        [self.mapView deselectAnnotation:sender animated:NO];
        ARTMapAnnotation *passedTappedInfo = sender;
        NSUInteger indexFromAnnotation = [passedTappedInfo.proximityNumber integerValue];
        ARTInfoViewController *infoVC = segue.destinationViewController;
        ARTInfo *artworkAtIndex = self.store.artworks[indexFromAnnotation-1];
        infoVC.artwork = artworkAtIndex;
        
    } else {
    
    ARTInfoViewController *infoVC = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
    ARTInfo *artworkAtIndex = self.store.artworks[selectedIndexPath.row];
    infoVC.artwork = artworkAtIndex;
        
    }
}

// add header to tabelview cells
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(0, 0, tableView.frame.size.width, 50.0)];
    
    sectionHeaderView.backgroundColor = [UIColor colorWithRed:217/255.0
                                                        green:147/255.0
                                                         blue:66/255.0
                                                        alpha:0.5];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(5, 2, sectionHeaderView.frame.size.width, 25.0)];
    
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.textColor = [UIColor whiteColor];
    
    headerLabel.textAlignment = NSTextAlignmentLeft;
    [headerLabel setFont:[UIFont boldSystemFontOfSize:13]];
    [sectionHeaderView addSubview:headerLabel];
    headerLabel.text = @"ART NEAR YOU:";

    return sectionHeaderView;
}


@end
