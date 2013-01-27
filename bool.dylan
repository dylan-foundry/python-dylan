module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define inline function py-bool-from-long (value :: <integer>)
  primitive-wrap-machine-word
    (%call-c-function("PyBool_FromLong")
       (value :: <raw-c-signed-int>)
        => (result :: <raw-machine-word>)
       (integer-as-raw(value))
  end)
end;

define inline function py-bool-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyBool_Check")
      (value :: <raw-machine-word>) => (check? :: <raw-c-signed-int>)
      (primitive-unwrap-machine-word(value))
    end
  )
end;

define inline function py-bool-is-true (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyBool_IsTrue")
      (value :: <raw-machine-word>) => (check? :: <raw-c-signed-int>)
      (primitive-unwrap-machine-word(value))
    end
  )
end;
