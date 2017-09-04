	
	start_element = ':element:'
	end_element = ':/element:'

		#isolating :element:
	array = 
		[":element:", "Catch", "Line", ":desc:", "claire", "et", "concise", ":/desc:", ":/element:", 
		":element:", "CTA", ":desc:", "Call", "To", "Action", "visible", ":/desc:", ":/element:", 
		":element:", "Persona", ":desc:", "Qui", "sont", "vos", "clients", "?", "Qui", "visez", "vous", "?", ":/desc:", ":/element:", 
		":element:", "Contre-objections", ":desc:", "Faire", "deux", "sous", "groupes", ":bullet:", "Ceux", "qui", "connaisent", "votre", "produit", "mais", "qui", "ne", "l'ont", "jamais", "essayé", ":/bullet:", ":bullet:", "Ceux", "qui", "connaissent", "votre", "produit", "mais", "qui", "ont", "décidé", "de", "ne", "pas", "l'acheter", "(abandon", "de", "panier", "par", "exemple,", "desinscription", "de", "newsletter", "etc.)", ":/bullet:", ":/desc:",":/element:",
		":element:", "testimonials", ":desc:", "toujours", "intéressant", "de", "savoir", "ce", "que", "les", "gens", "pensent", ":/desc:", ":/element:"]

  def position(array,element)
    position = array.find_index(element.to_s)
  end

	  def isolating_element(array, start_element, end_element)
	    isolating_element = []
	    while start_index = array.find_index(start_element)
	        end_index = array.find_index(end_element)
	      isolating_element << array.slice!(start_index..end_index)
	    end 
	    isolating_element
	  end

  def to_string(array)
    array.join(" ")
  end


  def remove_tags(array, start_element, end_element)
    position_start = position(array, start_element)
    position_end = position(array, end_element)
    array = array[(position_start + 1)..(position_end - 1)]
  end

  	# removing elements
 	tags_removed = []
	isolated_element = isolating_element(array,start_element,end_element)
	isolated_element.each do |element|
		tags_element_removed = remove_tags(element,":element:",":/element:")
		tags_removed << tags_element_removed
	end

	# isolating titles et description
	les_titres = []
	descriptions = []
	bullets = []
	tags_removed.each do |tag|
		index_of_title = position(tag, ":desc:")

		#isolating titles
		titre = tag[0...index_of_title]
		titre = to_string(titre)
		les_titres << titre

		#isolating description
		 description = tag[(index_of_title + 1)...(tag.length - 1)]
		if description.include? ":bullet:"
			start_element = ':bullet:'
			index_of_title = position(description, ":bullet:")
			description = description[0...index_of_title] 
			descriptions << description
		else
			description
			description = to_string(description)
			descriptions << description
		end

		 p descriptions

		bullet
		if tag.include? ":bullet:"
			start_element = ':bullet:'
			end_element = ':/bullet:'
			isolated_bullet = isolating_element(tag,start_element,end_element)
			isolated_bullet.each do |bullet|
				bullet_tag_removed = remove_tags(bullet,start_element,end_element)
				bullet_tag_removed = to_string(bullet_tag_removed)
				bullets << bullet_tag_removed
			end

		end
	end









