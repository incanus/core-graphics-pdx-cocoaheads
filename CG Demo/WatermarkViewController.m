//
//  WatermarkViewController.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "WatermarkViewController.h"

@implementation WatermarkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Basic #3";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Watermark"
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(watermarkImage:)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    self.view.backgroundColor = [UIColor darkGrayColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if ( ! [self.view.subviews count])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        imagePicker.delegate = self;
        
        [self.navigationController presentModalViewController:imagePicker animated:YES];
    }
}

#pragma mark -

- (void)watermarkImage:(id)sender
{
    UIImageView *imageView = [self.view.subviews objectAtIndex:0];
    
    UIImage *originalImage = imageView.image;
    
    UIGraphicsBeginImageContext(originalImage.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0, -originalImage.size.height);
    
    CGRect drawRect = CGRectMake(0, 0, originalImage.size.width, originalImage.size.height);
    
    CGContextDrawImage(context, drawRect, [originalImage CGImage]);
    
    CGContextSetAlpha(context, 0.25);
    
    UIImage *watermarkImage = [UIImage imageNamed:@"watermark.png"];
    
    CGContextDrawImage(context, drawRect, [watermarkImage CGImage]);
    
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    UIGraphicsEndImageContext();
}

#pragma mark -

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    [[[UIAlertView alloc] initWithTitle:@"Watermarked Image Saved" 
                                message:@"A watermarked image was saved to the camera roll." 
                               delegate:nil 
                      cancelButtonTitle:nil 
                      otherButtonTitles:@"OK", nil] show];
}

#pragma mark -

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:imageView];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.navigationController dismissModalViewControllerAnimated:YES];

    self.navigationItem.rightBarButtonItem.enabled = YES;
}

@end