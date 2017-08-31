=begin

Thomas Johannesmeyer

Project Euler Problem 3

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

=end

def isPrime?(n)
=begin
Returns true if n is prime.
=end
  if (n <= 1) then return false                         # Filter numbers below 1
  elsif(n <= 3) then return true                        # 2,3 are prime
  elsif((n % 2 == 0) or (n % 3 == 0)) then return false # filtering even numbers and those divisable by 3
  end

  # Filtering the rest up to sqrt(n)
  i = 5
  while (i*i <= n) do
    if ((n % i == 0) or (n % (i + 2) == 0)) then return false end
    i += 6
  end
  return true
end

def largestPrimeFactor(n)
  tempN = n
  potentialFactor = 2
  primeFactors = []
  currentProduct = 1
  while (potentialFactor <= n/currentProduct) do
    if (tempN % potentialFactor == 0) then
      # potentialFactor is a factor
      primeFactors.push(potentialFactor)
      currentProduct *= potentialFactor
      tempN /= potentialFactor
    end

    potentialFactor += (potentialFactor % 2 == 0) ? 1 : 2   # Increase potentialFactor skip even numbers
    while (!isPrime?(potentialFactor)) do                   # ...as long as we have found the next prime
      potentialFactor += (potentialFactor % 2 == 0) ? 1 : 2 # Increase potentialFactor skip even numbers
    end
  end
  if (n == primeFactors.reject(&:zero?).inject(:*))
    # n was perfectly divisible
    puts "Found Primefactors for n= #{n}: #{primeFactors}"
  else
    puts "Error: n not perfectly divisible. Found Primefactors for n= #{n}: #{primeFactors}"
  end
end

largestPrimeFactor(13195)
largestPrimeFactor(600851475143)

# (1..100).each do |x|
#   largestPrimeFactor(x)
# end
#
# largestPrimeFactor(21)
# largestPrimeFactor(91)

