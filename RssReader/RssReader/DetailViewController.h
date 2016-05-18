//
//  DetailViewController.h
//  RssReader
//
//  Created by ramesh chandra on 6/18/15.
//  Copyright © 2015 ramesh chandra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *Link;
- (IBAction)goWebsite:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *RSSTitle;
@property (weak, nonatomic) IBOutlet UIImageView *largeImageView;
@property (weak, nonatomic) IBOutlet UITextView *Detail;
@property(strong, nonatomic) NSDictionary *resiveDetail;
@property(strong, nonatomic) UIImage *resiveIMAGE;
@end
