/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

    config.language = 'en';
    config.height = '200px';
    config.width = '600px';
    config.resize_enabled = false;
    config.removePlugins = 'elementspath';

    config.toolbar = 'Customed';

    config.toolbar_Customed =
      [
          ['Cut','Copy','Paste','PasteText','-','Undo','Redo','-','Find','Replace','-','SpellChecker', 'Scayt'],
          ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Link','Unlink','Anchor'],
          ['Bold','Italic','Underline','Strike','-','TextColor','BGColor','-','Subscript','Superscript'],
          ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
          ['Font','FontSize','Styles','Format']
      ];

    config.toolbar_Easy =
      [
          ['Source','-','Preview','Templates'],
          ['Cut','Copy','Paste','PasteText','PasteFromWord',],
          ['Maximize','-','About'],
          ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
          ['Styles','Format'],
          ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
          ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
          ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
          ['Link','Unlink','Anchor'],
          ['Image','Embed','Flash','Attachment','Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
      ];
};
