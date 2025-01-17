## Put comments here that give an overall description of what your
## functions do

## The functions do create an inverse of a matrix and store/cache the object in memory to accelerate subsequent access instead of repeatedly calculating the inverse

## Write a short comment describing this function

## The first function, makeCacheMatrix creates a Matrix, which is really a list containing a function to

## set the value of the matrix
## get the value of the matrix
## set the Inverse of the matrix
## get the Inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) {m <<- inverse}
        getInverse <- function() {m}
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## Write a short comment describing this function
## The following function calculates the Inverse of the matrix created with the above function. However, it first checks to see if the Inverse has already been calculated. If so, it gets the Inverse from the cache and skips the computation. Otherwise, it calculates the Inverse of the data and sets the value of the Inverse in the cache via the setInverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
                
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
}
