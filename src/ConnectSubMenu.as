package
{
   import common.HalcyonSubMenuLabel;
   import common.HalcyonVGroup;
   import common.UiEvent;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ConnectSubMenu extends Sprite
   {
      public static const MENU_CLICK:String = "menuClick";
      
      private var _vGroup:HalcyonVGroup;
      private var _mcSubMenuBg:McSubMenu;
      private var _menuItem1HGroup:SubMenuHGroup;
      private var _mcWebcam:McVideoDarkIcon;
      private var _webcamLabel:HalcyonSubMenuLabel;
      private var _mcDivider1:McSubMenuDivLine;
      private var _menuItem2HGroup:SubMenuHGroup;
      private var _mcConnectAudio:McMuteMicDarkIcon;
      private var _mcConnectAudioLabel:HalcyonSubMenuLabel;
      
      public function ConnectSubMenu()
      {
         super();
         _mcSubMenuBg = new McSubMenu();
         _mcSubMenuBg.width = 185;
         _mcSubMenuBg.height = 100;
         this.addChild(_mcSubMenuBg);
         
         _vGroup = new HalcyonVGroup(this, 185, 100);
         _menuItem1HGroup = new SubMenuHGroup(this, 170, 40);
         _menuItem1HGroup.horizontalgap = 7;
         _menuItem1HGroup.paddingLeft = 15;
         _menuItem1HGroup.paddingTop = 10;
         _mcWebcam = new McVideoDarkIcon();
         _menuItem1HGroup.addChild(_mcWebcam);
         _webcamLabel = new HalcyonSubMenuLabel("TURN ON WEBCAM");
         _menuItem1HGroup.addChild(_webcamLabel);
         _vGroup.addChild(_menuItem1HGroup);
         _mcDivider1 = new McSubMenuDivLine();
         _mcDivider1.width = 185;
         _vGroup.addChild(_mcDivider1);
         
         _menuItem2HGroup = new SubMenuHGroup(this, 170, 40);
         _menuItem2HGroup.horizontalgap = 11;
         _menuItem2HGroup.paddingLeft = 15;
         _menuItem2HGroup.paddingTop = 10;
         _mcConnectAudio = new McMuteMicDarkIcon();
         _menuItem2HGroup.addChild(_mcConnectAudio);
         _mcConnectAudioLabel = new HalcyonSubMenuLabel("CONNECT AUDIO");
         _menuItem2HGroup.addChild(_mcConnectAudioLabel);
         _vGroup.addChild(_menuItem2HGroup);
         
         _menuItem1HGroup.addEventListener(MouseEvent.CLICK, onMouseClick, false, 0, true);
         _menuItem2HGroup.addEventListener(MouseEvent.CLICK, onMouseClick, false, 0, true);
         
         this.addChild(_vGroup);
      }
      
      private function onMouseClick(event:Event):void {
         var uiEvent:UiEvent = new UiEvent(MENU_CLICK);
         uiEvent.object = (event.currentTarget as SubMenuHGroup).getChildAt(0);
         dispatchEvent(uiEvent);
      }
      
   }
}