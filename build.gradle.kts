plugins {
    id("java")
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    // JUnit platform to support Karate
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")

    // Dependency for Karate (updated to the latest version)
    testImplementation("io.karatelabs:karate-junit5:1.5.0")
}

tasks.test {
    useJUnitPlatform()
}
