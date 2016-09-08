//
//  videoFeed.m
//  dyson
//
//  Created by Neil Morton on 08/09/2016.
//  Copyright © 2016 Progress Concepts Limited. All rights reserved.
//

#import "VideoFeed.h"


@implementation VideoFeed

-(void)setupVideoFeed:(NSString*)IPAddress
    imageUpdatedEvent:(ImageUpdatedEvent)imageUpdatedEvent
{
    _videoIPAddress = IPAddress;
    _videoURLString = [NSString stringWithFormat:@"http://%@:8080/frame.jpg", _videoIPAddress];
    NSLog(@"Build URL:%@",_videoURLString);
    //1
    _videoURL = [NSURL URLWithString:
                 _videoURLString];
    
    // 2
    if (!_videoSession) {
        NSLog(@"Video Session Setup");
        _videoSession = [NSURLSession sharedSession];
        _videoSession.configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        _videoSession.configuration.timeoutIntervalForResource = 1.0; // Keep download to 1 seconds
        _videoSession.configuration.timeoutIntervalForRequest = 1.0; // Need to sort this
        
    }
    
    [self getImageImageUpdatedEvent:imageUpdatedEvent];
}

-(void)restartVideoFeed:(ImageUpdatedEvent)imageUpdatedEvent
{
    [_downloadPhotoTask cancel];
    [self getImageImageUpdatedEvent:imageUpdatedEvent];
}

-(void)getImageImageUpdatedEvent:(ImageUpdatedEvent)imageUpdatedEvent
{
    // schedule fallback in case we loose connectivity
    [self performSelector:@selector(restartVideoFeed:)
               withObject:imageUpdatedEvent afterDelay:1.0];
    
    //NSLog(@"Get Image");
    _downloadPhotoTask = [_videoSession
                          downloadTaskWithURL:_videoURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                              // 3
                              
                              //NSLog(@"Error:%@",error.description);
                              if(error == nil){
                                  
                                  if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                      
                                      NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
                                      
                                      if (statusCode == 200) {
                                          // Should have data
                                          
                                          _videoImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                                          
                                          // Post Notification
                                          if (imageUpdatedEvent != nil) {
                                               dispatch_async(dispatch_get_main_queue(), ^{
                                                   imageUpdatedEvent();
                                               });
                                          }
                                      }
                                      
                                  }
                              }
                              
                              // cancel the above call (and any others on self)
                              [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(restartVideoFeed:) object:imageUpdatedEvent];
                              
                              [self getImageImageUpdatedEvent:imageUpdatedEvent];
                          }];
    
    // 4
    [_downloadPhotoTask resume];
    
}

@end
