//
//  User.h
//  Objective-C-Foundation
//
//  Created by SpiColorPendra on 16/1/20.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic,copy) NSString* name;
@property (nonatomic,copy) NSString* pass;

- (instancetype)initWithName:(NSString*)aname pass:(NSString*)aPass;
- (void) say:(NSString*) content;
@end
