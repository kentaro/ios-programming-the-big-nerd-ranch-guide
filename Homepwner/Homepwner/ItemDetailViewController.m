//
//  ItemDetailViewController.m
//  Homepwner
//
//  Created by 栗林健太郎 on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageStore.h"
#import "ItemDetailViewController.h"

@implementation ItemDetailViewController
@synthesize nameField;
@synthesize serialNumberField;
@synthesize valueField;
@synthesize dataField;
@synthesize possession;
@synthesize imageView;

- (void) viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [nameField setText:[possession possessionName]];
    [serialNumberField setText:[possession serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d", [possession valueInDollars]]];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    [dataField setText:[dateFormatter stringFromDate:[possession dateCreated]]];
    [[self navigationItem] setTitle:[possession possessionName]];

    NSString *imageKey = [possession imageKey];
    if (imageKey) {
        UIImage *imageToDisplay = [[ImageStore defaultImageStore] imageForKey:imageKey];
        [imageView setImage:imageToDisplay];
    }
    else {
        [imageView setImage:nil];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[self view] endEditing:YES];
    
    [possession setPossessionName:[nameField text]];
    [possession setSerialNumber:[serialNumberField text]];
    [possession setValueInDollars:[[valueField text] intValue]];
}

- (void)viewDidUnload {
    [self setNameField:nil];
    [self setSerialNumberField:nil];
    [self setValueField:nil];
    [self setDataField:nil];
    [self setPossession:nil];
    [self setImageView:nil];
    [super viewDidUnload];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)backgroundTapped:(id)sender
{
    [[self view] endEditing:YES];
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    [self presentModalViewController:imagePicker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *oldKey = [possession imageKey];
    if (oldKey) {
        [[ImageStore defaultImageStore] deleteImageForKey:oldKey];
    }
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    [possession setImageKey:(__bridge NSString *)newUniqueIDString];

    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);

    [[ImageStore defaultImageStore] setImage:image
                                      forKey:[possession imageKey]];


    [imageView setImage:image];
    [self dismissModalViewControllerAnimated:YES];
}

@end
