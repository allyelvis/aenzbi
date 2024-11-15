const { Model, DataTypes } = require('sequelize');
module.exports = (sequelize) => {
  class User extends Model {}
  User.init(
    {
      username: { type: DataTypes.STRING, allowNull: false, unique: true },
      password: { type: DataTypes.STRING, allowNull: false },
      role: { type: DataTypes.STRING, defaultValue: 'user' },
    },
    { sequelize, modelName: 'User' }
  );
  return User;
};