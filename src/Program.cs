using System;

public class Calculator
{
    public int Add(int a, int b)
    {
        return a + b;
    }

    public int Subtract(int a, int b)
    {
        return a - b;
    }

    public static void Main(string[] args)
    {
        Calculator calc = new Calculator();
        Console.WriteLine("Add: " + calc.Add(5, 3));
        Console.WriteLine("Subtract: " + calc.Subtract(5, 3));
    }
}
