//
//  ARTFullScreenViewController.h
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim on 11/3/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARTInfoViewController.h"

@interface ARTFullScreenViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *fullSizeImage;
@property (strong, nonatomic) ARTInfoViewController *art;
@property (strong, nonatomic) IBOutlet UIView *viewOfFullScreen;
@property (strong, nonatomic) UIImage *fullScreenImage;

@end
