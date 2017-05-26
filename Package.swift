import PackageDescription

let package = Package(
    name: "Perfect-LocalAuthentication-MySQL",
    targets: [
		Target(
			name: "LocalAuthentication",
			dependencies: []
		)
		],
    dependencies: [
		.Package(url: "https://github.com/iamjono/JSONConfig.git", majorVersion: 0),
		.Package(url: "https://github.com/PerfectlySoft/Perfect-RequestLogger.git", majorVersion: 1),
		.Package(url: "https://github.com/PerfectlySoft/Perfect-SMTP", majorVersion: 1),
		.Package(url: "https://github.com/SwiftORM/MySQL-StORM.git", majorVersion: 1),
		.Package(url: "https://github.com/PerfectlySoft/Perfect-Session-MySQL.git", majorVersion: 1),
		.Package(url: "https://github.com/PerfectlySoft/Perfect-Mustache.git", majorVersion: 2),
		]

)
