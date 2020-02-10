from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList, ResourceRelationship

from app.models.month import Month

from app import db


class MonthSchema(Schema):
    class Meta:
        type_ = 'month'
        self_view = 'month_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'month_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    label = fields.String(required=True)


class MonthList(ResourceList):
    schema = MonthSchema
    data_layer = {'session': db.session,
                  'model': Month}


class MonthDetail(ResourceDetail):
    schema = MonthSchema
    data_layer = {'session': db.session,
                  'model': Month}
