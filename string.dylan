module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define inline function py-string-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyString_Check")
      (value :: <py-object>) => (check? :: <raw-c-signed-int>)
      (value)
    end
  )
end;

define inline function py-string-as-string (value :: <py-object>)
  //---*** Check for error!
  //---*** Use version with string and size
  primitive-raw-as-string(
    %call-c-function("PyString_AsString")
      (value :: <py-object>) => (result :: <raw-byte-string>)
      (value)
    end
  )
end;
