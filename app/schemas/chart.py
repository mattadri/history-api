from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app.models.chart import Chart, ChartLabel, ChartDataset, ChartDatasetData, ChartOptions, ChartTitleOptions, \
    ChartLegendOptions, ChartLegendLabelOptions, ChartTooltipOptions

from app import db


class ChartSchema(Schema):
    class Meta:
        type_ = 'chart'
        self_view = 'chart_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'chart_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    title = fields.String(required=True)
    type = fields.String(required=True)

    chart_label = fields.Nested('ChartLabelSchema', many=True)
    chart_dataset = fields.Nested('ChartDatasetSchema', many=True)
    chart_options = fields.Nested('ChartOptionsSchema', many=True)


class ChartLabelSchema(Schema):
    class Meta:
        type_ = 'chart_label'
        self_view = 'chart_label_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'chart_label_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    label = fields.String(required=True)

    chart_rel = Relationship(
        schema='ChartSchema',
        type_='chart',
        required=True
    )


class ChartDatasetSchema(Schema):
    class Meta:
        type_ = 'chart_dataset'
        self_view = 'chart_dataset_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'chart_dataset_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    label = fields.String(required=True)
    fill = fields.Boolean()
    background_color = fields.String()
    border_color = fields.String()
    point_radius = fields.Integer()
    point_background_color = fields.String()

    chart_dataset_data = fields.Nested('ChartDatasetDataSchema', many=True)

    chart_rel = Relationship(
        schema='ChartSchema',
        type_='chart',
        required=True
    )


class ChartOptionsSchema(Schema):
    class Meta:
        type_ = 'chart_options'
        self_view = 'chart_options_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'chart_options_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    responsive = fields.Boolean()
    maintain_aspect_ratio = fields.Boolean()

    chart_rel = Relationship(
        schema='ChartSchema',
        type_='chart',
        required=True
    )

    chart_title_options = fields.Nested('ChartTitleOptionsSchema', many=True)
    chart_legend_options = fields.Nested('ChartLegendOptionsSchema', many=True)
    chart_tooltip_options = fields.Nested('ChartTooltipOptionsSchema', many=True)


class ChartTitleOptionsSchema(Schema):
    class Meta:
        type_ = 'chart_title_options'
        self_view = 'chart_title_options_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'chart_title_options_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    display = fields.Boolean()
    text = fields.String()
    position = fields.String()
    font_size = fields.Integer()
    font_family = fields.String()
    font_color = fields.String()
    font_style = fields.String()
    padding = fields.Integer()
    line_height = fields.String()

    chart_options_rel = Relationship(
        schema='ChartOptionsSchema',
        type_='chart_options',
        required=True
    )


class ChartTooltipOptionsSchema(Schema):
    class Meta:
        type_ = 'chart_tooltip_options'
        self_view = 'chart_tooltip_options_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'chart_tooltip_options_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    enabled = fields.Boolean()
    background_color = fields.String()
    title_font_family = fields.String()
    title_font_size = fields.Integer()
    title_font_style = fields.String()
    title_font_color = fields.String()
    title_align = fields.String()
    title_spacing = fields.Integer()
    title_margin_bottom = fields.Integer()
    body_font_family = fields.String()
    body_font_size = fields.Integer()
    body_font_style = fields.String()
    body_font_color = fields.String()
    body_align = fields.String()
    body_spacing = fields.Integer()
    footer_font_family = fields.String()
    footer_font_size = fields.Integer()
    footer_font_style = fields.String()
    footer_font_color = fields.String()
    footer_align = fields.String()
    footer_spacing = fields.Integer()
    footer_margin_top = fields.Integer()
    x_padding = fields.Integer()
    y_padding = fields.Integer()
    caret_padding = fields.Integer()
    caret_size = fields.Integer()
    corner_radius = fields.Integer()
    display_colors = fields.Boolean()
    border_color = fields.String()
    border_width = fields.Integer()

    chart_options_rel = Relationship(
        schema='ChartOptionsSchema',
        type_='chart_options',
        required=True
    )


