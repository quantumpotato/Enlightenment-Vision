//
//  MovementOneViewController.h
//  MovementOne
//
//  Created by X3N0 on 9/21/10.
//  Copyright Rage Creations 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ball.h"
#import "cmpgames.h"
#import "Mind.h"

@interface MovementOneViewController : UIViewController {
	
	CGPoint gestureStartPoint;
	CGPoint currentPosition;
	
	Mind *mind;
}

@property(nonatomic,retain) Mind *mind;

@end