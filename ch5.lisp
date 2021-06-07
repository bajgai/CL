;; Example
(defun poor-style (p)
  (setf p (+ p 5))
  (list 'result 'is p))

;;Example
(defun average ( x y)
  "Returns the mean (average value) of its two inputs."
  (let ((sum (+ x y)))
    (list x y 'average 'is (/ sum 2.0))))

;; 5.1
(defun poor-style1 (p)
  (let ((q (+ p 5)))
    (list 'result 'is q)))

;;example
(defun price-change (old new)
  (let* ((diff (- new old))
	 (proportion (/ diff old))
	 (percentage (* proportion 100.0)))
    (list 'widgets 'changed 'by percentage 'percent)))

;;example
(defun correct-size-range (x y z)
  (let* ((biggest (max x y z))
	 (smallest (min x y z))
	 (r (/ biggest smallest 1.0)))
    (list 'factor 'of r)))
;;example
(defun fair-coin ()
  (let ((toss (random 101)))
    (cond ((< toss 50) 'heads)
	  ((> toss 50) 'tails)
	  (t 'edge))))

;;;Function to compute Einstein's E = mc^2

(defun einstein (m)
  (let (( c 300000.0)) ; speed of light in km/sec
    ;; E is energy
    ;; m is mass
    (* m c c)))

;;; 5.6
(defun throw-die()
  (+ (random 6) 1))

(defun throw-dice ()
  (list (throw-die) (throw-die)))

(defun snake-eyes-p (throw)
  (equal throw '(1 1)))

(defun boxcars-p (throw)
  (equal throw '(6 6)))

(defun instant-win-p (throw)
  (cond ((equal (+ (first throw) (second throw)) 7) t)
	((equal (+(first throw) (second throw)) 11) t)
	(t nil)))

(defun instant-loss-p (throw)
  (cond ((snake-eyes-p throw) t)
	((boxcars-p throw) t)
	((equal (+ (first throw) (second throw)) 3) t)
	(t nil)))
(defun say-throw (throw)
  (cond ((snake-eyes-p throw) 'snakeeyes)
	((boxcars-p throw) 'boxcars)
	(t (+ (first throw) (second throw)))))

(defun craps()
  (let ((throw (throw-dice)))
	 (append (list 'throw (first throw) 'and (second throw) '--)
		 (cond ((instant-loss-p throw) (list (say-throw throw) '-- 'you 'loose))
		       ((instant-win-p throw) (list (say-throw throw) '-- 'you 'win))
		       (t (list 'your 'point 'is (+ (first throw) (second throw))))))))

(defun try-for-points (x)
  (let* ((throw (throw-dice))
	 (point (+ (first throw) (second throw))))
    (append (list 'throw (first throw) 'and (second throw) '--)
	    (cond ((equal point 7) (list point '-- 'you 'lose))
	          ((equal point x) (list point '-- 'you 'win))
		  (t (list point '-- 'throw 'again))))))
	 
