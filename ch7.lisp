
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
