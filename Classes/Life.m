//
//  Life.m
//  MovementOne
//
//  Created by X3N0 on 4/6/11.
//  Copyright 2011 Rage Creations. All rights reserved.
//

#import "Life.h"


@implementation Life

-(id)init {
	self = [super init];
	if (self) {
		self.k = KIND_LIFE;
		self.l = CGPointMake(-30,-30);
		self.targetID = KIND_UNDERSTANDING;
		self.brake = 3;
		self.accel = .43;
		self.maxMomentum = 6; //7;
		self.strength = 100;
		self.maxStrength = 100;
		self.image = @"greenblot.png";
		self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.image]];
		self.radius = 10;
		self.vel = CGPointZero;
		self.boostType = 1;
		self.boostStrength = 2.5;
		self.pursuitStyle = 2;
		self.bonusThrustStrength = 7;
		self.boostRadius = 280;
		self.recoveryRate = .083;
		self.vel = CGPointMake(2, 3);
	}
	return self;
}


-(void)calculateThrust {
	
	self.thrust = GetAngle(self.l, self.target);
	
	if (self.target.x > self.l.x) {
		if (self.vel.x > 0) {
			self.vel = IXncreaseX(self.vel, (self.vel.x * self.thrust.x * self.accel));
		} else if (self.vel.x < 0) {
			self.vel = IXncreaseX(self.vel, self.brake);
		}
	} else if (self.target.x < self.l.x) {
		if (self.vel.x < 0) {
		self.vel =IXncreaseX(self.vel, -(self.vel.x * self.thrust.x * self.accel));
		} else if (self.vel.x > 0) {
			self.vel =IXncreaseX(self.vel, -self.brake);
		}
	}
	if (self.target.y > self.l.y) {
		if (self.vel.y > 0) {
			self.vel =IYncreaseY(self.vel, (self.vel.y * self.thrust.y * self.accel));
		} else if (self.vel.y < 0) {
			self.vel =IYncreaseY(self.vel, self.brake);
		}
	} else if (self.target.y < self.l.y) {
		if (self.vel.y < 0) {
			self.vel =IYncreaseY(self.vel, -(self.vel.y * self.thrust.y * self.accel));
		} else if (self.vel.y > 0) {
			self.vel =IYncreaseY(self.vel, -self.brake);
		}
	}
	

	if (self.vel.x > -2 && self.vel.x < 2) {
		if (self.target.x > self.l.x) {
			self.vel = 	IXncreaseX(self.vel, 2);
		}else {
			self.vel = IXncreaseX(self.vel, -2);
		}
	}
	
	if (self.vel.y > -2 && self.vel.y < 2) {
		if (self.target.y > self.l.y) {
			self.vel = 	IYncreaseY(self.vel, 2);
		}else {
			self.vel = IYncreaseY(self.vel, -2);
		}
	}
	
	if (GetDist(self.l, self.target) < 90) {
		
		CGPoint greenboost = MultiplyVel(self.thrust, 5);
		self.l = CombineVel(self.l, greenboost);

	}
	
}	

-(void)move {
	[self calculateThrust];
	[super move];
	[self recover];
}

-(void)recover {
	if (self.strength < 100) {
		self.strength+= self.recoveryRate;
	} else if (self.strength > 100) {
		self.strength = 100;
	}

	if (self.strength < 0) {
		self.strength = 0;
	}
	
	self.imageView.transform = CGAffineTransformMakeScale(self.strength / 100, self.strength / 100);
	
}

-(void)resetPosition {
	self.l = CGPointMake(-30,-30);	
}

-(void)reset {
	self.strength = 100;
	[self resetPosition];
}

@end
