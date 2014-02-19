var counter = 1;
var limit = 4;
function addInput(divName){
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {
          var newdiv = document.createElement('div');
          newdiv.innerHTML = "Quaternion " + (counter + 1) + " <br><input type= 'text' name='constants[]'><text> + </text><input type='text' name='is[]'><text>i + </text><input type='text' name='js[]'><text>j + </text><input type='text' name='ks[]'><text>k</text>";
          document.getElementById(divName).appendChild(newdiv);
          counter++;
     }
}
