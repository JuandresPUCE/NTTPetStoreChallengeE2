import com.intuit.karate.junit5.Karate;

public class PetstoreApiTests {

    @Karate.Test
    Karate testPetstore() {
        //agrega mascota addPet
        //return Karate.run("features/petStoreFeatures.feature").tags("@addPet").relativeTo(getClass());
        //busca por id mascota findByIdPet
        //return Karate.run("features/petStoreFeatures.feature").tags("@findByIdPet").relativeTo(getClass());
        // actualiza mascota updatePet pero a sold
        //return Karate.run("features/petStoreFeatures.feature").tags("@updatePetSoldPet").relativeTo(getClass());
        // buscar por estatus findByStatusPet
        //return Karate.run("features/petStoreFeatures.feature").tags("@findByStatusPet").relativeTo(getClass());
        //@petStoreTest
        return Karate.run("features/petStoreFeatures.feature").tags("@petStoreTest").relativeTo(getClass());
    }

}

