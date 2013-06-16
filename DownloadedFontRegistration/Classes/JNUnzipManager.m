//
//  JNUnzipManager.m
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "JNUnzipManager.h"

#import "SSZipArchive.h"

@implementation JNUnzipManager

+ (BOOL)unzipFileAtPath:(NSString *)path
{
    NSError *error = nil;

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destination = [[paths objectAtIndex:0] stringByAppendingPathComponent:kFontsDirectoryName];

    if ([SSZipArchive unzipFileAtPath:path toDestination:destination overwrite:YES password:nil error:&error]) {
        if (![[NSFileManager defaultManager] removeItemAtPath:path error:&error]) {
            NSLog(@"Remove error: %@", [error localizedDescription]);
        }

        return YES;
    } else {
        NSLog(@"Unzip error: %@", [error localizedDescription]);

        return NO;
    }
}

@end
