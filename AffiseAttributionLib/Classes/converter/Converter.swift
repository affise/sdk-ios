/**
 * Interface for convert object to another object
 *
 * @param T object type in
 * @param R object type out
 */
public protocol Converter {
    associatedtype T
    associatedtype R

    /**
     * Convert value [from] to R
     */
    func convert(from: T) -> R
}
