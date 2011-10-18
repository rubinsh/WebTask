// Providing editor 'read-only' toggling functionality. 
( function()
{
   var cancelEvent = function( evt )
      {
         evt.cancel();
      };

   CKEDITOR.editor.prototype.readOnly = function( isReadOnly )
   {
      // *** this.document.$ is undefined ***
      // Turn off contentEditable.
      //this.document.$.body.disabled = isReadOnly;
      //CKEDITOR.env.ie ? this.document.$.body.contentEditable = !isReadOnly
      //: this.document.$.designMode = isReadOnly ? "off" : "on";

      // Prevent key handling.
      this[ isReadOnly ? 'on' : 'removeListener' ]( 'key', cancelEvent, null, null, 0 );
      this[ isReadOnly ? 'on' : 'removeListener' ]( 'selectionChange', cancelEvent, null, null, 0 );

      // Disable all commands in wysiwyg mode.
      var command,
         commands = this._.commands,
         mode = this.mode;

      for ( var name in commands )
      {
         command = commands[ name ];
         isReadOnly ? command.disable() : command[ command.modes[ mode ] ? 'enable' : 'disable' ]();
         this[ isReadOnly ? 'on' : 'removeListener' ]( 'state', cancelEvent, null, null, 0 );
      }
   }
} )();
