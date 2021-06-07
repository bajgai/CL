;;4.1
(defun make-even (x)
  (if (oddp x) (+ x 1) x))

;;4.2
(defun further (x)
  (if (> x 0) (+ x 1) (- x 1)))

;; 4.3
(defun my-not (x)
  (if x nil T))

;;4.4
(defun ordered (x y)
  (if (> x y) (list y x) (list x y)))

;; example
(defun compare (x y)
  (cond ((equal x y) 'numbers-are-the-same)
	((< x y) 'first-is-smaller)
	((> x y) 'frist-is-bigger)))
;;example
(defun where-is (x)
  (cond ((equal x 'paris) 'france)
	((equal x 'london) 'englan)
	((equal x 'beijing) 'china)
	(t 'unknown)))

;;4.6
(defun my-abs-cond (x)
  (cond ((< x 0) (* -1 x))
	(t x)))

;;example
(defun emphasize (x)
  (cond ((equal (first x) 'good) (cons 'great (rest x)))
       ((equal (first x) 'bad) (cons 'awful (rest x)))))

;;example
(defun emphasize2 (x)
  (cond ((equal (first x) 'good) (cons 'great (rest x)))
	((equal (first x) 'bad) (cons 'awful (rest x)))
	(t x)))

;;example
(defun compute (op x y)
  (cond ((equal op 'sum-of) (+ x y))
	((equal op 'product-of) (* x y))
	(t '(that doesnt compute))))

;;4.8
(defun emphasize3 (x)
  (cond ((equal (first x) 'good) (cons 'great (rest x)))
	((equal (first x) 'bad) (cons 'awful (rest x)))
	(t (cons 'very x))))

;;4.9
(defun make-odd (x)
  (cond ((not (oddp x)) (+ x 1))
	(t x)))

;;4.10
(defun constrain-cond (x min max)
  (cond ((< x min) min)
	((> x max) max)
	(t x)))
(defun constrain-if (x min max)
  (if (> x max) max (if (< x min) min x)))

;;4.11
(defun firstzero (x)
  (cond ((equal (first x) 0) 'first)
	((equal (second x) 0) 'second)
	((equal (third x) 0) 'third)
	(t 'none)))

;;4.12
(defun cycle (x)
  (cond ((equal x 99) 1)
	(t (+ x 1))))

;;4.13
(defun howcompute (x y z)
  (cond ((equal (+ x y) z) 'sum-of)
	((equal (* x y) z) 'product-of)
	(t '(beats me))))

;;example
(defun small-positive-oddp (X)
  (and (< x 100)
       (> x 0)
       (oddp x)))

;;example
(defun gtest (x y)
  (or (> x y)
      (zerop x)
      (zerop y)))

;;example
(defun how-alike (a b)
  (cond ((equal a b) 'the-same)
	((and (oddp a) (oddp b)) 'both-odd)
	((and (not (oddp a)) (not (oddp b))) 'both-even)
	((and (< a 0) (< b 0)) 'both-negative)
	(t 'not-alike)))

;;example
(defun same-sign (x y)
  (or (and (zerop x) (zerop y))
      (and (< x 0) (< y 0))
      (and (> x 0) (> y 0))))

;;4.15
(defun geq (x y)
  (or (equal x Y) (> x y)))

;;4.16
(defun fun416 (x)
  (cond ((and (oddp x) (> x 0)) (* x x))
	((and (oddp x) (< x 0)) (+ x x))
	(t (/ x 2))))
;;4.17
(defun fun417 (x y)
  (cond ((and (or (equal x 'boy) (equal x 'girl)) (equal y 'child)))
	((and (or (equal x 'man) (equal x 'women)) (equal y 'adult)))))
;;4.18
(defun play (x y)
  (cond ((or (and (equal x 'rock) (equal y 'scissors))
	     (and (equal x 'scissors) (equal y 'paper))
	     (and (equal x 'paper) (equal y 'rock))) 'first-wins)
	((or (and (equal y 'rock) (equal x 'scissors))
	     (and (equal y 'scissors) (equal x 'paper))
	     (and (equal y 'paper) (equal x 'rock))) 'second-winds)))

;;example
(defun posnump (x)
  (and (numberp x) (> x 0)))

;;example
(defun posnump-2 (x)
  (if (numberp x) (> x 0) nil))

;;example
(defun posnump-3 (x)
  (cond ((numberp x) (> x 0))
	(t nil)))

;;example
(defun where-is-2 (x)
  (if (equal x 'paris) 'france
      (if (equal x 'london) 'england
	  (if (equal x 'beijing) 'china
	      'unknown))))
;;example
(defun where-is-3 (x)
  (or (and (equal x 'paris) 'france)
      (and (equal x 'london) 'englan)
      (and (equal x 'beijing) 'china)
      'unknown))
;;4.19
(defun and1 (x y z w)
  (cond ((equal x nil) nil)
	((equal y nil) nil)
	((equal z nil) nil)
	(t w)))
(defun and2 (x y z w)
  (if x
      (if y
	  (if z w))))

;;4.20
(defun compare1 (x y)
  (if (> x y) 'first-is-bigger
      (if (< x y) 'first-is-smaller
	  'numbers-are-the-same)))

(defun compare2 (x y)
  (or (and (> x y) 'first-is-bigger)
      (and (< x y) 'first-is-samller)
      'numbers-are-the-smae))

;;4.21
(defun gtest1 (x y)
  (if (> x y) t
      (if (equal x 0) t
	   (equal y 0))))

(defun gtest2 (x y)
  (cond ((> x y) t)
	((zerop x) t)
	(t (zerop y))))

;;4.22
(defun boilingp (temp scale)
  (cond ((equal scale 'fahrenheit) (> temp 212))
	((equal scale 'celsius) (> temp 100))))

(defun boilingp1 (temp scale)
  (if (equal scale 'fahrenheit) (> temp 212)
      (if (equal scale 'celsius) (> temp 100))))

(defun boilingp2 (temp scale)
  (or (and (equal scale 'fahrenheit) (> temp 212))
      (and (equal scale 'celsius) (> temp 100))))

;;example
(defun factorial (n)
  (if (plusp n)
      (* n (factorial (1- n)))
      1))

;;example
(defun logical-and (x y) (and x y t))

;;4.29
(defun logical-and1 (x y)
  (if x (if y t)))

(defun logical-and2 (x y)
  (cond (x (cond (y t)))))

;;4.30
(defun logical-or (x y)
  (cond (x t)
	(y t)
	(t nil)))
;;example
(defun demorgan-and (x y)
  (not (or (not x) (not y))))

(defun demorgan-or (x y)
  (not (and (not x) (not y))))

;;4.35
(defun demorgan-and (x y z)
  (not (or (not x) (not y) (not z))))

(defun demorgan-or (x y z)
  (not (and (not x) (not y) (not z))))


;;4.36
(defun nand (x y) (not (and x y)))

;;3.37
(defun not2 (x) (nand x x))

(defun logical-and-with-nand (x y)
  (nand (nand x y) (nand x y)))

(defun logical-or-with-nand (x y)
  (nand (nand x x) (nand y y)))

;;4.38
(defun nor (x y)
  (not (or x y)))

(defun not-with-nor (x)
  (nor x x))

(defun logical-and-with-nor (x y)
  (nor (nor x x) (nor y y)))

(defun nand-with-nor (x y)
  (nor (nor (nor  x x) (nor y y))
       (nor (nor x x) (nor y y))))

(defun logical-or-with-nor (x y)
  (nor (nor x y) nil))

