//: Playground - noun: a place where people can play

import UIKit
import Foundation




//Regular expression for email, phone number, date, and SSN



/*Email address regex take string and return bool
 ?www.          //optional www.
 b(a-z).        //at least one letter then a-z loop with a . at the end
 ?(a-z).        //potentially another set of a-z like followed by a .
 [edu, com]     // ends with string edu or com
*/


let phonePattern = "(((((\\d{3})(-?))|(\\(\\d{3}\\)))(\\d{3})(-?)(\\d{4})))"
let testPhoneValue = "(123)456-7890" // "(1234)456-7890" fails test
let emailPattern = "(([a-z])+@([a-z]+)\\.com)"
let testEmailValue = "test@email.com" //test@@email.com fails test


enum type: String {
    case email, phone, date, SSN
}

func testPhone(value: String)-> Bool{
    
    //This code returns the strings for all matches
//    let matches = regex.matches(in: pat, options: [], range:NSRange(location: 0, length: pat.characters.count))
//    regex.numberOfMatches(in: pat, options: [], range: NSRange(location: 0, length: pat.characters.count))
//    for match in matches{
//
//            let range = match.rangeAt(0)
//            let r = pat.index(pat.startIndex, offsetBy: range.location) ..< pat.index(pat.startIndex, offsetBy: range.length + range.location)
//        
//            print(pat.substring(with: r))
//      
//    }
    let regex = try! NSRegularExpression(pattern: phonePattern, options: [])
    
    
    //This returns true if there is a valid string in the whole string
    if regex.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.characters.count)) != nil {
            return true
        } else {
            return false
        }
}


func testEmail(value: String)-> Bool{
    let regex = try! NSRegularExpression(pattern: emailPattern, options: [])
    
    //This returns true if there is a valid string in the whole string
    if regex.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.characters.count)) != nil {
        return true
    } else {
        return false
    }
}


func testAllRegEx(value: String, function: (String) -> Bool, type: type) -> Bool{
    
  
    if function(value){
        print("Valid \(type)")
        return true
    }else {
        print("Invalid \(type)")
        return false
    }
    
}






assert(testPhone(value: testPhoneValue))
assert(testEmail(value: testEmailValue))


assert(testAllRegEx(value: testPhoneValue, function: testPhone, type: type.phone))//Valid phone because input is phone number
assert(testAllRegEx(value: testEmailValue, function: testPhone, type: type.phone) == false) //Invalid phone because input is email address

assert(testAllRegEx(value: testEmailValue, function: testEmail, type: type.email)) //Valid email because input is email address
assert(testAllRegEx(value: testPhoneValue, function: testEmail, type: type.email) == false) //Invalid email because input is phone number


/*
 Phone number regex take numbers and return bool
 1-
 3(d)         //3 number (0-9)
 ?-
 3(d)         //3 number (0-9)
 ?-
 4(d)          // 4 numbers (0-9) 
*/

/* SSN Regex = take numbers and return bool
 
 */
