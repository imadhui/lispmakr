(defsystem "lispmakr"
  :version "0.1.0"
  :author "Madhu Surisetti"
  :license "MIT"
  :depends-on ("markr" "clog" "cells")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "lispmakr/tests"))))

(defsystem "lispmakr/tests"
  :author "Madhu Surisetti"
  :license "MIT"
  :depends-on ("lispmakr"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for lispmakr"
  :perform (test-op (op c) (symbol-call :rove :run c)))
