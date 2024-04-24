int fibonacci(int i){
    if(i == 1 || i == 0) return i;
    return fibonacci(i - 1) + fibonacci(i-2);
}