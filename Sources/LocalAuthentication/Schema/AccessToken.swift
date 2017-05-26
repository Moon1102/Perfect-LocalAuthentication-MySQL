//
//  AccessToken.swift
//  Perfect-OAuth2-Server
//
//  Created by Jonathan Guthrie on 2017-02-06.
//
//

import StORM
import MySQLStORM
import Foundation
import SwiftRandom
import SwiftMoment

public class AccessToken: MySQLStORM {
	public var accesstoken		= ""
	public var refreshtoken		= ""
	public var userid			= ""
	public var expires			= 0
	public var scope			= ""

	var _rand = URandom()

	public override init(){}

	public init(userid u: String, expiration: Int, scope s: [String] = [String]()) {
		accesstoken = _rand.secureToken
		refreshtoken = _rand.secureToken
		userid = u
		let th = moment()
		expires = Int(th.epoch()) + (expiration * 1000)
		scope = s.isEmpty ? "" : s.joined(separator: " ")
	}

	override public func to(_ this: StORMRow) {
		accesstoken     = this.data["accesstoken"] as? String	?? ""
		refreshtoken	= this.data["refreshtoken"] as? String	?? ""
		userid			= this.data["userid"] as? String		?? ""
		expires			= this.data["expires"] as? Int			?? 0
		scope			= this.data["scope"] as? String			?? ""
	}

	public func rows() -> [AccessToken] {
		var rows = [AccessToken]()
		for i in 0..<self.results.rows.count {
			let row = AccessToken()
			row.to(self.results.rows[i])
			rows.append(row)
		}
		return rows
	}

}
