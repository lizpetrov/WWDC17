import UIKit
import PlaygroundSupport
import Foundation


// LOAD CUSTON FONTS
// font name == london
let fontURL = Bundle.main.url(forResource: "Barn Owl", withExtension: "ttf")
CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)

let fontURL2 = Bundle.main.url(forResource: "April Flowers - TTF", withExtension: "ttf")
CTFontManagerRegisterFontsForURL(fontURL2! as CFURL, CTFontManagerScope.process, nil)

let myGame = pigCowDog(digits: 3)
print("made myGame")


class mainPageViewController : UIViewController {
    
    
    
    var label : UILabel!
    var label2 : UILabel!
    var label3 : UILabel!
    var textField : UITextField!
    var imageView : UIImageView!
    var wwdcImageView : UIImageView!
    var button: UIButton!
    var titleText: UILabel!
    var subTitleText: UILabel!
    var musicButton: UIButton!
    var questionButton: UIButton!
    var isOnWhichView: Int!  // 1 - main 2 - rules 3 - about me
    var aboutMeButton: UIButton!
    
    func initComponents()
    {
        titleText = UILabel()
        titleText.text = "Pig Cow Dog"
        titleText.font = UIFont(name: "london", size: 60)
        titleText.textAlignment = .center
        titleText.adjustsFontSizeToFitWidth = true
        
        let backGround = UIImage(named: "farmDrawingNoClouds.png")
        imageView = UIImageView(image: backGround)
        // picture creds to freepik
        
        subTitleText = UILabel()
        subTitleText.numberOfLines = 0
        subTitleText.textAlignment = .center
        subTitleText.font = UIFont(name: "April Flowers", size: 30)
        subTitleText.adjustsFontSizeToFitWidth = true
        
        textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Your guess"
        
        button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.tintColor = .red
        
        musicButton = UIButton(type: .system)
        musicButton.setTitle("Toggle Music ", for: .normal)
        musicButton.tintColor = .red
        
        aboutMeButton = UIButton(type: .system)
        aboutMeButton.setTitle("About Me ", for: .normal)
        aboutMeButton.tintColor = .red
        
        questionButton = UIButton(type: .system)
        questionButton.setTitle("Game rules", for: .normal)
        questionButton.tintColor = .red
        
        label = UILabel()
        label.numberOfLines = 0
        label.text = ""
        label.font = UIFont(name: "April Flowers", size: 20)
        label.adjustsFontSizeToFitWidth = true
        
        label2 = UILabel()
        label2.numberOfLines = 0
        label2.text = "\tWelcome to Pig, Cow, Dog! You might know this game as Bulls and Cows, but because there is no Bull emoji I changed it to Dog 😁\n\n\tThe goal of the game is to guess the 3-digit computer generated random number that has all distinct digits.\n\n\tWhen you guess a number, you will get a series of emojis (and sound) in response:\n\n🐷 - Pig - All digits are wrong and not in the final number\n🐮 - Cow - One digit is correct but in the wrong location\n🐶 - Dog - One digit is correct and in the correct location\n\n\tI hope you enjoy this fun farm-themed exploration into Swift Playgrounds!"
        label2.font = UIFont(name: "April Flowers", size: 20)
        label2.adjustsFontSizeToFitWidth = true
        
        label3 = UILabel()
        label3.numberOfLines = 11
        label3.text = "\tMy name is Elizabeth (Liz) Petrov and I am a highschooler from Princeton, NJ. I have been interested in engineering and especially computer programming since I was a little girl. This is my first swift project, and I hope to learn more about how to build killer apps at WWDC with you in June!\n\n\tAt a hackathon I met someone who works for Apple teaching Swift. He told me that recently Swift Playground got the capability of displaying maps! I tried this but I had trouble making it offline maps. So heres a picture of the flight I hope to take in June 🙃😉 (haha):"
        label3.font = UIFont(name: "April Flowers", size: 20)
        label3.adjustsFontSizeToFitWidth = true
        
        let WWDC_map = UIImage(named: "WWDC_map.png")
        wwdcImageView = UIImageView(image: WWDC_map)
        wwdcImageView.contentMode = .scaleAspectFit
        // picture creds to freepik
    }
    
    override func loadView() {
        
        initComponents()
        //loadMainView()
        loadAboutMeView()
    }
    
