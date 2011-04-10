//
//  Death.h
//  MovementOne
//
//  Created by X3N0 on 4/9/11.
//  Copyright 2011 Rage Creations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ball.h"

@interface Death : Ball {

	Ball *goal;
}

@property(nonatomic, retain) Ball *goal;



-(void)move;

@end
