class TransactionFilters {

	def sessionFactory

	def filters = {

		startTransaction(controller:'*', action:'*') {
			before = {
				sessionFactory.getCurrentSession().beginTransaction()
			}
		}

		// no need for an 'after' filter, Spring take care of committing or rolling back
		// the transaction

	}
	
	// Source : http://blog.octo.com/en/transactions-in-grails/

}