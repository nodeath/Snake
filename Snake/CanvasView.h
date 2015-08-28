//
//  CanvasView.h
//  Snake
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Snake.h"

@protocol CanvasViewDelegate;
@protocol CanvasViewDataSource;

@interface CanvasView : UIView

@property (weak, nonatomic) NSObject<CanvasViewDelegate> *delegate;
@property (weak, nonatomic) NSObject<CanvasViewDataSource> *dataSource;

@end


@protocol CanvasViewDataSource <NSObject>

- (Snake *)snake;
- (NSArray *)fruits;

@end

@protocol CanvasViewDelegate <NSObject>

@end