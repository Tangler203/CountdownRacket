#lang racket

;Creates static list of numbers and operators
(define l (list 1 4 '+ 3 '-))
(define f null)
(define x1 null)
(define x2 null)

;static list of operands
(define op (list '+ '+ '+ '+ '+ '- '- '- '- '- '- '* '* '* '* '* '/ '/ '/ '/ '/ ))



; Reverse Polish Notation function, Sourced from https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket

(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    ;(printf "~a\t -> ~a~N" token stack) ; Uncomment to see workings, not recommended for long lists.
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (cons (/ y x) s)]
     [('^ (list x y s ___)) (cons (expt y x) s)]
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))

;How validation works.

;1 stack (r) for validating


;Create stack r starting at 0.
;Pass through expression.
   ;If next element in expression is number, increase r by 1.
   ;If next element in expression is operand, check if r > 1.
      ;If r > 1, decrease r by 1 and move on.
      ;if r < 2, expression is not rpn-compatible. Move on to next expression
;Stack is rpn-compatible if r = 1.
 

(define (valid-rpn? e[r 0])
  (if(null? e)
     (if (= r 1)
         #t
         #f)
     (if(number? (car e) )
        (valid-rpn? (cdr e) (+ r 1))
        (if(> r 1)
           (valid-rpn? (cdr e) (- r 1))
           #f))))

(define (validlength? e[s 0])
  (if(null? e)
     (if( = s 1)
        #t
        #f)
     (if(number? (car e) )
        (validlength?(cdr e) (+ s 1 ))
        (validlength?(cdr e) (- s 1 )))))


(define (sum x)
  (cond ((null? x)
         0)
        (else (cond ((valid-rpn? (car x))
                     ((write (car x))
                      (writeln (calculate-RPN (car x)))
                      (sum (cdr x)) 0))
                    (else (sum (cdr x)) 0)))))


(define (mklist l (s 2) (g null))
  (cond ((<= s (length l))
         (mklist l (+ s 1) (append g (cartesian-product (combinations l s) (remove-duplicates(combinations op (- s 1)))))))
      (else  g)))

(define (rpn l)
  (set! f (mklist l)))

(define (makep l)
  (map (sum (permutations (flatten (car l))))))

'ready

(define (search-for-primes n m)
  (cond ((< n m)
         (sum n)
         (search-for-primes (+ n 1) m))
        (else
         (display " calculating stopped. "))))

