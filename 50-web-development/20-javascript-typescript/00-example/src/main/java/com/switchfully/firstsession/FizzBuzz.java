package com.switchfully.firstsession;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;

class FizzBuzz {

    public static void main(String[] args) {
        System.out.println(fizzBuzz(20));
    }

    private static List<String> fizzBuzz(int amount) {
        List<String> result = new ArrayList<>();
        for (int number = 1; number < amount + 1; number++) {
            result.add(convertToFizzBuzz(number));
        }
        return result;
    }

    private static String convertToFizzBuzz(int number) {
        if (number % 15 == 0) {
            return "FizzBuzz";
        }
        if (number % 3 == 0) {
            return "Fizz";
        }
        if (number % 5 == 0) {
            return "Buzz";
        }
        return "" + number;
    }
}
