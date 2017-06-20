module SchoolMissesHelper

	def give_fault_to_all_alumns(date)
		alumns = Alumn.all

		for alumn in alumns 
			SchoolMiss.create(alumn_id:alumn.id , date:date)
		end
	end
end
