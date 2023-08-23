# app/services/google_books_service.rb
class GoogleBooksService
  include HTTParty
  base_uri 'https://www.googleapis.com/books/v1'

  def self.search_books(query)
    response = get('/volumes', query: { q: query, key: ENV['GOOGLE_API_KEY'] })
    if response.success?
      response.parsed_response['items'].map do |book|
        {
          title: book['volumeInfo']['title'],
          description: book['volumeInfo']['description'],
          authors: book['volumeInfo']['authors'],
          image_url: book['volumeInfo']['imageLinks']['thumbnail'] 
        }
      end
    end
  end
end
