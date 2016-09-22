//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String, wordB: String) {
        self.wordA = wordA
        self.wordB = wordB
    }

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?


//: [Yes, they are both of type String. The class variables are defined as strings and the constructor also takes Strings or nils and wraps up the variable as an optional. The exclamation point unwraps the optional when evaluating.]


//: ## Q2: Variable Types and Function Types
    class func arePalindromes(words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reversed())}
        let numElements = words.count
        
        for i in 0...(numElements-1) {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
//: ### Why does the compiler dislike the **for loop**? Fix it.
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: [The compiler dislikes the for loop because the range should be from 0 to (numElements-1), not "0..< numElements". We want to include all this indices and this means starting from 0 and stopping right before the length of the list. We need class at the beginning of the function name because the function arePalindrome is part of the class Words]


//: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters : [Character : Int] = [:]//Line X
        let lenA = self.wordA.characters.count
        let lenB = self.wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
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


//: [The problem in Line X is that we have not initialized the dictionary. I added the [:] to the end in order to do so. Also at the end of function, it should return true, not nil, because a boolean needs to be returned. The function should not be a class function because isAnagram needs to be called on an object of the words class. Xcode also recommended that I change var lenA and var lenB to let lenA and let lenB because the instances do not change. Also it recommended that I remove letter from the laster for loop because it is unused]
    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(words: ["hih", "racecar", "mom", "wow"])
Words.arePalindromes(words: ["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
