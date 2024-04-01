public class InternalModules {

    public static func getModule(_ name: AffiseModules) -> AffiseModule?  {
        return Affise.getApi()?.moduleManager.getModule(name)
    }
}
