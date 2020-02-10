from app import db


class Event(db.Model):
    __tablename__ = 'event'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    label = db.Column(db.String, nullable=False)
    description = db.Column(db.String)
    event_start_day = db.Column(db.Integer)
    event_start_month_fk = db.Column(db.Integer, db.ForeignKey('month.id'))
    event_start_month = db.relationship('Month', foreign_keys=[event_start_month_fk])
    event_start_month_rel = db.relationship('Month', foreign_keys=[event_start_month_fk])
    event_start_year = db.Column(db.BigInteger)
    event_start_era_fk = db.Column(db.Integer, db.ForeignKey('era.id'))
    event_start_era = db.relationship('Era', foreign_keys=[event_start_era_fk])
    event_start_era_rel = db.relationship('Era', foreign_keys=[event_start_era_fk])
    event_end_day = db.Column(db.Integer)
    event_end_month_fk = db.Column(db.Integer, db.ForeignKey('month.id'))
    event_end_month = db.relationship('Month', foreign_keys=[event_end_month_fk])
    event_end_month_rel = db.relationship('Month', foreign_keys=[event_end_month_fk])
    event_end_year = db.Column(db.BigInteger)
    event_end_era_fk = db.Column(db.Integer, db.ForeignKey('era.id'))
    event_end_era = db.relationship('Era', foreign_keys=[event_end_era_fk])
    event_end_era_rel = db.relationship('Era', foreign_keys=[event_end_era_fk])
    reference_fk = db.Column(db.Integer, db.ForeignKey('reference.id'))
    reference = db.relationship('Reference', foreign_keys=[reference_fk])
    reference_rel = db.relationship('Reference', foreign_keys=[reference_fk])


class EventNote(db.Model):
    __tablename__ = 'event_note'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    note = db.Column(db.String, nullable=False)
    event_fk = db.Column(db.Integer, db.ForeignKey('event.id'))
    event = db.relationship('Event', foreign_keys=[event_fk], backref=db.backref('event_note'))
    event_rel = db.relationship('Event', foreign_keys=[event_fk])
