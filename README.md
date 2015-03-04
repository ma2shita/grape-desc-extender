Grape Description Extender
==========================

Overview
--------

[Grape]()のdesc blockで指定できるメソッド(=document)を拡張できます

```
class MyAPI < Grape::API
  desc "ping if" do
    detail "'pong' return every time"
    req_example <<-EOT
    $ curl http://localhost:9292/ping
    EOT
    res_example <<-EOT
    {"result":"pong"}
    EOT
  end
  get "/ping" do
    {result: "pong"}
  end
end
```

※通常はreq\_exampleとres\_exampleがNoMethodError

Getting start
-------------

Is simple. Add this line to your Gemfile:

```
gem 'grape-desc-extender'
```

Require and Configuration:

```
require 'grape'
require 'grape/desc-extender'
GrapeDescExtender.config.extend = [:req_example, :res_example]
```

Describe to your API:

```
class MyAPI < Grape::API
  desc "ping if" do
    detail "'pong' return every time"
    req_example <<EOT
$ curl http://localhost:9292/ping
EOT
    res_example <<EOT
{"result":"pong"}
EOT
  end
  get "/ping" do
    {result: "pong"}
  end
end
```

You can get a value via `route_DESC` method:

```
> MyAPI.routes[0].route_req_example
=> "$ curl http://localhost:9292/ping\n"
> MyAPI.routes[0].route_res_example
=> "{\"result\":\"pong\"}\n"
```

License
--------

This code is licensed under MIT license.

