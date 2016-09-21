//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?

//: The values passed into the init function and the values set to the instance variables possible will be the of the same type because the parameter passed into the init function is used to assign the instance variable.


    //: ## Q2: Variable Types and Function Types
    func arePalindromes(_ words: [String]) -> Bool { //func arePalindromes takes in string array labeled words and returns a boolean
        let reversedWords = words.map() {String($0.characters.reversed())} //reverses the string argument
        let numElements = words.count //counts the numbers of letters in the word
        
        for i in 0 ..< numElements { //iterates over the index of the string to see if letters are the same when word is reversed
            if words[i] != reversedWords[i] {
                return false
            } else { //I added this line in because there is no return True line
                return true
            }
        }
    }
    //: ### Why does the compiler dislike the **for loop**? Fix it.
    //: ### What else is wrong with this function? You may have to refer to (but **not**
    //: ### change) the code at the very bottom. Debug the function.
    
    
    //: [I think this function didn't have a return true statatement because at the bottom, there are palindromes that get passed into this function.]
    
    
    //: ## Q3: More Functions and Object Initialization
    class func isAnagram() -> Bool {
        //var countLetters : [Character : Int] //Line X
        var countLetters = [Character : Int]() //Line X, creates empty dictionary of keys character and value integer
        var lenA = wordA.characters.count //gets lengths of wordA and wordB
        var lenB = wordB.characters.count
        
        if lenA != lenB { //compares length of wordA and wordB. If they aren't equal, then they can't be anagrams of each other
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 { //iterates ever character in arrA and counts the appearance of each letter into a dictionary
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y, letter is already in dictionary so value gets updated
                countLetters[letter] = val + 1
            } else { //new letter in dictionary so value is set to 1
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] { //decrements the value by one everytime the letter shows up in the word for the dict
                countLetters[letter] = val - 1
            } else { //if new letter appears, the words are not anagrams of each other
                return false
            }
        }
        
        for (letter, count) in countLetters { //iterates through values in the dictionary to see if there are any leftover letters or extra letters when arrB decremented the value by the letter of the key
            if count != 0 {
                return false
            }
        }
        
        return true
    }
//: ### What is the problem with declaring **countLetters** as we do in **Line X**,
//: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: ### [In Line X, the convention for creating the empty dictionary would be to use an equal sign for assignment and using paranthesis after the braket to create the empty dictionary. ]
    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(["hih", "racecar", "mom", "wow"])
Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
