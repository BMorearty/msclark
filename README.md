README
======

This sample app was prepared for Curious by Brian Morearty.

Master branch
-------------

The initial state. It's slow and inefficient.

paginate-cache-turbolinks branch
--------------------------------

Optimizations are applied, including:

* Rack-mini-profiler to find trouble spots
* Pagination with kaminari
* Fragment caching--specifically, Russian Doll caching
  (using `touch: true` on all `belongs_to` statements).
* Turbolinks
* Support for ETag and If-Not-Modified headers

pct-etag-last-modified branch
-----------------------------
Has most of what's in `paginate-cache-turbolinks` (hence the pct prefix),
but also demonstrates support for `Etag` and `Last-Modified`
headers--and their pitfalls.

Copyright (c) 2013 Brian Morearty.
All rights reserved.
