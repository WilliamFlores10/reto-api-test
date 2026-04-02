package helpers;

public class DataStore {
    private static String sharedId;
    private static String sharedId2;
    private static String sharedEmail;

    // Métodos para el ID
    public static void setSharedId(String id) { sharedId = id; }
    public static String getSharedId() { return sharedId; }

    // Métodos para el ID2
    public static void setSharedId2(String id) { sharedId2 = id; }
    public static String getSharedId2() { return sharedId2; }

    // Métodos para el Email
    public static void setSharedEmail(String email) { sharedEmail = email; }
    public static String getSharedEmail() { return sharedEmail; }
}