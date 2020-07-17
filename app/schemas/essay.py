# from flask import request

from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app.models.essay import Essay, EssayNote, EssayReference, EssayEvent, EssayPerson, EssayTimeline, EssayType

from app import db


class EssaySchema(Schema):
    class Meta:
        type_ = 'essay'
        self_view = 'essay_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'essay_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    title = fields.String(required=True)
    abstract = fields.String()
    essay = fields.String()

    type = fields.Nested('EssayTypeSchema')
    essay_note = fields.Nested('EssayNoteSchema', many=True)
    essay_reference = fields.Nested('EssayReferenceSchema', many=True)
    essay_event = fields.Nested('EssayEventSchema', many=True)
    essay_person = fields.Nested('EssayPersonSchema', many=True)
    essay_timeline = fields.Nested('EssayTimelineSchema', many=True)

    type_rel = Relationship(
        many=False,
        schema='EssayTypeSchema',
        type_='essay_type',
        required=False
    )


class EssayList(ResourceList):
    schema = EssaySchema
    data_layer = {'session': db.session,
                  'model': Essay}


class EssayDetail(ResourceDetail):
    # make sure that related objects are deleted as well.
    def before_delete(self, args, kwargs):
        # delete all notes
        query = db.session.query(EssayNote)
        query = query.filter(EssayNote.essay_fk == kwargs['id'])
        query.delete()

        # delete all references
        query = db.session.query(EssayReference)
        query = query.filter(EssayReference.essay_fk == kwargs['id'])
        query.delete()

        # delete all events
        query = db.session.query(EssayEvent)
        query = query.filter(EssayEvent.essay_fk == kwargs['id'])
        query.delete()

        # delete all people
        query = db.session.query(EssayPerson)
        query = query.filter(EssayPerson.essay_fk == kwargs['id'])
        query.delete()

        # delete all timelines
        query = db.session.query(EssayTimeline)
        query = query.filter(EssayTimeline.essay_fk == kwargs['id'])
        query.delete()

    schema = EssaySchema
    data_layer = {'session': db.session,
                  'model': Essay}


class EssayNoteSchema(Schema):
    class Meta:
        type_ = 'essay_note'
        self_view = 'essay_note_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'essay_note_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    note = fields.String(required=True)

    reference_chapter = fields.String()
    reference_page = fields.Integer()

    reference = fields.Nested('ReferenceSchema')

    essay_rel = Relationship(
        schema='EssaySchema',
        type_='essay',
        required=True
    )

    reference_rel = Relationship(
        schema='ReferenceSchema',
        type_='reference',
        required=False
    )


class EssayNoteList(ResourceList):
    schema = EssayNoteSchema
    data_layer = {'session': db.session,
                  'model': EssayNote}


class EssayNoteDetail(ResourceDetail):
    schema = EssayNoteSchema
    data_layer = {'session': db.session,
                  'model': EssayNote}


class EssayReferenceSchema(Schema):
    class Meta:
        type_ = 'essay_reference'
        self_view = 'essay_reference_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'essay_reference_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    chapter = fields.String()
    page = fields.Integer()

    reference = fields.Nested('ReferenceSchema')

    essay_rel = Relationship(
        schema='EssaySchema',
        type_='essay',
        required=True
    )

    reference_rel = Relationship(
        schema='ReferenceSchema',
        type_='reference',
        required=False
    )


class EssayReferenceList(ResourceList):
    schema = EssayReferenceSchema
    data_layer = {'session': db.session,
                  'model': EssayReference}


class EssayReferenceDetail(ResourceDetail):
    schema = EssayReferenceSchema
    data_layer = {'session': db.session,
                  'model': EssayReference}


class EssayEventSchema(Schema):
    class Meta:
        type_ = 'essay_event'
        self_view = 'essay_event_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'essay_event_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    event = fields.Nested('EventSchema')

    essay_rel = Relationship(
        schema='EssaySchema',
        type_='essay',
        required=True
    )

    event_rel = Relationship(
        schema='EventSchema',
        type_='event',
        required=False
    )


class EssayEventList(ResourceList):
    schema = EssayEventSchema
    data_layer = {'session': db.session,
                  'model': EssayEvent}


class EssayEventDetail(ResourceDetail):
    schema = EssayEventSchema
    data_layer = {'session': db.session,
                  'model': EssayEvent}


class EssayPersonSchema(Schema):
    class Meta:
        type_ = 'essay_person'
        self_view = 'essay_person_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'essay_person_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    person = fields.Nested('PersonSchema')

    essay_rel = Relationship(
        schema='EssaySchema',
        type_='essay',
        required=True
    )

    person_rel = Relationship(
        schema='PersonSchema',
        type_='person',
        required=False
    )


class EssayPersonList(ResourceList):
    schema = EssayPersonSchema
    data_layer = {'session': db.session,
                  'model': EssayPerson}


class EssayPersonDetail(ResourceDetail):
    schema = EssayPersonSchema
    data_layer = {'session': db.session,
                  'model': EssayPerson}


class EssayTimelineSchema(Schema):
    class Meta:
        type_ = 'essay_timeline'
        self_view = 'essay_timeline_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'essay_timeline_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    timeline = fields.Nested('TimelineSchema')

    essay_rel = Relationship(
        schema='EssaySchema',
        type_='essay',
        required=True
    )

    timeline_rel = Relationship(
        schema='TimelineSchema',
        type_='timeline',
        required=False
    )


class EssayTimelineList(ResourceList):
    schema = EssayTimelineSchema
    data_layer = {'session': db.session,
                  'model': EssayTimeline}


class EssayTimelineDetail(ResourceDetail):
    schema = EssayTimelineSchema
    data_layer = {'session': db.session,
                  'model': EssayTimeline}


class EssayTypeSchema(Schema):
    class Meta:
        type_ = 'essay_type'
        self_view = 'essay_type_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'essay_type_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    label = fields.String()


class EssayTypeList(ResourceList):
    schema = EssayTypeSchema
    data_layer = {'session': db.session,
                  'model': EssayType}


class EssayTypeDetail(ResourceDetail):
    schema = EssayTypeSchema
    data_layer = {'session': db.session,
                  'model': EssayType}