    func loadMainView() {
        
        // UI
        isOnWhichView = 1
        let view = UIView()
        view.backgroundColor = UIColor(red:0.61, green:0.75, blue:1.00, alpha:1.0)
        
        view.addSubview(imageView)
        
        
        view.addSubview(titleText)
        
        subTitleText.text = "A Short Game Demonstrating the \npower of Swift Playgrounds.\nEnter your 3-digit guess below:"
        view.addSubview(subTitleText)
        
        
        view.addSubview(textField)
        
        
        view.addSubview(button)
        
        
        view.addSubview(musicButton)
        
        aboutMeButton.setTitle("About Me ", for: .normal)
        questionButton.setTitle("Game rules", for: .normal)
        
        aboutMeButton.tintColor = .red
        view.addSubview(aboutMeButton)
        
        questionButton.tintColor = .red
        view.addSubview(questionButton)
        
        
        view.addSubview(label)
        
        self.view = view
        
        // Layout
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        titleText.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        subTitleText.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        questionButton.translatesAutoresizingMaskIntoConstraints = false
        musicButton.translatesAutoresizingMaskIntoConstraints = false
        aboutMeButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            
            questionButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5),
            questionButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            //    questionButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            aboutMeButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5),
            aboutMeButton.leadingAnchor.constraint(equalTo: questionButton.trailingAnchor, constant: 55),
            
            
            musicButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5),
            //     musicButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            musicButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -20),
            imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            titleText.topAnchor.constraint(equalTo: margins.topAnchor, constant: 40),
            titleText.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            titleText.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            subTitleText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 5),
            subTitleText.leadingAnchor.constraint(equalTo: titleText.leadingAnchor),
            subTitleText.trailingAnchor.constraint(equalTo: titleText.trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: subTitleText.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: titleText.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: titleText.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: subTitleText.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -70),
            button.trailingAnchor.constraint(equalTo: titleText.trailingAnchor),
            
            label.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 5),
            label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: titleText.trailingAnchor)
            ])
        
        // Events
        button.addTarget(self, action: #selector(submitResponse), for: .touchUpInside)
        musicButton.addTarget(self, action: #selector(toggleMus), for: .touchUpInside)
        questionButton.addTarget(self, action: #selector(toggleGameRules), for: .touchUpInside)
        aboutMeButton.addTarget(self, action: #selector(toggleAboutMe), for: .touchUpInside)
    }
    
    
    func loadGameRulesView()
    {
        isOnWhichView = 2
        
        let view = UIView()
        view.backgroundColor = UIColor(red:0.61, green:0.75, blue:1.00, alpha:1.0)
        
        
        view.addSubview(imageView)
        
        view.addSubview(titleText)
        
        subTitleText.text = "Game Rules"
        view.addSubview(subTitleText)
        
        view.addSubview(musicButton)
        aboutMeButton.setTitle("About Me ", for: .normal)
        questionButton.setTitle("Back      ", for: .normal)
        
        aboutMeButton.tintColor = .red
        view.addSubview(aboutMeButton)
        questionButton.tintColor = UIColor(red: 0.5569, green: 0, blue: 0.0078, alpha: 1.0) /* #8e0002 */
        view.addSubview(questionButton)
        
        view.addSubview(label2)
        
        self.view = view
        
        // Layout
        label2.translatesAutoresizingMaskIntoConstraints = false
        titleText.translatesAutoresizingMaskIntoConstraints = false
        subTitleText.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        questionButton.translatesAutoresizingMaskIntoConstraints = false
        musicButton.translatesAutoresizingMaskIntoConstraints = false
        aboutMeButton.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            
            questionButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5),
            questionButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            //    questionButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            aboutMeButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5),
            aboutMeButton.leadingAnchor.constraint(equalTo: questionButton.trailingAnchor, constant: 55),
            
            musicButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5),
            //     musicButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            musicButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -20),
            imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            titleText.topAnchor.constraint(equalTo: margins.topAnchor, constant: 40),
            titleText.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            titleText.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            subTitleText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 5),
            subTitleText.leadingAnchor.constraint(equalTo: titleText.leadingAnchor),
            subTitleText.trailingAnchor.constraint(equalTo: titleText.trailingAnchor),
            
            label2.leadingAnchor.constraint(equalTo: subTitleText.leadingAnchor, constant: 2),
            label2.topAnchor.constraint(equalTo: subTitleText.bottomAnchor, constant: 10),
            label2.trailingAnchor.constraint(equalTo: subTitleText.trailingAnchor)
            ])
        
        // Events
        button.addTarget(self, action: #selector(submitResponse), for: .touchUpInside)
        musicButton.addTarget(self, action: #selector(toggleMus), for: .touchUpInside)
        questionButton.addTarget(self, action: #selector(toggleGameRules), for: .touchUpInside)
        aboutMeButton.addTarget(self, action: #selector(toggleAboutMe), for: .touchUpInside)
    }
    
    func loadAboutMeView()
    {
        isOnWhichView = 3
        
        let view = UIView()
        view.backgroundColor = UIColor(red:0.61, green:0.75, blue:1.00, alpha:1.0)
        
        view.addSubview(imageView)
        
        view.addSubview(titleText)
        
        subTitleText.text = "About Me"
        view.addSubview(subTitleText)
        
        view.addSubview(musicButton)
        aboutMeButton.setTitle("Back", for: .normal)
        questionButton.setTitle("Game rules", for: .normal)
        aboutMeButton.tintColor = UIColor(red: 0.5569, green: 0, blue: 0.0078, alpha: 1.0) /* #8e0002 */
        view.addSubview(aboutMeButton)
        questionButton.tintColor = .red
        view.addSubview(questionButton)
        
        view.addSubview(label3)
        
        view.addSubview(wwdcImageView)
        
        self.view = view
        
        // Layout
        label3.translatesAutoresizingMaskIntoConstraints = false
        titleText.translatesAutoresizingMaskIntoConstraints = false
        subTitleText.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        questionButton.translatesAutoresizingMaskIntoConstraints = false
        musicButton.translatesAutoresizingMaskIntoConstraints = false
        aboutMeButton.translatesAutoresizingMaskIntoConstraints = false
        wwdcImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            
            questionButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5),
            questionButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            //    questionButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            aboutMeButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5),
            aboutMeButton.leadingAnchor.constraint(equalTo: questionButton.trailingAnchor, constant: 55),
            
            musicButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5),
            //     musicButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            musicButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -20),
            imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            titleText.topAnchor.constraint(equalTo: margins.topAnchor, constant: 40),
            titleText.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            titleText.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            subTitleText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 5),
            subTitleText.leadingAnchor.constraint(equalTo: titleText.leadingAnchor),
            subTitleText.trailingAnchor.constraint(equalTo: titleText.trailingAnchor),
            
            label3.leadingAnchor.constraint(equalTo: subTitleText.leadingAnchor, constant: 0),
            label3.topAnchor.constraint(equalTo: subTitleText.bottomAnchor, constant: 10),
            label3.trailingAnchor.constraint(equalTo: subTitleText.trailingAnchor),
            
            wwdcImageView.leadingAnchor.constraint(equalTo: label3.leadingAnchor, constant: 5),
            wwdcImageView.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: -500),
            wwdcImageView.trailingAnchor.constraint(equalTo: label3.trailingAnchor)
            
            ])
        
        // Events
        button.addTarget(self, action: #selector(submitResponse), for: .touchUpInside)
        musicButton.addTarget(self, action: #selector(toggleMus), for: .touchUpInside)
        questionButton.addTarget(self, action: #selector(toggleGameRules), for: .touchUpInside)
        aboutMeButton.addTarget(self, action: #selector(toggleAboutMe), for: .touchUpInside)
    }
    
    @objc func toggleAboutMe()
    {
        if(isOnWhichView == 1 || isOnWhichView == 2) // main or gamerules
        {
            isOnWhichView = 3
            loadAboutMeView()
        }
        else
        {
            isOnWhichView = 1
            loadMainView()
        }
    }
    @objc func toggleGameRules()
    {
        if(isOnWhichView == 1 || isOnWhichView == 3) // main or aboutme
        {
            isOnWhichView = 2
            loadGameRulesView()
        }
        else
        {
            isOnWhichView = 1
            loadMainView()
        }
    }
    @objc func toggleMus() {
        myGame.toggleMusic()
    }
    @objc func submitResponse(){
        let guessAnswer = myGame.checkMyGuess(guess: textField.text!)
        updateLabelText(myText: guessAnswer)
    }
    func updateLabelText(myText: String) {
        self.label.text = myText + "\n" + self.label.text!
    }
    
}


let mainGameView = mainPageViewController()

PlaygroundPage.current.liveView = mainGameView
print("added view")

mainGameView.updateLabelText(myText: " - For your reference to make sure the game is working properly, the random target number is: " + myGame.getTargetNumber())
