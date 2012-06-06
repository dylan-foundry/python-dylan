module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener
copyright: 2012, Data Fueled, LLC.

define inline function py-tuple-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyTuple_Check")
      (value :: <py-object>) => (check? :: <raw-c-signed-int>)
      (value)
    end
  )
end;

define inline function py-tuple-size (value :: <py-object>)
  //---*** Check for error!
  raw-as-integer(
    %call-c-function("PyTuple_Size")
      (value :: <py-object>) => (result :: <raw-c-signed-int>)
      (value)
    end
  )
end;

define inline function py-tuple-get-item (value :: <py-object>, index :: <integer>)
  //---*** Check for error!
  %call-c-function("PyTuple_GetItem")
    (value :: <py-object>, index :: <raw-c-signed-int>)
     => (result :: <py-object>)
    (value, integer-as-raw(index))
  end
end;