from app import db


class Essay(db.Model):
    __tablename__ = 'essay'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    title = db.Column(db.String, nullable=False)
    abstract = db.Column(db.Text)
    essay = db.Column(db.Text)


class EssayReference(db.Model):
    __tablename__ = 'essay_reference'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    chapter = db.Column(db.String)
    page_number = db.Column(db.Integer)

    essay_fk = db.Column(db.Integer, db.ForeignKey('essay.id'))
    essay = db.relationship('Essay', foreign_keys=[essay_fk], backref=db.backref('essay_reference'))
    essay_rel = db.relationship('Essay', foreign_keys=[essay_fk])

    reference_fk = db.Column(db.Integer, db.ForeignKey('reference.id'))
    reference = db.relationship('Reference', foreign_keys=[reference_fk], backref=db.backref('essay_reference'))
    reference_rel = db.relationship('Reference', foreign_keys=[reference_fk])
