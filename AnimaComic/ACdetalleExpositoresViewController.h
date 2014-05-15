//
//  ACdetalleExpositoresViewController.h
//  AnimaComic
//
//  Created by Jose Maria on 22/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACexpositoresViewController.h"

@class Expositor;




@interface ACdetalleExpositoresViewController : UIViewController


@property (nonatomic, strong) Expositor *expositor;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UIButton *mailButton;
@property (weak, nonatomic) IBOutlet UIImageView *imagenExpositor;
@property (weak, nonatomic) IBOutlet UITextView *textoExpositor;
@property (weak, nonatomic) IBOutlet UILabel *webExpositor;
@property (weak, nonatomic) IBOutlet UIButton *faceButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UILabel *nombreExpositor;
- (IBAction)callButton:(id)sender;
- (IBAction)mailButton:(id)sender;
- (IBAction)facebookButton:(id)sender;
- (IBAction)twitterButton:(id)sender;

@end
