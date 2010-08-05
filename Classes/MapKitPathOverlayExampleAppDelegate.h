//
//  MapKitPathOverlayExampleAppDelegate.h
//  MapKitPathOverlayExample
//
//  Created by Cory Wiles on 5/25/10.
//  Copyright Wiles, LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapKitPathOverlayExampleViewController;

@interface MapKitPathOverlayExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MapKitPathOverlayExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MapKitPathOverlayExampleViewController *viewController;

@end

