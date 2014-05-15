//
//  ACmapaComicViewController.m
//  AnimaComic
//
//  Created by Jose Maria on 22/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import "ACmapaComicViewController.h"

@interface ACmapaComicViewController ()

@end

@implementation ACmapaComicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#ifdef LITE
    
    self.vistaProximamente.hidden=NO;
    self.vistaNegra.hidden=NO;

#else
    
     NSURL *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"mapa" ofType:@"html"]];
    self.vistaProximamente.hidden=YES;
    self.vistaNegra.hidden=YES;
   
    [self.webViewMapa loadRequest:[NSURLRequest requestWithURL:htmlFile]];
  #endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
