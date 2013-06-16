//
//  JNFont.m
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "JNFont.h"
#import <CoreText/CoreText.h>

@implementation JNFont

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    if (self) {
        _displayName = dictionary[@"display_name"];
        _name = dictionary[@"name"];
        _downloadURL = [NSURL URLWithString:dictionary[@"download_url"]];
        _unzippedDir = dictionary[@"unzipped_dir"];
        _unzippedFile = dictionary[@"unzipped_file"];
    }
    return self;
}

- (BOOL)registerDownloadedFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fontPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:kFontsDirectoryName];
    fontPath = [fontPath stringByAppendingPathComponent:self.unzippedDir];
    fontPath = [fontPath stringByAppendingPathComponent:self.unzippedFile];

    if (![[NSFileManager defaultManager] fileExistsAtPath:fontPath]) {
        NSLog(@"Font file does not exist. %@", fontPath);
        return NO;
    }

    NSURL *url = [NSURL fileURLWithPath:fontPath];

    CFErrorRef cfError = NULL;
    BOOL success = CTFontManagerRegisterFontsForURL((__bridge CFURLRef)url, kCTFontManagerScopeNone, &cfError);
    if (!success) {
        NSError *error = (__bridge_transfer NSError*)cfError;
        NSLog(@"%@", [error localizedDescription]);
    }

    return success;
}

- (id)copyWithZone:(NSZone *)zone
{
    JNFont *font = [[[self class] allocWithZone:zone] init];
    
    font->_displayName = self.displayName;
    font->_name = self.name;
    font->_downloadURL = self.downloadURL;
    font->_unzippedDir = self.unzippedDir;
    font->_unzippedFile = self.unzippedFile;

    return font;
}

@end
