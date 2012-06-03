module: dylan-user

define library python-dylan
  use common-dylan;
  use c-ffi;

  export python-dylan;
end library;

define module python-dylan
  use common-dylan;
  use c-ffi;

  export py-initialize, py-finalize;

  export py-run-simple-string;
end module;
