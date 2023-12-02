import Foundation

struct TicketModel: Decodable {
  let success: Bool
  let message: String
  let data: TicketData
}

struct TicketData: Decodable {
  let tickets: [TicketItem]
}

struct TicketItem: Decodable, Identifiable {
  let id: String
  let user: String
  let ticketCode: String
  let game: String
  let hasDrawn: Bool
  let createdAt: Date
  let v: Int
  let blocks: [Block]

  private enum CodingKeys: String, CodingKey {
    case id = "_id"
    case user
    case ticketCode
    case game
    case hasDrawn
    case createdAt
    case v = "__v"
    case blocks
  }
}

struct Block: Decodable, Identifiable {
  let id: String
  let ticket: String
  let numbers: [Int]
  let isWinner: Bool
  let createdAt: Date
  let v: Int

  private enum CodingKeys: String, CodingKey {
    case id = "_id"
    case ticket
    case numbers
    case isWinner
    case createdAt
    case v = "__v"
  }
}
