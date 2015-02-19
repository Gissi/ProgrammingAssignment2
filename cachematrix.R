## functions to store matrix inverse cached in memory. For heavy computational inverses of matrizes 


## creating a function that points to another functions. defining all that functions to 
## work with the matrix. 
## functions available are 
## 1. defining a matrix with a superassignment modifying the variable outside of the enviroment
## 2. setting inverse matrix with a superassignment modifying the variable outside of the enviroment
## 3. Get the input in the function i.e the matrix
## 4. Get the assigned inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## caluclating the inverse of the matrix only if it is not already stored in the cache. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
