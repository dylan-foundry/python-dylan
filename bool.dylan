module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define inline function py-bool-from-long (value :: <integer>)
  wrap-raw-py-object
    (%call-c-function("PyBool_FromLong")
       (value :: <raw-c-signed-int>)
        => (result :: <raw-py-object>)
       (integer-as-raw(value))
  end)
end;

define inline function py-bool-check (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyBool_Check")
      (value :: <raw-py-object>) => (check? :: <raw-c-signed-int>)
      (as-raw-py-object(value))
    end)
end;

define inline function py-bool-is-true (value :: <py-object>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyBool_IsTrue")
      (value :: <raw-py-object>) => (check? :: <raw-c-signed-int>)
      (as-raw-py-object(value))
    end)
end;
