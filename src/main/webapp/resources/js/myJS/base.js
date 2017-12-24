/**
 * @Author sirLiu
 * @Date 2017/12/24 15:12
 */

//获取当前网址，如： http://localhost:8080/chenThree/jspPage/pages/projectImplementation.html
var curWwwPath = window.document.location.href;
//获取主机地址之后的目录如：/chenThree/jspPage/pages/projectImplementation.html
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
//获取主机地址，如： http://localhost:8080/chenThree
var localhostPath = curWwwPath.substring(0, pos);
//获取带"/"的项目名，如：/chenThree
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);