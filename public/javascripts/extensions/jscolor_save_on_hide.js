var elementId = "colorButton";

var myPicker = new jscolor.color(document.getElementById(elementId), {required:false, valueElement:'hiddenHelper'});
myPicker.hidePicker = (function() {
  var original = myPicker.hidePicker;
  return function() {
    console.log('selected color: ' + myPicker.toString());
    document.getElementsByTagName('BODY')[0].style.backgroundColor = '#' + myPicker.toString();
    return original();
  };
})();  
