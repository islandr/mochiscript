function foo() {
  if (authHeader && authHeader.match(/^OAuth\b/i)) {
    var params = authHeader.match(/[^=\s]+="[^"]*"(?:,\s*)?/g);
    for (var i=0; i < params.length; i++) {
      var match = params[i].match(/([^=\s]+)="([^"]*)"/);
      var key   = qs.unescape(match[1]);
      var value = qs.unescape(match[2]);
      oauthHeaders[key] = value;
    }
  }
}


// this is a test for a common javascript divide parsing bug
var stuff = 40;
var foo   = stuff / 10;

var test  = 4 / 2;
var regex = /hello/;


$m.test(#{
  $1.eq(2, test);
  $1.isTrue("hello".match(regex));
});