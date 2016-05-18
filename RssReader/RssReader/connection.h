//
//  connection.h
//  RssReader
//
//  Created by ramesh chandra on 6/18/15.
//  Copyright © 2015 ramesh chandra. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChildDelegate;


@interface connection : NSObject
@property (nonatomic, weak) id<ChildDelegate> delegate;
-(void)connect:( NSString*)RSS and: (int)startCount;
@end

@protocol ChildDelegate <NSObject>

-(void)reload:(NSMutableArray*)array and:(BOOL) flag;
@end