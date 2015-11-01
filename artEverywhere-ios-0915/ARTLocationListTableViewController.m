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
#import "MyCustomAnnotation.h"
#import "MapOverlay.h"
#import "MapOverlayView.h"
#import <MapKit/MapKit.h>

// CONVERSION VALUES

#define MILE_METERS 1609.344
#define FEET_METERS 3.28084


// ART LOCATION COORDINATES

#define CHARGING_BULL_LAT 40.70555;
#define CHARGING_BULL_LON -74.01344;
#define RED_CUBE_LAT 40.70846;
#define RED_CUBE_LON -74.00978;
#define GROUP_OF_FOUR_TREES_LAT 40.70776;
#define GROUP_OF_FOUR_TREES_LON -74.00885;
#define SECOND_SELF_LAT 40.70403;
#define SECOND_SELF_LON -74.01375;
#define UNION_OF_THE_SENSES_LAT 40.70982; // 40.71301 (actual)
#define UNION_OF_THE_SENSES_LON -74.01329; // -74.01317 (actual)


@interface ARTLocationListTableViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation ARTLocationListTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.store = [ARTInfoDataStore sharedArtInfoDataStore];
    self.navigationController.navigationBar.topItem.title = @"";
    
    [self.mapView setShowsUserLocation:YES];
    [self.mapView setShowsPointsOfInterest:NO];
    self.mapView.delegate = self;
    
    MapOverlay *dimOverlay = [[MapOverlay alloc] initWithMapView:self.mapView];
    [self.mapView addOverlay: dimOverlay];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    
    
    // ask for permission to user's location data
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager startUpdatingLocation];
    
    CLLocationCoordinate2D chargingBullCoord;
    chargingBullCoord.latitude = CHARGING_BULL_LAT;
    chargingBullCoord.longitude = CHARGING_BULL_LON;
    MyCustomAnnotation *chargingBullAnnot = [[MyCustomAnnotation alloc] initWithTitle:@"Charging Bull" Location:chargingBullCoord Proximity:@"1"];
    [self.mapView addAnnotation:chargingBullAnnot];
    
    CLLocationCoordinate2D secondSelfCoord;
    secondSelfCoord.latitude = SECOND_SELF_LAT;
    secondSelfCoord.longitude = SECOND_SELF_LON;
    MyCustomAnnotation *secondSelfAnnot = [[MyCustomAnnotation alloc] initWithTitle:@"Second Self" Location:secondSelfCoord Proximity:@"2"];
    [self.mapView addAnnotation:secondSelfAnnot];
    
    CLLocationCoordinate2D redCubeCoord;
    redCubeCoord.latitude = RED_CUBE_LAT;
    redCubeCoord.longitude = RED_CUBE_LON;
    MyCustomAnnotation *redCubeAnnot = [[MyCustomAnnotation alloc] initWithTitle:@"Red Cube" Location:redCubeCoord Proximity:@"3"];
    [self.mapView addAnnotation:redCubeAnnot];
    
    CLLocationCoordinate2D groupFourTreesCoord;
    groupFourTreesCoord.latitude = GROUP_OF_FOUR_TREES_LAT;
    groupFourTreesCoord.longitude = GROUP_OF_FOUR_TREES_LON;
    MyCustomAnnotation *groupFourTreesAnnot = [[MyCustomAnnotation alloc] initWithTitle:@"Group of Four Trees" Location:groupFourTreesCoord Proximity:@"4"];
    [self.mapView addAnnotation:groupFourTreesAnnot];
    
    CLLocationCoordinate2D unionSensesCoord;
    unionSensesCoord.latitude = UNION_OF_THE_SENSES_LAT;
    unionSensesCoord.longitude = UNION_OF_THE_SENSES_LON;
    MyCustomAnnotation *unionSensesAnnot = [[MyCustomAnnotation alloc] initWithTitle:@"Union of the Senses" Location:unionSensesCoord Proximity:@"5"];
    [self.mapView addAnnotation:unionSensesAnnot];

}

#pragma mark - Map stuff

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    NSLog(@"HEY, didUpdateLOCATION\n\n\n\n");
    
    
    [self.locationManager stopUpdatingLocation];
    CLLocation *location = locations.lastObject;
    
    for (ARTInfo *art in self.store.artworks) {
        
        NSLog(@"%@", art);
        
        [self.store setupDistanceFromUserPropertyForArtwork:art
                                               withLocation:location];
    }
    
    // zoom the map into the users current location
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, .8*MILE_METERS, .8*MILE_METERS);
    [self.mapView setRegion:viewRegion animated:YES];
    
    
    
    NSSortDescriptor *sortByDistance = [NSSortDescriptor sortDescriptorWithKey:@"distanceFromUser"
                                                                     ascending:YES];
    
    [self.store.artworks sortUsingDescriptors:@[ sortByDistance ]];
    
    
    //see what this does to cells if you want.
    [self.tableView reloadData];

