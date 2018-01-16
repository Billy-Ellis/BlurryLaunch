//BlurryLaunch

//Created by Billy Ellis @bellis1000

//If you are using this source code for your own tweak, please credit me ;)

/* I wrote this nearly 3 years ago, so sorry if the code is terrible */

float red = 92/255;
float green = 225;
float blue = 255;

float alpha = 0.35;

float duration = 0.5;

static UIWindow *contentWindow = nil;

%hook SBIconController

//method for when an app icon is tapped

-(void)iconWasTapped:(id)fp8{

NSMutableDictionary *prefsStrength = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.uprisecreations.blurrylaunch.plist"];

NSInteger integer2 = [[prefsStrength objectForKey:@"StrengthList"] intValue];

if (integer2 == 1){

alpha = 0.35;

}

if (integer2 == 2){

alpha = 0.5;

}

if (integer2 == 3){

alpha = 1.0;

}

//theme selection

NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.uprisecreations.blurrylaunch.plist"];

NSInteger integer = [[prefs objectForKey:@"ThemeList"] intValue];

if (integer == 1){

red = 92/255;
green = 225;
blue = 255;

}

if (integer == 2){

red = 53;
green = 253;
blue = 99;

}

if (integer == 3){

red = 0;
green = 0;
blue = 0;

}

if (integer == 4){

red = 252;
green = 53;
blue = 232;
}

if (integer == 5){

red = 252;
green = 52;
blue = 80;

}

if (integer == 6){

red = 212;
green = 252;
blue = 53;

}

if (integer == 7){

red = 40;
green = 41;
blue = 36;

}

if (integer == 8){

red = 75;
green = 50;
blue = 205;

}

if (integer == 9){

red = 17;
green = 243;
blue = 173;

}


NSMutableDictionary *prefs5 = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.uprisecreations.blurrylaunch.plist"];

NSInteger integer6 = [[prefs5 objectForKey:@"DurationList"] intValue];

if (integer6 == 1){

duration = 0.3;


}

if (integer6 == 2){

duration = 0.5;

}

if (integer6 == 3){

duration = 1.0;

}

//enables the tweak (Enable/Disable switch in settings)

NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/Library/Preferences/%@",NSHomeDirectory(),@"com.uprisecreations.blurrylaunchsettings.plist"]];

NSNumber* shouldNotify = [settings objectForKey:@"AwesomeSwitch1"];

if ([shouldNotify boolValue] == YES)

{

if (!contentWindow) {

//works for all screen sizes

contentWindow = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,2048,2048)];

contentWindow.backgroundColor = [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:alpha];

contentWindow.windowLevel = UIWindowLevelStatusBar;

contentWindow.hidden = NO;

         UIVisualEffect *blurEffect;
blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];

UIVisualEffectView *visualEffectView;
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = contentWindow.bounds;
[contentWindow addSubview:visualEffectView];



[self performSelector:@selector(fadeOut) withObject:nil afterDelay:duration];

}
}

%orig;

}

%new

-(void)fadeOut{

        contentWindow.alpha = 1;
                 [UIView beginAnimations:nil context:nil];
                 
                 [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                 [UIView setAnimationDelegate:self];
                 
                 [UIView setAnimationDuration:0.5];
                 
                 contentWindow.alpha = 0;
                 
                 [UIView commitAnimations];
                 
                [self performSelector:@selector(hide) withObject:nil afterDelay:0.6];

}

%new

-(void)hide{

contentWindow.hidden = YES;
contentWindow = nil;

}

%end
