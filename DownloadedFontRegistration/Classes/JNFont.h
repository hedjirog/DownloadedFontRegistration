//
//  JNFont.h
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JNFont : NSObject <NSCopying>

@property (nonatomic, copy, readonly) NSString *displayName;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSURL *downloadURL;
@property (nonatomic, copy, readonly) NSString *unzippedDir;
@property (nonatomic, copy, readonly) NSString *unzippedFile;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (BOOL)registerDownloadedFile;

@end
