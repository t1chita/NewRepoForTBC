//
//  ListView.swift
//  SwiftUIExerciseFirst
//
//  Created by Temur Chitashvili on 22.05.24.
//

import SwiftUI

struct ListView: View {
    
     var titles: [String] = [
        "რა დაუწუნა ბარბარემ ნიკის?", "რა ზომის ფეხი აქვს ვასოს?",
        "რა სიმაღლისაა ანჟელა ew?", "რატომ გაებუტა ბარბარეს ჭეპეტე?",
        "MVC vs MVVM", "ნეტავ რამდენი ხანი გაგრძელდება ეს?"
    ]
    
     var posts: [String] = [
        "ნიკის ამაზე ჯერ განცხადება არ გაუკეთებია, ფანები ელოდებიან რომ რომელიმე მალე სიჩუმეს გაფანტავს",
        "დეველოპერებმა განაცხადეს რომ თუ მას 42 და მეტი ზომა ფეხი აქვს მის მოსმენას აზრი არ აქვს და კომენტარის გარეშე დატოვებენ ლექციას",
        "ანჟელა ew არის მეტრაოთხმოცი, რაც ნიშნავს რომ ის დაახლოებით ტეილორ Swift-ის სიმაღლისაა და დიდი ფეხი აქვს",
        "ამჟამინდელი მონაცემებით ისინი 2 დღე არ ესაუბრებოდნენ ერთმანეთს და როგორც გაირკვა ანიგნორებს აიგნორებდნენ რაღაც იგნორში.",
        "აი ეს MVC გასაგებია, მაგრამ MVVM ჩემამდე არ დადის რა, ამ სვიბთ იუაიში სად ვიყენებთ მაგას?",
        "აღმოჩნდა რომ დეველოპერები ძალიან გახარებულები არიან SwiftUI-ით. ნეტავ რამდენი ხანი გაგრძელდება Honeymoon phase?",
        "აღმოჩნდა რომ დეველოპერები ძალიან გახარებულები არიან SwiftUI-ით. ნეტავ რამდენი ხანი გაგრძელდება Honeymoon phase?",
    ]
    
    @State var buttonBackground: Color = .refreshBackground
    @State var buttonBackgroundChanged: Bool = false
    
    var body: some View {
        ZStack {
            List {
                ForEach(Array(zip(titles, posts)), id: \.0) { item in
                    HStack {
                        Image(.notf)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                        
                        VStack(alignment: .leading,spacing: 3) {
                            Text(item.0)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                            
                            Text(item.1)
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 10))
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { d in
                        d[.leading]}
                    .listRowBackground(Color.background)
                }
            }
            .scrollContentBackground(.hidden)
            
            Button(action: {
                if !buttonBackgroundChanged {
                    buttonBackground = .blue
                    buttonBackgroundChanged = true
                } else {
                    buttonBackground = .refreshBackground
                    buttonBackgroundChanged = false
                }
            }, label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(buttonBackground)
                    .background(Color.white)
                    .cornerRadius(30)
            })
            .padding(EdgeInsets(top: 330, leading: 315, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    ListView()
}
