/* [ ] Create a Playground named Human.
* [ ] Make a class named BodyPart.
* [ ] Create 20 classes that are subclasses of BodyPart.
* [ ] Each class should have 3 methods that are specific to that part.
* [ ] Each class should have 3 properties that are specific to that part.

### Hard Mode

* [ ] Connect the body parts through properties.
* [ ] Tell 15 parts to do something from another part... bonus if you can chain 4 + parts through methods.

*/


import UIKit

enum Color: String {
    case Red = "red"
    case Pink = "pink"
    case White = "white"
    case Black = "black"
    
}
class BodyPart {
    var numberOfPart: Int
    var typeOfBody: String
    var human: Bool
    var isAttached: Bool
    var hasHair: Bool
    var weight: Int
    var color: Color
    var isBroken: Bool
    var isEdible: Bool
    var length: Int
    
    init() {
        
        self.numberOfPart = 0
        self.typeOfBody = "Human"
        self.human = true
        self.isAttached = true
        self.hasHair = true
        self.weight = 0
        self.color = Color.Pink
        self.isBroken = false
        self.isEdible = false
        self.length = 0
    }
    func removeBodyPart() {
        self.isAttached = false
    }
    func eatBodyPart() {
        self.isEdible = true
    }
    func crushBodyPart() {
        self.isBroken = true
    }
}
class Head: BodyPart {
    override init() {
        super.init()
        self.hasHair = true
        self.weight = 15
        self.color = Color.Pink
    }
    func isDead() {
            self.color = Color.White
    }
    func isOld() {
        self.hasHair = false
    }
    func isFat() {
        self.weight = 25
    }
}
class Neck: BodyPart {
    var holdsHead: Bool
    var diameter: Int
    var tattoos: String
    
    override init() {
        self.holdsHead = true
        self.tattoos = "Live, Laugh, Love"
        self.diameter = 20
    }
    func decapitate() {
        self.holdsHead = false
    }
    func tattooRemoval() {
        self.tattoos = " iv , L  g , ove"
    }
    func gainsWeight() {
        self.diameter = 45
    }
}
class Pecks: BodyPart {
    var numberOf: Int
    var tattoos: String
    var size: String
    
    override init() {
        self.numberOf = 2
        self.size = "small"
        self.tattoos = "2 Tuff 2 Lern"
    }
    func worksOut() {
        self.size = "large"
    }
    func getsMoreTattoos() {
        self.tattoos = "Hillary 4 Prez"
    }
    func surgery() {
        self.numberOf = 3
    }
}
class Spine: BodyPart {
    override init() {
        super.init()
        self.isBroken = false
        self.isEdible = false
        self.color = Color.White
    }
    func fallsDownStairs() {
        self.isBroken = true
    }
    func becomesCannibal() {
        self.isEdible = true
    }
    func getsCannibalized() {
        self.color = Color.Red
    }
}
class Arms: BodyPart {
    override init() {
        super.init()
        self.numberOfPart = 2
        self.length = 32
        self.color = Color.Pink
    }
    func swordJuggling() {
        self.numberOfPart = 0
    }
    func motorcycleAccident() {
        self.length = 10
    }
    func playingWithFire() {
        self.color = Color.Black
    }
}
class Legs: BodyPart {
    override init() {
        super.init()
        self.isAttached = true
        self.hasHair = true
        self.isEdible = false
    }
    func walk() {
}
    func trip() {
}
    func kick() {
}
class Finger: BodyPart {
    override init() {
        super.init()
        self.isBroken = true
        self.length = 4
        self.numberOfPart = 8
    }
}
class Thumbs: BodyPart {
    override init() {
        super.init()
        self.human = true
        self.color = Color.Pink
        self.numberOfPart = 2
    }
    func goodJob() {
    }
    func gouge() {
    }
    func execute() {
    }
}
class Teeth: BodyPart {
    override init() {
        super.init()
        self.color = Color.White
        self.numberOfPart = 28
        self.isEdible = false
    }
    func bite() {
    }
    func gnash() {
    }
    func fallOut() {
    }
}
class Ears: BodyPart {
    override init() {
        super.init()
        self.hasHair = false
        self.isAttached = true
        self.length = 4
    }
    func hear() {
    }
    func bleed() {
    }
    func gauge() {
    }
}
class Eyes: BodyPart {
    override init() {
        super.init()
        self.color = Color.White
        self.hasHair = false
        self.numberOfPart = 2
    }
    func look() {
    }
    func glare() {
    }
    func shootLasers() {
    }
}
class Nose: BodyPart {
    override init() {
        super.init()
        self.isBroken = true
        self.length = 5
        self.weight = 1
    }
    func smell() {
    }
    func snortCocaine() {
    }
    func sneeze() {
    }
}
//13
class Tongue: BodyPart {
    override init() {
        super.init()
        self.numberOfPart = 1
        self.length = 2
        self.isAttached = true
    }
    func lick() {
    }
    func remove() {
    }
    func pullThroughThroat() {
    }
}
class Lungs: BodyPart {
    override init() {
        super.init()
        self.color = Color.Black
        self.hasHair = true
        self.numberOfPart = 2
    }
    func smoke() {
    }
    func haveCancer() {
    }
    func fillWithFluid() {
    }
}
class Liver: BodyPart {
    override init() {
        super.init()
        self.color = Color.Red
        self.isAttached = true
        self.isBroken = true
    }
    func processAlcohol() {
    }
    func contractPsoriasis() {
    }
    func regrow() {
    }
}
//16
class Kidney: BodyPart {
    override init() {
        super.init()
        self.color = Color.Red
        self.numberOfPart = 2
        self.length = 4
    }
    func removeToxins() {
    }
    func fail() {
    }
    func causeJaundice() {
    }
}
class Brain: BodyPart {
    override init() {
        super.init()
        self.weight = 8
        self.isEdible = true
        self.human = true
    }
    func think() {
    }
    func hemorrhage() {
    }
    func removeFrontalLobe() {
    }
}
class Heart: BodyPart {
    override init() {
        super.init()
        self.isEdible = true
        self.weight = 5
        self.color = Color.Red
    }
    func tacchycardia() {
    }
    func murmur() {
    }
    func arrest() {
    }
}
class Skull: BodyPart {
    override init() {
        super.init()
        self.color = Color.White
        self.numberOfPart = 1
        self.weight = 5
    }
    func crack() {
    }
    func lookSpooky() {
    }
    func protectBrain() {
    }
}
class Stomach: BodyPart {
    override init() {
        super.init()
        self.weight = 20
        self.isAttached = true
        self.hasHair = false
    }
    func digest() {
    }
    func puke() {
    }
    func autocannibalize() {
    }
}
}

