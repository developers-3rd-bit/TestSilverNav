package
{
   import common.HalcyonSubMenuLabel;
   import common.HalcyonVGroup;
   import common.UiEvent;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class InviteSubMenu extends Sprite
   {
      public static const MENU_CLICK:String = "menuClick";
      
      private var _vGroup:HalcyonVGroup;
      private var _mcSubMenuBg:McSubMenu;
      private var _menuItem1HGroup:SubMenuHGroup;
      private var _mcMyContacts:McContactsDarkIcon;
      private var _mcMyContactsLabel:HalcyonSubMenuLabel;
      private var _mcDivider1:McSubMenuDivLine;
      private var _menuItem2HGroup:SubMenuHGroup;
      private var _mcSendInvite:McInviteDarkIcon;
      private var _mcSendInviteLabel:HalcyonSubMenuLabel;
      private var _mcDivider2:McSubMenuDivLine;
      private var _menuItem3HGroup:SubMenuHGroup;
      private var _mcCallAGuest:McCallGuestDarkIcon;
      private var _mcCallAGuestLabel:HalcyonSubMenuLabel;
      
      public function InviteSubMenu()
      {
         super();
         _mcSubMenuBg = new McSubMenu();
         _mcSubMenuBg.width = 175;
         _mcSubMenuBg.height = 140;
         this.addChild(_mcSubMenuBg);
         
         _vGroup = new HalcyonVGroup(this, 175, 140);
         _menuItem1HGroup = new SubMenuHGroup(this, 160, 40);
         _menuItem1HGroup.horizontalgap = 7;
         _menuItem1HGroup.paddingLeft = 15;
         _menuItem1HGroup.paddingTop = 10;
         _mcMyContacts = new McContactsDarkIcon();
         _menuItem1HGroup.addChild(_mcMyContacts);
         _mcMyContactsLabel = new HalcyonSubMenuLabel("MY CONTACTS");
         _menuItem1HGroup.addChild(_mcMyContactsLabel);
         _vGroup.addChild(_menuItem1HGroup);
         _mcDivider1 = new McSubMenuDivLine();
         _mcDivider1.width = 175;
         _vGroup.addChild(_mcDivider1);
         
         _menuItem2HGroup = new SubMenuHGroup(this, 160, 40);
         _menuItem2HGroup.horizontalgap = 11;
         _menuItem2HGroup.paddingLeft = 20;
         _menuItem2HGroup.paddingTop = 10;
         _mcSendInvite = new McInviteDarkIcon();
         _menuItem2HGroup.addChild(_mcSendInvite);
         _mcSendInviteLabel = new HalcyonSubMenuLabel("SEND INVITE");
         _menuItem2HGroup.addChild(_mcSendInviteLabel);
         _vGroup.addChild(_menuItem2HGroup);
         _mcDivider2 = new McSubMenuDivLine();
         _mcDivider2.width = 175;
         _vGroup.addChild(_mcDivider2);
         
         _menuItem3HGroup = new SubMenuHGroup(this, 160, 40);
         _menuItem3HGroup.horizontalgap = 11;
         _menuItem3HGroup.paddingLeft = 20;
         _menuItem3HGroup.paddingTop = 10;
         _mcCallAGuest = new McCallGuestDarkIcon();
         _menuItem3HGroup.addChild(_mcCallAGuest);
         _mcCallAGuestLabel = new HalcyonSubMenuLabel("CALL A GUEST");
         _menuItem3HGroup.addChild(_mcCallAGuestLabel);
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