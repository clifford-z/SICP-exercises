#lang racket
(#%require "../Collections/math/basic.scm")
(#%require "../Collections/math/prime.scm")
(#%require "../Collections/math/primes-search.scm")


(search-for-primes 10000000000000) ;1e13
(search-for-primes 100000000000000) ;1e14
(search-for-primes 1000000000000000) ;1e15