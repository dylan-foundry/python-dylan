module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define inline function py-list-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyList_Check")
      (value :: <raw-machine-word>) => (check? :: <raw-c-signed-int>)
      (primitive-unwrap-machine-word(value))
    end
  )
end;

define inline function py-list-size (value :: <py-object>)
  //---*** Check for error!
  raw-as-integer(
    %call-c-function("PyList_Size")
      (value :: <raw-machine-word>) => (result :: <raw-c-signed-int>)
      (primitive-unwrap-machine-word(value))
    end)
end;

define inline function py-list-get-item (value :: <py-object>, index :: <integer>)
  //---*** Check for error!
  primitive-wrap-machine-word
    (%call-c-function("PyList_GetItem")
       (value :: <raw-machine-word>, index :: <raw-c-signed-int>)
        => (result :: <raw-machine-word>)
       (primitive-unwrap-machine-word(value), integer-as-raw(index))
  end)
end;
