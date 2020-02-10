from app import db


class Culture(db.Model):
    __tablename__ = 'culture'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    label = db.Column(db.String, nullable=False)


class CulturePeriod(db.Model):
    __tablename__ = 'culture_period'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    period_start_day = db.Column(db.Integer)
    period_start_month_fk = db.Column(db.Integer, db.ForeignKey('month.id'))
    period_start_month = db.relationship('Month', foreign_keys=[period_start_month_fk])
    period_start_year = db.Column(db.Integer)
    period_start_era_fk = db.Column(db.Integer, db.ForeignKey('era.id'))
    period_start_era = db.relationship('Era', foreign_keys=[period_start_era_fk])
    period_end_day = db.Column(db.Integer)
    period_end_month_fk = db.Column(db.Integer, db.ForeignKey('month.id'))
    period_end_month = db.relationship('Month', foreign_keys=[period_end_month_fk])
    period_end_year = db.Column(db.Integer)
    period_end_era_fk = db.Column(db.Integer, db.ForeignKey('era.id'))
    period_end_era = db.relationship('Era', foreign_keys=[period_end_era_fk])
    culture_fk = db.Column(db.Integer, db.ForeignKey('culture.id'))
    culture = db.relationship('Culture', foreign_keys=[culture_fk])


class CultureReference(db.Model):
    __tablename__ = 'culture_reference'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    reference_fk = db.Column(db.Integer, db.ForeignKey('reference.id'))
    reference = db.relationship('Reference', foreign_keys=[reference_fk])
