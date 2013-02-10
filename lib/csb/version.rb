module Csb
  class Version
    MAJOR = 0 unless defined? Csb::Version::MAJOR
    MINOR = 0 unless defined? Csb::Version::MINOR
    PATCH = 1 unless defined? Csb::Version::PATCH
    PRE = nil unless defined? Csb::Version::PRE

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end

    end

  end
end
