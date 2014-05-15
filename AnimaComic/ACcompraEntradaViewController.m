//
//  ACcompraEntradaViewController.m
//  AnimaComic
//
//  Created by Jose Maria on 21/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import "ACcompraEntradaViewController.h"

@interface ACcompraEntradaViewController ()

@end

@implementation ACcompraEntradaViewController

int respuestaServidor;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://animacomic.kometasoft.com/entrada/edit"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}


-(void) viewDidAppear:(BOOL)animated{
    NSURL *url = [NSURL URLWithString:@"http://animacomic.kometasoft.com/entrada/edit"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
