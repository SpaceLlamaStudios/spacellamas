//
//  SLViewController.m
//  SpaceLlamas
//
//  Created by Elsie Ng on 2013-06-13.
//  Copyright (c) 2013 Space Llama Studios. All rights reserved.
//

#import "SLViewController.h"
#import "SLTitleScene.h"

@implementation SLViewController

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
	if (!skView.scene){
		skView.showsFPS = NO;
		skView.showsNodeCount = NO;
    
		// Create and configure the scene.
		SKScene * scene = [SLTitleScene sceneWithSize:skView.bounds.size];
		scene.scaleMode = SKSceneScaleModeAspectFill;
		
		// Present the scene.
		[skView presentScene:scene];
	}
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}
-(BOOL)prefersStatusBarHidden
{
	return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
