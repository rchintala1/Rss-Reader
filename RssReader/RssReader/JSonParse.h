//
//  JSonParse.h
//  RssReader
//
//  Created by ramesh chandra on 6/18/15.
//  Copyright © 2015 ramesh chandra. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface JSonParse : NSObject
-(NSMutableArray *)parse:(NSDictionary *)response;
-(NSString*)checkRSS:(NSString*)string;
@end

