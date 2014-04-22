package jee.pottier.biblioj

import org.springframework.dao.DataIntegrityViolationException

class ReservationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reservationInstanceList: Reservation.list(params), reservationInstanceTotal: Reservation.count()]
    }

    def create() {
        [reservationInstance: new Reservation(params)]
    }

    def save() {
        def reservationInstance = new Reservation(params)
        if (!reservationInstance.save(flush: true)) {
            render(view: "create", model: [reservationInstance: reservationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])
        redirect(action: "show", id: reservationInstance.id)
    }

    def show(Long id) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        [reservationInstance: reservationInstance]
    }

    def edit(Long id) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        [reservationInstance: reservationInstance]
    }

    def update(Long id, Long version) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reservationInstance.version > version) {
                reservationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reservation.label', default: 'Reservation')] as Object[],
                          "Another user has updated this Reservation while you were editing")
                render(view: "edit", model: [reservationInstance: reservationInstance])
                return
            }
        }

        reservationInstance.properties = params

        if (!reservationInstance.save(flush: true)) {
            render(view: "edit", model: [reservationInstance: reservationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])
        redirect(action: "show", id: reservationInstance.id)
    }

    def delete(Long id) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        try {
            reservationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def enregistrerReservation() {
		def listeReserve = []
		def listeIndisponible = []
		
		for (int i = 0; session['panier'] != null && i < session['panier'].size(); i++){
			if (session['panier'][i].nbExDispos > 0){
				listeReserve.add(session['panier'][i])
				session['panier'][i].nbExDispos -= 1
			}
			else {
				listeIndisponible.add(session['panier'][i])
			}
		}
		
		// La réservation est créée avec les livres dispos
		def random = 0
		def codeGenere = false
		while (!codeGenere){
			int highBound = 100000;
			random = (int)(Math.random() * (highBound));
			
			def resultatsByCode = Reservation.findAllByCode(random)
			codeGenere = (resultatsByCode.isEmpty() ? true : false)
		}
		session['reservation'] = new Reservation(code : random, livresReserves : listeReserve, dateReservation : new Date());
		if (listeIndisponible.size() > 0){
			
		}
		else {
			// Vide le panier, sauve la réservation en base et calcule la date limite
			session['panier'] = []
			session['reservation'].save()
			Calendar calendrier = Calendar.getInstance();
			calendrier.setTime(new Date());
			calendrier.add(Calendar.DATE, 1);
			session['dateLimite'] = calendrier.getTime().toString()
		}
		
		[reserve : listeReserve, indisponible : listeIndisponible]
	}
	
	def confirmerReservation(){
		if(session['reservation'] != null){
			session['reservation'].save()
		}
	}
	
	def annulerReservation(){
		session['reservation'] = null;
	}
}
