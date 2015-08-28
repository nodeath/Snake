//
//  IntegerPoint.h
//  Snake
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

@import Foundation;
@import UIKit;


@interface IntegerPoint : NSObject<NSCopying>


+ (instancetype)pointWithX:(NSInteger)x
                         Y:(NSInteger)y;

+ (instancetype)pointWithCGPoint:(CGPoint)point;


- (instancetype)initWithX:(NSInteger)x
                        y:(NSInteger)y;

@property (nonatomic) NSInteger x;
@property (nonatomic) NSInteger y;

@end

