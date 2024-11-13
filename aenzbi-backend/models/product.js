const { Model, DataTypes } = require('sequelize');
module.exports = (sequelize) => {
  class Product extends Model {}
  Product.init(
    {
      name: { type: DataTypes.STRING, allowNull: false },
      price: { type: DataTypes.DECIMAL, allowNull: false },
      description: DataTypes.TEXT,
      stock: { type: DataTypes.INTEGER, defaultValue: 0 },
    },
    { sequelize, modelName: 'Product' }
  );
  return Product;
};
