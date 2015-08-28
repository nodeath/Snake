//
//  ViewController.h
//  Snake
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"

@interface ViewController : UIViewController<CanvasViewDataSource>

@property (weak, nonatomic) IBOutlet CanvasView *canvas;

- (IBAction)didClickStartButton:(id)sender;
@end

