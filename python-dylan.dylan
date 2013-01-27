module: python-dylan
synopsis: Embed a Python interpreter.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define constant $py-single-input = 256;
define constant $py-file-input = 257;
define constant $py-eval-input = 258;
define constant <py-start-input> = one-of(
    $py-single-input,
    $py-file-input,
    $py-eval-input
  );

define constant <raw-py-object> = <raw-machine-word>;

define class <py-object> (<object>)
  constant slot raw-py-object :: <raw-py-object>,
    required-init-keyword: raw:;
end;

define inline function wrap-raw-py-object (raw-py-object :: <raw-py-object>)
 => (py-object :: <py-object>)
  make(<py-object>, raw: raw-py-object);
end;

define inline function as-raw-py-object (py-object :: <py-object>)
 => (raw-py-object :: <raw-py-object>)
  py-object.raw-py-object
end;

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
  let py-data = wrap-raw-py-object
    (%call-c-function ("PyRun_String")
      (code :: <raw-byte-string>,
       start :: <raw-c-signed-int>,
       globals :: <raw-py-object>,
       locals :: <raw-py-object>)
      => (result :: <raw-py-object>)
      (primitive-string-as-raw(code),
       integer-as-raw(start),
       as-raw-py-object(py-globals),
       as-raw-py-object(py-locals))
    end);
  py-to-dylan(py-data)
end;

define function py-to-dylan (obj :: <py-object>)
  if (py-bool-check(obj))
    py-bool-is-true(obj)
  elseif (py-dict-check(obj))
    error("Dictionaries aren't supported yet.");
  elseif (py-int-check(obj))
    py-int-as-long(obj)
  elseif (py-list-check(obj))
    let list-size = py-list-size(obj);
    let output = make(<vector>, size: list-size);
    for (i :: <integer> from 0 below list-size)
      output[i] := py-to-dylan(py-list-get-item(obj, i))
    end;
    output
  elseif (py-string-check(obj))
    py-string-as-string(obj)
  elseif (py-tuple-check(obj))
    let tuple-size = py-tuple-size(obj);
    let output = make(<vector>, size: tuple-size);
    for (i :: <integer> from 0 below tuple-size)
      output[i] := py-to-dylan(py-tuple-get-item(obj, i))
    end;
    output
  else
    error("Unknown type in py-to-dylan");
  end;
end;
