package modele;

public class Enfant {
    private String nom;
    private String prenom;
    private Section section;
    
    public String getPrenom() {
        return this.prenom;
    }
    public String getNom() {
        return this.nom;
    }
    public Section getSection() {
        return this.section;
    }
    
    public Enfant(String nom, String prenom, Section section) {
        this.nom = nom;
        this.prenom = prenom;
        this.section = section;
    }
}
