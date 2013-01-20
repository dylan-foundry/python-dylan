module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define inline function py-list-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyList_Check")
      (value :: <py-object>) => (check? :: <raw-c-signed-int>)
      (value)
    end
  )
end;

define inline function py-list-size (value :: <py-object>)
  //---*** Check for error!
  raw-as-integer(
    %call-c-function("PyList_Size")
      (value :: <py-object>) => (result :: <raw-c-signed-int>)
      (value)
    end
  )
end;

define inline function py-list-get-item (value :: <py-object>, index :: <integer>)
  //---*** Check for error!
  %call-c-function("PyList_GetItem")
    (value :: <py-object>, index :: <raw-c-signed-int>)
     => (result :: <py-object>)
    (value, integer-as-raw(index))
  end
end;
