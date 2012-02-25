//
//  PossessionStore.h
//  Homepwner
//
//  Created by 栗林健太郎 on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Possession.h"

@interface PossessionStore : NSObject

@property (nonatomic, strong) NSMutableArray *allPossessions;

+ (PossessionStore *)defaultStore;
- (Possession *)createPossession;
- (void) removePossession:(Possession *)p;
- (void) movePossessionAtIndex:(int)from
                       toIndex:(int)to;

@end
