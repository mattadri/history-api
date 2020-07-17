from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app.models.person import Person, PersonNote, PersonBiography

from app.models.tag import PersonTag

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
    description = fields.String()
    birth_day = fields.Integer(required=False)
    birth_month = fields.Nested('MonthSchema', required=False)
    birth_year = fields.Integer(required=True)
    birth_era = fields.Nested('EraSchema', required=False)
    death_day = fields.Integer(required=False)
    death_month = fields.Nested('MonthSchema', required=False)
    death_year = fields.Integer(required=False)

    death_era = fields.Nested('EraSchema', required=False)

    reference = fields.Nested('ReferenceSchema')

    person_biography = fields.Nested('PersonBiographySchema', many=True)

    person_note = fields.Nested(
        'PersonNoteSchema',
        exclude=('person',),
        many=True)

    timeline_person = fields.Nested(
        'TimelinePersonSchema',
        exclude=('timeline.timeline_person', 'timeline.timeline_event', 'person'),
        many=True)

    person_tag = fields.Nested(
        'PersonTagSchema',
        exclude=('person',),
        many=True
    )

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
        required=False
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


class PersonNoteSchema(Schema):
    class Meta:
        type_ = 'person_note'
        self_view = 'person_note_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'person_note_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    note = fields.String(required=True)
    person = fields.Nested('PersonSchema')

    person_rel = Relationship(
        many=False,
        schema='PersonSchema',
        type_='person'
    )


class PersonNoteList(ResourceList):
    schema = PersonNoteSchema
    data_layer = {'session': db.session,
                  'model': PersonNote}


class PersonNoteDetail(ResourceDetail):
    schema = PersonNoteSchema
    data_layer = {'session': db.session,
                  'model': PersonNote}


class PersonBiographySchema(Schema):
    class Meta:
        type_ = 'person_biography'
        self_view = 'person_biography_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'person_biography_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    essay = fields.Nested('EssaySchema', only=('id', 'title'))

    essay_rel = Relationship(
        many=False,
        schema='EssaySchema',
        type_='essay')

    person_rel = Relationship(
        many=False,
        schema='PersonSchema',
        type_='person'
    )


class PersonBiographyList(ResourceList):
    schema = PersonBiographySchema
    data_layer = {'session': db.session,
                  'model': PersonBiography}


class PersonBiographyDetail(ResourceDetail):
    schema = PersonBiographySchema
    data_layer = {'session': db.session,
                  'model': PersonBiography}


class PersonTagSchema(Schema):
    class Meta:
        type_ = 'person_tag'
        self_view = 'person_tag_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'person_tag_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    tag = fields.Nested('TagSchema')
    person = fields.Nested('PersonSchema')

    tag_rel = Relationship(
        many=False,
        schema='TagSchema',
        type_='tag'
    )

    person_rel = Relationship(
        many=False,
        schema='PersonSchema',
        type_='person'
    )


class PersonTagList(ResourceList):
    schema = PersonTagSchema
    data_layer = {'session': db.session,
                  'model': PersonTag}


class PersonTagDetail(ResourceDetail):
    schema = PersonTagSchema
    data_layer = {'session': db.session,
                  'model': PersonTag}
