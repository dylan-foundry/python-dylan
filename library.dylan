module: dylan-user

define library python-dylan
  use dylan;
  use common-dylan;

  export python-dylan;
end library;

define module python-dylan
  use common-dylan;
  use dylan-direct-c-ffi;

  export py-initialize, py-finalize;

  export py-run-simple-string, py-run-string;

  export py-dict-new, py-dict-check;

  export py-int-check, py-int-as-long;

  export py-string-check, py-string-as-string;
end module;
