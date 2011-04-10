//obstacle states
//obstacle generation and bouncing
//larger space for rush distance
//obstacles

//
//  MovementOneViewController.m
//  MovementOne
//
//  Created by X3N0 on 9/21/10.
//  Copyright Rage Creations 2010. All rights reserved.
//

#import "MovementOneViewController.h"

@implementation MovementOneViewController
@synthesize mind;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];
	self.view.backgroundColor = [UIColor blackColor];
	srandom(time(NULL));
	self.mind = [[Mind alloc] initWithView:self.view];
}	

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{	
	
	UITouch *touch = [touches anyObject];
	gestureStartPoint = [touch locationInView:self.view];
	[self.mind touch:gestureStartPoint];
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	currentPosition = [touch locationInView:self.view];
	[self.mind touch:currentPosition];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[self.mind touchUp];
}

@end