from app import db


class Chart(db.Model):
    __tablename__ = 'chart'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    title = db.Column(db.String, nullable=False)
    type = db.Column(db.String)


class ChartOptions(db.Model):
    __tablename__ = 'chart_options'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    responsive = db.Column(db.Boolean)
    maintain_aspect_ratio = db.Column(db.Boolean)

    chart_fk = db.Column(db.Integer, db.ForeignKey('chart.id'))
    chart = db.relationship('Chart', foreign_keys=[chart_fk], backref=db.backref('chart_options'))
    chart_rel = db.relationship('Chart', foreign_keys=[chart_fk])


class ChartTitleOptions(db.Model):
    __tablename__ = 'chart_title_options'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    display = db.Column(db.Boolean)
    text = db.Column(db.String)
    position = db.Column(db.String)
    font_size = db.Column(db.Integer)
    font_family = db.Column(db.String)
    font_color = db.Column(db.String)
    font_style = db.Column(db.String)
    padding = db.Column(db.Integer)
    line_height = db.Column(db.String)

    chart_options_fk = db.Column(db.Integer, db.ForeignKey('chart_options.id'))
    chart_options = db.relationship('ChartOptions', foreign_keys=[chart_options_fk], backref=db.backref('chart_title_options'))
    chart_options_rel = db.relationship('ChartOptions', foreign_keys=[chart_options_fk])


class ChartLegendOptions(db.Model):
    __tablename__ = 'chart_legend_options'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    display = db.Column(db.Boolean)
    position = db.Column(db.String)
    align = db.Column(db.String)
    full_width = db.Column(db.Boolean)
    reverse = db.Column(db.Boolean)

    chart_options_fk = db.Column(db.Integer, db.ForeignKey('chart_options.id'))
    chart_options = db.relationship('ChartOptions', foreign_keys=[chart_options_fk], backref=db.backref('chart_legend_options'))
    chart_options_rel = db.relationship('ChartOptions', foreign_keys=[chart_options_fk])


class ChartLegendLabelOptions(db.Model):
    __tablename__ = 'chart_legend_label_options'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    box_width = db.Column(db.Integer)
    padding = db.Column(db.Integer)
    use_point_style = db.Column(db.Boolean)
    font_size = db.Column(db.Integer)
    font_style = db.Column(db.String)
    font_color = db.Column(db.String)
    font_family = db.Column(db.String)

    chart_legend_options_fk = db.Column(db.Integer, db.ForeignKey('chart_legend_options.id'))
    chart_legend_options = db.relationship('ChartLegendOptions', foreign_keys=[chart_legend_options_fk], backref=db.backref('chart_legend_label_options'))
    chart_legend_options_rel = db.relationship('ChartLegendOptions', foreign_keys=[chart_legend_options_fk])


class ChartTooltipOptions(db.Model):
    __tablename__ = 'chart_tooltip_options'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    enabled = db.Column(db.Boolean)
    background_color = db.Column(db.String)
    title_font_family = db.Column(db.String)
    title_font_size = db.Column(db.Integer)
    title_font_style = db.Column(db.String)
    title_font_color = db.Column(db.String)
    title_align = db.Column(db.String)
    title_spacing = db.Column(db.Integer)
    title_margin_bottom = db.Column(db.Integer)
    body_font_family = db.Column(db.String)
    body_font_size = db.Column(db.Integer)
    body_font_style = db.Column(db.String)
    body_font_color = db.Column(db.String)
    body_align = db.Column(db.String)
    body_spacing = db.Column(db.Integer)
    footer_font_family = db.Column(db.String)
    footer_font_size = db.Column(db.Integer)
    footer_font_style = db.Column(db.String)
    footer_font_color = db.Column(db.String)
    footer_align = db.Column(db.String)
    footer_spacing = db.Column(db.Integer)
    footer_margin_top = db.Column(db.Integer)
    x_padding = db.Column(db.Integer)
    y_padding = db.Column(db.Integer)
    caret_padding = db.Column(db.Integer)
    caret_size = db.Column(db.Integer)
    corner_radius = db.Column(db.Integer)
    display_colors = db.Column(db.Boolean)
    border_color = db.Column(db.String)
    border_width = db.Column(db.Integer)

    chart_options_fk = db.Column(db.Integer, db.ForeignKey('chart_options.id'))
    chart_options = db.relationship('ChartOptions', foreign_keys=[chart_options_fk], backref=db.backref('chart_tooltip_options'))
    chart_options_rel = db.relationship('ChartOptions', foreign_keys=[chart_options_fk])


class ChartLabel(db.Model):
    __tablename__ = 'chart_label'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    label = db.Column(db.String)

    chart_fk = db.Column(db.Integer, db.ForeignKey('chart.id'))
    chart = db.relationship('Chart', foreign_keys=[chart_fk], backref=db.backref('chart_label'))
    chart_rel = db.relationship('Chart', foreign_keys=[chart_fk])


class ChartDataset(db.Model):
    __tablename__ = 'chart_dataset'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    label = db.Column(db.String)
    fill = db.Column(db.Boolean)
    background_color = db.Column(db.String)
    border_color = db.Column(db.String)
    point_radius = db.Column(db.Integer)
    point_background_color = db.Column(db.String)

    chart_fk = db.Column(db.Integer, db.ForeignKey('chart.id'))
    chart = db.relationship('Chart', foreign_keys=[chart_fk], backref=db.backref('chart_dataset'))
    chart_rel = db.relationship('Chart', foreign_keys=[chart_fk])


class ChartDatasetData(db.Model):
    __tablename__ = 'chart_dataset_data'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    x_data = db.Column(db.Float)
    y_data = db.Column(db.Float)

    # radius value in the case of a bubble map
    r_data = db.Column(db.Float)

    chart_dataset_fk = db.Column(db.Integer, db.ForeignKey('chart_dataset.id'))
    chart_dataset = db.relationship('ChartDataset', foreign_keys=[chart_dataset_fk], backref=db.backref('chart_dataset_data'))
    chart_dataset_rel = db.relationship('ChartDataset', foreign_keys=[chart_dataset_fk])
