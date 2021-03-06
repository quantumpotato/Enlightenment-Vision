//
//  Mind.h
//  MovementOne
//
//  Created by X3N0 on 4/9/11.
//  Copyright 2011 Rage Creations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Life.h"
#import "Vision.h"
#import "Death.h"

@interface Mind : NSObject {
	UIView *view;
	Life *life;
	Vision *vision;
	Death *death;
	
	int shotset, shot, sshot;
	int orangedeflects;

	float pillarRadius;
	
	int gamestate;
		NSTimer *timer;
}

@property(nonatomic,retain) UIView *view;
@property(nonatomic,retain) Life *life;
@property(nonatomic,retain) Vision *vision;
@property(nonatomic,retain) Death *death;

-(id)initWithView:(UIView *)newView;

-(void)resetPhysics;

-(void)touch:(CGPoint)touchLoc;

-(void)touchUp;

@end
