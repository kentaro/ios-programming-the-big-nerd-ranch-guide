//
//  MapPoint.m
//  Whereami
//
//  Created by 栗林健太郎 on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

@synthesize coordinate, title;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];

    if (self) {
        coordinate = c;
        [self setTitle:t];
    }

    return self;
}

@end
