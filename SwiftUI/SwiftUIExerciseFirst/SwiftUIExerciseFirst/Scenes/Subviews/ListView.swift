//
//  ListView.swift
//  SwiftUIExerciseFirst
//
//  Created by Temur Chitashvili on 22.05.24.
//

import SwiftUI

struct ListView: View {
    
    @State var titles: [String] = [
    "რა დაუწუნა ბარბარემ ნიკის?", "რა ზომის ფეხი აქვს ვასოს?",
    "რა სიმაღლისაა ანჟელა ew?", "რატომ გაებუტა ბარბარეს ჭეპეტე?",
    "MVC vs MVVM", "ნეტავ რამდენი ხანი გაგრძელდება ეს?"
    ]
    
    @State var posts: [String] = [
    "ნიკის ამაზე ჯერ განცხადება არ გაუკეთებია, ფანები ელოდებიან რომ რომელიმე მალე სიჩუმეს გაფანტავს",
    "დეველოპერებმა განაცხადეს რომ თუ მას 42 და მეტი ზომა ფეხი აქვს მის მოსმენას აზრი არ აქვს და კომენტარის გარეშე დატოვებენ ლექციას",
    "ანჟელა ew არის მეტრაოთხმოცი, რაც ნიშნავს რომ ის დაახლოებით ტეილორ Swift-ის სიმაღლისაა და დიდი ფეხი აქვს",
    "ამჟამინდელი მონაცემებით ისინი 2 დღე არ ესაუბრებოდნენ ერთმანეთს და როგორც გაირკვა ანიგნორებს აიგნორებდნენ რაღაც იგნორში.",
    "აი ეს MVC გასაგებია, მაგრამ MVVM ჩემამდე არ დადის რა, ამ სვიბთ იუაიში სად ვიყენებთ მაგას?",
    "აღმოჩნდა რომ დეველოპერები ძალიან გახარებულები არიან SwiftUI-ით. ნეტავ რამდენი ხანი გაგრძელდება Honeymoon phase?",
    ]
    
    @State var buttonBackground: Color = .refreshBackground
    
    var body: some View {
        ZStack {
            Color.gray
            .ignoresSafeArea()
#warning ("გაარკვიე zip რას შვება")
            List {
                ForEach(Array(zip(titles, posts)), id: \.0) { item in
                    ZStack {
                        HStack {
                            Image(.notf)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                            
                            VStack {
                                HStack {
                                    Text(item.0)
                                        .font(.system(size: 14, weight: .medium))
                                    Spacer()
                                }
                                HStack {
                                    Text(item.1)
                                        .font(.system(size: 10, weight: .regular))
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 29))
                        }
                    }
                    .listStyle(PlainListStyle())
                    .listRowBackground(Color.gray)
                    .frame(width: 375)
                }
            }
            .background(Color.gray)
            .scrollContentBackground(.hidden)
            HStack {
                Spacer()
                Button(action: {
                    buttonBackground = .blue
                }, label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(buttonBackground)
                        .background(Color.white)
                        .cornerRadius(30)
                })
                .padding(EdgeInsets(top: 330, leading: 0, bottom: 0, trailing: 10))
            }
        }
    }
}

#Preview {
    ListView()
}
