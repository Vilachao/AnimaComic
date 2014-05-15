//
//  ACTableViewCell.m
//  AnimaComic
//
//  Created by Jose Maria on 13/05/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import "ACTableViewCell.h"

@implementation ACTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
    

}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)cambiaFiltro:(id)sender {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:self.nombreCategoria.text forKey:@"categoria"];
    if(self.cambioCategoria.on){
        [center postNotificationName:@"addFiltro" object:self userInfo:userInfo];
    }else{
        [center postNotificationName:@"remFiltro" object:self userInfo:userInfo];
    }
}

@end
