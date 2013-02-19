package common
{
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class HalcyonSubMenuLabel extends McSubMenuLabelField
   {
      private var _labelField:TextField;
      private var _textFormat:TextFormat;
      
      public function HalcyonSubMenuLabel(argLabel:String = "", argFontSize:Number = 14)
      {
         _labelField = this.getChildAt(0) as TextField;
         _labelField.mouseEnabled = false;
         _labelField.autoSize = TextFieldAutoSize.LEFT;
         _labelField.text = argLabel;
         _textFormat = new TextFormat();
         fontSize = argFontSize;
      }
      
      public function set label(value:String):void {
         if (_labelField.text == value) return;
         _labelField.text = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function get label():String {
         return _labelField.text;
      }
      
      public function set fontColor(value:uint):void {
         _textFormat.color = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function set fontSize(value:Number):void {
         if(value < 1) return;
         _textFormat.size = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function set bold(value:Boolean):void {
         _textFormat.bold = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function set underline(value:Boolean):void {
         _textFormat.underline = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function set wordWrap(value:Boolean):void {
         _labelField.wordWrap = value;
      }
      
      public function set autoSize(value:String):void {
         if(value == null) return;
         _labelField.autoSize = value;
      }
   }
}