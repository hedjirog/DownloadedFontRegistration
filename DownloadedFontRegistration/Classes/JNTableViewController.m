//
//  JNMasterViewController.m
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "JNTableViewController.h"

#import "JNTextViewController.h"

@interface JNTableViewController ()

@property (nonatomic, strong) NSArray *downloadedFonts;
@property (nonatomic, strong) NSArray *systemFonts;

@end

@implementation JNTableViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];

    if ([segue.identifier isEqualToString:kDownloadedFontPushSegueIdentifier]) {
        NSString *fontDisplayName = [self.downloadedFonts objectAtIndex:selectedIndexPath.row][ @"Display Name" ];
        NSString *fontName = [self.downloadedFonts objectAtIndex:selectedIndexPath.row][ @"Name" ];

        [(JNTextViewController *)segue.destinationViewController setFontDisplayName:fontDisplayName];
        [(JNTextViewController *)segue.destinationViewController setFontName:fontName];
    }
    else if ([segue.identifier isEqualToString:kSystemFontPushSegueIdentifier]) {
        NSString *fontDisplayName = [self.systemFonts objectAtIndex:selectedIndexPath.row][ @"Display Name" ];
        NSString *fontName = [self.systemFonts objectAtIndex:selectedIndexPath.row][ @"Name" ];

        [(JNTextViewController *)segue.destinationViewController setFontDisplayName:fontDisplayName];
        [(JNTextViewController *)segue.destinationViewController setFontName:fontName];
    }
}

#pragma mark - Properties

- (NSArray *)downloadedFonts
{
    if (_downloadedFonts != nil) {
        return _downloadedFonts;
    }

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DownloadedFonts" ofType:@"plist"];
    self.downloadedFonts = [[NSArray alloc] initWithContentsOfFile:filePath];

    return _downloadedFonts;
}

- (NSArray *)systemFonts
{
    if (_systemFonts != nil) {
        return _systemFonts;
    }

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SystemFonts" ofType:@"plist"];
    self.systemFonts = [[NSArray alloc] initWithContentsOfFile:filePath];

    return _systemFonts;
}

#pragma mark - UITableDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [self.downloadedFonts count];
    }
    if (section == 1) {
        return [self.systemFonts count];
    }

    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Downloaded Fonts";
    }
    if (section == 1) {
        return @"System Fonts";
    }

    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;

    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:kDownloadedFontCellIdentifier forIndexPath:indexPath];
    }
    if (indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:kSystemFontCellIdentifier forIndexPath:indexPath];
    }

    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        cell.textLabel.text = [self.downloadedFonts objectAtIndex:indexPath.row][ @"Display Name" ];
    }
    if (indexPath.section == 1) {
        cell.textLabel.text = [self.systemFonts objectAtIndex:indexPath.row][ @"Display Name" ];
    }
}

@end
