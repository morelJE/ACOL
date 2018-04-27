package modele;

public class Enfant {
    private String nom;
    private String prenom;
    private Section section;
    private String login;
    
    public String getPrenom() {
        return this.prenom;
    }
    public String getNom() {
        return this.nom;
    }
    public Section getSection() {
        return this.section;
    }
    public String getLogin() {
        return this.login;
    }
    
    public Enfant(String nom, String prenom, Section section, String login) {
        this.nom = nom;
        this.prenom = prenom;
        this.section = section;
        this.login = login;
    }
}
