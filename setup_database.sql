-- Không cần tạo database vì Render đã tạo sẵn
-- Sử dụng SERIAL thay vì AUTO_INCREMENT trong PostgreSQL

-- Tạo bảng decisions
CREATE TABLE IF NOT EXISTS decisions (
    decision_id SERIAL PRIMARY KEY,
    decision_name VARCHAR(255) NOT NULL,
    description TEXT,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    criteria_cr FLOAT DEFAULT NULL,
    criteria_comparison_json TEXT DEFAULT NULL
);

-- Tạo bảng criteria
CREATE TABLE IF NOT EXISTS criteria (
    criterion_id SERIAL PRIMARY KEY,
    decision_id INTEGER NOT NULL,
    criterion_name VARCHAR(255) NOT NULL,
    weight FLOAT DEFAULT NULL,
    FOREIGN KEY (decision_id) REFERENCES decisions(decision_id) ON DELETE CASCADE
);

-- Tạo bảng alternatives
CREATE TABLE IF NOT EXISTS alternatives (
    alternative_id SERIAL PRIMARY KEY,
    decision_id INTEGER NOT NULL,
    alternative_name VARCHAR(255) NOT NULL,
    overall_score FLOAT DEFAULT NULL,
    rank_value INTEGER DEFAULT NULL,
    FOREIGN KEY (decision_id) REFERENCES decisions(decision_id) ON DELETE CASCADE
);

-- Tạo bảng alternative_scores
CREATE TABLE IF NOT EXISTS alternative_scores (
    score_id SERIAL PRIMARY KEY,
    alternative_id INTEGER NOT NULL,
    criterion_id INTEGER NOT NULL,
    raw_score FLOAT DEFAULT NULL,
    normalized_score FLOAT DEFAULT NULL,
    FOREIGN KEY (alternative_id) REFERENCES alternatives(alternative_id) ON DELETE CASCADE,
    FOREIGN KEY (criterion_id) REFERENCES criteria(criterion_id) ON DELETE CASCADE
);

-- Tạo bảng criteria_comparison
CREATE TABLE IF NOT EXISTS criteria_comparison (
    comparison_id SERIAL PRIMARY KEY,
    decision_id INTEGER NOT NULL,
    criterion1_id INTEGER NOT NULL,
    criterion2_id INTEGER NOT NULL,
    value FLOAT NOT NULL,
    FOREIGN KEY (decision_id) REFERENCES decisions(decision_id) ON DELETE CASCADE,
    FOREIGN KEY (criterion1_id) REFERENCES criteria(criterion_id) ON DELETE CASCADE,
    FOREIGN KEY (criterion2_id) REFERENCES criteria(criterion_id) ON DELETE CASCADE
); 