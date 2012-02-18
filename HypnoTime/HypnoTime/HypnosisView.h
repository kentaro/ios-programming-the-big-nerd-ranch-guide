//
//  HypnosisView.h
//  Hypnosister
//
//  Created by 栗林健太郎 on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HypnosisView : UIView
{
    UIColor *stripeColor;
    float xShift, yShift;
}

@property (nonatomic, assign) float xShift;
@property (nonatomic, assign) float yShift;

@end
