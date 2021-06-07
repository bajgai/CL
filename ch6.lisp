(defun add-to-end (x e)
  "Adds element E to the end of the list X."
  (append x (list e)))

(defun add-to-end-1 (x y)
  (reverse (cons y (reverse x))))

;;;6.6
(defun last-element (x)
  (first (last x)))

(defun last-element1 (x)
  (first (reverse x)))

(defun last-element2 (x)
  (nth (- (length x) 1)  x))

;;6.7
(defun next-to-last (x)
  (second (reverse x)))

(defun next-to-last2 (x)
  (nth (- (length x) 2) x))

;;;6.8

(defun my-butlast (x)
  (reverse (rest (reverse x))))

;;;6.10

(defun palindromep (x)
  (equal (reverse x ) x))

;;;6.11

(defun make-palindrome (x)
  (append x (reverse x)))

;;;exmple
(defun beforep (x y l)
  "Retruns true if X appears before y in l"
  (member y (member x l)))

;;;6.15
(defun contains-article-p (sent)
  (intersection '(the a an) sent))

(defun contains-article-p1 (sent)
  (or (member 'the sent) (member 'a sent) (member 'an sent)))

(defun contains-article-p2 (sent)
  (not (and (not (member 'the sent))
	    (not (member 'a sent))
	    (not (member 'an sent)))))

;;;6.18
(defun add-vowels (letters)
  (union letters '(a e i o u)))

;;;6.21
(defun my-subsetp (x y)
  (if (equal (set-difference x y) nil) t nil))

;;;6.24
(defun set-equal (x y)
  (and (subsetp x y) (subsetp y x)))

;;;6.25
(defun proper-subsetp (x y)
  (and (subsetp x y) (not (subsetp y x))))

;;; example

(defun titledp (name)
  (member (first name) '(mr ms miss mrs)))

(defvar male-first-names)
(defvar female-first-names)
(setf male-first-names '(john kim richard fred george))
(setf female-first-names '(jane mary wanda barbara kim))

(defun malep (name)
  (and (member name male-first-names)
       (not (member name female-first-names))))

(defun femalep (name)
  (and (member name female-first-names)
       (not (member name male-first-names))))

(defun give-title (name)
  "Returns a name with an appropriate title on the front"
  (cond ((titledp name) name)
	((malep (first name)) (cons 'Mr name))
	((femalep (first name)) (cons 'Ms name))
	(t (append '(mr or ms) name))))

(defun gender-ambigious-name ()
  (intersection male-first-names female-first-names))

(defun uniquely-male-names ()
  (set-difference male-first-names female-first-names))

;;;6.26
(defun right-side (feature)
  (rest (member '-vs- feature)))

(defun left-side (feature)
  (reverse (rest (member '-vs- (reverse feature)))))

(defun count-common (feature)
  (length (intersection (left-side feature) (right-side feature))))

(defun compare (feature)
  (cons (count-common feature) '(common features)))

(defvar words)
(setf words '((one un)
	      (two deux)
	      (three trois)
	      (four quatre)
	      (five cinq)))
