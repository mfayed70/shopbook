function invokeFaceookShareFeature(){
//Get Current page url
var webSiteurl=window.location.href;

//Add this url to standard Facebook share url-->
var url="http://www.facebook.com/share.php?u="+webSiteurl;

//Open this url in a new 500x500 window
window.open(url,"Facebook", "width=500,height=500");

}