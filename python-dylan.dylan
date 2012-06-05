module: python-dylan
synopsis: Embed a Python interpreter.
author: Bruce Mitchener
copyright: 2012, Data Fueled, LLC.

define constant $py-single-input = 256;
define constant $py-file-input = 257;
define constant $py-eval-input = 258;
define constant <py-start-input> = one-of(
    $py-single-input,
    $py-file-input,
    $py-eval-input
  );

define function py-initialize () => ()
  %call-c-function ("Py_Initialize")
    () => (nothing :: <raw-c-void>)
    ()
  end;
end;

define function py-finalize () => ()
  %call-c-function ("Py_Finalize")
    () => (nothing :: <raw-c-void>)
    ()
  end;
end;

define function py-run-simple-string (code :: <string>)
  let result = raw-as-integer(
    %call-c-function ("PyRun_SimpleString")
      (code :: <raw-byte-string>) => (result :: <raw-c-signed-int>)
      (primitive-string-as-raw(code))
    end);
  if (result < 0)
    error("Executing Python code failed.");
  end;
end;

define function py-run-string (code :: <string>,
    #key start :: <py-start-input> = $py-eval-input,
         globals :: false-or(<table>) = #f,
         locals :: false-or(<table>) = #f)
  let py-globals = py-dict-new();
  let py-locals = py-dict-new();
  let py-data = %call-c-function ("PyRun_String")
      (code :: <raw-byte-string>,
       start :: <raw-c-signed-int>,
       globals :: <raw-c-pointer>,
       locals :: <raw-c-pointer>)
      => (result :: <raw-c-pointer>)
      (primitive-string-as-raw(code),
       integer-as-raw(start),
       py-globals,
       py-locals)
    end;
  py-to-dylan(py-data)
end;

define function py-to-dylan (obj :: <raw-c-pointer>)
  if (py-dict-check(obj))
    error("Dictionaries aren't supported yet.");
  elseif (py-int-check(obj))
    py-int-as-long(obj)
  else
    error("Unknown type in py-to-dylan");
  end;
end;
