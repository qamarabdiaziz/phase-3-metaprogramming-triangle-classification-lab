class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    validate_triangle
  end

  def kind
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    validate_positive_lengths
    validate_triangle_inequality
  end

  def validate_positive_lengths
    if side1 <= 0 || side2 <= 0 || side3 <= 0
      raise TriangleError, "Side lengths must be larger than 0."
    end
  end

  def validate_triangle_inequality
    if side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
      raise TriangleError, "Triangle inequality is not satisfied."
    end
  end

  class TriangleError < StandardError
  end
end

