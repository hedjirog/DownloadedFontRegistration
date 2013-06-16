//
//  UIFont+Additions.m
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "UIFont+Additions.h"

@implementation UIFont (Additions)

+ (BOOL)fontExistsOfName:(NSString *)fontName
{
    for (NSString *fn in [UIFont familyNames]) {
        for (NSString *n in [UIFont fontNamesForFamilyName:fn]) {
            if ([fontName isEqualToString:n]) {
                return YES;
            }
        }
    }
    return NO;
}

@end
