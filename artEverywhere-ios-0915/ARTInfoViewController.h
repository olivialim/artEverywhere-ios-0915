//
//  ARTInfoViewController.h
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim on 10/28/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARTLocationListTableViewController.h"
#import "ARTInfoDataStore.h"

@interface ARTInfoViewController : UIViewController

@property (strong, nonatomic) ARTInfo *artwork;
@property (strong, nonatomic) ARTInfoDataStore *store;

@end
