//
//  UserDetailView.swift
//  JWTDemo
//
//  Created by Arthur Nsereko Kahwa on 7/13/23.
//

import SwiftUI
import MapKit

struct UserDetailView: View {
    @Binding var selectedUser: UserDetail?
    
    var body: some View {
        if let user = selectedUser {
            GeometryReader { geometry in
                Form {
                    Text("UserDetails")
                        .font(.largeTitle)
                    
                    Section("Personal Details") {
                        Text("Name: \(user.name)")
                        Text("Username: \(user.username)")
                        Text("email \(user.email)")
                        Text("Phone: \(user.phone)")
                        Text("Website: \(user.website)")
                    }
                    
                    /*
                    Section("Address") {
                        Text("Street: \(user.address.street)")
                        Text("Suite: \(user.address.suite)")
                        Text("City: \(user.address.zipcode), \(user.address.city)")
                        Text("")
                    }
                    
                    Section("Company") {
                        Text("Company Name: \(user.company.name)")
                        Text("Catch Phrase: \(user.company.catchPhrase)")
                        Text("BS: \(user.company.bs)")
                    }
                    */
                    
                    Section("Location") {
                        Map(coordinateRegion:
                                .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: user.address.geo.lat,
                                                                                            longitude: user.address.geo.lng),
                                                             span: MKCoordinateSpan(latitudeDelta: 0.5,
                                                                                    longitudeDelta: 0.5))),
                            showsUserLocation: true,
                            userTrackingMode: .constant(.follow))
                        .frame(width: geometry.size.width,
                               height: 400,
                               alignment: .center)
                    }
                }
            }
        }
        else {
            EmptyView()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let geo = UserDetail.Address.Geo(lat: -68.6102, lng: -47.0653)
        let addres = UserDetail.Address(street: "Red Street 1",
                                        suite: "42",
                                        city: "Red City",
                                        zipcode: "4321", geo: geo)
        let company = UserDetail.Company(name: "Red Company",
                                         catchPhrase: "We are Red",
                                         bs: "Some BS")
        UserDetailView(selectedUser: .constant(UserDetail(id: 42,
                                            name: "Eric The Red",
                                            username: "rederic368",
                                            email: "eric@red.local",
                                            address: addres,
                                            phone: "012345",
                                            website: "www.redsite.local",
                                            company: company)))
    }
}
