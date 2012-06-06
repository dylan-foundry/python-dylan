module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener
copyright: 2012, Data Fueled, LLC.

define inline function py-string-check (value :: <raw-c-pointer>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyString_Check")
      (value :: <raw-c-pointer>) => (check? :: <raw-c-signed-int>)
      (value)
    end
  )
end;

define inline function py-string-as-string (value :: <raw-c-pointer>)
  //---*** Check for error!
  //---*** Use version with string and size
  primitive-raw-as-string(
    %call-c-function("PyString_AsString")
      (value :: <raw-c-pointer>) => (result :: <raw-byte-string>)
      (value)
    end
  )
end;