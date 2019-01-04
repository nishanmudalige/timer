library(beepr)

# Set a warning at 60, 30, 10 min
# Can run in ht background as shell script

timer = function(){
  
  require(beepr)
  
  start.time = as.numeric(Sys.time())
  current.time = start.time
  end.time = start.time + 6*60*60
  
  n.warn.interval = 3
  n.warn.end = 3
  
  flag.60 = FALSE
  flag.30 = FALSE
  flag.10 = FALSE
  flag.end = FALSE
  
  while(current.time < end.time){
    current.time = as.numeric(Sys.time())
    
    
    # 60 minute warning
    if(current.time >= end.time-(60*60) & flag.60 == FALSE ){
      warning.text = (paste("Your current session will expire and your token will become invalid in 60 minutes at",
                             Sys.time() + 60,sep=" "))
      
      # display warning message n.warn number of times
      for(i in 1:n.warn.interval){
        warning(warning.text, call. = FALSE, immediate. = TRUE)
      }
      flag.60 = TRUE
      current.time = as.numeric(Sys.time())
      beepr::beep()
    }
    
    
    # 30 minute warning
    if(current.time >= end.time-(30*60) & flag.30 == FALSE ){
      warning.text = (paste("Your current session will expire and your token will become invalid in 30 minutes at",
                             Sys.time() + 60,sep=" "))
      
      # display warning message n.warn number of times
      for(i in 1:n.warn.interval){
        warning(warning.text, call. = FALSE, immediate. = TRUE)
      }
      flag.30 = TRUE
      current.time = as.numeric(Sys.time())
      beepr::beep()
    }
    
    
    # 10 minute warning
    if(current.time >= end.time-(10*60) & flag.10 == FALSE ){
      warning.text = (paste("Your current session will expire and your token will become invalid in 30 minutes at",
                             Sys.time() + 10,sep=" "))
      
      # display warning message n.warn number of times
      for(i in 1:n.warn.interval){
        warning(warning.text, call. = FALSE, immediate. = TRUE)
      }
      flag.10 = TRUE
      current.time = as.numeric(Sys.time())
      beepr::beep()
    }
    
    # Token Expiry warning
    # Token Expiry warning
    # Token Expiry warning
    if(current.time >= end.time-2 & flag.end == FALSE ){
      
      for(i in 1:n.warn.end){
        warning("Your token has expired. Please login to BOLD with a new token", 
                call. = FALSE, immediate. = TRUE)
        beepr::beep()
      }
      flag.end = TRUE
    }  
    
  }
  
}