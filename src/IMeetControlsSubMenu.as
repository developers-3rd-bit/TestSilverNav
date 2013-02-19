package
{
   import common.HalcyonCanvas;
   import common.HalcyonSubMenuLabel;
   import common.HalcyonVGroup;
   import common.UiEvent;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class IMeetControlsSubMenu extends Sprite
   {
      public static const MENU_CLICK:String = "menuClick";
      
      private var _vGroup:HalcyonVGroup;
      private var _mcSubMenuBg:McSubMenu;
      private var _menuItem1HGroup:SubMenuHGroup;
      private var _mcLockIMeet:McLockDarkIcon;
      private var _mcLockIMeetLabel:HalcyonSubMenuLabel;
      private var _mcDivider1:McSubMenuDivLine;
      private var _menuItem2HGroup:SubMenuHGroup;
      private var _mcMuteGuests:McMuteDarkIcon;
      private var _mcMuteGuestsLabel:HalcyonSubMenuLabel;
      private var _mcDivider2:McSubMenuDivLine;
      private var _menuItem3HGroup:SubMenuHGroup;
      private var _mcEndMeeting:McEndMeetingDarkIcon;
      private var _mcEndMeetingLabel:HalcyonSubMenuLabel;
      
      public function IMeetControlsSubMenu()
      {
         super();
         _mcSubMenuBg = new McSubMenu();
         _mcSubMenuBg.width = 155;
         _mcSubMenuBg.height = 140;
         this.addChild(_mcSubMenuBg);
         
         _vGroup = new HalcyonVGroup(this, 155, 140);
         _menuItem1HGroup = new SubMenuHGroup(this, 140, 40);
         _menuItem1HGroup.horizontalgap = 7;
         _menuItem1HGroup.paddingLeft = 15;
         _menuItem1HGroup.paddingTop = 10;
         _mcLockIMeet = new McLockDarkIcon();
         _menuItem1HGroup.addChild(_mcLockIMeet);
         _mcLockIMeetLabel = new HalcyonSubMenuLabel("LOCK iMEET");
         _menuItem1HGroup.addChild(_mcLockIMeetLabel);
         _vGroup.addChild(_menuItem1HGroup);
         _mcDivider1 = new McSubMenuDivLine();
         _mcDivider1.width = 155;
         _vGroup.addChild(_mcDivider1);
         
         _menuItem2HGroup = new SubMenuHGroup(this, 140, 40);
         _menuItem2HGroup.horizontalgap = 3;
         _menuItem2HGroup.paddingLeft = 11;
         _menuItem2HGroup.paddingTop = 4;
         _mcMuteGuests = new McMuteDarkIcon();
         _menuItem2HGroup.addChild(_mcMuteGuests);
         _mcMuteGuestsLabel = new HalcyonSubMenuLabel("MUTE GUESTS");
         _menuItem2HGroup.addChild(new HalcyonCanvas(this).prepareElementAndPosition(_mcMuteGuestsLabel, 45)); // Had to do this way, the icon;s level and label's level was not the same
         _vGroup.addChild(_menuItem2HGroup);
         _mcDivider2 = new McSubMenuDivLine();
         _mcDivider2.width = 155;
         _vGroup.addChild(_mcDivider2);
         
         _menuItem3HGroup = new SubMenuHGroup(this, 140, 40);
         _menuItem3HGroup.horizontalgap = 7;
         _menuItem3HGroup.paddingLeft = 15;
         _menuItem3HGroup.paddingTop = 10;
         _mcEndMeeting = new McEndMeetingDarkIcon();
         _menuItem3HGroup.addChild(_mcEndMeeting);
         _mcEndMeetingLabel = new HalcyonSubMenuLabel("END iMEET");
         _menuItem3HGroup.addChild(_mcEndMeetingLabel);
         _vGroup.addChild(_menuItem3HGroup);
         
         _menuItem1HGroup.addEventListener(MouseEvent.CLICK, onMouseClick, false, 0, true);
         _menuItem2HGroup.addEventListener(MouseEvent.CLICK, onMouseClick, false, 0, true);
         _menuItem3HGroup.addEventListener(MouseEvent.CLICK, onMouseClick, false, 0, true);
         
         this.addChild(_vGroup);
      }
      
      private function onMouseClick(event:Event):void {
         var uiEvent:UiEvent = new UiEvent(MENU_CLICK);
         uiEvent.object = (event.currentTarget as SubMenuHGroup).getChildAt(0);
         dispatchEvent(uiEvent);
      }
   }
}