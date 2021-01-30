//
//  User.swift
//  iVac
//
//  Created by Gus Adi on 30/01/21.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var _id: ObjectId = ObjectId.generate()
    @objc dynamic var email: String = ""
    @objc dynamic var jenisKelamin: String? = nil
    @objc dynamic var nama: String = ""
    @objc dynamic var nik: String = ""
    @objc dynamic var no_telepon: String? = nil
    @objc dynamic var realm_id: String? = nil
    @objc dynamic var tglLahir: String? = nil
    override static func primaryKey() -> String? {
        return "_id"
    }
}
