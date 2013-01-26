module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define inline function py-int-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyInt_Check")
      (value :: <raw-machine-word>) => (check? :: <raw-c-signed-int>)
      (primitive-unwrap-machine-word(value))
    end)
end;

define inline function py-int-as-long (value :: <py-object>)
  //---*** Check for error!
  raw-as-integer(
    %call-c-function("PyInt_AsLong")
      (value :: <raw-machine-word>) => (result :: <raw-c-signed-int>)
      (primitive-unwrap-machine-word(value))
    end)
end;
