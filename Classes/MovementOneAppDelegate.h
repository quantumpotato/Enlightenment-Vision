//
//  MovementOneAppDelegate.h
//  MovementOne
//
//  Created by X3N0 on 9/21/10.
//  Copyright Rage Creations 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovementOneViewController;

@interface MovementOneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MovementOneViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MovementOneViewController *viewController;

@end

