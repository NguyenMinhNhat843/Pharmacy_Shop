package utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.Getter;

public class EntityManagerFactoryUtil {
    private EntityManagerFactory entityManagerFactory;
    @Getter
    private EntityManager entityManager;

    public EntityManagerFactoryUtil() {
        entityManagerFactory = Persistence.createEntityManagerFactory("Pharmacy");
        entityManager = entityManagerFactory.createEntityManager();
    }

    public void close() {
        entityManager.close();
        entityManagerFactory.close();
    }
}
