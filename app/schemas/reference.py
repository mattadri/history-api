from flask import request

from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList, ResourceRelationship

from app.models.reference import Reference, Author, ReferenceAuthor, ReferenceNote
from app.schemas.month import MonthSchema
from app.schemas.era import EraSchema

from app import db


class ReferenceSchema(Schema):
    class Meta:
        type_ = 'reference'
        self_view = 'reference_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'reference_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    title = fields.String(required=True)
    sub_title = fields.String(required=False, allow_none=True)
    published_day = fields.Integer(required=False, allow_none=True)
    published_month = fields.Nested(MonthSchema)
    published_year = fields.Integer(required=True)
    published_era = fields.Nested(EraSchema)

    reference_author = fields.Nested(
        'ReferenceAuthorSchema',
        exclude=('reference',),
        many=True)

    reference_note = fields.Nested(
        'ReferenceNoteSchema',
        exclude=('reference',),
        many=True)

    published_month_rel = Relationship(
        self_view='reference_month',
        self_view_kwargs={'id': '<id>'},
        related_view='month_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='MonthSchema',
        type_='month',
        required=False
    )
    published_era_rel = Relationship(
        self_view='reference_era',
        self_view_kwargs={'id': '<id>'},
        related_view='era_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='EraSchema',
        type_='era',
        required=True
    )
    reference_author_rel = Relationship(
        many=True,
        schema='ReferenceAuthorSchema',
        type_='reference_author'
    )


class ReferenceList(ResourceList):
    def after_get(self, result):
        # for each source sort the notes descending so the newest note is always listed first
        for source in result['data']:
            try:
                notes = source['attributes']['reference_note']['data']

                if len(notes):
                    sorted_notes = sorted(notes, key=lambda k: k['attributes']['created'], reverse=True)

                    source['attributes']['reference_note']['data'] = sorted_notes

            except Exception as e:
                continue

    schema = ReferenceSchema
    data_layer = {'session': db.session,
                  'model': Reference}


class ReferenceDetail(ResourceDetail):
    def after_get(self, result):
        # sort the notes descending so the newest note is always listed first
        notes = result['data']['attributes']['reference_note']['data']

        if len(notes):
            sorted_notes = sorted(notes, key=lambda k: k['attributes']['created'], reverse=True)

            result['data']['attributes']['reference_note']['data'] = sorted_notes

    def before_patch(self, args, kwargs):
        if 'published_day' in request.json['data']['attributes'].keys() and request.json['data']['attributes']['published_day'] == 'null':
            request.json['data']['attributes']['published_day'] = None

        if 'published_month_rel' in request.json['data']['attributes'] and request.json['data']['attributes']['published_month_rel']['data']['id'] == 'null':
            request.json['data']['attributes']['published_month_rel']['data']['id'] = None

    # make sure that when a reference is deleted any relationships that reference had with any authors is also deleted.
    def before_delete(self, args, kwargs):
        query = db.session.query(ReferenceAuthor)
        query = query.filter(ReferenceAuthor.reference_fk == kwargs['id'])
        query.delete()

    schema = ReferenceSchema
    data_layer = {'session': db.session,
                  'model': Reference}


class ReferenceRelationship(ResourceRelationship):
    schema = ReferenceSchema
    data_layer = {'session': db.session,
                  'model': Reference}


class AuthorSchema(Schema):
    class Meta:
        type_ = 'author'
        self_view = 'author_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'author_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    first_name = fields.String()
    middle_name = fields.String()
    last_name = fields.String()
    reference_authors = Relationship(
        many=True,
        schema='ReferenceAuthorSchema',
        type_='reference_author'
    )


class AuthorList(ResourceList):
    schema = AuthorSchema
    data_layer = {'session': db.session,
                  'model': Author}


class AuthorDetail(ResourceDetail):
    # make sure that when an author is deleted any relationships that author had with any references is also deleted.
    def before_delete(self, args, kwargs):
        query = db.session.query(ReferenceAuthor)
        query = query.filter(ReferenceAuthor.author_fk == kwargs['id'])
        query.delete()

    schema = AuthorSchema
    data_layer = {'session': db.session,
                  'model': Author}


class AuthorRelationship(ResourceRelationship):
    schema = AuthorSchema
    data_layer = {'session': db.session,
                  'model': Author}


class ReferenceAuthorSchema(Schema):
    class Meta:
        type_ = 'reference_author'
        self_view = 'reference_author_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'reference_author_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    reference = fields.Nested(ReferenceSchema)
    author = fields.Nested(AuthorSchema)

    reference_rel = Relationship(
        schema='ReferenceSchema',
        type_='reference',
        required=True
    )

    author_rel = Relationship(
        schema='AuthorSchema',
        type_='author',
        required=True
    )


class ReferenceAuthorList(ResourceList):
    schema = ReferenceAuthorSchema
    data_layer = {'session': db.session,
                  'model': ReferenceAuthor}


class ReferenceAuthorDetail(ResourceDetail):
    schema = ReferenceAuthorSchema
    data_layer = {'session': db.session,
                  'model': ReferenceAuthor}


class ReferenceNoteSchema(Schema):
    class Meta:
        type_ = 'reference_note'
        self_view = 'reference_note_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'reference_note_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    note = fields.String(required=True)
    chapter = fields.String()
    page = fields.Integer()

    reference = fields.Nested('ReferenceSchema')

    reference_rel = Relationship(
        many=False,
        schema='ReferenceSchema',
        type_='reference'
    )


class ReferenceNoteList(ResourceList):
    schema = ReferenceNoteSchema
    data_layer = {'session': db.session,
                  'model': ReferenceNote}


class ReferenceNoteDetail(ResourceDetail):
    schema = ReferenceNoteSchema
    data_layer = {'session': db.session,
                  'model': ReferenceNote}
