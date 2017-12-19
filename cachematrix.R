## Code written by Esther Lips, Dec 2017

## function takes matrix as input and returns a set of functions
makeCacheMatrix <- function(x = matrix()) 
{
  m <- NULL
  
  # function to set matrix
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x     # function that gets matrix
  setinverse <- function(inverse) m <<- inverse # function that inverses matrix 
  getinverse <- function() m # function that gets inversed matrix
  
  # return list of functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# function takes matrix that is used as input in function makeCacheMatrix 
# and inverses it by using the functions from makeCacheMatrix
cacheSolve <- function(x, ...) 
{
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}