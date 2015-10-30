//
//  ARTLocationListTableViewController.h
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim on 10/27/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARTInfoDataStore.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ARTLocationListTableViewController : UITableViewController


@property (nonatomic, strong) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) ARTInfoDataStore *store;

@end
