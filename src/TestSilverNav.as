package
{
   import common.HalcyonCanvas;
   import common.TweenedButton;
   import common.UiEvent;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [SWF(width="1280", height="800")]
   public class TestSilverNav extends Sprite
   {
      private var _screenWidth:Number = 1280;
      private var _screenHeight:Number = 800;
      private var _canvas:HalcyonCanvas;
      private var _bg:McBg;
      private var _logo:McLogo;
      private var _bottomSilverNavGroup:BottomSiverNavGroup;
      private var _chatWindow:ChatWindow;
      private var _connectSubMenu:ConnectSubMenu;
      private var _inviteSubMenu:InviteSubMenu;
      private var _shareSubMenu:ShareSubMenu;
      private var _iMeetControlsSubMenu:IMeetControlsSubMenu;
      
      public function TestSilverNav()
      {
         _canvas = new HalcyonCanvas(this, _screenWidth, _screenHeight);
         _bg = new McBg();
         _canvas.prepareElementAndPosition(_bg, 0, 0, 0, 0);
         _logo = new McLogo();
         _canvas.prepareElementAndPosition(_logo, 30, NaN, 30, NaN);
         _chatWindow = new ChatWindow(300, 300);
         _canvas.prepareElementAndPosition(_chatWindow, NaN, 45, 5, NaN);
         _bottomSilverNavGroup = new BottomSiverNavGroup(_canvas, 1280, 75);
         _canvas.prepareElementAndPosition(_bottomSilverNavGroup, NaN, 0, 0, 0);
         _connectSubMenu = new ConnectSubMenu();
         _canvas.prepareElementAndPosition(_connectSubMenu, NaN, 85, 430, NaN);
         _connectSubMenu.visible = false;
         
         _inviteSubMenu = new InviteSubMenu();
         _canvas.prepareElementAndPosition(_inviteSubMenu, NaN, 85, 560, NaN);
         _inviteSubMenu.visible = false;
         
         _shareSubMenu = new ShareSubMenu();
         _canvas.prepareElementAndPosition(_shareSubMenu, NaN, 85, 650, NaN);
         _shareSubMenu.visible = false;
         
         _iMeetControlsSubMenu = new IMeetControlsSubMenu();
         _canvas.prepareElementAndPosition(_iMeetControlsSubMenu, NaN, 55, 1050, NaN);
         _iMeetControlsSubMenu.visible = false;
         
         _bottomSilverNavGroup.addEventListener(BottomSiverNavGroup.BUTTON_CLICK, onBottomSliderNavGroupButtonClick, false, 0, true);
         _bg.addEventListener(MouseEvent.CLICK, hideAllSubMenus, false, 0, true);
         _connectSubMenu.addEventListener(ConnectSubMenu.MENU_CLICK, onMenuClick, false, 0, true);
         _inviteSubMenu.addEventListener(InviteSubMenu.MENU_CLICK, onMenuClick, false, 0, true);
         _shareSubMenu.addEventListener(ShareSubMenu.MENU_CLICK, onMenuClick, false, 0, true);
         _iMeetControlsSubMenu.addEventListener(IMeetControlsSubMenu.MENU_CLICK, onMenuClick, false, 0, true);
         
         this.addChild(_canvas);
      }
      
      private function hideAllSubMenus(event:Event = null):void {
         _connectSubMenu.visible = false;
         _inviteSubMenu.visible = false;
         _shareSubMenu.visible = false;
         _iMeetControlsSubMenu.visible = false;
      }
      
      private function onMenuClick(uiEvent:UiEvent):void {
         hideAllSubMenus();
         if(uiEvent.object is McVideoDarkIcon) {
            trace("Turn on webcam menu item clicked");
         } else if(uiEvent.object is McMuteMicDarkIcon) {
            trace("Connect Audio menu item clicked");
         } else if(uiEvent.object is McContactsDarkIcon) {
            trace("My Contacts menu item clicked");
         } else if(uiEvent.object is McInviteDarkIcon) {
            trace("Send Invite menu item clicked");
         } else if(uiEvent.object is McCallGuestDarkIcon) {
            trace("Call a guest menu item clicked");
         } else if(uiEvent.object is McShareDarkIcon) {
            trace("Share a file menu item clicked");
         } else if(uiEvent.object is McScreenShareDarkIcon) {
            trace("Share my screen menu item clicked");
         } else if(uiEvent.object is McLockDarkIcon) {
            trace("Lock iMeet menu item clicked");
         } else if(uiEvent.object is McMuteDarkIcon) {
            trace("Mute guests menu item clicked");
         } else if(uiEvent.object is McEndMeetingDarkIcon) {
            trace("End iMeet menu item clicked");
         } 
      }
      
      private function onBottomSliderNavGroupButtonClick(uiEvent:UiEvent):void {
         var tweenedButton:TweenedButton = uiEvent.object as TweenedButton;
         if(tweenedButton != null) {
            if(tweenedButton.icon is McConnectBtn) {
               _connectSubMenu.visible = !_connectSubMenu.visible;
               _inviteSubMenu.visible = false;
               _shareSubMenu.visible = false;
               _iMeetControlsSubMenu.visible = false;
            } else if(tweenedButton.icon is McInviteBtn) {
               _inviteSubMenu.visible = !_inviteSubMenu.visible;
               _connectSubMenu.visible = false;
               _shareSubMenu.visible = false;
               _iMeetControlsSubMenu.visible = false;
            } else if(tweenedButton.icon is McShareBtn) {
               _shareSubMenu.visible = !_shareSubMenu.visible;
               _connectSubMenu.visible = false;
               _inviteSubMenu.visible = false;
               _iMeetControlsSubMenu.visible = false;
            } else if(tweenedButton.icon is McRoomMenuBtn) {
               _iMeetControlsSubMenu.visible = !_iMeetControlsSubMenu.visible;        
               _connectSubMenu.visible = false;
               _inviteSubMenu.visible = false;
               _shareSubMenu.visible = false;
            }
         }
      }
   }
}