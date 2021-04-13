class Player{
    
    let name : String
    let game : String
    let age : Int
    
    // вычисляемое свойство
    var playerInfo : String {
        let playerInfo = """
        Player name is \(name).
        He plays \(game).
        He is \(age) old.
    """
        return playerInfo
    }
    
    init(name: String, game: String, age: Int) {
        self.name = name
        self.game = game
        self.age = age
        
    }
}

protocol PolitePlayer {
    var friends: [Player] { get }
    var haveAFriend: Bool { get }
    
    func smile()
    func appologize() -> String
}

class ProfessionalPlayer : Player {
    let experience : Int
    let retirementAge : Int
    
     init(name: String, game: String, age: Int, experience: Int, retirementAge: Int) {
        self.experience = experience
        self.retirementAge = retirementAge
        super.init(name: name, game: game, age: age)
    }
}

extension ProfessionalPlayer: PolitePlayer{
    var friends: [Player] {
        return [Player(name: "Mike", game: "Basketball", age: 27)]
    }
    
    var haveAFriend: Bool {
        return !friends.isEmpty
    }
    
    func smile() {
        print("Let's smile together")
    }
    
    func appologize() -> String {
        return "Sorry, friend!"
    }
}

let player = Player(name: "Dani", game: "Run", age: 29)
player.playerInfo

let proPlayer = ProfessionalPlayer(name: "Andy", game: "Tenis", age: 24, experience: 5, retirementAge: 35)
proPlayer.playerInfo

proPlayer.appologize()
proPlayer.haveAFriend
