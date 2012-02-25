//
//  PossessionStore.m
//  Homepwner
//
//  Created by 栗林健太郎 on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PossessionStore.h"

static PossessionStore *defaultStore = nil;

@implementation PossessionStore

@synthesize allPossessions;

+ (PossessionStore *)defaultStore
{
    if (!defaultStore) {
        defaultStore = [[super allocWithZone:NULL] init];
    }
    
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init
{
    if (defaultStore) {
        return defaultStore;
    }
    else {    
        self = [super init];

        if (self) {
            allPossessions = [[NSMutableArray alloc] init];
        }

        return self;
    }
}

- (Possession *)createPossession
{
    Possession *p = [Possession randomPossession];
    [allPossessions addObject:p];
    return p;
}

- (void)removePossession:(Possession *)p
{
    [allPossessions removeObjectIdenticalTo:p];
}

- (void)movePossessionAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }
    
    Possession *p = [allPossessions objectAtIndex:from];
    [allPossessions removeObjectAtIndex:from];
    [allPossessions insertObject:p atIndex:to];
}

@end
