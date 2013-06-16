//
//  JNUnzipManager.h
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JNUnzipManager : NSObject

+ (BOOL)unzipFileAtPath:(NSString *)path;

@end
