//
//  videoFeed.h
//  dyson
//
//  Created by Neil Morton on 08/09/2016.
//  Copyright © 2016 Progress Concepts Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ImageUpdatedEvent)();

@interface VideoFeed : NSObject

@property (strong, nonatomic)NSString *videoIPAddress;
@property (strong, nonatomic)NSString *videoURLString;
@property (strong, nonatomic)NSURL *videoURL;
@property (strong, nonatomic)NSURLSession* videoSession;
@property (strong, nonatomic)NSString* dysonID;
@property (strong, nonatomic)NSURLSessionDownloadTask *downloadPhotoTask;
@property (strong, nonatomic)UIImage *videoImage;

-(void)setupVideoFeed:(NSString*)IPAddress
    imageUpdatedEvent:(ImageUpdatedEvent)imageUpdatedEvent;
    
@end
