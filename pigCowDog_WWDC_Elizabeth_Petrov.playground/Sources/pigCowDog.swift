import Foundation
import AVFoundation

public class pigCowDog
{
    var targetNumber: Array<Int> = []
    var numDigits: Int
    var dogSound: AVAudioPlayer!
    var cowSound: AVAudioPlayer!
    var pigSound: AVAudioPlayer!
    var rooster: AVAudioPlayer!
    var backgroundMusic: AVAudioPlayer!
    var cheer: AVAudioPlayer!
    
    public init(digits: Int)
    {
        dogSound = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "dogBark", withExtension: "m4a")!)
        dogSound.play() //The "some audio" mp3 file is in Resources folder
        cowSound = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "cowMoo", withExtension: "m4a")!)
        cowSound.play() //The "some audio" mp3 file is in Resources folder
        pigSound = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "wreee", withExtension: "wav")!)
        pigSound.play() //The "some audio" mp3 file is in Resources folder
        rooster = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "rooster-1", withExtension: "wav")!)
        rooster.play() //The "some audio" mp3 file is in Resources folder
        cheer = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "cheer", withExtension: "wav")!)
        
        backgroundMusic = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "countryLoop-looperman", withExtension: "wav")!)
        backgroundMusic.numberOfLoops = -1
        backgroundMusic.play() //The "some audio" mp3 file is in Resources folder
        
        
        numDigits = digits
        targetNumber = self.generateRandomNumber(numDigs: numDigits)
        print("init myGame:")
        for num in targetNumber
        {
            print(String(num) + " ")
        }
    }
    
    public func toggleMusic()
    {
        print("Before: " + String(describing: backgroundMusic))
        if backgroundMusic != nil {
            if(backgroundMusic.isPlaying)
            {
                backgroundMusic.stop()
            }
            else
            {
                backgroundMusic.play()
            }
        }
        else
        {
            
        }
        print("after: " + String(describing: backgroundMusic))
    }
    
    public func getTargetNumber() -> String
    {
        var output: String = ""
        for num in targetNumber
        {
            output += String(num)
        }
        return output
    }

    public func checkMyGuess(guess: String) -> String
    {
        if(Int(guess) == nil || guess.characters.count > 3 || guess.characters.count < 3)
        {
            rooster.play()
            return " - 🆘 You can't trick me. Enter a 3-digit number 🙄"
        }
        
        
        var myGuess: Array<Int> = getArrayOfGuess(theGuess: guess)
        for num in myGuess
        {
            print(String(num) + " ")
        }
        
        
        var dog = 0  // correct and in right place
        var cow = 0   // correct but in wrong place
        
        for index in 0...(numDigits - 1)
        {
            if(myGuess[index] == targetNumber[index])
            {
                dog += 1
                continue
            }
            else
            {
                for ind in 0...(numDigits - 1)
                {
                    if(ind == index)
                    {
                        //skip this because you arent comparing to the same position
                    }
                    else
                    {
                        if(myGuess[index] == targetNumber[ind])
                        {
                            cow += 1
                            continue
                        }
                    }
                }
            }
        }
        
        if(dog == numDigits)
        {
            cheer.play()
            return " - Correct! YASSSS you guessed it! 🎉"
        }
        else if(dog == 0 && cow == 0)
        {
            pigSound.play()
            return " - \(guess) is a 🐷"
        }
        else
        {
            // looping didnt work for somereason, so using if statements
            if(dog > 0)
            {
                dogSound.play()
            }
            if(cow > 0)
            {
                cowSound.play()
            }

            return " - \(guess) is a " + String(repeating: "🐶", count: dog) + String(repeating: "🐮", count: cow)
        }
        
        
    }
    
    public func getArrayOfGuess(theGuess: String) -> Array<Int> {
        var myTempArray: Array<Int> = []
        for c in theGuess.characters
        {
            myTempArray.append(Int(String(c)) ?? 0)
       }
        
        return myTempArray
    }
    
    public func generateRandomNumber(numDigs: Int) -> Array<Int>{
        var ranNumArray = Array(repeating: 0, count: numDigs)
        var isDistinct = false
        
        // generate random digits that are all distinct
        for index in 0...(numDigs-1)
        {
            if(index == 0)
            {
                ranNumArray[0] = Int(arc4random_uniform(9)) + 1   // 1 to 9
            }
            else
            {
                while(isDistinct == false)
                {
                    ranNumArray[index] = Int(arc4random_uniform(10))    // 0 to 9
                    isDistinct = true
                    
                    for ind in 0...(index - 1)
                    {
                        if(ranNumArray[ind] == ranNumArray[index])
                        {
                            isDistinct = false;
                            break;
                        }
                    }
                }
                isDistinct = false
            }
        }
        
        return ranNumArray
    }

}
