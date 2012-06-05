module: dylan-user

define library python-dylan-test-suite
  use common-dylan;
  use io;
  use python-dylan;
  use testworks;

  export python-dylan-test-suite;
end library;

define module python-dylan-test-suite
  use common-dylan, exclude: { format-to-string };
  use format;
  use python-dylan;
  use testworks;

  export python-dylan-test-suite;
end module;
