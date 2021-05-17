//
//  AppDelegate.m
//  Fractal Clock
//
//  Created by Yuji on 5/17/21.
//

#import "AppDelegate.h"
#import "../FractalClockView.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (strong) NSTimer *timer;
@property (strong) FractalClockView *clockView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.clockView=[[FractalClockView alloc] initWithFrame:self.window.contentView.frame isPreview:NO];
    self.clockView.autoresizingMask=NSViewWidthSizable|NSViewHeightSizable;
    [self.window.contentView addSubview:self.clockView];
    [self.clockView startAnimation];
    self.timer=[NSTimer scheduledTimerWithTimeInterval:self.clockView.animationTimeInterval target:self.clockView selector:@selector(animateOneFrame) userInfo:nil repeats:YES];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    [self.clockView stopAnimation];
}

-(IBAction) installScreenSaver:(id)sender
{
    NSString*saver=[[NSBundle mainBundle] pathForResource:@"FractalClock" ofType:@"saver"];
    [[NSWorkspace sharedWorkspace] openFile:saver];
}
@end
