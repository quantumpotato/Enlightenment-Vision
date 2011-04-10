//
//  Mind.h
//  MovementOne
//
//  Created by X3N0 on 4/9/11.
//  Copyright 2011 Rage Creations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Life.h"

@interface Mind : NSObject {
	UIView *view;
	Life *life;
	
	int shotset, shot, sshot; //Shot set, shot number in set, scored shots
	int orangedeflects;

	float pillarRadius;
	
	int gamestate;
		NSTimer *timer;
}

@property(nonatomic,retain) UIView *view;
@property(nonatomic,retain) Life *life;

-(id)initWithView:(UIView *)newView;

-(void)resetPhysics;

-(void)touch:(CGPoint)touchLoc;

-(void)touchUp;

@end
