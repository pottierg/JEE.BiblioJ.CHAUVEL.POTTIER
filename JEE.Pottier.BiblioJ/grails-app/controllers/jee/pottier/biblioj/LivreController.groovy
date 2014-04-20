package jee.pottier.biblioj

import org.springframework.dao.DataIntegrityViolationException

class LivreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max, Integer idLivre) {
        params.max = Math.min(max ?: 10, 100)
		
		if(session['panier'] == null){
			session['panier'] = []
		}
		
		if(idLivre != null && idLivre != 0){
			ajoutPanier(idLivre)
		}
		
        [livreInstanceList: Livre.list(params), livreInstanceTotal: Livre.count()]
    }

    def create() {
        [livreInstance: new Livre(params)]
    }

    def save() {
        def livreInstance = new Livre(params)
        if (!livreInstance.save(flush: true)) {
            render(view: "create", model: [livreInstance: livreInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'livre.label', default: 'Livre'), livreInstance.id])
        redirect(action: "show", id: livreInstance.id)
    }

    def show(Long id) {
        def livreInstance = Livre.get(id)
        if (!livreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "list")
            return
        }

        [livreInstance: livreInstance]
    }

    def edit(Long id) {
        def livreInstance = Livre.get(id)
        if (!livreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "list")
            return
        }

        [livreInstance: livreInstance]
    }

    def update(Long id, Long version) {
        def livreInstance = Livre.get(id)
        if (!livreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (livreInstance.version > version) {
                livreInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'livre.label', default: 'Livre')] as Object[],
                          "Another user has updated this Livre while you were editing")
                render(view: "edit", model: [livreInstance: livreInstance])
                return
            }
        }

        livreInstance.properties = params

        if (!livreInstance.save(flush: true)) {
            render(view: "edit", model: [livreInstance: livreInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'livre.label', default: 'Livre'), livreInstance.id])
        redirect(action: "show", id: livreInstance.id)
    }

    def delete(Long id) {
        def livreInstance = Livre.get(id)
        if (!livreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "list")
            return
        }

        try {
            livreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def rechercheLivres() {
		if(session['panier'] == null){
			session['panier'] = []
		}
		
		[livreInstance : new Livre()]
	}
	
	def resultatsRecherche(int max, int offset, String titre, String nom, boolean checkType, int type, int idLivre) {
		params.max = 5
		params.offset = Math.min(offset ?: 0, 100)
		
		if(idLivre != null && idLivre != 0){
			ajoutPanier(idLivre)
		}
		
		if(titre == null){
			titre = session['titre']
			nom = session['nom']
			checkType = session['checkType']
			type = session['type']
		}
		else{
			session['titre'] = titre
			session['nom'] = nom
			session['checkType'] = checkType
			session['type'] = type
		}
		
		def c = Livre.createCriteria()
		def liste = null
		if (checkType == true){
			liste = c.list {
				like('titre', "%" + titre + "%")
				auteurs {
					like('nom', "%" + nom + "%")
				}
				'eq'("type", Type.get(type))
				order("titre", "asc")
			}
		} else {
			liste = c.list {
				like('titre', "%" + titre + "%")
				auteurs {
					like('nom', "%" + nom + "%")
				}
				order("titre", "asc")
			}
		}
		
		def total = 0
		
		if (liste != null) {
			total = liste.size()
		}
		
		[livreInstanceList : liste, livreInstanceTotal: total, pagination : params]
	}
	
	def ajoutPanier(Integer idLivre){
		if (session['panier'] == null){
			session['panier'] = []
		}
		
		if (Livre.findById(idLivre).nbExDispos > 0 && !session.panier.id.contains(Livre.findById(idLivre).id)){
			session['panier'].add(Livre.findById(idLivre))
		}
	}
	
	def deleteFromPanier(Integer idLivre){
		for(int i = 0; session['panier'] != null && i < session['panier'].size(); i++){
			if(session['panier'][i] != null && session["panier"][i].getId() == idLivre){
				session['panier'].remove(i)
				break
			}
		}
		
		def targetUri = params.targetUri ?: "/"
		redirect(uri: targetUri)
	}
}
