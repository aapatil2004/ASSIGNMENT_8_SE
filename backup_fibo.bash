#!/bin/bash

# Script to calculate Fibonacci series and backup the result to a file

backup_file="fibonacci_backup.txt"

# Fibonacci function to calculate the nth Fibonacci number
fibonacci() {
  num=$1

  a=0
  b=1
  temp=0

  while [ $num <= 10 ]; do
    temp=$((a + b))
    a=$b
    b=$temp
    num=$((num - 1))
  done

  echo $a
}

backup() {
  echo "Backing up Fibonacci result..."
  result=$(fibonacci $1)
  echo "Fibonacci result for $1 is: $result"
  
  echo "Fibonacci result for $1: $result" >> $backup_file
}

if [ $# -eq 0 ]; then
  echo "Please provide a number as an argument."
  exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please provide a positive integer."
  exit 1
fi

backup $1
