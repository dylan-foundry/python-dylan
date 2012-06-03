module: python-dylan
synopsis: Embed a Python interpreter.
author: Bruce Mitchener
copyright: 2012, Data Fueled, LLC.

define C-function py-initialize
  c-name: "Py_Initialize";
end;

define C-function py-finalize
  c-name: "Py_Finalize";
end;

define C-function py-run-simple-string
  input parameter code :: <c-string>;
  c-name: "PyRun_SimpleString";
end;
