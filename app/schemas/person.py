from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app.models.person import Person

from app import db


class PersonSchema(Schema):
    class Meta:
        type_ = 'person'
        self_view = 'person_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'person_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    first_name = fields.String()
    middle_name = fields.String()
    last_name = fields.String()
    birth_day = fields.Integer(required=False)
    birth_month = fields.Nested('MonthSchema')
    birth_year = fields.Integer(required=True)
    birth_era = fields.Nested('EraSchema')
    death_day = fields.Integer(required=False)
    death_month = fields.Nested('MonthSchema')
    death_year = fields.Integer(required=True)
    death_era = fields.Nested('EraSchema')
    reference = fields.Nested('ReferenceSchema')
    birth_month_rel = Relationship(
        related_view='month_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='MonthSchema',
        type_='month',
        required=False
    )
    birth_era_rel = Relationship(
        related_view='era_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='EraSchema',
        type_='era',
        required=True
    )
    death_month_rel = Relationship(
        related_view='month_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='MonthSchema',
        type_='month',
        required=False
    )
    death_era_rel = Relationship(
        related_view='era_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='EraSchema',
        type_='era',
        required=True
    )
    reference_rel = Relationship(
        schema='ReferenceSchema',
        type_='reference',
        required=False
    )


class PersonList(ResourceList):
    schema = PersonSchema
    data_layer = {'session': db.session,
                  'model': Person}


class PersonDetail(ResourceDetail):
    schema = PersonSchema
    data_layer = {'session': db.session,
                  'model': Person}
