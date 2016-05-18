//
//  customTableViewCell.h
//  RssReader
//
//  Created by ramesh chandra on 6/18/15.
//  Copyright © 2015 ramesh chandra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *RssImageView;
@property (weak, nonatomic) IBOutlet UILabel *RssTitle;
@property (weak, nonatomic) IBOutlet UILabel *RssShortDetail;

@end
