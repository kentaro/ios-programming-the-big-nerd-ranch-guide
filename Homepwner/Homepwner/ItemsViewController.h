//
//  ItemsViewController.h
//  Homepwner
//
//  Created by 栗林健太郎 on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
}

- (UIView *)headerView;
- (IBAction)addNewPossession:(id)sender;
- (IBAction)toggleEditingMode:(id)sender;

@end
