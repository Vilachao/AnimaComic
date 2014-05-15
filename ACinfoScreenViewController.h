//
//  ACinfoScreenViewController.h
//  AnimaComic
//
//  Created by Jose Maria on 11/03/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACinfoScreenViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UIButton *mailButton;
@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)callAction:(id)sender;
- (IBAction)mailAction:(id)sender;


@end
