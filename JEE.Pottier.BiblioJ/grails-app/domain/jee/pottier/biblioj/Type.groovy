package jee.pottier.biblioj

class Type {

    static constraints = {
		intitule blank : false
    }
	
	String intitule
	
	String toString(){
		return intitule
	}
}
