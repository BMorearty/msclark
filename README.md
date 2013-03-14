README
======

This sample app was prepared for Curious by Brian Morearty.

The master branch is the initial state. It's slow and inefficient.
The faster branch has optimizations applied, including:

* Rack-mini-profiler to find trouble spots
* Pagination with will_paginate
* Fragment caching--specifically, Russian Doll caching
  (using `touch: true` on all `belongs_to` statements).
* Turbolinks
* Support for ETag and If-Not-Modified headers

Copyright (c) 2013 Brian Morearty.
All rights reserved.
