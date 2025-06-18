public class InternalModules {

    public static func getModule(_ name: AffiseModules) -> AffiseModule?  {
        return Affise.api?.moduleManager.getModule(name)
    }
}
