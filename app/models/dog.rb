class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  BREED = %w[Akita Barbet Basenji Beagle Beauceron
             Bloodhound Boerboel Boxer Briard Brittany Bulldog
             Corgi Chihuahua Chinook Dalmatian Eurasier Harrier
             Havanese Keeshond Komondor Kooikerhondje Kuvasz
             Leonberger Maltese Newfoundland Sheepdog Papillon
             Pekingese Plott Pointer Pomeranian Poodle Pug
             Rottweiler Saluki Samoyed Schipperke Vizsla Weimaraner]

  SIZE = %w[XSmall Small Medium Large XLarge]

  ACTIVITY = %w[Hiking Biking Cuddling Dogpark Pickup Fetch Obedience Swimming Dogsledding]

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
