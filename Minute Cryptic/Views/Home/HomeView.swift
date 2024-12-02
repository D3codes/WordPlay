//
//  HomeView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

import SwiftUI

struct HomeView: View {
    let defaults = UserDefaults.standard
    let apiWrapper: ApiWrapper = ApiWrapper()
    
    @State var dailyPuzzle: DailyPuzzle?
    
    func getDailyPuzzle() async {
        if let data = defaults.object(forKey: UserDefaultsKeys().dailyPuzzleKey()) as? Data,
           let dp = try? JSONDecoder().decode(DailyPuzzle.self, from: data) {
            self.dailyPuzzle = dp
        }
        
        if dailyPuzzle == nil {
            self.dailyPuzzle = await apiWrapper.getDailyPuzzle()
            
            if let encoded = try? JSONEncoder().encode(dailyPuzzle) {
                self.defaults.set(encoded, forKey: UserDefaultsKeys().dailyPuzzleKey())
                self.defaults.synchronize()
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HomeHeaderView()
                
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 5)
                            .fill(.mcYellow)
                            .frame(height: 150)
                            .padding(.horizontal, 15)
                            .padding(.top, 15)
                        
                        VStack {
                            Text("The Daily Clue")
                                .font(.custom("mulish", size: 25))
                                .foregroundStyle(.black)
                                .bold()
                            Text("Solve a clue with a hidden meaning.")
                                .font(.custom("mulish", size: 20))
                                .foregroundStyle(.black)
                            
                            if dailyPuzzle != nil {
                                NavigationLink(destination: DailyPuzzleView(dailyPuzzle: dailyPuzzle!)) {
                                    ZStack {
                                        Capsule()
                                            .stroke(.black, lineWidth: 5)
                                            .fill(.mcPurple)
                                            .frame(width: 200, height: 50)
                                        Text("play")
                                            .font(.custom("sansita", size: 25))
                                            .tint(.black)
                                            .bold()
                                    }
                                }
                            } else {
                                ZStack {
                                    Capsule()
                                        .stroke(.black, lineWidth: 5)
                                        .fill(.mcPurple)
                                        .frame(width: 200, height: 50)
                                    Text("play")
                                        .font(.custom("sansita", size: 25))
                                        .tint(.black)
                                        .bold()
                                    Capsule()
                                        .fill(.thinMaterial.opacity(0.8))
                                        .frame(width: 200, height: 50)
                                    ProgressView()
                                      .progressViewStyle(CircularProgressViewStyle(tint: .black))
                                      .scaleEffect(1.5, anchor: .center)
                                }
                            }
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 5)
                            .fill(.mcPurple)
                            .frame(height: 120)
                            .padding(.horizontal, 15)
                            .padding(.top, 10)
                        
                        VStack {
                            Text("Weekly Mini")
                                .font(.custom("mulish", size: 25))
                                .bold()
                                .tint(.primary)
                            Text("Play the Weekly 7x7 Cryptic Crossword.")
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                                .font(.custom("mulish", size: 20))
                                .tint(.primary)
                        }
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.thinMaterial.opacity(0.9))
                            .frame(height: 120)
                            .padding(.horizontal, 15)
                            .padding(.top, 10)
                        
                        Text("Coming Soon")
                            .font(.custom("mulish", size: 40))
                            .bold()
                            .tint(.primary)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 5)
                            .fill(.mcBlue)
                            .frame(height: 120)
                            .padding(.horizontal, 15)
                            .padding(.top, 10)
                        
                        VStack {
                            Text("Archive")
                                .font(.custom("mulish", size: 25))
                                .bold()
                                .tint(.primary)
                            Text("Enjoy full access to the Minute Cryptic archive.")
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                                .font(.custom("mulish", size: 20))
                                .tint(.primary)
                        }
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.thinMaterial.opacity(0.9))
                            .frame(height: 120)
                            .padding(.horizontal, 15)
                            .padding(.top, 10)
                        
                        Text("Coming Soon")
                            .font(.custom("mulish", size: 40))
                            .bold()
                            .tint(.primary)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 5)
                            .fill(.mcYellow)
                            .frame(height: 120)
                            .padding(.horizontal, 15)
                            .padding(.top, 10)
                        
                        VStack {
                            Text("Submit Clues")
                                .font(.custom("mulish", size: 25))
                                .bold()
                                .tint(.primary)
                            Text("Send in your clues for the chance to see them featured!")
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                                .font(.custom("mulish", size: 20))
                                .tint(.primary)
                        }
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.thinMaterial.opacity(0.9))
                            .frame(height: 120)
                            .padding(.horizontal, 15)
                            .padding(.top, 10)
                        
                        Text("Coming Soon")
                            .font(.custom("mulish", size: 40))
                            .bold()
                            .tint(.primary)
                    }
                }
                .background(.mcBlue)
            }
            .task {
                await getDailyPuzzle()
            }
        }
    }
}

#Preview {
    HomeView()
}
