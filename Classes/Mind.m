//
//  Mind.m
//  MovementOne
//
//  Created by X3N0 on 4/9/11.
//  Copyright 2011 Rage Creations. All rights reserved.
//

#import "Mind.h"


@implementation Mind
@synthesize view, life, vision;

-(id)initWithView:(UIView *)newView {
	self = [super init];
	if (self) {
		self.view = newView;	
		self.life = [[Life alloc] init];
		[newView addSubview:self.life.imageView];
		self.vision = [[Vision alloc] init];
		[newView addSubview:self.vision.imageView];
		[self resetPhysics];
		
		timer = [[NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(loop) userInfo:nil repeats:YES] retain];
	}
	return self;
}

-(BOOL)proximal:(Ball *)b1 :(Ball *)b2{
	if ( GetDist(b1.l, b2.l) <= (b1.radius + b2.radius)){
		return YES;
	}
	return NO;
}

-(void)visionFailed {
	[self resetPhysics];	
}

-(void)popLife {
	self.life.strength -= sshot;
	if (self.life.strength <= 0) {
		[self visionFailed];
	}
	[self.life resetPosition];
}

-(void)checkForEnlightenment {
	if ([self proximal:self.life :self.vision]) {
		[self popLife];
	}
}

-(void)loop {
	sshot = 10;
	if (gamestate == 1) {
		[self.life move];	
		[self.vision move];
		self.vision.imageView.alpha = self.life.strength / 100;
		
		[self checkForEnlightenment];
		
	}
}

-(void)resetPhysics{
	sshot = 0;
	shotset = 0;
	shot = 1;
	pillarRadius = 25;
	gamestate = 1;
	[self.life reset];
}


-(void)touch:(CGPoint)touchLoc {
	gamestate = 1;
	self.vision.l = touchLoc;
	self.life.target = touchLoc;	
}

-(void)touchUp {
	gamestate = -1;
}

@end
