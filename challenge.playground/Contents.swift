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


