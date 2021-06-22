


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

;;;Example
(defvar words)
(setf words '((one un)
	      (two deux)
	      (three trois)
	      (four quatre)
	      (five cinq)))

;;;Example
(defvar sounds)
(setf sounds
      '((cow . moo)
	(pig . oink)
	(cat . meow)
	(dog . woof)
	(bird . tweet)))

;;;6.28
(defvar produce)
(setf produce
      '((apple . fruit)
       (celery . veggie)
       (banana . fruit)
	(lettuce . veggie)))

;;;Example
(defvar things)
(setf things
      '((object1 large green shiny cube)
	(object2 small red dull metal cube)
	(object3 red small dull plastic cube)
	(object4 small dull blue metal cube)
	(object5 small shiny red four-sided pyramid)
	(object6 large shiny green sphere)))

(defun description (x)
  (rest (assoc x things)))

(defun differences (x y)
  (set-exclusive-or (description x)
		    (description y)))

;;;Example
(defvar quality-table
  '((large . size)
    (small . size)
    (red . color)
    (green . color)
    (blue . color)
    (shiny . luster)
    (dull . luster)
    (metal . material)
    (plastic . material)
    (cube . shape)
    (sphere . shape)
    (pyramid . shape)
    (four-sided . shape)))

(defun quality (x)
  (cdr (assoc x quality-table)))

(defun quality-difference (x y)
  (quality (first (differences x y))))

(defun contrast (x y)
  (remove-duplicates
   (sublis quality-table (differences x y))))

;;;6.30
(defvar books)
(setf books
      '((war-and-peace leo-tolstoy)
	(the-idiot fyodor-dostoeevsky)
	(zen-and-the-art-of-motorcycle-maintenance Robert-Pirsig)
	(the-three-body-problem lui-cixin)
	(the-illiad homer)))

;;;6.31
(defun who-wrote (book)
  (second (assoc book books
		 )))

;;;6.34
(defvar atlas)
(setf atlas
      '((pennsylvania pittsburgh)
	(new-jersey newark)
	(pennsylvania johnstown)
	(ohio columbus)
	(new-jersey princeton)
	(new-jersey trenton)))

(defvar redesigned-atlas)
(setf redesigned-atlas
      '((pennsylvania (pittsburgh johnstown))
	(new-jersey (newark princeton trenton))
	(ohio (columbus))))
;;6.35
(defvar nerd-states)
(setf nerd-states
      '((sleeping eating)
	(eating waiting-for-a-computer)
	(waiting-for-a-computer programming)
	(programming debugging)
	(debugging sleeping)))

(defun nerdus (state-name)
  (second (assoc state-name nerd-states)))

(defun sleepless-nerd (state-name)
  (if (equal state-name 'debugging) 'eating (nerdus state-name)))

(defun nerd-on-caffine (state-name)
  (nerdus (nerdus state-name)))

;;;6.36
(defun swap-first-last (x)
  (append (last x) (butlast (rest x)) (list (first x))))

;;;6.37
(defun rotate-left (x)
  (append (rest x) (list (first x))))

(defun rotate-right (x)
  (butlast (append (last x) x)))

;;;Example
(defvar rooms)
(setf rooms
      '((living-room
	 (north front-staris)
	 (south dinning-room)
	 (east kitchen))
	
	(upstaris-bedroom
	 (south front-stairs)
	 (west library))
	
	(dining-room
	 (north living-room)
	 (east pantry)
	 (west downstairs-bedroom))

	(kitchen
	 (south pantry)
	 (west living-room))

	(pantry
	 (north kitchen)
	 (west dinning-room))

	(downstaris-bedroom
	 (east dinning-room)
	 (north back-stairs))

	(back-stairs
	 (north library)
	 (south downstaris-bedroom))

	(front-stairs
	 (north upstairs-bedroom)
	 (south living-room))

	(library
	 (east upstairs-bedroom)
	 (south back-stairs))))

(defun choices (room)
  (rest (assoc room rooms)))

(defun look (direction room)
  (second (assoc direction (choices room))))

(defvar loc)
(setf loc 'pantry)

(defun set-robbie-location (place)
  "Moves robbie to PLACE by setting the variable LOC."
  (setf loc place))

(defun how-many-choices ()
  (length (choices loc)))

(defun upstairsp (place)
  (if (or (equal place 'library) (equal place 'upstairs-bedroom)) t ))

(defun onstairsp (place)
  (if (or (equal place 'front-stairs) (equal place 'back-stairs)) t))

(defun where ()
  (cond ((upstairsp loc) (list 'robbie 'is 'upstaris 'in 'the loc))
	((onstairsp loc) (list 'robbie 'is 'on 'the loc))
	(t (list 'robbie 'is 'downstaris 'in 'the loc))))

(defun move (dir)
  (let ((room (look dir loc)))
    (if room (set-robbie-location room) '(ouch! robbie hit a wall))
    (if room (where))))

(defun royal-we (x)
  (subst 'we 'i x))
