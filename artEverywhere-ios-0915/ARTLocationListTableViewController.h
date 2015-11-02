//
//  ARTLocationListTableViewController.h
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "ARTInfoDataStore.h"


@interface ARTLocationListTableViewController : UITableViewController


@property (nonatomic, strong) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) ARTInfoDataStore *store;

@end
