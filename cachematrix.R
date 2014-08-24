## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

## functions do

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
 cacheMatrix <- makeVector(x) # call the makeVector accessory function
im <- x$getInverse # get the Inverse attribute from the "getter" (i.e. "get" function)
if (!is.null(im)) {
message("Getting the cached inverseMatrix")
return(im) # if the inverse already exists, get the inverse from the cache
} else {
inverseMatrix <- cacheSolve(x) # if the inverse does not yet exist, cacheSolve will return the inverse
}
setinverse <- function(cacheMatrix) cacheSolve(cacheMatrix) #"setter"
getInverse <- function(cacheMatrix) cacheMatrix #"getter"
list(set = set, get = get, # create storage for resulting S3 objects
setInverse = setInverse,
getInverse = getInverse)
return(cacheMatrix)

}


## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         inverseMatrix <- solve(x) #solve returns the inverse of a matrix when given an invertible matrix as input (we assume that the input is an invertible matrix in this assignment)
return(inverseMatrix) #explicitly returning the return value with the return function is slower though perhaps clearer, cleaner code.
}
