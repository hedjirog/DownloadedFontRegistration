//
//  JNFont.m
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "JNFont.h"

@implementation JNFont

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    if (self) {
        _displayName = dictionary[@"display_name"];
        _name = dictionary[@"name"];
        _downloadURL = [NSURL URLWithString:dictionary[@"download_url"]];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    JNFont *font = [[[self class] allocWithZone:zone] init];
    
    font->_displayName = self.displayName;
    font->_name = self.name;
    font->_downloadURL = self.downloadURL;

    return font;
}

@end
