//
//  JNTextViewController.m
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "JNTextViewController.h"

#import "JNDownloadRequestOperation.h"
#import "JNUnzipManager.h"
#import "JNFont.h"

#import "UIFont+Additions.h"

@interface JNTextViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation JNTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = self.font.displayName;

    if ([UIFont fontExistsOfName:self.font.name]) {
        self.textView.font = [UIFont fontWithName:self.font.name size:16];
    } else {
        self.textView.alpha = 0.4;
        self.navigationItem.prompt = @"downloading...";

        NSURLRequest *request = [NSURLRequest requestWithURL:self.font.downloadURL];
        JNDownloadRequestOperation *operation = [[JNDownloadRequestOperation alloc] initWithRequest:request];

        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            self.navigationItem.prompt = @"unzipping...";

            if ([JNUnzipManager unzipFileAtPath:[(JNDownloadRequestOperation *)operation tempPath]]) {
                if ([self.font registerDownloadedFile]){
                    self.textView.font = [UIFont fontWithName:self.font.name size:16];
                    self.textView.alpha = 1.0;
                }
            }

            self.navigationItem.prompt = nil;
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Download error: %@", [error localizedDescription]);

            self.navigationItem.prompt = nil;
        }];
        
        [operation start];
    }
}

@end
