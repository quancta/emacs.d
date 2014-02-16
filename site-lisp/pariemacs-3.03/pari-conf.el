;; pari-conf.el or pari-conf.el.in -- configuration file.

;; Copyright (C) 1997-2007  The PARI group.

;; This file is part of the PARIEMACS package.

;; PARIEMACS is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation. It is distributed in the hope that it
;; will be useful, but WITHOUT ANY WARRANTY WHATSOEVER.

;; Check the License for details. You should have received a copy of
;; it, along with the package; see the file 'COPYING'. If not, write
;; to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;; Maintainer (01-March-2003): Olivier Ramare (ramare AT math.univ-lille1.fr).
;; To be used with pari.el version 3.02 or higher.

(provide 'pari-conf)
;; Set the following constants for your site:
(defconst gp-version "2.5.4" "pari's version number")

(defconst gp-file-name "/usr/local/Cellar/pari/2.5.4/bin/gp"
 "The file name of the gp executable file")

(defconst gp-gphelp-dir "/usr/local/Cellar/pari/2.5.4/bin/"
  "The directory where gphelp is to be found")

(defconst gp-pariemacs "/usr/local/share/emacs/site-lisp/pari/README"
  "The pariemacs file")