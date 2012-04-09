//
//  ImageStore.m
//  Homepwner
//
//  Created by 栗林健太郎 on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageStore.h"

static ImageStore *defaultImageStore = nil;

@implementation ImageStore

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultImageStore];
}

+ (ImageStore *)defaultImageStore
{
    if (!defaultImageStore) {
        defaultImageStore = [[super allocWithZone:NULL] init];
    }
    
    return defaultImageStore;
}

- (id) init
{
    if (defaultImageStore) {
        return defaultImageStore;
    }
    
    self = [super init];
    if (self) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)setImage:(UIImage *)i forKey:(NSString *)s
{
    [dictionary setObject:i forKey:s];
}

- (UIImage *)imageForKey:(NSString *)s
{
    return [dictionary objectForKey:s];
}

- (void)deleteImageForKey:(NSString *)s
{
    if (!s) return;
    [dictionary removeObjectForKey:s];
}

@end
