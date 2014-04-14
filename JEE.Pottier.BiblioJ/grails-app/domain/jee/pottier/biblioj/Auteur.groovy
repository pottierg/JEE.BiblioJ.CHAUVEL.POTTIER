package jee.pottier.biblioj

class Auteur {

    static constraints = {
		nom blank : false
		prenom blank : false
    }
	
	static hasMany = [livresEdites : Livre]
	
	String nom
	String prenom
	
	String toString(){
		return "${prenom} ${nom}";
	}
}
