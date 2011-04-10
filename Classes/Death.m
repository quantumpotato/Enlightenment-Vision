//
//  Death.m
//  MovementOne
//
//  Created by X3N0 on 4/9/11.
//  Copyright 2011 Rage Creations. All rights reserved.
//

#import "Death.h"


@implementation Death
@synthesize goal;

-(id)initWithGoal:(Ball *)targetLife {
	self = [super init];
	if (self) {
		self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redtriangle.png"]];
		self.brake = 2;
		self.strength = 4;
		self.maxMomentum = 7;
		self.goal = targetLife;
		self.accel = .5;
	}
	return self;
}

-(void)move {
	CGPoint redtarget = CombineVel(self.goal.l, MultiplyVel(self.goal.vel, 3));
	CGPoint idealred = GetAngle(self.l, redtarget);
	
	self.vel = CombineVel(self.vel, MultiplyVel(idealred, self.accel));
}
@end
