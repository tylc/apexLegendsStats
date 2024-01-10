//
//  PlayerStatus.swift
//  Apex Legends Stats
//
//  Created by Enric Herce on 10/1/24.
//

struct PlayerInfo: Codable {
    let global: Global
    let realtime: Realtime
    let legends: Legends
    let mozambiquehereInternal: MozambiquehereInternal
    let total: Total
    let processingTime: Double

    enum CodingKeys: String, CodingKey {
        case global, realtime, legends
        case mozambiquehereInternal = "mozambiquehere_internal"
        case total, processingTime
    }
}

// MARK: - Global
struct Global: Codable {
    let name, uid: String
    let avatar: JSONNull?
    let platform: String
    let level, toNextLevelPercent, internalUpdateCount: Int
    let bans: Bans
    let rank: GlobalRank
    let arena: Arena
    let battlepass: Battlepass
    let internalParsingVersion: Int
    let badges: [Damage]
    let levelPrestige: Int
}

// MARK: - Arena
struct Arena: Codable {
    let rankScore: Int
    let rankName: String
    let rankDiv, ladderPosPlatform: Int
    let rankImg: String
    let rankedSeason, alStopPercent, alStopInt, alStopPercentGlobal: String
    let alStopIntGlobal: String
    let alsFlag: Bool

    enum CodingKeys: String, CodingKey {
        case rankScore, rankName, rankDiv, ladderPosPlatform, rankImg, rankedSeason
        case alStopPercent = "ALStopPercent"
        case alStopInt = "ALStopInt"
        case alStopPercentGlobal = "ALStopPercentGlobal"
        case alStopIntGlobal = "ALStopIntGlobal"
        case alsFlag = "ALSFlag"
    }
}

// MARK: - Damage
struct Damage: Codable {
    let name: String
    let value: Int
}

// MARK: - Bans
struct Bans: Codable {
    let isActive: Bool
    let remainingSeconds: Int
    let lastBanReason: String

    enum CodingKeys: String, CodingKey {
        case isActive, remainingSeconds
        case lastBanReason = "last_banReason"
    }
}

// MARK: - Battlepass
struct Battlepass: Codable {
    let level, history: JSONNull?
}

// MARK: - GlobalRank
struct GlobalRank: Codable {
    let rankScore: Int
    let rankName: String
    let rankDiv, ladderPosPlatform: Int
    let rankImg: String
    let rankedSeason: String
    let alStopPercent: Double
    let alStopInt: Int
    let alStopPercentGlobal: Double
    let alStopIntGlobal: Int
    let alsFlag: Bool

    enum CodingKeys: String, CodingKey {
        case rankScore, rankName, rankDiv, ladderPosPlatform, rankImg, rankedSeason
        case alStopPercent = "ALStopPercent"
        case alStopInt = "ALStopInt"
        case alStopPercentGlobal = "ALStopPercentGlobal"
        case alStopIntGlobal = "ALStopIntGlobal"
        case alsFlag = "ALSFlag"
    }
}

// MARK: - Legends
struct Legends: Codable {
    let selected: Selected
    let all: All
}

// MARK: - All
struct All: Codable {
    let global: Ballistic
    let revenant: Ash
    let crypto, horizon, gibraltar, wattson: Ballistic
    let fuse: Ballistic
    let bangalore, wraith: Ash
    let octane: Ballistic
    let bloodhound: Bloodhound
    let caustic: Caustic
    let lifeline, pathfinder, loba: Bloodhound
    let mirage, rampart, valkyrie, seer: Ballistic
    let ash: Ash
    let madMaggie, newcastle, vantage: Ballistic
    let catalyst: Bloodhound
    let ballistic, conduit: Ballistic

    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case revenant = "Revenant"
        case crypto = "Crypto"
        case horizon = "Horizon"
        case gibraltar = "Gibraltar"
        case wattson = "Wattson"
        case fuse = "Fuse"
        case bangalore = "Bangalore"
        case wraith = "Wraith"
        case octane = "Octane"
        case bloodhound = "Bloodhound"
        case caustic = "Caustic"
        case lifeline = "Lifeline"
        case pathfinder = "Pathfinder"
        case loba = "Loba"
        case mirage = "Mirage"
        case rampart = "Rampart"
        case valkyrie = "Valkyrie"
        case seer = "Seer"
        case ash = "Ash"
        case madMaggie = "Mad Maggie"
        case newcastle = "Newcastle"
        case vantage = "Vantage"
        case catalyst = "Catalyst"
        case ballistic = "Ballistic"
        case conduit = "Conduit"
    }
}

