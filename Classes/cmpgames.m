//
//  cmpgames.m
//  coop
//
//  Created by X3N0 on 7/18/10.
//  Copyright 2010 Rage Creations. All rights reserved.
//

#import "cmpgames.h"




CGPoint CombineVel(CGPoint v1, CGPoint v2){
	v1 = CGPointMake(v1.x+v2.x,v1.y+v2.y);
		return v1;
}

float GetDist(CGPoint initialp, CGPoint secondp){
	distvar = ((initialp.x - secondp.x) * (initialp.x - secondp.x));
    distvar2 = ((initialp.y - secondp.y) * (initialp.y - secondp.y));
	if (distvar + distvar2 == 0){
		distvar = 1;
		distvar2 = 3;
	}
	
    fdist = fabsf(sqrt((distvar+distvar2)));
    return fdist;
	
}

BOOL OutOfBounds(CGPoint initialp){
	if (initialp.x < -10 || initialp.x > 330 || initialp.y < -10 || initialp.y > 490){
		return YES;	
	}
	return NO;
}

float cValueForTriangle(float a, float b) {
	return sqrt((pow(a,2) + pow(b,2)));
}

CGPoint GetAngle(CGPoint initialp ,CGPoint secondp){
	distvar = ((initialp.x - secondp.x) * (initialp.x - secondp.x));
	distvar2 = ((initialp.y - secondp.y) * (initialp.y - secondp.y));
	if (distvar + distvar2 == 0){
		distvar = 1;
		distvar2 = 3;
	}
	veldistance = sqrt((distvar+distvar2));
	
	distvar = ((fabsf(initialp.x-secondp.x))/veldistance);
	distvar2 = ((fabsf(initialp.y-secondp.y))/veldistance);
	
	if (secondp.x < initialp.x){
		distvar = -distvar;
	}
	if (secondp.y < initialp.y){
		distvar2 = -distvar2;
	}
	
	fvel = CGPointMake(distvar,distvar2);
	
	return fvel;
}

CGPoint MultiplyVel(CGPoint cref , float mfact){
	cref = CGPointMake(cref.x * mfact, cref.y * mfact);
	return cref;
}

BOOL towardsX(CGPoint target, CGPoint location, CGPoint vel) {
	return (target.x > location.x && vel.x > 0) || (target.x < location.x && vel.x < 0);		
}

BOOL towardsY(CGPoint target, CGPoint location, CGPoint vel) {
	return (target.y > location.y && vel.y > 0) || (target.y < location.y && vel.y < 0);		
}

CGPoint SXetX(CGPoint v1, float x){
	v1 = CGPointMake(x,v1.y);
	return v1;
}

CGPoint SXOffsetX(CGPoint v1, float x){
	v1 = CGPointMake(v1.x+x,v1.y);
	return v1;
}

CGPoint SYOffsetY(CGPoint v1, float y){
	v1 = CGPointMake(v1.x,v1.y+y);
	return v1;
}


CGPoint SYetY(CGPoint v1, float y){
	v1 = CGPointMake(v1.x,y);
	return v1;
}

CGPoint IXncreaseX(CGPoint v1, float xv){
	v1 = CGPointMake(v1.x+xv,v1.y);
	return v1;
}

CGPoint IYncreaseY(CGPoint v1, float yv){
	v1 = CGPointMake(v1.x,v1.y+yv);
	return v1;
}
