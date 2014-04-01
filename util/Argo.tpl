;; -*- Emacs-Lisp -*-

;;; Argo.prj - project setup file for Emacs VHDL Mode 3.33.6

;; Project : Argo
;; Saved   : 2014-02-24 16:52:40 eit-cpm


;; project name
(setq vhdl-project "ArgoAsyncNOC")

;; project setup
(aput 'vhdl-project-alist vhdl-project
'("Async noc" "ARGO_PROJECT_DIR" 
 ("common/" "async_noc/src/")
 ""
 (("ModelSim" "-93 \\2" "-f \\1 top_level" nil)
  ("Synopsys" "-vhdl93 \\2" "-f \\1 top_level"
   ((".*/datapath/.*" . "-optimize \\3")
    (".*_tb\\.vhd"))))
 "async_noc/sim/" "work" "async_noc/sim/work/" "Makefile_\\2" "")
)
