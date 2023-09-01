import Foundation


private func get64LeastSignificantBitsForVersion1() -> Int64  {
    let random = Int64.random(in: 0...Int64.max)
    let random63BitLong = random & 0x3FFFFFFFFFFFFFFF
    let variant3BitFlag = Int64.min
    return random63BitLong | variant3BitFlag
}

private func get64MostSignificantBitsForVersion1() -> Int64  {
    let currentTimeMillis = Date().timeIntervalSince1970.timeInMillis
    let timeLow = (currentTimeMillis & 0x00000000FFFFFFFF) << 32
    let timeMid = ((currentTimeMillis >> 32 ) & 0xFFFF) << 16
    let version: Int64 = 1 << 12
    let timeHi = (currentTimeMillis >> 48) & 0x0FFF
    return timeLow | timeMid | version | timeHi
}

private func generateType1UUID() -> UUID {
    var most64SigBits = get64MostSignificantBitsForVersion1()
    var least64SigBits = get64LeastSignificantBitsForVersion1()
    let mostData = Data(bytes: &most64SigBits, count: MemoryLayout<Int64>.size)
    let leastData = Data(bytes: &least64SigBits, count: MemoryLayout<Int64>.size)
    let bytes = [UInt8](mostData) + [UInt8](leastData)
    let tuple: uuid_t = (bytes[7], bytes[6], bytes[5], bytes[4],
                         bytes[3], bytes[2], bytes[1], bytes[0],
                         bytes[15], bytes[14], bytes[13], bytes[12],
                         bytes[11], bytes[10], bytes[9], bytes[8])
    
    return UUID(uuid: tuple)
}

internal func generateUUID() -> UUID {
    return generateType1UUID()
}
