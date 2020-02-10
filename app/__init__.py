import os

from flask import Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy

# local config import
from instance.config import app_config


db = SQLAlchemy()


# noinspection PyTypeChecker
def create_api(flask_app):
    from flask_rest_jsonapi import Api

    from app.schemas.era import EraList, EraDetail
    from app.schemas.month import MonthList, MonthDetail
    from app.schemas.culture import CulturePeriodList, CulturePeriodDetail
    from app.schemas.culture import CultureList, CultureDetail
    from app.schemas.culture import CultureReferenceList, CultureReferenceDetail
    from app.schemas.event import EventList, EventDetail
    from app.schemas.event import EventNoteList, EventNoteDetail
    from app.schemas.reference import ReferenceList, ReferenceDetail, ReferenceRelationship
    from app.schemas.reference import AuthorList, AuthorDetail, AuthorRelationship
    from app.schemas.reference import ReferenceAuthorList, ReferenceAuthorDetail, ReferenceAuthorRelationship
    from app.schemas.person import PersonList, PersonDetail

    from app.schemas.timeline import TimelineList, TimelineDetail
    from app.schemas.timeline import TimelinePersonList, TimelinePersonDetail
    from app.schemas.timeline import TimelineEventList, TimelineEventDetail

    api = Api(flask_app)

    # ERA ROUTES
    api.route(EraList, 'era_list', '/eras')
    api.route(EraDetail, 'era_detail', '/eras/<int:id>')

    # MONTH ROUTES
    api.route(MonthList, 'month_list', '/months')
    api.route(MonthDetail, 'month_detail', '/months/<int:id>')

    # REFERENCE ROUTES
    api.route(ReferenceList, 'reference_list', '/references')
    api.route(ReferenceDetail, 'reference_detail', '/references/<int:id>')
    api.route(ReferenceRelationship, 'reference_month', '/references/<int:id>/relationships/published_month')
    api.route(ReferenceRelationship, 'reference_era', '/references/<int:id>/relationships/published_era')

    # AUTHOR ROUTES
    api.route(AuthorList, 'author_list', '/authors')
    api.route(AuthorDetail, 'author_detail', '/authors/<int:id>')

    # REFERENCE-AUTHOR ROUTES
    api.route(ReferenceAuthorList, 'reference_author_list', '/reference_authors')
    api.route(ReferenceAuthorDetail, 'reference_author_detail', '/reference_authors/<int:id>')

    # CULTURE ROUTES
    api.route(CultureList, 'culture_list', '/cultures')
    api.route(CultureDetail, 'culture_detail', '/cultures/<int:id>')

    # CULTURE PERIOD ROUTES
    api.route(CulturePeriodList, 'culture_period_list', '/culture_periods')
    api.route(CulturePeriodDetail, 'culture_period_detail', '/culture_periods/<int:id>')

    # CULTURE REFERENCE ROUTES
    api.route(CultureReferenceList, 'culture_reference_list', '/culture_references')
    api.route(CultureReferenceDetail, 'culture_reference_detail', '/culture_references/<int:id>')

    # EVENT ROUTES
    api.route(EventList, 'event_list', '/events')
    api.route(EventDetail, 'event_detail', '/events/<int:id>')

    # EVENT NOTE ROUTES
    api.route(EventNoteList, 'event_note_list', '/event_notes')
    api.route(EventNoteDetail, 'event_note_detail', '/event_notes/<int:id>')

    # PERSON ROUTES
    api.route(PersonList, 'person_list', '/persons')
    api.route(PersonDetail, 'person_detail', '/persons/<int:id>')

    # TIMELINE ROUTES
    api.route(TimelineList, 'timeline_list', '/timelines')
    api.route(TimelineDetail, 'timeline_detail', '/timelines/<int:id>')

    # TIMELINE-EVENT ROUTES
    api.route(TimelineEventList, 'timeline_event_list', '/timeline_events')
    api.route(TimelineEventDetail, 'timeline_event_detail', '/timeline_events/<int:id>')

    # TIMELINE-PERSON ROUTES
    api.route(TimelinePersonList, 'timeline_person_list', '/timeline_persons')
    api.route(TimelinePersonDetail, 'timeline_person_detail', '/timeline_persons/<int:id>')


def create_flask_app(environment_config):
    flask_app = Flask(__name__)
    flask_app.config.from_object(app_config[environment_config])
    flask_app.config.from_pyfile('../instance/config.py')
    flask_app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    CORS(flask_app)

    return flask_app


def create_app(environment_config):
    app = create_flask_app(environment_config)
    create_api(app)
    db.init_app(app)

    return app

config_name = os.getenv('APP_SETTINGS')
application = create_app(config_name)
