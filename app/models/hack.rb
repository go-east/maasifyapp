class Hack < ApplicationRecord
    mount_uploader :photo, PhotoUploader

	include AlgoliaSearch
	algoliasearch do
	  # All the attributes to send to algolia (in this case, everything)
	  attributes :titre, :description, :categorie_une, :qualite, :image
	  # All the attributes we want to search in
	  # unordered means that te position of the word(s) which matched doesn't matter
	  searchableAttributes ['unordered(titre)', 'categorie_une', 'description', 'qualite']
	  # Attribute(s) to use when sorting with the same textual match
	  customRanking ['desc(qualite)']
	
	  attributesForFaceting ['searchable(categorie_une)']

	end

end
