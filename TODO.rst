* Wrap more of the Python C API. (Don't worry about anything
  involving ``FILE*``.)
* A lot of error checking.
* Clean up references, do proper refcounting.
* Can we make this typesafe at all without adding wrapper objects
  like the higher level C-FFI?
* Implement more type conversions.
* Fix warning about _POSIX_SOURCE when building wrapper.c
