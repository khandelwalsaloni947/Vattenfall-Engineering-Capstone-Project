CREATE CATALOG vattenfall_dev;

CREATE SCHEMA vattenfall_dev.raw;
CREATE SCHEMA vattenfall_dev.refined;
CREATE SCHEMA vattenfall_dev.analytics;

CREATE VOLUME vattenfall_dev.raw.landing;
CREATE VOLUME vattenfall_dev.raw.checkpoints;