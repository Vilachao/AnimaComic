//
//  ACdetalleExpositoresViewController.m
//  AnimaComic
//
//  Created by Jose Maria on 22/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import "ACdetalleExpositoresViewController.h"
#import "ACexpositoresViewController.h"
#import "MBProgressHUD.h"
#import "ANWsclassService.h"
#import "ACAppDelegate.h"
#import "Expositor.h"
#import "MBProgressHUD.h"

#define EXPOSITOR @"http://animacomic.kometasoft.com/public/images/expositor/"
#define ACTIVIDAD @"http://animacomic.kometasoft.com/public/images/actividad"

@interface ACdetalleExpositoresViewController ()

@end

@implementation ACdetalleExpositoresViewController

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
    
[self.navigationItem setHidesBackButton:YES animated:YES];
    
    if(self.expositor!=nil){
        self.textoExpositor.text=self.expositor.descripcion;
        self.nombreExpositor.text=self.expositor.nombre;
        self.webExpositor.text=self.expositor.web;
        NSString *urlString = [NSString stringWithFormat:@"%@%@",EXPOSITOR,self.expositor.rutaLogo];
        NSURL *url = [NSURL URLWithString:urlString];
        UIImage *img = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:url]];
        if(img==nil)
        {
            img = [UIImage imageNamed:@"imagenLocal"];
        }
            self.imagenExpositor.image = img;
    
    }

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


- (IBAction)callButton:(id)sender {
    NSString * telefono = [NSString stringWithFormat:@"telprompt://%@",self.expositor.telefono];
    NSURL *phoneNumber = [NSURL URLWithString:telefono];
    [[UIApplication sharedApplication] openURL:phoneNumber];
}

- (IBAction)mailButton:(id)sender {
    
    
    NSString * email = [NSString stringWithFormat:@"mailto:%@",self.expositor.correo];
    
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (IBAction)facebookButton:(id)sender {
    
    NSString * facebook = [NSString stringWithFormat:@"%@",self.expositor.facebook];
    NSURL *url =[NSURL URLWithString:@"http://canalsurradio.rtva.stream.flumotion.com/rtva/canalsurradio_master.mp3.m3u"];
}

- (IBAction)twitterButton:(id)sender {
}

@end
