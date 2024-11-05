import Cocoa

// OPTIONALS

// eg 1
var username: String? = nil /* NOTE: we CANNOT assign nil
                             value to non-optional
                             variables/constants */

// if let can only be used with an optional value
if let unwrappedName = username {
    /* NOTE: This block runs if our optional, 'username'
     has some value which is not nil */
    print("We got a user: \(username).")
} else {
    print("The optional name was empty.")
}

// eg 2
/* NOTE: If we define a function with non-optional
 parameters, we cannot call it by passing an optional
 parameter. The walkaround is to unwrap the optional, see
 if it has a real value, and then call it */

func square(of number: Int) -> Int {
    number * number
}

var sampleNumber: Int? = nil

// unwrapping the optional integer and then calling the func
if let sampleNumber = sampleNumber {
    /* NOTE: here, the constant on the LHS has the same
     name as the optional variable declared above. this is
     called SHADOWING.
     
     The LHS value, i.e., the unwrapped value, only has its
     scope within the braces of the IF CONDITION. outside
     the IF braces, whenever we use 'sampleNumber', we are
     referring to the optional variable. */
    print(square(of: sampleNumber))
} else {
    print("The optional number was empty.")
}

/* NOTE: outside the IF condition, when we use
 'sampleNumber', we are referring to the optional variable,
 whose value is nil in this case */
print(sampleNumber)

// eg 3
let album = "wow"
let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}




// GUARD-LET

/* NOTE: we can also use guard to check non-optional
 values, eg, to check if an array is empty */

// eg 1
func printSquare(of number: Int?) {
    guard let number = number else {
        // this block runs if number does NOT have a value
        print("Missing input")
        return // this return is ALWAYS required with guard
    }
    
    /* NOTE: even though the unwrapped constant 'number'
     was written with the guard block, unlike the if-let
     block, we can use the unwrapped constant within the
     scope of the funciton inside which guard-let was
     called */
    print("\(number) x \(number) = \(number * number)")
}

printSquare(of: 7)
printSquare(of: nil)

// eg 2
func double(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}

let input = 5

if let doubled = double(number: input) {
    print("\(input) doubled is \(doubled).")
}




// NIL COALESCING OPERATOR

// eg 1
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] /* NOTE: since this key
                                does't exit within the
                                disctionary captains, the
                                constant 'new' is assigned
                                an Optional value of 'nil'
                                */

let random = captains["random"] ?? "N/A"
/* NOTE: '??' is the NIL COALESCING operator, and the above
 line works in the following way - we first unwrap
 captains["random"] and if it has a value, then it is
 assigned to the constant random. if not, we assign a
 default value of "N/A". this ensures that the constant
 random will be a NON-OPTIONAL string. */


// eg 2
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Atomic Habits", author: nil)
let author = book.author ?? "Anonymous"
print(author)




// OPTIONAL CHAINIGN
struct Book2 {
    let title: String
    let author: String?
}

let book2: Book2? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"
print(author2)




// FUNCTIONAL FAILURES WITH OPTIONALS
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

// or we can also use it with nil coalescing
let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)




// CHECKPOINT 9
func randomValue(_ array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

let sampleArray1: [Int]? = nil
let result1 = randomValue(sampleArray1)
print(result1)

let sampleArray2: [Int]? = [1, 2, 3, 4, 5]
let result2 = randomValue(sampleArray2)
print(result2)
