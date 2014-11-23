## The function makeCacheMatrix creates a object that can catch the inverse of its matrix.

## The list in this function aim to set/get the matrix, set/get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv = NULL  # inverse of the matrix
  set = function(y) {
    x <<- y
    inv <<- NULL
  }
  get = function() x
  setinv = function(outside_inv) {
    inv <<- outside_inv
  }
  getinv = function() inv
  list(set=set, get=get, setinv = setinv, getinv=getinv)
}


## Calculate the inverse of the matrix returned by makeCacheMatrix.
cacheSolve <- function(x, ...) {
  inv = x$getinv()
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  data = x$get()
  inv = solve(data)
  x$setinv(inv)
  inv
}

git add -A
git commit-m
git push