//
//    CLLocationCoordinate2D chargingBullCoord;
//    chargingBullCoord.latitude = CHARGING_BULL_LAT;
//    chargingBullCoord.longitude = CHARGING_BULL_LON;
//    CLLocation *chargingBullLocation = [[CLLocation alloc] initWithCoordinate:chargingBullCoord altitude:0 horizontalAccuracy:0 verticalAccuracy:0 course:0 speed:0 timestamp:[NSDate date]];
//    CLLocationDistance chargingBullMeters = [chargingBullLocation distanceFromLocation:location];
//    CGFloat chargingBullDistanceConverted = chargingBullMeters / MILE_METERS;
//    NSString *chargingBullDisplayDistance = [NSString stringWithFormat:@"%.2f",chargingBullDistanceConverted];
//    NSLog(@"Charging Bull is %@ miles away",chargingBullDisplayDistance);
//    
//    CLLocationCoordinate2D secondSelfCoord;
//    secondSelfCoord.latitude = SECOND_SELF_LAT;
//    secondSelfCoord.longitude = SECOND_SELF_LON;
//    CLLocation *secondSelfLocation = [[CLLocation alloc] initWithCoordinate:secondSelfCoord altitude:0 horizontalAccuracy:0 verticalAccuracy:0 course:0 speed:0 timestamp:[NSDate date]];
//    CLLocationDistance secondSelfMeters = [secondSelfLocation distanceFromLocation:location];
//    CGFloat secondSelfDistanceConverted = secondSelfMeters / MILE_METERS;
//    NSString *secondSelfDisplayDistance = [NSString stringWithFormat:@"%.2f",secondSelfDistanceConverted];
//    NSLog(@"Second Self is %@ miles away",secondSelfDisplayDistance);
//    
//    CLLocationCoordinate2D redCubeCoord;
//    redCubeCoord.latitude = RED_CUBE_LAT;
//    redCubeCoord.longitude = RED_CUBE_LON;
//    CLLocation *redCubeLocation = [[CLLocation alloc] initWithCoordinate:redCubeCoord altitude:0 horizontalAccuracy:0 verticalAccuracy:0 course:0 speed:0 timestamp:[NSDate date]];
//    CLLocationDistance redCubeMeters = [redCubeLocation distanceFromLocation:location];
//    CGFloat redCubeDistanceConverted = redCubeMeters / MILE_METERS;
//    NSString *redCubeDisplayDistance = [NSString stringWithFormat:@"%.2f",redCubeDistanceConverted];
//    NSLog(@"Red Cube is %@ miles away",redCubeDisplayDistance);
//    
//    CLLocationCoordinate2D groupFourTreesCoord;
//    groupFourTreesCoord.latitude = GROUP_OF_FOUR_TREES_LAT;
//    groupFourTreesCoord.longitude = GROUP_OF_FOUR_TREES_LON;
//    CLLocation *groupFourTreesLocation = [[CLLocation alloc] initWithCoordinate:groupFourTreesCoord altitude:0 horizontalAccuracy:0 verticalAccuracy:0 course:0 speed:0 timestamp:[NSDate date]];
//    CLLocationDistance groupFourTreesMeters = [groupFourTreesLocation distanceFromLocation:location];
//    CGFloat groupFourTreesDistanceConverted = groupFourTreesMeters / MILE_METERS;
//    NSString *groupFourTreesDisplayDistance = [NSString stringWithFormat:@"%.2f",groupFourTreesDistanceConverted];
//    NSLog(@"Group of Four Trees is %@ miles away",groupFourTreesDisplayDistance);
//    
//    CLLocationCoordinate2D unionSensesCoord;
//    unionSensesCoord.latitude = UNION_OF_THE_SENSES_LAT;
//    unionSensesCoord.longitude = UNION_OF_THE_SENSES_LON;
//    CLLocation *unionSensesLocation = [[CLLocation alloc] initWithCoordinate:unionSensesCoord altitude:0 horizontalAccuracy:0 verticalAccuracy:0 course:0 speed:0 timestamp:[NSDate date]];
//    CLLocationDistance unionSensesMeters = [unionSensesLocation distanceFromLocation:location];
//    CGFloat unionSensesDistanceConverted = unionSensesMeters / MILE_METERS;
//    NSString *unionSensesDisplayDistance = [NSString stringWithFormat:@"%.2f",unionSensesDistanceConverted];
//    NSLog(@"Union of the Senses is %@ miles away",unionSensesDisplayDistance);
    
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(nonnull id<MKAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[MyCustomAnnotation class]])
    {
        
        MyCustomAnnotation *myLocation = (MyCustomAnnotation *)annotation;
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

-(MapOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    if([overlay isMemberOfClass:[MapOverlay class]]) {
        MapOverlayView *dimOverlayView = [[MapOverlayView alloc] initWithOverlay:overlay];
        dimOverlayView.overlayAlpha = 0.35;
        dimOverlayView.overlayColor = [[UIColor alloc] initWithRed:225.0 / 255 green:107.0 / 255 blue:105.0 / 255 alpha:1.0];
        return dimOverlayView;
    }
    return nil;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.store.artworks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artLocation" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSLog(@"WHEN DO YOU GET CALLED!!!!!, cellforrowatindexpath \n\n\n");
    
    
    ARTInfo *currentArtwork = self.store.artworks[indexPath.row];
    
    cell.textLabel.text = currentArtwork.title;
    cell.detailTextLabel.text = currentArtwork.distanceFromUser;
    
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ARTInfoViewController *infoVC = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
    
    
    ARTInfo *artworkAtIndex = self.store.artworks[selectedIndexPath.row];
    
    infoVC.artwork = artworkAtIndex;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end
