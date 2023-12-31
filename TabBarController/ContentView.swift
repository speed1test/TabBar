//
//  ContentView.swift
//  TabBarController
//
//  Created by elsalvador on 30/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Primera Pestaña")
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }

            Text("Segunda Pestaña")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }

            CircleImageView(imageURL: "https://images.alphacoders.com/121/1218911.jpg")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Perfil")
                }
        }
    }
}

struct CircleImageView: View {
    var imageURL: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()  // Cambiado a .scaledToFill() para ocupar el tamaño completo
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .frame(width: 200, height: 200)  // Ajustado el tamaño
                case .failure:
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill()  // Cambiado a .scaledToFill()
                        .foregroundColor(.blue)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .frame(width: 200, height: 200)  // Ajustado el tamaño
                @unknown default:
                    EmptyView()
                }
            }
            
            Text("Mi Perfil")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
