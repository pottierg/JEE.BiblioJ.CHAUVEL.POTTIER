package jee.pottier.biblioj

class Livre {

    static constraints = {
		titre blank : false
		nbEx validator : {return it >= 0}
		nbExDispos validator : {return it >= 0}
    }
	
	Type type
	//static belongsTo = Auteur
    static hasMany = [auteurs : Auteur]
	
	String titre
	Integer nbEx
	Integer nbExDispos
	
	def String toString(){
		return "${titre}"
	}
}
