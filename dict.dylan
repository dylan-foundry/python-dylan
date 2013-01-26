module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define inline function py-dict-new ()
  primitive-wrap-machine-word
    (%call-c-function("PyDict_New")
       () => (result :: <raw-machine-word>)
       ()
     end)
end;

define inline function py-dict-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyDict_Check")
      (value :: <raw-machine-word>) => (check? :: <raw-c-signed-int>)
      (primitive-unwrap-machine-word(value))
    end)
end;
