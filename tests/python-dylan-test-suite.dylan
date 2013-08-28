module: python-dylan-test-suite
synopsis: Test suite for the python-dylan library.

define suite python-dylan-test-suite ()
  test initialize-python;
  test run-simple-string;
  test run-string-return-integer;
  test run-string-return-list;
  test run-string-return-nested-list;
  test run-string-return-string;
  test run-string-return-boolean;
  test run-string-return-tuple;
  test run-string-return-nested-tuple;
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

define test run-string-return-list ()
  py-initialize();
  check-equal("run-string can return list",
              py-run-string("[1, 2]"),
              vector(1, 2));
  py-finalize();
end test;

define test run-string-return-nested-list ()
  py-initialize();
  check-equal("run-string can return nested list",
              py-run-string("[1, 2, [3, 4]]"),
              vector(1, 2, vector(3, 4)));
  py-finalize();
end test;

define test run-string-return-string ()
  py-initialize();
  check-equal("run-string can return string",
              py-run-string("\"a\" + \"b\""),
              "ab");
  py-finalize();
end test;

define test run-string-return-boolean ()
  py-initialize();
  check-equal("run-string can return boolean False via comparison",
              py-run-string("1 == 2"),
              #f);
  check-equal("run-string can return boolean True via comparison",
              py-run-string("1 == 1"),
              #t);
  py-finalize();
end test;

define test run-string-return-tuple ()
  py-initialize();
  check-equal("run-string can return tuple",
              py-run-string("(1, 2)"),
              vector(1, 2));
  py-finalize();
end test;

define test run-string-return-nested-tuple ()
  py-initialize();
  check-equal("run-string can return nested tuple",
              py-run-string("(1, 2, (3, 4))"),
              vector(1, 2, vector(3, 4)));
  py-finalize();
end test;
