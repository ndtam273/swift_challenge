import UIKit

//Challenge 1:

//Write a function that accepts a String as its only parameter, and returns true if the string has
//only unique letters, taking letter case into account.
//Sample input and output
//• The string “No duplicates” should return true.
//• The string “abcdefghijklmnopqrstuvwxyz” should return true.
//• The string “AaBbCc” should return true because the challenge is case-sensitive.
//• The string “Hello, world” should return false because of the double Ls and double Os.

let test1 = "AaBbCc"
let test2 = "No duplicates"
let test3 = "Hello, world"

func challenge1a(_ text: String) -> Bool {
        for char in text {
        let charCount = text.components(separatedBy: String(char)).count - 1
            if charCount > 1  {return false}
    }
    return true
    
}
challenge1a(test3)
challenge1a(test2)
challenge1a(test1)

func challenge1b(_ text: String) -> Bool {
    var chars = [Character]()
    for char in text {
        if chars.contains(char) {
            return false
        }
        chars.append(char)
    }
    return true
    
}

challenge1b(test3)
challenge1b(test2)
challenge1b(test1)


func challenge1c(_ text: String) -> Bool {
    return Set(text).count == text.count
}

challenge1c(test3)
challenge1c(test2)
challenge1c(test1)


// Challenge 2:
//Write a function that accepts a String as its only parameter, and returns true if the string
//reads the same when reversed, ignoring case.
//Sample input and output
//• The string “rotator” should return true.
//• The string “Rats live on no evil star” should return true.
//• The string “Never odd or even” should return false; even though the letters are the
//same in reverse the spaces are in different places.
//• The string “Hello, world” should return false because it reads “dlrow ,olleH”
//backwards.

func challenge2a(_ text: String) -> Bool {
    return Array(text.lowercased()) == text.lowercased().reversed()
}

challenge2a("rotator")
challenge2a("Hello, world")
challenge2a("Never odd or even")
challenge2a("Rats live on no evil star")


//Challenge 3: Do two strings contain the same characters?
//Difficulty: Easy
//Write a function that accepts two String parameters, and returns true if they contain the same characters in any order taking into account letter case.
//Sample input and output
//• The strings “abca” and “abca” should return true.
//• The strings “abc” and “cba” should return true.
//• The strings “ a1 b2 ” and “b1 a2” should return true.
//• The strings “abc” and “abca” should return false.
//• The strings “abc” and “Abc” should return false.
//• The strings “abc” and “cbAa” should return false.

func challenge3a(_ text1: String, _ text2: String) -> Bool {
    let trimText1 = text1.trimmingCharacters(in: .whitespaces)
    let trimText2 = text2.trimmingCharacters(in: .whitespaces)
    guard trimText1.count == trimText2.count else {return false}
    for char in trimText1 {
        if trimText2.contains(char) {
            continue
        }
        return false
    }
    return true
}

challenge3a("abca", "abca")
challenge3a("abc", "cba")
challenge3a("abc", "Abc")
challenge3a("abc", "cbAa")
challenge3a("abc", "abca")
challenge3a(" a1 b2 ", "b1 a2")

func challenge3b(_ text1: String, _ text2: String) -> Bool {
    let trimText1 = text1.trimmingCharacters(in: .whitespaces)
    var checkingText = Array(text2.trimmingCharacters(in: .whitespaces))
    for char in trimText1 {
        if let index = checkingText.firstIndex(of: char) {
            checkingText.remove(at: index)
        } else {
            return false
        }
        
    }
    return checkingText.count == 0
}
challenge3b("abca", "abca")
challenge3b("abc", "cba")
challenge3b("abc", "Abc")
challenge3b("abc", "cbAa")
challenge3b("abc", "abca")
challenge3b(" a1 b2 ", "b1 a2")

func challenge3c(_ text1: String, _ text2: String) -> Bool {
    let array1 = Array(text1.trimmingCharacters(in: .whitespaces))
    let array2 = Array(text2.trimmingCharacters(in: .whitespaces))
    return array1.sorted() == array2.sorted()
}

challenge3c("abca", "abca")
challenge3c("abc", "cba")
challenge3c("abc", "Abc")
challenge3c("abc", "cbAa")
challenge3c("abc", "abca")
challenge3c(" a1 b2 ", "b1 a2")

//Challenge 4: Does one string contain another?
//Difficulty: Easy
//Write your own version of the contains() method on String that ignores letter case, and
//without using the existing contains() method.
//Sample input and output
//• The code "Hello, world".fuzzyContains("Hello") should return true.
//• The code "Hello, world".fuzzyContains("WORLD") should return true.
//• The code "Hello, world".fuzzyContains("Goodbye") should return false.

let text = "Hello, world"

extension String {
    func fuzzyContains(_ string: String) -> Bool {
        return self.range(of: string, options: .caseInsensitive) != nil
    }
}
text.fuzzyContains("Hello")
text.fuzzyContains("WORLD")
text.fuzzyContains("Goodbye")

//Challenge 5: Count the characters
//Difficulty: Easy
//Write a function that accepts a string, and returns how many times a specific character appears,
//taking case into account.
//Tip: If you can solve this without using a for-in loop, you can consider it a Tricky challenge.
//Sample input and output
//• The letter “a” appears twice in “The rain in Spain”.
//• The letter “i” appears four times in “Mississippi”.
//• The letter “i” appears three times in “Hacking with Swift”.

func challenge5a(_ text: String, _ char: Character) -> Int {
    var count = 0
    for letter in text.lowercased() {
        if letter == char {
        count += 1
    }
    
}
    return count
}

challenge5a("The train in Spain", "t")


func challenge5b(_ text: String, _ char: Character) -> Int {
    let array = Array(text.lowercased())
    return array.reduce(0) {
        $1 == char ? $0 + 1 : $0
    }
}
challenge5a("The train in Spain", "t")

func challenge5c(_ text: String, _ char: Character) -> Int {
    return text.lowercased().components(separatedBy: String(char)).count - 1
}

challenge5c("The train in Spain", "t")


//Challenge 6: Remove duplicate letters from a string
//Difficulty: Easy
//Write a function that accepts a string as its input, and returns the same string just with
//duplicate letters removed.
//Tip: If you can solve this challenge without a for-in loop, you can consider it “tricky” rather than “easy”.
//Sample input and output
//• The string “wombat” should print “wombat”.
//• The string “hello” should print “helo”.
//• The string “Mississippi” should print “Misp”.

func challenge6a(_ text: String) -> String {
    var chars = [Character]()
    for char in text {
        if !chars.contains(char) {
            chars.append(char)
        }
    }
    return String(chars)
}

challenge6a("Mississippi")

func challenge6b(_ text: String) -> String {
    let array = text.map { String($0)}
    let set = NSOrderedSet(array: array)
    let letters = Array(set) as! Array<String>
    return letters.joined()
}
challenge6b("Mississippi")


