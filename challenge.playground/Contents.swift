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

//Challenge 7: Condense whitespace
//Difficulty: Easy
//Write a function that returns a string with any consecutive spaces replaced with a single space.
//Sample input and output
//I’ve marked spaces using “[space]” below for visual purposes:
//• The string “a[space][space][space]b[space][space][space]c” should return “a[space]b[space]c”.
//• The string “[space][space][space][space]a” should return “[space]a”.
//• The string “abc” should return “abc”.

func challenge7a(_ text: String) -> String {
    let components = text.components(separatedBy: .whitespacesAndNewlines)
    return components.filter{!$0.isEmpty}.joined(separator: " ")
    
}
challenge7a("  a    b  c ")

func challenge7b(_ text: String) -> String {
    var seenSpace = false
    var returnValue = ""
    
    for char in text {
        if char != " " {
            returnValue.append(char)
            seenSpace = false
        } else {
            if !seenSpace {
                returnValue.append(char)
                seenSpace = true
            } else {
                continue
                
            }
        }
    }
    return returnValue
}

challenge7b("  a    b  c ")

func challenge7c(_ text: String) -> String {
    return text.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

challenge7c("  a    b  c ")


//Challenge 8: String is rotated
//Difficulty: Tricky
//Write a function that accepts two strings, and returns true if one string is rotation of the other,
//taking letter case into account.
//Tip: A string rotation is when you take a string, remove some letters from its end, then append them to the front. For example, “swift” rotated by two characters would be “ftswi”.
//Sample input and output
//• The string “abcde” and “eabcd” should return true.
//• The string “abcde” and “cdeab” should return true.
//• The string “abcde” and “abced” should return false; this is not a string rotation.
//• The string “abc” and “a” should return false; this is not a string rotation.
let textx = "cat"
print(textx + textx)

func challenge8a(_ text1: String, _ text2: String) -> Bool {
    let doubleText1 = text1 + text1
    return doubleText1.contains(text2) && doubleText1.count == text2.count * 2
}
challenge8a("abcde", "eabcd")
challenge8a("abcde", "cdeab")
challenge8a("abcde", "abced")
challenge8a("abc", "a")


//Challenge 9: Find pangrams
//Difficulty: Tricky
//Write a function that returns true if it is given a string that is an English pangram, ignoring
//letter case.
//Tip: A pangram is a string that contains every letter of the alphabet at least once.
//Sample input and output
//• The string “The quick brown fox jumps over the lazy dog” should return true.
//• The string “The quick brown fox jumped over the lazy dog” should return false, because it’s missing the S.

func challenge9a(_ text: String) -> Bool {
    var alphabets : [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    for char in text.lowercased() {
        guard let index = alphabets.firstIndex(of: char) else { continue }
        alphabets.remove(at: index)
    }
    if alphabets.count == 0 { return true}
    return false
}

challenge9a("The quick brown fox Jumps over the lazy dog")
challenge9a("The quick brown fox jumped over the lazy dog")

func challenge9b(_ text: String) -> Bool {
    let set = Set(text.lowercased())
    let letters = set.filter{ $0 >= "a" && $0 <= "z" }
    return letters.count == 26
}

challenge9b("The quick brown fox Jumps over the lazy dog")
challenge9b("The quick brown fox jumped over the lazy dog")


//Challenge 10: Vowels and consonants
//Difficulty: Tricky
//Given a string in English, return a tuple containing the number of vowels and consonants.
//Tip: Vowels are the letters, A, E, I, O, and U; consonants are the letters B, C, D, F, G, H, J, K, L, M, N, P, Q, R, S, T, V, W, X, Y, Z.
//Sample input and output
//• The input “Swift Coding Challenges” should return 6 vowels and 15 consonants.
//• The input “Mississippi” should return 4 vowels and 7 consonants.

func challenge10a(_ text: String) -> (Int, Int) {
    var vowelCount = 0
    var consonentCount = 0
    let noSpace = text.filter{ $0 != " "}
    let vowels = "aeiou"
    let consonants = "bcdfghjklmnpqrstvwxyz"
    for char in noSpace.lowercased() {
        if vowels.contains(char) {
            vowelCount += 1
        } else if consonants.contains(char){
            consonentCount += 1
        }
    }
    return (vowelCount, consonentCount)
}

print(challenge10a("Swift Coding Challenges"))
print(challenge10a("Mississippi"))

//Challenge 11: Three different letters
//Difficulty: Tricky
//Write a function that accepts two strings, and returns true if they are identical in length but
//have no more than three different letters, taking case and string order into account.
//Sample input and output
//• The strings “Clamp” and “Cramp” would return true, because there is one letter difference.
//• The strings “Clamp” and “Crams” would return true, because there are two letter differences.
//• The strings “Clamp” and “Grams” would return true, because there are three letter differences.
//• The strings “Clamp” and “Grans” would return false, because there are four letter differences.
//• The strings “Clamp” and “Clam” would return false, because they are different lengths.
//• The strings “clamp” and “maple” should return false. Although they differ by only one
//letter, the letters that match are in different positions.