// MARK: - Ash
struct Ash: Codable {
    let data: [AshDatum]
    let imgAssets: ImgAssets

    enum CodingKeys: String, CodingKey {
        case data
        case imgAssets = "ImgAssets"
    }
}

// MARK: - AshDatum
struct AshDatum: Codable {
    let name: String
    let value: Int
    let key: String
    let rank, rankPlatformSpecific: PurpleRank
}

// MARK: - PurpleRank
struct PurpleRank: Codable {
    let rankPos: Int
    let topPercent: Double
}

// MARK: - ImgAssets
struct ImgAssets: Codable {
    let icon: String
    let banner: String
}

// MARK: - Ballistic
struct Ballistic: Codable {
    let imgAssets: ImgAssets

    enum CodingKeys: String, CodingKey {
        case imgAssets = "ImgAssets"
    }
}

// MARK: - Bloodhound
struct Bloodhound: Codable {
    let data: [AshDatum]
    let gameInfo: BloodhoundGameInfo
    let imgAssets: ImgAssets

    enum CodingKeys: String, CodingKey {
        case data, gameInfo
        case imgAssets = "ImgAssets"
    }
}

// MARK: - BloodhoundGameInfo
struct BloodhoundGameInfo: Codable {
    let badges: [Damage]
}

// MARK: - Caustic
struct Caustic: Codable {
    let data: [CausticDatum]
    let imgAssets: ImgAssets

    enum CodingKeys: String, CodingKey {
        case data
        case imgAssets = "ImgAssets"
    }
}

// MARK: - CausticDatum
struct CausticDatum: Codable {
    let name: String
    let value: Int
    let key: String
    let rank, rankPlatformSpecific: FluffyRank
}

// MARK: - FluffyRank
struct FluffyRank: Codable {
    let rankPos, topPercent: String
}

// MARK: - Selected
struct Selected: Codable {
    let legendName: String
    let data: [SelectedDatum]
    let gameInfo: SelectedGameInfo
    let imgAssets: ImgAssets

    enum CodingKeys: String, CodingKey {
        case legendName = "LegendName"
        case data, gameInfo
        case imgAssets = "ImgAssets"
    }
}

// MARK: - SelectedDatum
struct SelectedDatum: Codable {
    let name: String
    let value: Int
    let key: String
    let global: Bool
}

// MARK: - SelectedGameInfo
struct SelectedGameInfo: Codable {
    let skin, skinRarity, frame, frameRarity: String
    let pose, poseRarity, intro, introRarity: String
    let badges: [Badge]
}

// MARK: - Badge
struct Badge: Codable {
    let name: String
    let value: Int
    let category: String
}

// MARK: - MozambiquehereInternal
struct MozambiquehereInternal: Codable {
    let isNewToDB: Bool
    let clusterSrv: String
}

// MARK: - Realtime
struct Realtime: Codable {
    let lobbyState: String
    let isOnline, isInGame, canJoin, partyFull: Int
    let selectedLegend, currentState: String
    let currentStateSinceTimestamp: Int
    let currentStateAsText: String
}

// MARK: - Total
struct Total: Codable {
    let kills, specialEventKills, specialEventDamage, headshots: Damage
    let killsSeason14, specialEventWINS, winsSeason14, docDroneHealing: Damage
    let killsSeason15, winsSeason15, damage: Damage
    let kd: Kd

    enum CodingKeys: String, CodingKey {
        case kills
        case specialEventKills = "specialEvent_kills"
        case specialEventDamage = "specialEvent_damage"
        case headshots
        case killsSeason14 = "kills_season_14"
        case specialEventWINS = "specialEvent_wins"
        case winsSeason14 = "wins_season_14"
        case docDroneHealing = "doc_drone_healing"
        case killsSeason15 = "kills_season_15"
        case winsSeason15 = "wins_season_15"
        case damage, kd
    }
}

// MARK: - Kd
struct Kd: Codable {
    let value, name: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
