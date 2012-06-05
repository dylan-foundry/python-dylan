module: python-dylan
synopsis: Python types support.
author: Bruce Mitchener
copyright: 2012, Data Fueled, LLC.

define inline function py-dict-new ()
  %call-c-function("PyDict_New")
    () => (result :: <raw-c-pointer>)
    ()
  end;
end;

define inline function py-dict-check (value :: <raw-c-pointer>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyDict_Check")
      (value :: <raw-c-pointer>) => (check? :: <raw-c-signed-int>)
      (value)
    end
  )
end;

define inline function py-int-check (value :: <raw-c-pointer>)
  primitive-raw-as-boolean(
    %call-c-function("dylan_PyInt_Check")
      (value :: <raw-c-pointer>) => (check? :: <raw-c-signed-int>)
      (value)
    end
  )
end;

define inline function py-int-as-long (value :: <raw-c-pointer>)
  //---*** Check for error!
  raw-as-integer(
    %call-c-function("PyInt_AsLong")
      (value :: <raw-c-pointer>) => (check? :: <raw-c-signed-int>)
      (value)
    end
  )
end;
