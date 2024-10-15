#!/bin/bash


#Before 
# fibonacci() {
#     a=0
#     b=1
#     for (( i=0; i<$1; i++ )); do
#         echo -n "$a "
#         temp=$((a + b))
#         a=$b
#         b=$temp
#     done
#     echo
# }


#After
# Fibonacci function to print the sequence up to n terms
fibonacci() {
    local a=0
    local b=1
    local temp

    # Loop to generate the Fibonacci sequence
    for (( i=0; i<$1; i++ )); do
        echo -n "$a "
        temp=$((a + b))
        a=$b
        b=$temp
    done
    echo
}

# Check if the user provided the number of terms as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <number_of_terms>"
    exit 1
fi

# Call the fibonacci function with the user's input
fibonacci $1
