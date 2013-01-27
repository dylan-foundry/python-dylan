module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define inline function py-tuple-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyTuple_Check")
      (value :: <raw-py-object>) => (check? :: <raw-c-signed-int>)
      (as-raw-py-object(value))
    end)
end;

define inline function py-tuple-size (value :: <py-object>)
  //---*** Check for error!
  raw-as-integer(
    %call-c-function("PyTuple_Size")
      (value :: <raw-py-object>) => (result :: <raw-c-signed-int>)
      (as-raw-py-object(value))
    end)
end;

define inline function py-tuple-get-item (value :: <py-object>, index :: <integer>)
  //---*** Check for error!
  wrap-raw-py-object
    (%call-c-function("PyTuple_GetItem")
       (value :: <raw-py-object>, index :: <raw-c-signed-int>)
        => (result :: <raw-py-object>)
       (as-raw-py-object(value), integer-as-raw(index))
     end)
end;
