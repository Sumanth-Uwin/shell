#!/bin/bash
Num1=10
Num2=20
echo "Addition of both variables : $((Num1+Num2))"

Movies =("Oddeyssy" "Inception" "Interstellar" "The Dark Knight")
echo "print all movies: ${Movies[@]}"
echo "first movie : ${Movies[0]}"
echo "second movie : ${Movies[1]}"