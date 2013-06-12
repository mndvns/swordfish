console.log ""
console.log "GOT HEREEEEEE"
console.log ""

require.config {}=
  paths:
    derp : "derp"
    # jquery  : "lib/jquery/jquery"
    # angular : "../lib/angular/angular"
    # text    : "lib/require/text"

  base-url: "asd/"
  # shim:
  #   angular:
  #     exports: "angular"

  #   angular-mocks:
  #     deps    : ["angular"]
  #     exports : "angular.mock"

  priority: ["derp"]

# require ["derp"], ("derp") ->

# require ["jquery", "angular", "app", "routes"], ($, angular, app, routes) ->
  # $(document).ready ->
  #   $html = $("html")
  #   angular.bootstrap $html, [app["name"]]

  #   # Because of RequireJS we need to bootstrap the app app manually
  #   # and Angular Scenario runner won't be able to communicate with our app
  #   # unless we explicitely mark the container as app holder
  #   # More info: https://groups.google.com/forum/#!msg/angular/yslVnZh9Yjk/MLi3VGXZLeMJ

  #   $html.addClass "ng-app"

