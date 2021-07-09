
(defun square (n) (* n n))

(defvar words)
(setf words
      '((one un)
	(two deux)
	(three trois)
	(four quatre)
	(five cinq)))

(defun translate (x)
  (second (assoc x words)))

;;;Exercise 7.1
(defun add1 (x)
  (+ x 1))

;;;Exercise 7.2
(defvar daily-planet)
(setf daily-planet
      '((olsen jimmy 123-76-4535 cub-reporter)
        (kent clark 089-52-6787 reporter)
        (lane lois 951-26-1438 reporter)
        (white perry 355-16-7439 editor)))

;;;Exercise 7.4
(defun grater-than-five-p (x)
  (if (> x 5) t))

;;;Exercise 7.7
(defun testfunc (x)
  (mapcar #'(lambda (n) (if (equal n 'up) 'down 'up)) x))

;;;Example
(defun my-assoc (key table)
  (find-if #'(lambda (entry)
	       (equal key (first entry))) table))

;;;7.8
(defun roughly-equal (x k)
  (find-if #'(lambda (i)
	       (and (> i (- k 10)) (< i (+ k 10)))) x))

;;;7.9
(defun find-nested (x)
  (find-if #'consp x))

;;; 7.10
(defvar note-table)
(setf note-table
      '((c 1)
	(c-sharp 2)
	(d 3)
	(d-sharp 4)
	(e 5)
	(f 6)
	(f-sharp 7)
	(g 8)
	(g-sharp 9)
	(a 10)
	(a-shrap 11)
	(b 12)))

(defun numbers (notes)
  (mapcar #'(lambda (n) (second (assoc n note-table))) notes))

