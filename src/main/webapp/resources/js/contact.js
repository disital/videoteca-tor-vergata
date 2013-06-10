/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $('#nodetypeDialog').bind('show', function() {
        setPrompt('Nodetype for "' + decodeURI(rootName) + '"');
        document.getElementById("woOption" + rootType).selected = true;
    });
});
function setPrompt(s) {
    document.getElementById("prompt").innerHTML = s;
}
function closeDialog() {
    $('#nodetypeDialog').modal('hide');
}
function okWebpageDialog() {
    $("#webpageDialog").modal('hide');
}
;