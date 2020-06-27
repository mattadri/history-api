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
    from app.schemas.event import EventList, EventDetail
    from app.schemas.event import EventNoteList, EventNoteDetail
    from app.schemas.event import EventTagList, EventTagDetail
    from app.schemas.reference import ReferenceList, ReferenceDetail, ReferenceRelationship
    from app.schemas.reference import AuthorList, AuthorDetail, AuthorRelationship
    from app.schemas.reference import ReferenceAuthorList, ReferenceAuthorDetail
    from app.schemas.reference import ReferenceNoteList, ReferenceNoteDetail
    from app.schemas.person import PersonList, PersonDetail
    from app.schemas.person import PersonTagList, PersonTagDetail
    from app.schemas.person import PersonNoteList, PersonNoteDetail
    from app.schemas.chart import ChartList, ChartDetail
    from app.schemas.chart import ChartLabelList, ChartLabelDetail
    from app.schemas.chart import ChartDatasetList, ChartDatasetDetail
    from app.schemas.chart import ChartDatasetDataList, ChartDatasetDataDetail
    from app.schemas.chart import ChartOptionsList, ChartOptionsDetail
    from app.schemas.chart import ChartTitleOptionsList, ChartTitleOptionsDetail
    from app.schemas.chart import ChartLegendOptionsList, ChartLegendOptionsDetail
    from app.schemas.chart import ChartLegendLabelOptionsList, ChartLegendLabelOptionsDetail
    from app.schemas.chart import ChartTooltipOptionsList, ChartTooltipOptionsDetail
    from app.schemas.essay import EssayList, EssayDetail
    from app.schemas.essay import EssayNoteList, EssayNoteDetail
    from app.schemas.essay import EssayReferenceList, EssayReferenceDetail
    from app.schemas.essay import EssayEventList, EssayEventDetail
    from app.schemas.essay import EssayPersonList, EssayPersonDetail
    from app.schemas.essay import EssayTimelineList, EssayTimelineDetail
    from app.schemas.brainstorm import BrainstormList, BrainstormDetail
    from app.schemas.brainstorm import BrainstormThoughtList, BrainstormThoughtDetail
    from app.schemas.brainstorm import BrainstormTopicList, BrainstormTopicDetail
    from app.schemas.brainstorm import BrainstormTopicThoughtList, BrainstormTopicThoughtDetail
    from app.schemas.tag import TagList, TagDetail

    from app.schemas.timeline import TimelineList, TimelineDetail
    from app.schemas.timeline import TimelinePersonList, TimelinePersonDetail
    from app.schemas.timeline import TimelineEventList, TimelineEventDetail
    from app.schemas.timeline import TimelineCategoryList, TimelineCategoryDetail
    from app.schemas.timeline import TimelineCategoryEventList, TimelineCategoryEventDetail
    from app.schemas.timeline import TimelineCategoryPersonList, TimelineCategoryPersonDetail

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

    # REFERENCE-NOTE ROUTES
    api.route(ReferenceNoteList, 'reference_note_list', '/reference_notes')
    api.route(ReferenceNoteDetail, 'reference_note_detail', '/reference_notes/<int:id>')

    # EVENT ROUTES
    api.route(EventList, 'event_list', '/events')
    api.route(EventDetail, 'event_detail', '/events/<int:id>')

    # EVENT NOTE ROUTES
    api.route(EventNoteList, 'event_note_list', '/event_notes')
    api.route(EventNoteDetail, 'event_note_detail', '/event_notes/<int:id>')

    # PERSON ROUTES
    api.route(PersonList, 'person_list', '/persons')
    api.route(PersonDetail, 'person_detail', '/persons/<int:id>')

    # PERSON NOTE ROUTES
    api.route(PersonNoteList, 'person_note_list', '/person_notes')
    api.route(PersonNoteDetail, 'person_note_detail', '/person_notes/<int:id>')

    # CHART ROUTES
    api.route(ChartList, 'chart_list', '/charts')
    api.route(ChartDetail, 'chart_detail', '/charts/<int:id>')

    # CHART LABEL ROUTES
    api.route(ChartLabelList, 'chart_label_list', '/chart_labels')
    api.route(ChartLabelDetail, 'chart_label_detail', '/chart_labels/<int:id>')

    # CHART DATASET ROUTES
    api.route(ChartDatasetList, 'chart_dataset_list', '/chart_datasets')
    api.route(ChartDatasetDetail, 'chart_dataset_detail', '/chart_datasets/<int:id>')

    # CHART DATASET DATA ROUTES
    api.route(ChartDatasetDataList, 'chart_dataset_data_list', '/chart_dataset_data')
    api.route(ChartDatasetDataDetail, 'chart_dataset_data_detail', '/chart_dataset_data/<int:id>')

    # CHART OPTIONS ROUTES
    api.route(ChartOptionsList, 'chart_options_list', '/chart_options')
    api.route(ChartOptionsDetail, 'chart_options_detail', '/chart_options/<int:id>')

    # CHART TITLE OPTIONS ROUTES
    api.route(ChartTitleOptionsList, 'chart_title_options_list', '/chart_title_options')
    api.route(ChartTitleOptionsDetail, 'chart_title_options_detail', '/chart_title_options/<int:id>')

    # CHART LEGEND OPTIONS ROUTES
    api.route(ChartLegendOptionsList, 'chart_legend_options_list', '/chart_legend_options')
    api.route(ChartLegendOptionsDetail, 'chart_legend_options_detail', '/chart_legend_options/<int:id>')

    # CHART LEGEND LABEL OPTIONS ROUTES
    api.route(ChartLegendLabelOptionsList, 'chart_legend_label_options_list', '/chart_legend_label_options')
    api.route(ChartLegendLabelOptionsDetail, 'chart_legend_label_options_detail', '/chart_legend_label_options/<int:id>')

    # CHART TOOLTIP OPTIONS ROUTES
    api.route(ChartTooltipOptionsList, 'chart_tooltip_options_list', '/chart_tooltip_options')
    api.route(ChartTooltipOptionsDetail, 'chart_tooltip_options_detail', '/chart_tooltip_options/<int:id>')

    # ESSAY ROUTES
    api.route(EssayList, 'essay_list', '/essays')
    api.route(EssayDetail, 'essay_detail', '/essays/<int:id>')

    # ESSAY REFERENCE ROUTES
    api.route(EssayReferenceList, 'essay_reference_list', '/essay_references')
    api.route(EssayReferenceDetail, 'essay_reference_detail', '/essay_references/<int:id>')

    # ESSAY EVENT ROUTES
    api.route(EssayEventList, 'essay_event_list', '/essay_events')
    api.route(EssayEventDetail, 'essay_event_detail', '/essay_events/<int:id>')

    # ESSAY PERSON ROUTES
    api.route(EssayPersonList, 'essay_person_list', '/essay_persons')
    api.route(EssayPersonDetail, 'essay_person_detail', '/essay_persons/<int:id>')

    # ESSAY TIMELINE ROUTES
    api.route(EssayTimelineList, 'essay_timeline_list', '/essay_timelines')
    api.route(EssayTimelineDetail, 'essay_timeline_detail', '/essay_timelines/<int:id>')

    # ESSAY NOTE ROUTES
    api.route(EssayNoteList, 'essay_note_list', '/essay_notes')
    api.route(EssayNoteDetail, 'essay_note_detail', '/essay_notes/<int:id>')

    # BRAINSTORM ROUTES
    api.route(BrainstormList, 'brainstorm_list', '/brainstorms')
    api.route(BrainstormDetail, 'brainstorm_detail', '/brainstorms/<int:id>')

    # BRAINSTORM THOUGHT ROUTES
    api.route(BrainstormThoughtList, 'brainstorm_thought_list', '/brainstorm_thoughts')
    api.route(BrainstormThoughtDetail, 'brainstorm_thought_detail', '/brainstorm_thoughts/<int:id>')

    # BRAINSTORM_TOPIC ROUTES
    api.route(BrainstormTopicList, 'brainstorm_topic_list', '/brainstorm_topics')
    api.route(BrainstormTopicDetail, 'brainstorm_topic_detail', '/brainstorm_topics/<int:id>')

    # BRAINSTORM_TOPIC_THOUGHT ROUTES
    api.route(BrainstormTopicThoughtList, 'brainstorm_topic_thought_list', '/brainstorm_topic_thoughts')
    api.route(BrainstormTopicThoughtDetail, 'brainstorm_topic_thought_detail', '/brainstorm_topic_thoughts/<int:id>')

    # TIMELINE ROUTES
    api.route(TimelineList, 'timeline_list', '/timelines')
    api.route(TimelineDetail, 'timeline_detail', '/timelines/<int:id>')

    # TIMELINE-EVENT ROUTES
    api.route(TimelineEventList, 'timeline_event_list', '/timeline_events')
    api.route(TimelineEventDetail, 'timeline_event_detail', '/timeline_events/<int:id>')

    # TIMELINE-PERSON ROUTES
    api.route(TimelinePersonList, 'timeline_person_list', '/timeline_persons')
    api.route(TimelinePersonDetail, 'timeline_person_detail', '/timeline_persons/<int:id>')

    # TIMELINE-CATEGORY ROUTES
    api.route(TimelineCategoryList, 'timeline_category_list', '/timeline_categories')
    api.route(TimelineCategoryDetail, 'timeline_category_detail', '/timeline_categories/<int:id>')

    # TIMELINE-CATEGORY EVENT ROUTES
    api.route(TimelineCategoryEventList, 'timeline_category_event_list', '/timeline_category_events')
    api.route(TimelineCategoryEventDetail, 'timeline_category_event_detail', '/timeline_category_events/<int:id>')

    # TIMELINE-CATEGORY PERSON ROUTES
    api.route(TimelineCategoryPersonList, 'timeline_category_person_list', '/timeline_category_persons')
    api.route(TimelineCategoryPersonDetail, 'timeline_category_person_detail', '/timeline_category_persons/<int:id>')

    # TAG ROUTES
    api.route(TagList, 'tag_list', '/tags')
    api.route(TagDetail, 'tag_detail', '/tags/<int:id>')

    # EVENT TAG ROUTES
    api.route(EventTagList, 'event_tag_list', '/event_tags')
    api.route(EventTagDetail, 'event_tag_detail', '/event_tags/<int:id>')

    # PERSON TAG ROUTES
    api.route(PersonTagList, 'person_tag_list', '/person_tags')
    api.route(PersonTagDetail, 'person_tag_detail', '/person_tags/<int:id>')


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
