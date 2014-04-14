import jee.pottier.biblioj.Auteur
import jee.pottier.biblioj.Livre
import jee.pottier.biblioj.Type

class BootStrap {

	def init = { servletContext ->
		Type t0 = new Type(intitule : "Policier")
		Type t1 = new Type(intitule : "Dystopie")
		Type t2 = new Type(intitule : "Aventure")
		Type t3 = new Type(intitule : "Uchronie")
		Type t4 = new Type(intitule : "Biographie")
		Type t5 = new Type(intitule : "Litterature enfant")
		t0.save(); t1.save() ; t2.save(); t3.save(); t4.save(); t5.save()
		
		Auteur a1 = new Auteur(nom : "Orwell", prenom : "George")
		Auteur a2 = new Auteur(nom : "Collins", prenom : "Suzanne")
		Auteur a3 = new Auteur(nom: "Murakami", prenom : "Haruki")
		Auteur a4 = new Auteur(nom : "Larsson", prenom : "Stieg")
		Auteur a5 = new Auteur(nom : "Pancol", prenom : "Katherine")
		Auteur a6 = new Auteur(nom : "Harzog", prenom : "Felicite")
		Auteur a7 = new Auteur(nom : "Isaacson", prenom : "Walter")
		Auteur a8 = new Auteur(nom : "Sendak", prenom : "Maurice")
		a1.save(flush : true)
		a2.save(flush : true)
		a3.save(flush : true)
		a4.save(flush : true)
		a5.save(flush : true)
		a6.save(flush : true)
		a7.save(flush : true)
		a8.save(flush : true)
		
		
		Livre l1 = new Livre(titre : "1984", nbEx : 10, nbExDispos : 2, auteurs : [a1], type : t1)
		Livre l2 = new Livre(titre : "Hunger Games", nbEx : 10, nbExDispos : 3, auteurs : [a2], type : t2)
		Livre l3 = new Livre(titre : "L'embrasement", nbEx : 10, nbExDispos : 3, auteurs : [a2], type : t2)
		Livre l4 = new Livre(titre : "La revolte", nbEx : 10, nbExDispos : 3, auteurs : [a2], type : t2)
		Livre l5 = new Livre(titre : "1Q84", nbEx : 10, nbExDispos : 3, auteurs : [a3], type : t3)
		Livre l6 = new Livre(titre : "L'homme qui n'aimait pas les femmes", nbEx : 10, nbExDispos : 3, auteurs : [a3], type : t1)
		Livre l7 = new Livre(titre : "La fille qui revait d'un bidon d'essence et d'une allumette ", nbEx : 10, nbExDispos : 3, auteurs : [a3], type : t0)
		Livre l8 = new Livre(titre : "Les ecureuils de Central Park sont tristes le lundi", nbEx : 10, nbExDispos : 3, auteurs : [a5], type : t0)
		Livre l9 = new Livre(titre : "Un heros", nbEx : 10, nbExDispos : 3, auteurs : [a6], type : t2)
		Livre l10 = new Livre(titre : "Steve Jobs", nbEx : 10, nbExDispos : 3, auteurs : [a7], type : t4)
		Livre l11 = new Livre(titre : "Max et les Maximonstres", nbEx : 10, nbExDispos : 3, auteurs : [a8], type : t5)
		l1.save(); l2.save(); l3.save(); l4.save(); l5.save()
		l6.save(); l7.save(); l8.save(); l9.save(); l10.save(); l11.save();
	}
	def destroy = {
	}
}
