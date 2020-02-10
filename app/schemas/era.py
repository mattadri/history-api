from marshmallow_jsonapi.flask import Schema
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app.models.era import Era

from app import db


class EraSchema(Schema):
    class Meta:
        type_ = 'era'
        self_view = 'era_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'era_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    label = fields.String(required=True)


class EraList(ResourceList):
    schema = EraSchema
    data_layer = {'session': db.session,
                  'model': Era}


class EraDetail(ResourceDetail):
    schema = EraSchema
    data_layer = {'session': db.session,
                  'model': Era}
