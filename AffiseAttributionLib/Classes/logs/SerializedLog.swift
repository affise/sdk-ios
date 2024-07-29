/**
 * Serialized log contains [id] identification, [type] and log [data]
 */
public struct SerializedLog{

    /**
     * Log id
     */
    let id: String

    /**
     * Log type
     */
    let type: String

    /**
     * Log data - json
     */
    let data: String
}
