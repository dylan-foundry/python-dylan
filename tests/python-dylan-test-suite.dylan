module: python-dylan-test-suite
synopsis: Test suite for the python-dylan library.

define suite python-dylan-test-suite ()
  test initialize-python;
  test run-simple-string;
  test run-string-return-integer;
  test run-string-return-string;
end suite;

define test initialize-python ()
  check-no-errors("initialize python", py-initialize());
  check-no-errors("finalize python", py-finalize());
end test;

define test run-simple-string ()
  py-initialize();
  check-no-errors("run simple string",
                  py-run-simple-string("import sys"));
  py-finalize();
end test;

define test run-string-return-integer ()
  py-initialize();
  check-equal("run-string can return integer",
              py-run-string("1 + 2"),
              3);
  py-finalize();
end test;

define test run-string-return-string ()
  py-initialize();
  check-equal("run-string can return string",
              py-run-string("\"a\" + \"b\""),
              "ab");
  py-finalize();
end test;