(function(){

var app=angular.module('tsa',['ngRoute']);


app.controller('HeadController', function($rootScope, $scope, $http, $location){

$rootScope.page_title = "Home";
$rootScope.selectedMenuIndex = 1;

});

app.controller('NavController', function($rootScope, $scope, $http, $location){
var pagePath=window.location.toString();
console.log(pagePath);
if(pagePath.indexOf("contact")!= -1)
{
	$rootScope.selectedMenuIndex=3;
	$rootScope.page_title = "Contact";
} else if(pagePath.indexOf("login")!= -1)
{
	$rootScope.selectedMenuIndex=4;
	$rootScope.page_title = "Login";
} else if(pagePath.indexOf("services")!= -1)
{
	$rootScope.selectedMenuIndex=2;
	$rootScope.page_title = "Services";
}
console.log(window.location);
$rootScope.activechange=function(selectIndex)
{
	$rootScope.selectedMenuIndex = selectIndex;
	switch(selectIndex)
	{
		case 1:
		$rootScope.page_title = "Home";
		break;
		case 2:
		$rootScope.page_title = "Services";
		break;
		case 3:
		$rootScope.page_title = "Contact";
		break;
		case 4:
		$rootScope.page_title = "Login";
		break;
		default:
		$rootScope.page_title = "";
		break;
	}
}
//$rootScope.page_title = "Services";
//$rootScope.selectedMenuIndex = 2;

});

app.controller('ContactController', function($rootScope, $scope, $http, $location){

$rootScope.page_title = "Contact";
$rootScope.selectedMenuIndex = 3;

});

app.controller('LoginController', function($rootScope, $scope, $http, $location){

this.loginWrong=false;
var controlvar=this;
this.loginClick=function()
{
	$http({
        method : "POST",
        url : "./services/misc.php",
		headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		data:"call=authenticate_user&user_name="+this.uname+"&user_pass="+this.upwd+"",
    }).then(function mySucces(response) {
		if(response.data.trim()=='0')
		{
			console.log("if"+ response.data);
			$http.get('./services/misc.php?call=get_session_info').success(function(data){
					if(data.user_type==="A")
						window.location="./portal/admin/";
					else if(data.user_type==="T")
						window.location="./portal/user/dashboard-user.php";
					else
						controlvar.loginWrong=true;
				});
			
			controlvar.loginWrong=false;
		}
		else{
			console.log("else"+ response.data);
			controlvar.loginWrong=true;
		}
       console.log(response.data);
	   console.log("done");
    }, function myError(response) {
        $scope.myWelcome = response.statusText;
    });
	//console.log(this.uname+":"+this.upwd)
}
this.keypresssed=function(keyEvent)
{
	if (keyEvent.which === 13)
    controlvar.loginClick();
	
}
});

})();
