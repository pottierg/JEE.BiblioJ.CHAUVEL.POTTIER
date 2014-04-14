package jee.pottier.biblioj

class Reservation {

    static constraints = {
		code nullable : false
    }
	
	Integer code
	Date dateReservation
	static hasMany = [livresReserves : Livre]
}
