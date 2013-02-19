package
{
   import com.soma.ui.layouts.HBoxUI;
   
   import common.HalcyonCanvas;
   import common.HalcyonHGroup;
   import common.TweenedButton;
   import common.UiEvent;
   
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class BottomSiverNavGroup extends HalcyonCanvas
   {
      public static const BUTTON_CLICK:String = "buttonClick";
      
      private var _navBar:McNavBar;
      private var _leftButtonsGroup:HalcyonHGroup;
      private var _chatBtn:TweenedButton;
      private var _notesBtn:TweenedButton;
      private var _middleButtonsGroup:HalcyonHGroup;
      private var _connectBtn:TweenedButton;
      private var _inviteBtn:TweenedButton;
      private var _shareBtn:TweenedButton;
      private var _divider1:McDiv;
      private var _divider2:McDiv;
      private var _rightButtonsGroup:HalcyonHGroup;
      private var _roomMenuBtn:TweenedButton;
      private var _settingsBtn:TweenedButton;
      private var _helpBtn:TweenedButton;
      private var _bwBtn:TweenedButton;
      private var _preferredButtonWidth:Number = 32;
      private var _preferredButtonHieght:Number = 32;
      
      public function BottomSiverNavGroup(reference:DisplayObjectContainer, width:Number=15, height:Number=15)
      {
         super(reference, width, height);
         _navBar = new McNavBar();
         this.prepareElementAndPosition(_navBar, 0, 0, 0, 0);
         _leftButtonsGroup = new HalcyonHGroup(this);
         _leftButtonsGroup.horizontalgap = 10;
         _chatBtn = new TweenedButton(McChatBtn, _preferredButtonWidth, _preferredButtonHieght);
         _leftButtonsGroup.addChild(_chatBtn);
         _notesBtn = new TweenedButton(McNotesBtn, _preferredButtonWidth, _preferredButtonHieght);
         _leftButtonsGroup.addChild(_notesBtn);
         _middleButtonsGroup = new HalcyonHGroup(this);
         _middleButtonsGroup.paddingTop = -8;
         _middleButtonsGroup.horizontalgap = 20;
         _connectBtn = new TweenedButton(McConnectBtn, 86, 30, true);
         _inviteBtn = new TweenedButton(McInviteBtn, 59, 30, true);
         _shareBtn = new TweenedButton(McShareBtn, 61, 30, true);
         _divider1 = new McDiv();
         _divider2 = new McDiv();
         _middleButtonsGroup.addChild(_connectBtn);
         _middleButtonsGroup.addChild(_divider1);
         _middleButtonsGroup.addChild(_inviteBtn);
         _middleButtonsGroup.addChild(_divider2);
         _middleButtonsGroup.addChild(_shareBtn);
         _rightButtonsGroup = new HalcyonHGroup(this, 150);
         _rightButtonsGroup.horizontalgap = 10;
         _roomMenuBtn = new TweenedButton(McRoomMenuBtn, _preferredButtonWidth, _preferredButtonHieght);
         _rightButtonsGroup.addChild(_roomMenuBtn);
         _settingsBtn = new TweenedButton(McSettingsBtn, _preferredButtonWidth, _preferredButtonHieght);
         _rightButtonsGroup.addChild(_settingsBtn);
         _helpBtn = new TweenedButton(McHelpBtn, 22, _preferredButtonHieght);
         _rightButtonsGroup.addChild(_helpBtn);
         _bwBtn = new TweenedButton(McBwBtn, _preferredButtonWidth, 28);
         _rightButtonsGroup.addChild(_bwBtn);
         
         _chatBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _notesBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _connectBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _inviteBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _shareBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _roomMenuBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _settingsBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _helpBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _bwBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         
         this.prepareElementAndPosition(_leftButtonsGroup, 39, NaN, 20, NaN);
         this.prepareElementAndPosition(_middleButtonsGroup, 30, NaN, _navBar.width / 2 - 152, NaN);
         this.prepareElementAndPosition(_rightButtonsGroup, 39, NaN, NaN, 20);
      }
      
      private function onButtonClick(event:Event):void {
         var uiEvent:UiEvent = new UiEvent(BUTTON_CLICK);
         uiEvent.object = event.currentTarget;
         dispatchEvent(uiEvent);
      }
   }
}