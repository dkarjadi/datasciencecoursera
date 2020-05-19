InvMtxCache <- function(x, ...) {
  m <- x$getinverse()
  if (!is.null(m)) {
    return(m)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i 
}