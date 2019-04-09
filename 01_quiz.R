# Riddle #1: How many months of the year have 28 days?
# Answer #1: All 
# Riddle #2: If you took two apples from a pile of three apples, how many apples do you have?
# Answer #2: Two
# Riddle #3: What has hands, but can’t clap?
# Answer #3: A clock

# Vector of the questions.
questions <- c(
  'How many months of the year have 28 days?: ',
  'If you took two apples from a pile of three apples, how many apples do you have?: ',
  "What has hands, but can't clap?: "
)

# Vector of the answers.
answers <- c('12', '2', 'clock')

# Vector of the menu choices.
menu_choices <- list(
  c(1, 2, 12),
  c(1, 3, 2),
  c('computer mouse', 'barstool', 'clock')
)

# Function to check answer
check_answer <- function(input, answer) {
  if (check.numeric(input)) {
    if (as.numeric(input) == answer) {
      return(TRUE)
    } else {
      return(FALSE)
    }
    
  } else {
    if (grepl(tolower(as.character(answer)), tolower(as.character(input)))) {
      return(TRUE)
    } else {
      return(FALSE)
    }
  }
  
}

# Function for right answer.
right_answer <- function() {
  cat('CORRECT!!! Very good!\n\n')
  beepr::beep(sound = 3)
  Sys.sleep(3)
}

# Function for wrong answer.
wrong_answer <- function(attempt_num) {
  cat('WRONG!!! Try again :=)\n\n')
  attempt_num <- attempt_num + 1
  beepr::beep(sound = 10)
  Sys.sleep(0.5)
  
  return(attempt_num)
}

# Function to ask the questions.
askQuestion <- function(question, answer, menu_choices, menu_answer = '') {
  
  # Initialize attempts counter.
  attempt_num <- 1
  
  # Accept free-text input for first two attempts.
  while(attempt_num < 3) {
    input <- readline(prompt = paste0('Attempt #', attempt_num, ' - ', question))
    boop_boop_beep_boop()
    if(check_answer(input, answer)) { break }
    attempt_num <- wrong_answer(attempt_num)
    }
  
  ### Reach this point if If > 2 attempts OR answer is correct ###
  
  # Check answer.
  if( check_answer(input, answer) ) {
    right_answer()
  } else {
    # If incorrect, display menu of choices.
    menu_answer <- menu(
      choices = menu_choices,
      title = paste0('Attempt #', attempt_num, ' - ', question)
    )
    boop_boop_beep_boop()
    
    if ( check_answer(menu_choices[menu_answer], answer) ) {
      right_answer()
    } else {
      while ( check_answer(menu_choices[menu_answer], answer) == FALSE ) {
        attempt_num <- wrong_answer(attempt_num)
        menu_answer <- menu(choices = menu_choices,
                            title = paste0('Attempt #', attempt_num, ' - ', question))
        boop_boop_beep_boop()
        
      }
    }
    
    right_answer()
    
    
  }
  

}

# Function for jibberish output
boop_boop_beep_boop <- function() {
  for (i in 1:20) {
    x <- 1:50
    vector <- sample(x, 30, replace = TRUE)
    print(paste0('Calculating...: ', intToUtf8(vector)))
    Sys.sleep(0.08)
    
    
  }
}



# Map askQuestion over the vectors
pmap(
  .l = list(
    questions, answers, menu_choices
  ),
  .f = askQuestion
)





