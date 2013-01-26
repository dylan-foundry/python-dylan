module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define inline function py-string-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyString_Check")
      (value :: <raw-machine-word>) => (check? :: <raw-c-signed-int>)
      (primitive-unwrap-machine-word(value))
    end)
end;

define inline function py-string-as-string (value :: <py-object>)
  //---*** Check for error!
  //---*** Use version with string and size
  primitive-raw-as-string(
    %call-c-function("PyString_AsString")
      (value :: <raw-machine-word>) => (result :: <raw-byte-string>)
      (primitive-unwrap-machine-word(value))
    end)
end;
