//
//  VBooking.swift
//  Zen-u
//
//  Created by Inzamam on 26/04/23.
//

import SwiftUI

struct VBooking: View {
    @State var isShowingPopover = false
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Booking\nVaccinations")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle.weight(.heavy))
            
            HStack{
                Text("Yahan search bar hoga.")
                Spacer()
                Text(" Smjhey?")
            }
            .padding()
            .background(Color("Secondary"))
            .cornerRadius(10)
            .padding(.bottom, 20 )
            
            
            
            
            HStack{
                Image(systemName: "info.circle")
                    .font(.title2)
                    .foregroundColor(.red)
                    .frame(width: 20)
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading) {
                    Text("Covid-19")
                        .font(.headline.weight(.semibold))
                    
                    Text("Search your nearest Vaccination Center")
                        .font(.subheadline.weight(.regular))
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(Color("Secondary"))
            .cornerRadius(10)
            
           
            
            HStack {
                Text("Vaccinations")
                    .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3.weight(.semibold))
                ViewButton(text: "View All", selectable: true)
            }.padding(.trailing, 10)
            
            HStack{
                
                VStack(alignment: .leading) {
                    Text("PSV23")
                        .font(.headline.weight(.semibold))
                    
                    Text("Pfizer")
                        .font(.subheadline.weight(.regular))
                    
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("123")
                        .font(.title.weight(.bold))
                    
                    Text("Available")
                        .font(.subheadline.weight(.bold))
                    
                }
            }
            .padding()
            .background(Color("Secondary"))
            .cornerRadius(10)
            .contextMenu(){
               Text(" asfjka\ndsafjajs\nkajfkasj")
                    .frame(width: 230, height: 60)
                    .onLongPressGesture {
                                   isShowingPopover = true
                               }
                               .popover(isPresented: $isShowingPopover) {
                                   VStack {
                                       Text("Popover title")
                                           .font(.headline)
                                       Text("Popover message")
                                           .font(.subheadline)
                                   }
                                   .padding()
                               }
                
              }
            
            
            HStack{
                
                VStack(alignment: .leading) {
                    Text("PSV23")
                        .font(.headline.weight(.semibold))
                    
                    Text("Pfizer")
                        .font(.subheadline.weight(.regular))
                    
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("123")
                        .font(.title.weight(.bold))
                    
                    Text("Available")
                        .font(.subheadline.weight(.bold))
                    
                }
            }
            .padding()
            .background(Color("Secondary"))
            .cornerRadius(10)
            
            
            HStack {
                Text("Search by Ailment")
                    .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3.weight(.semibold))
                ViewButton(text: "View All", selectable: true)
            }.padding(.trailing, 10)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 20) {
                    
                    VStack{
                        
                        VStack(alignment: .leading) {
                            Text("PSV23")
                                .font(.headline.weight(.semibold))
                            
                           
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("123")
                                .font(.title.weight(.bold))
                            
                            Text("Available")
                                .font(.subheadline.weight(.bold))
                            
                        }
                    }
                    .padding()
                    .background(Color("Secondary"))
                    .cornerRadius(10)
                    
                    VStack{
                        
                        VStack(alignment: .leading) {
                            Text("PSV23")
                                .font(.headline.weight(.semibold))
                            
                           
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("123")
                                .font(.title.weight(.bold))
                            
                            Text("Available")
                                .font(.subheadline.weight(.bold))
                            
                        }
                    }
                    .padding()
                    .background(Color("Secondary"))
                    .cornerRadius(10)
                    
                    VStack{
                        
                        VStack(alignment: .leading) {
                            Text("PSV23")
                                .font(.headline.weight(.semibold))
                            
                           
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("123")
                                .font(.title.weight(.bold))
                            
                            Text("Available")
                                .font(.subheadline.weight(.bold))
                            
                        }
                    }
                    .padding()
                    .background(Color("Secondary"))
                    .cornerRadius(10)
                    
                    VStack{
                        
                        VStack(alignment: .leading) {
                            Text("PSV23")
                                .font(.headline.weight(.semibold))
                            
                           
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("123")
                                .font(.title.weight(.bold))
                            
                            Text("Available")
                                .font(.subheadline.weight(.bold))
                            
                        }
                    }
                    .padding()
                    .background(Color("Secondary"))
                    .cornerRadius(10)
                    
                    VStack{
                        
                        VStack(alignment: .leading) {
                            Text("PSV23")
                                .font(.headline.weight(.semibold))
                            
                           
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("123")
                                .font(.title.weight(.bold))
                            
                            Text("Available")
                                .font(.subheadline.weight(.bold))
                            
                        }
                    }
                    .padding()
                    .background(Color("Secondary"))
                    .cornerRadius(10)
                    
                    VStack{
                        
                        VStack(alignment: .leading) {
                            Text("PSV23")
                                .font(.headline.weight(.semibold))
                            
                           
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("123")
                                .font(.title.weight(.bold))
                            
                            Text("Available")
                                .font(.subheadline.weight(.bold))
                            
                        }
                    }
                    .padding()
                    .background(Color("Secondary"))
                    .cornerRadius(10)
                                        }
                                    }
                                
            Spacer()
            
            
            
        }.padding(24)
    }
}




struct VBooking_Previews: PreviewProvider {
    static var previews: some View {
        VBooking()
    }
}

