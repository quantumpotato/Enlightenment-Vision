//
//  Vision.m
//  MovementOne
//
//  Created by X3N0 on 4/9/11.
//  Copyright 2011 Rage Creations. All rights reserved.
//

#import "Vision.h"


@implementation Vision

-(id)init {
	self = [super init];
	if (self) {
		self.radius = 4;
		self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whitedot8.png"]];
	}
	return self;
}

-(void)move {
	self.imageView.center = self.l;	
}

@end
