//
//  connection.m
//  RssReader
//
//  Created by ramesh chandra on 6/18/15.
//  Copyright © 2015 ramesh chandra. All rights reserved.
//

#import "connection.h"
#import <AFNetworking/AFNetworking.h>
#import "JSonParse.h"


@implementation connection

-(void)connect:( NSString*)RSS and: (int)startCount{
    
    id<ChildDelegate> strongDelegate = self.delegate;
    JSonParse *obj=[[JSonParse alloc]init];

    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat: @"https://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=%@&start=%zd",RSS,startCount]];
    NSMutableURLRequest *request = [[NSURLRequest requestWithURL:URL] mutableCopy];
    if (![[AFNetworkReachabilityManager sharedManager] isReachable]) {
        [request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
    }
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSCachedURLResponse *cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:operation.response data:operation.responseData];
        [[NSURLCache sharedURLCache] storeCachedResponse:cachedResponse forRequest:request];
       
        NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData: responseObject options: NSJSONReadingMutableContainers error: nil];
        
        
      //  NSLog(@"%@",jsonArray);
       
        
        if ([strongDelegate respondsToSelector:@selector(reload:and:)]) {
            
            if (startCount<12 && [obj parse:jsonArray]!=nil) {
                       [self connect:RSS and:(startCount+4)];
            }
            [strongDelegate reload:[obj parse:jsonArray] and:true ];
            
        }
      
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
      
 
        if ([strongDelegate respondsToSelector:@selector(reload:and:)]) {
            
           
            [strongDelegate reload:nil and:false ];
        }

        
    }];
    [[NSOperationQueue mainQueue] addOperation:op];

}


@end
