class Rectangulo {
  double base;
  double altura;

  Rectangulo(this.base, this.altura);

  double calcularArea() {
    return base * altura;
  }

  double calcularPerimetro() {
    return 2 * base + 2 * altura;
  }
}