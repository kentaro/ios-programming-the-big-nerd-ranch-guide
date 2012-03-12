//
//  ItemDetailViewController.h
//  Homepwner
//
//  Created by 栗林健太郎 on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Possession.h"

@interface ItemDetailViewController : UIViewController
<UINavigationControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *serialNumberField;
@property (strong, nonatomic) IBOutlet UITextField *valueField;
@property (strong, nonatomic) IBOutlet UILabel *dataField;
@property (strong, nonatomic) Possession *possession;

@end
