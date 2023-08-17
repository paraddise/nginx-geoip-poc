# Nginx opensource with geoip2 module proof of concept.

Use `X-Forwarded-For` to provide different ip addresses or use $remote_addr as source if you have static non-local ip.
You create separate variable for source and use custom header and set source if you don't want to use `X-Forwarded-For` header.