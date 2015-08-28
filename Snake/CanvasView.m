//
//  CanvasView.m
//  Snake
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import "CanvasView.h"

static CGFloat BlockSize = 5.0f;

@implementation CanvasView {
    CGPoint startPoint;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects perforsmance during animation.

-(void)awakeFromNib{
    [super awakeFromNib];
    startPoint = CGPointMake(0, 0);
}

- (void)drawRect:(CGRect)rect {
    Snake *snake = self.dataSource.snake;
    if(self.dataSource && snake){
        UIBezierPath *boundryPath = [UIBezierPath bezierPathWithRect:CGRectMake(startPoint.x, startPoint.y, snake.boundry.x*BlockSize + startPoint.x, snake.boundry.x*BlockSize + startPoint.y)];
        boundryPath.lineWidth = BlockSize;
        
        [boundryPath stroke];
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path setLineWidth:BlockSize];
        [path moveToPoint:CGPointMake([snake tail].x*BlockSize + startPoint.x, [snake tail].y*BlockSize + startPoint.y)];
        
        [[snake body] enumerateObjectsUsingBlock:^(IntegerPoint *point, NSUInteger idx, BOOL *stop) {
            if(idx > 0){
                [path addLineToPoint:CGPointMake(point.x*BlockSize + startPoint.x, point.y*BlockSize + startPoint.y)];
            }
        }];
        
        [path stroke];
    }
}


@end
