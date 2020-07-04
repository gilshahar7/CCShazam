#include <substrate.h>
#import <objc/runtime.h>
#import "CCShazam.h"

@implementation CCShazam

//Return the icon of your module here
- (UIImage *)iconGlyph
{
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

//Return the color selection color of your module here
- (UIColor *)selectedColor
{
	return [UIColor blueColor];
}

- (BOOL)isSelected
{
  return _selected;
}

- (void)setSelected:(BOOL)selected
{
	_selected = selected;

  [super refreshState];

  if(_selected)
  {
    //Your module got selected, do something
		//Set up Siri
    SiriPresentationSpringBoardMainScreenViewController *presentation = MSHookIvar<SiriPresentationSpringBoardMainScreenViewController *>([objc_getClass("SBAssistantController") sharedInstance], "_mainScreenSiriPresentation");

    SiriPresentationOptions *presentationOptions = [[objc_getClass("SiriPresentationOptions") alloc] init];
    presentationOptions.wakeScreen = NO;
    presentationOptions.hideOtherWindowsDuringAppearance = NO;

    SASRequestOptions *requestOptions = [[objc_getClass("SASRequestOptions") alloc] initWithRequestSource:0 uiPresentationIdentifier:@"com.apple.siri.Siriland"];
    requestOptions.buttonDownTimestamp = requestOptions.timestamp;
    //Check whether we should enable or disable an alarm, and then relay it to Siri

    requestOptions.text = [NSString stringWithFormat:@"What song is this? bitch"];

    AFApplicationInfo *applicationInfo = [[objc_getClass("AFApplicationInfo") alloc] init];
    applicationInfo.pid = [NSProcessInfo processInfo].processIdentifier;
    applicationInfo.identifier = [NSBundle mainBundle].bundleIdentifier;
    requestOptions.contextAppInfosForSiriViewController = @[applicationInfo];

    //Actually present Siri
    [presentation presentationRequestedWithPresentationOptions:presentationOptions requestOptions:requestOptions];

		[self setSelected:NO];
  }
  else
  {
    //Your module got unselected, do something
  }
}

@end
