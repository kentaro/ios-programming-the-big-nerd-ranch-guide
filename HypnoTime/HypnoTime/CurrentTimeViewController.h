//
//  CurrentTimeViewController.h
//  HypnoTime
//
//  Created by 栗林健太郎 on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentTimeViewController : UIViewController
{
    IBOutlet UILabel *timeLabel;
}
- (IBAction)showCurrentTIme:(id)sender;

@end
