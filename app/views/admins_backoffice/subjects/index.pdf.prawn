prawn_document do |pdf|
    pdf.text "Lista de assuntos", :align => :center
    pdf.move_down 20
    pdf.table @subjects.collect{|s| [s.id, s.description]}
end