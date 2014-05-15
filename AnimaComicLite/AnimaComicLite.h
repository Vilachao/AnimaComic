//
//  AnimaComicLite.h
//  AnimaComicLite
//
//  Created by Jose Maria on 29/04/14.
//  Copyright (c) 2014 Kometasoft. All rights reserved.
//

#import <Automator/AMBundleAction.h>

@interface AnimaComicLite : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