class ChartLegendOptionsSchema(Schema):
    class Meta:
        type_ = 'chart_legend_options'
        self_view = 'chart_legend_options_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'chart_legend_options_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    display = fields.Boolean()
    position = fields.String()
    align = fields.String()
    full_width = fields.Boolean()
    reverse = fields.Boolean()

    chart_legend_label_options = fields.Nested('ChartLegendLabelOptionsSchema', many=True)

    chart_options_rel = Relationship(
        schema='ChartOptionsSchema',
        type_='chart_options',
        required=True
    )


class ChartLegendLabelOptionsSchema(Schema):
    class Meta:
        type_ = 'chart_legend_label_options'
        self_view = 'chart_legend_label_options_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'chart_legend_label_options_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    box_width = fields.Integer()
    padding = fields.Integer()
    use_point_style = fields.Boolean()
    font_size = fields.Integer()
    font_style = fields.String()
    font_color = fields.String()
    font_family = fields.String()

    chart_legend_options_rel = Relationship(
        schema='ChartLegendOptionsSchema',
        type_='chart_legend_options',
        required=True
    )


class ChartDatasetDataSchema(Schema):
    class Meta:
        type_ = 'chart_dataset_data'
        self_view = 'chart_dataset_data_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'chart_dataset_data_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    x_data = fields.Float()
    y_data = fields.Float()
    r_data = fields.Float()

    chart_dataset_rel = Relationship(
        schema='ChartDatasetSchema',
        type_='chart_dataset',
        required=True
    )


# LISTS
class ChartList(ResourceList):
    schema = ChartSchema
    data_layer = {'session': db.session,
                  'model': Chart}


class ChartLabelList(ResourceList):
    schema = ChartLabelSchema
    data_layer = {'session': db.session,
                  'model': ChartLabel}


class ChartDatasetList(ResourceList):
    schema = ChartDatasetSchema
    data_layer = {'session': db.session,
                  'model': ChartDataset}


class ChartDatasetDataList(ResourceList):
    schema = ChartDatasetDataSchema
    data_layer = {'session': db.session,
                  'model': ChartDatasetData}


class ChartOptionsList(ResourceList):
    schema = ChartOptionsSchema
    data_layer = {'session': db.session,
                  'model': ChartOptions}


class ChartTitleOptionsList(ResourceList):
    schema = ChartTitleOptionsSchema
    data_layer = {'session': db.session,
                  'model': ChartTitleOptions}


class ChartLegendOptionsList(ResourceList):
    schema = ChartLegendOptionsSchema
    data_layer = {'session': db.session,
                  'model': ChartLegendOptions}


class ChartLegendLabelOptionsList(ResourceList):
    schema = ChartLegendLabelOptionsSchema
    data_layer = {'session': db.session,
                  'model': ChartLegendLabelOptions}


class ChartTooltipOptionsList(ResourceList):
    schema = ChartTooltipOptionsSchema
    data_layer = {'session': db.session,
                  'model': ChartTooltipOptions}


# DETAILS
class ChartDetail(ResourceDetail):
    schema = ChartSchema
    data_layer = {'session': db.session,
                  'model': Chart}


class ChartLabelDetail(ResourceDetail):
    schema = ChartLabelSchema
    data_layer = {'session': db.session,
                  'model': ChartLabel}


class ChartDatasetDetail(ResourceDetail):
    schema = ChartDatasetSchema
    data_layer = {'session': db.session,
                  'model': ChartDataset}


class ChartDatasetDataDetail(ResourceDetail):
    schema = ChartDatasetDataSchema
    data_layer = {'session': db.session,
                  'model': ChartDatasetData}


class ChartOptionsDetail(ResourceDetail):
    schema = ChartOptionsSchema
    data_layer = {'session': db.session,
                  'model': ChartOptions}


class ChartTitleOptionsDetail(ResourceDetail):
    schema = ChartTitleOptionsSchema
    data_layer = {'session': db.session,
                  'model': ChartTitleOptions}


class ChartLegendOptionsDetail(ResourceDetail):
    schema = ChartLegendOptionsSchema
    data_layer = {'session': db.session,
                  'model': ChartLegendOptions}


class ChartLegendLabelOptionsDetail(ResourceDetail):
    schema = ChartLegendLabelOptionsSchema
    data_layer = {'session': db.session,
                  'model': ChartLegendLabelOptions}


class ChartTooltipOptionsDetail(ResourceDetail):
    schema = ChartTooltipOptionsSchema
    data_layer = {'session': db.session,
                  'model': ChartTooltipOptions}
