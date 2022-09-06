(defpackage lispmakr/tests/main
  (:use :cl
        :lispmakr
        :rove))
(in-package :lispmakr/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :lispmakr)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
