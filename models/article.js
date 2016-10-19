'use strict';
module.exports = function(sequelize, DataTypes) {
  var article = sequelize.define('article', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    post: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    thread_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    create_date: {
      type: DataTypes.DATE,
      allowNull: false
    },
    name: {
      type: DataTypes.TEXT,
      allowNull: true
    },
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    }
  });
  return article;
};
