add_test( XThreadPoolTest.Init /home/danylko/Project/cmake/bin/unit_xthread_pool [==[--gtest_filter=XThreadPoolTest.Init]==] --gtest_also_run_disabled_tests)
set_tests_properties( XThreadPoolTest.Init PROPERTIES WORKING_DIRECTORY /home/danylko/Project/cmake/build/src/xthread_pool/unit_test SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set( unit_xthread_pool_TESTS XThreadPoolTest.Init)
