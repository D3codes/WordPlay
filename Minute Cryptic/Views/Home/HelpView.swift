//
//  HelpView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 12/2/24.
//

import SwiftUI

struct HelpView: View {
    
    func highlightText(_ text: String, color: Color) -> AttributedString {
        var a = AttributedString(text)
        a.backgroundColor = color
        
        return a
    }

    func underlineText(_ text: String) -> AttributedString {
        var a = AttributedString(text)
        a.underlineStyle = .single
        
        return a
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("This game started as a TikTok channel!")
                    .font(.custom("mulish", size: 25))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Watching our clue explanations is a great way to learn how to play and develop your intuition. Just ask our tens of thousands of followers! We post explanations of every Minute Cryptic clue.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 15) {
                    Link(destination: URL(string: "https://www.instagram.com/minutecryptic/")!) {
                        Image("igLogo")
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                    
                    Link(destination: URL(string: "https://www.tiktok.com/@minutecryptic")!) {
                        Image("ttLogo")
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                    
                    Link(destination: URL(string: "https://www.youtube.com/@MinuteCryptic")!) {
                        Image("ytApp")
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                    
                    Spacer()
                }
                
                Divider()
                    .frame(height: 2)
                    .background(.primary)
            }
            .padding(.horizontal, 10)
            .padding(.top, 20)
            
            VStack(spacing: 10) {
                Text("How to play")
                    .font(.custom("mulish", size: 25))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Solve the cryptic clue by typing your answer in the grid!")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image("howTo1")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 400)
                    .padding(.vertical, 10)
                
                Text("• When you need some help, ask for a hint or choose to see a random letter in the grid.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("• As you're helped, your **shown count** increases. This is your way of measuring how you did and comparing with friends.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("• The **par number** indicates the typical amount of help a player might need on this clue. If you go under - well done! If over, maybe this just wasn't your clue.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("• When you fill the grid, the **check answer** button enables, and you can see if you got it right!")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .frame(height: 2)
                    .background(.primary)
            }
            .padding(.horizontal, 10)
            
            VStack(spacing: 10) {
                Text("Have fun!")
                    .font(.custom("mulish", size: 25))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                Text("This game isn't about getting it right all the time.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Sometimes the best clues are the ones that blow your mind, totally baffle you, and where you pick up new tricks for next time!")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                Text("P.S. We use the helping letters and hints all the time - they're your friends 😄")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .frame(height: 2)
                    .background(.primary)
            }
            .padding(.horizontal, 10)
            
            VStack(spacing: 10) {
                Text("How to solve")
                    .font(.custom("mulish", size: 25))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Text("Each cryptic clue has a **\(highlightText("definition", color: .mcBlue))** and a secret meaning hidden in **wordplay**, which is made up of **\(underlineText("signpost(s)"))** and **\(highlightText("fodder", color: .mcPurple))**.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("The first step to solving a cryptic clue can be identifying which part is fodder, signpost or definition:")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• **\(highlightText("Fodder:", color: .mcPurple))** a strange combination of words and letters is often a sign of wordplay fodder - you need to use these letters.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• **\(underlineText("Signposts:"))** words that tell you what to do with the fodder.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• **\(highlightText("Definition:", color: .mcBlue))** one or more words that have a direct synonym which is the answer. The definition always appears at the beginning or end of the clue.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Example:")
                    .font(.custom("mulish", size: 25))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                    .padding(.top, 20)
                
                Text("\(highlightText("Struggle", color: .mcBlue)) \(highlightText("with siesta", color: .mcPurple)) \(underlineText("upsetting")) \(highlightText("the", color: .mcPurple)) \(underlineText("Spanish"))")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image("howTo2")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300)
                    .padding(.vertical, 10)
                
                Text("The definition is \(underlineText("Struggle")).")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Text("It could also be \"the Spanish\" (which comes at the end) but it's hard to think of 7-letter synonyms for \"the Spanish\". And you might already be able to think of a synonym for \(underlineText("struggle")) that fits here!")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("The wordplay is \(underlineText("with siesta upsetting the Spanish")). How does this work?")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Text("• **\(highlightText("with", color: .mcPurple))** is fodder and needs us to find a ligitimate abbreviation, which in this case is just \"w\".")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• **\(highlightText("siesta", color: .mcPurple))** is fodder and needs us to find a synonym - \"rest\"")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• **\(underlineText("upsetting"))** is a signpost, telling us to upset or rearrange a word")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• **\(underlineText("Spanish"))** is also a signpost, telling us we need to find the Spanish equivalent for a word.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• **\(highlightText("the", color: .mcPurple))** is the fodder for both \"Spanish\" and \"upsetting\". We need to find a Spanish word for \"the\" - \"el\" - and rearrange it. This gives us \"le\".")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("All this gives us **\(underlineText("w"))** + **\(underlineText("rest"))** + **\(underlineText("le"))**, or \"**\(underlineText("wrestle"))**\" - another word for struggle.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.mcBlue)
                
                Image("howTo3")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300)
                    .padding(.vertical, 10)
                
                Divider()
                    .frame(height: 2)
                    .background(.primary)
            }
            .padding(.horizontal, 10)
            
            VStack(spacing: 10) {
                Text("Learn as you play!")
                    .font(.custom("mulish", size: 25))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Text("You don't need to understand every part of the clue to solve it.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Text("1. Sometimes you might **identify and solve the definition** without understanding the wordplay.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("2. Or perhaps sometimes you **figure out the wordplay** without even knowing the word in the answer (it happens!)")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("3. **A lot of the time you end up moving between wordplay and definition** - understanding part of the wordplay, which gives you a good hint about how the definition works, which then helps you solve the rest of the wordplay.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("This means that you can learn as you play: simultaneously getting the answer and increasing your knowledge of words and cryptic clues!")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Divider()
                    .frame(height: 2)
                    .background(.primary)
            }
            .padding(.horizontal, 10)
            
            VStack(spacing: 10) {
                Text("Common Signposts")
                    .font(.custom("mulish", size: 25))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Text("Rearranging:")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Text("Probably the easiest and most common, this signpost tells you to rearrange a word or words - to find an anagram.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Common rearranging signposts:")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• order")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• destroy")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• hit")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• mix")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• sort")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Example: **Guns of war or any power play (8)**. By playing with the words \"any power\", we can rearrange them into the word \"weaponry\", for guns of war.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Inserting/Surrounding:")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Text("This signpost indicates that you should put letters or words into another word, or put a word around some letters.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Common inserting/surrounding signposts:")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• in")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• inside")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• entering")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• outside")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• capturing")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• without")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Example: **Old South American hotel outside California (5)**. By putting \"inn\" (for hotel) outside \"CA\" (for California), we can get \"Incan\" - a person from an old South American culture.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Shortening:")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Text("A shortening signpost directs you to remove part of a word, or keep only part of a word.")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Common shortening signposts:")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• dropping")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• without")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• disheartened")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• empty")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• first")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• last")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("• clothing")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Example: **Fugitive without a landing strip (6)**. Here, \"without a\" instructs us to remove an \"a\" from runaway (for fugitive), giving \"runway\" - a landing strip!")
                    .font(.custom("mulish", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .frame(height: 2)
                    .background(.primary)
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    HelpView()
}
