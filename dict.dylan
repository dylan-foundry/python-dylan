module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define inline function py-dict-new ()
  %call-c-function("PyDict_New")
    () => (result :: <py-object>)
    ()
  end;
end;

define inline function py-dict-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyDict_Check")
      (value :: <py-object>) => (check? :: <raw-c-signed-int>)
      (value)
    end
  )
end;
