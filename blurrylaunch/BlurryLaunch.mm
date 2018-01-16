#import <Preferences/Preferences.h>



@protocol PreferencesTableCustomView
-(id)initWithSpecifier:(id)arg1;
@optional
-(CGFloat)preferredHeightForWidth:(CGFloat)arg1;
@end


@interface BlurryLaunchCustomCell : PSTableCell <PreferencesTableCustomView> {
    
    UILabel *label;
    UILabel *underLabel;
    UILabel *otherLabel;
}
@end

@implementation BlurryLaunchCustomCell
-(id)initWithSpecifier:(id)specifier {
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	
	CGRect frame = CGRectMake(0, -15, [[UIScreen mainScreen] bounds].size.width, 60);
	CGRect underFrame = CGRectMake(0, 24, [[UIScreen mainScreen] bounds].size.width, 60);

	
	label = [[UILabel alloc] initWithFrame:frame];
	[label setNumberOfLines:1];
	label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:56];
	[label setText:@"BlurryLaunch 2"];
	[label setBackgroundColor:[UIColor clearColor]];
	label.textColor = [UIColor colorWithRed:0.129 green:0.588 blue:0.953 alpha:1.0];
	label.textAlignment = NSTextAlignmentCenter;
	
	underLabel = [[UILabel alloc] initWithFrame:underFrame];
	[underLabel setNumberOfLines:1];
	underLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
	[underLabel setText:@"Created by Billy Ellis"];
	[underLabel setBackgroundColor:[UIColor clearColor]];
	underLabel.textColor = [UIColor grayColor];
	underLabel.textAlignment = NSTextAlignmentCenter;
	
	
	
	[self addSubview:label];
	[self addSubview:underLabel];
  
    }
    return self;
}

-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@interface BlurryLaunchListController: PSListController {
}
@end

@implementation BlurryLaunchListController

-(void)twittermethod{

[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.twitter.com/bellis1000"]];

}

-(void)youtubemethod{


[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://YouTube.com/user/pr0hacks2014"]];

}

-(void)respring{

system("killall -9 SpringBoard");


}

-(void)help{

UIAlertView *help = [[UIAlertView alloc]initWithTitle:@"Help" message:@"If the tweak is not working, try disabling and re-enabling it. If it still doesn't work, try rebooting or reinstalling the tweak." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];

[help show];

}
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"BlurryLaunch" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
