
;;;example
(defvar words)
(setf words
      '((one un)
	(two deux)
	(three trois)
	(four quatre)
	(five cinq)))


;;; Exercise 7.1

(defun add1 (x)
  (+ x 1))
(mapcar #'add1 '(13 5 7 9))


;;; Exercise 7.2

(defvar daily-planet)

(setf daily-planet
      '((olsen jimmy 123-76-4535 cub-reporter)
	(kent clark 089-52-6787 reporter)
	(lane lois 951-25-1438 reporter)
	(white perry 355-16-7439 editor)))

;;; Exercise 7.4

(defun grater-than-five-p (x)
  (if (> x 5) t nil))
  
;;;Exercise 7.8

(mapcar #'(lambda (x) (if (equal x 'up) 'down 'up)) '(up down up down))

;;; example
(defun my-assoc(key table)
  (find-if #'(lambda (entry) (equal key (first entry))) table))
