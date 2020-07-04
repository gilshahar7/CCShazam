#import <ControlCenterUIKit/CCUIToggleModule.h>

@interface CCShazam : CCUIToggleModule
{
  BOOL _selected;
}

@end

@interface SiriPresentationOptions : NSObject
@property (assign, nonatomic) BOOL wakeScreen;
@property (assign, nonatomic) BOOL hideOtherWindowsDuringAppearance;
@end

@interface AFApplicationInfo : NSObject
@property (nonatomic, copy) NSString *identifier;
@property (assign, nonatomic) NSInteger pid;
-(id)initWithCoder:(id)arg1;
@end

@interface SASRequestOptions : NSObject
@property (assign, nonatomic) CGFloat timestamp;
@property (assign, nonatomic) BOOL useAutomaticEndpointing;
@property (nonatomic, retain) NSArray *contextAppInfosForSiriViewController;
@property (nonatomic) double buttonDownTimestamp;
@property (nonatomic, assign) NSString *text;
-(id)initWithRequestSource:(NSInteger)arg1 uiPresentationIdentifier:(id)arg2;
@end

@interface SiriPresentationSpringBoardMainScreenViewController : UIViewController
-(oneway void)presentationRequestedWithPresentationOptions:(id)arg1 requestOptions:(id)arg2;
@end

@interface SBAssistantController {
	SiriPresentationSpringBoardMainScreenViewController* _mainScreenSiriPresentation;
}
+(BOOL)isAssistantVisible;
+(BOOL)isVisible;
+(id)sharedInstance;
-(BOOL)handleSiriButtonDownEventFromSource:(NSInteger)arg1 activationEvent:(NSInteger)arg2;
-(void)handleSiriButtonUpEventFromSource:(NSInteger)arg1;
-(void)dismissPluginForEvent:(NSInteger)arg1;
-(void)dismissAssistantViewIfNecessary;
@end
