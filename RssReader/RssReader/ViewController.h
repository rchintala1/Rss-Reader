//
//  ViewController.h
//  RssReader
//
//  Created by ramesh chandra on 6/18/15.
//  Copyright © 2015 ramesh chandra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "connection.h"
#import "JSonParse.h"

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,ChildDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextField *RSSValueTextBox;
@property (strong, nonatomic) connection * rssCon;
@property (strong,nonatomic) NSMutableArray * detail;
- (IBAction)RssButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *RssFeedTable;
@property(strong, nonatomic) NSMutableArray *sendDetail;


@end

