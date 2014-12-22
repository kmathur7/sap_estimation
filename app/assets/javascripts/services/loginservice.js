angular.module('Saps').factory('loginService',function($state)
{
  var role;
  return {
      setRole : function(data)
      {
        role=data;
        $state.go('home');
      },
      getRole : function()
      {
        return role;
      },
    logout: function()
    {
      role="";
      $state.go('/');
    }
    };
});