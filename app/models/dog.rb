class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }

  BREED = %w[Akita Barbet Basenji Beagle Beauceron
             Bloodhound Boerboel Boxer Briard Brittany Bulldog
             Corgi Chihuahua Chinook Dalmatian Eurasier Harrier
             Havanese Keeshond Komondor Kooikerhondje Kuvasz
             Leonberger Maltese Newfoundland Sheepdog Papillon
             Pekingese Plott Pointer Pomeranian Poodle Pug
             Rottweiler Saluki Samoyed Schipperke Vizsla Weimaraner]

  SIZE = %w[Small Medium Large]

  ACTIVITY = %w[Hiking Biking Cuddling Dogpark Pickup Fetch Obedience Swimming Dogsledding]

  ADDRESS = ["160 Piccadilly, St. James's, London W1J 9EB", "30 Berkeley St, London W1J 8EH",
             "10, The Arches, Villiers St, London WC2N 6NG", "Somerset House, Strand, London WC2R 0RN",
             "Bow St, London WC2E 9DD", "100 Strand, London WC2R 0EZ", "181 Piccadilly, St. James's, London W1A 1ER",
             "R. de Dom Manuel II 44, 4050-522 Porto, Portugal", "Rua do Campo Alegre 790, 4150-171 Porto, Portugal",
             "Av. da Boavista 604-610, 4149-071 Porto, Portugal", "Alameda de Basílio Teles 51, 4050-127 Porto, Portugal",
             "R. José Falcão 262, 4400-330 Vila Nova de Gaia, Portugal", "Alameda Empresa 110, 4400-133 Vila Nova de Gaia, Portugal",
             "Rua do Conde de Redondo 91B, 1150-103 Lisboa, Portugal", "Travessa do Olival a Santos 4, 1200-870 Lisboa, Portugal",
             "Calçada da Patriarcal 40, 1250-182 Lisboa, Portugal", "Av. da República 93, 1050-190 Lisboa, Portugal",
             "R. Padre António Vieira 32, 1070-015 Lisboa, Portugal", "R. Padre António Vieira 32, 1070-015 Lisboa, Portugal",
             "R. Dom Pedro V 129, 1250-096 Lisboa, Portugal", "Miradouro de Santa Catarina (Adamastor, 1200-401 Lisboa, Portugal",
             "R. Nova do Almada 114, 1100-184 Lisboa, Portugal", "Largo Chão do Loureiro, 1100-145 Lisboa, Portugal"]

  validates :name, presence: true
  validates :breed, presence: true
  validates :breed, inclusion: { in: BREED }
  validates :size, presence: true
  validates :size, inclusion: { in: SIZE }
  validates :activity, presence: true
  validates :activity, inclusion: { in: ACTIVITY }
  validates :age, presence: true
  validates :age, numericality: { only_integer: true }
  validates :age, numericality: { greater_than_or_equal_to: 0 }
  validates :age, numericality: { less_than_or_equal_to: 20 }
  validates :address, presence: true

end
