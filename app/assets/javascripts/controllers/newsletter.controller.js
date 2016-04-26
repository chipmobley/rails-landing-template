function NewsletterCtrl($scope, $http) {
    $scope.newsletterForm = {};
    $scope.signup_message = '';
    $scope.showForm = true;
    $scope.showError = false;
    $scope.newsletterForm.submitForm = function(item, event) {
        var dataObject = JSON.stringify({
            email: $scope.newsletterForm.email
        });

        $http({
            method: 'POST',
            url: '/newsletter_signup',
            data: dataObject
        }).then(
            function successCallback(response) {
                $scope.showForm = false;
                $scope.signup_message = response.data.message;
            }, function errorCallback(response) {
                $scope.showError = true;
                $scope.signup_message = response.data.message;
            }
        );

    };
}
