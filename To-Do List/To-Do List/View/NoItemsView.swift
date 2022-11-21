//
//  NoItemsView.swift
//  To-Do List
//
//  Created by Chowdhury Md Rajib  Sarwar on 2/11/22.
//

import SwiftUI

struct NoItemsView: View {
    
    //1.
    @State var animate: Bool = false
    //6.1
    let accent = Color("AccentColor")
    let secondaryAccent = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add a bunch of items to your to do list! Hit the add button to do so")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()) {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                    //6.2
                        .background(animate ? secondaryAccent : accent)
                        .cornerRadius(10)
                }
                //6.3
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccent.opacity(0.7) : accent.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0.0,
                        y: animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            //2.
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
    }
    
    func addAnimation() {
        //3.
        guard !animate else { return }
        //4.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            //5.
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
    }
}
