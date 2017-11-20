{:dev {:dependencies [[com.cemerick/piggieback "0.2.2"]
                      [org.clojure/tools.nrepl "0.2.10"]]
       ;:repl-options {:nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]}
       }
 :user {:plugins [[lein-ancient "0.6.7"]
                  [lein-codox "0.9.4"]
                  [cider/cider-nrepl "0.15.1-SNAPSHOT"]
                  [lein-environ "1.0.2"]
                  [lein-exec "0.3.6"]
                  [jonase/eastwood "0.2.4"]
                  ;; Set of tools to improve the REPL and test results.
                  [venantius/ultra "0.5.1"]]
        :dependencies [[org.clojure/tools.trace "0.7.6"]
                       [redl "0.2.4"]
                       [spyscope "0.1.6"]
                       [criterium "0.4.4"]
                       #_[clj-stacktrace "0.2.7"]
                       [slamhound "1.5.5"]
                       #_[io.aviso/pretty "0.1.18"]]
        :injections [(require '[redl core complete]
                              '[spyscope core]
                              #_'io.aviso.repl
                              'clojure.repl
                              'clojure.main
                              #_[clj-stacktrace.repl :only [pst]])
                     ;; Reference:
                     ;; http://z.caudate.me/give-your-clojure-workflow-more-flow/
                     ;; (alter-var-root #'clojure.main/repl-caught
                     ;;                 (constantly @#'io.aviso.repl/pretty-pst))
                     ;; (alter-var-root #'clojure.repl/pst
                     ;;                 (constantly @#'io.aviso.repl/pretty-pst))
                     ]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        ;; To use VisualVM for profiling.
        ; :jvm-opts ["-Dcom.sun.management.jmxremote"
        ;    "-Dcom.sun.management.jmxremote.ssl=false"
        ;    "-Dcom.sun.management.jmxremote.authenticate=false"
        ;    "-Dcom.sun.management.jmxremote.port=43210"]
        }
 }
