'use strict';
module.exports = function(sequelize, DataTypes) {
  var thread = sequelize.define('thread', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    title: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    board_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    create_date: {
      type: DataTypes.DATE,
      allowNull: false
    },
    update_date: {
      type: DataTypes.DATE,
      allowNull: false
    },
    latest_res_number: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    post: {
      type: DataTypes.TEXT,
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
  return thread;
};
