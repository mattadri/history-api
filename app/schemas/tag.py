from marshmallow_jsonapi.flask import Schema
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app import db

from app.models.tag import Tag


class TagSchema(Schema):
    class Meta:
        type_ = 'tag'
        self_view = 'tag_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'tag_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    label = fields.String(required=True)


class TagList(ResourceList):
    schema = TagSchema
    data_layer = {'session': db.session,
                  'model': Tag}


class TagDetail(ResourceDetail):
    schema = TagSchema
    data_layer = {'session': db.session,
                  'model': Tag}