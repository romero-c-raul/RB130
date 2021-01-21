- input: string and integer
- output: string

rules
  - Explicit rules
    - Write a program that conforms to they above instructions and encrypts
      tests with the following and simple cipher
      - Replace each letter in the original string with another letter
      - Replace each letter with another letter that is 13 positions away
        from the original letter

ALGORITHM
- Create a collection of alphabet separated by lowercase and uppercase
- Rotate alphabet by the given amount and create a hash that has 
  the original letter as key, and the rotated letter corresponding to that key
  as value
- Split string into characters and transform:
  - For each character
    - If the character is a letter
      - Return the swapped character from the hash created above
    - else
      - Return the current character

- Join characters
