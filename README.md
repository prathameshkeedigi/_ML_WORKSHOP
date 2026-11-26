# 🦈 Deal ya Doglapan? Can a computer think like a Shark?

**DSC × AWS Club · Machine Learning Workshop · KLE Tech**

In this workshop you build a complete machine-learning pipeline that looks at a Shark Tank India pitch and predicts: **Deal or No deal?**

No ML experience needed. Run the cells in order, read the explanation above each one, and compare your output with the expected result in the table below.

> ⚠️ **The dataset is simulated.** The 1,000 startups and their numbers are made up, but their shapes copy the real Shark Tank India data (asks, equity, revenue, margins, industries, cities, deal terms). The patterns are a bit clearer than on TV, so we can learn from them.

---

## 🆘 Stuck? Tell us the cell number

Every code cell starts with a number, like this:

```python
# ── Cell 12 ──
```

If something breaks, raise your hand and tell us: **"Cell 12, I got this error: …"**. That's all we need to help you.

---

## 📁 What's in this repo

| File | What it is |
|---|---|
| `deal_ya_doglapan_full_pipeline.ipynb` | The workshop notebook: 42 numbered code cells, with all results already saved |
| `Shark_tank/shark_tank_simulated.csv` | The dataset: 1,000 pitches × 32 columns |
| `site/index.html` | 🎮 The interactive **pitch desk**: open it in any browser, no setup needed |
| `setup_workshop.bat` | One-click setup for Windows |
| `README.md` | This guide |

---

## 🎮 Just want to play? Open the pitch desk

Double-click **`site/index.html`**. It opens in your browser, works offline, and needs no Python. Enter a pitch (industry, ask, equity, revenue…), submit it, and click the photo to see whether our trained model says **Deal** or **Doglapan**.

---

## 🚀 Setup (on your laptop)

### Option A: Windows one-click setup (recommended)

1. Clone the repo (or **Code → Download ZIP** on GitHub and unzip it):
   ```cmd
   git clone https://github.com/prathameshkeedigi/_ML_WORKSHOP.git
   cd _ML_WORKSHOP
   ```
2. **Before the workshop, with internet:** double-click `setup_workshop.bat` (or run it in cmd). It:
   - finds 64-bit Python 3.11–3.13 (and installs Python 3.13 with `winget` if you have none),
   - creates a private environment in a `.venv` folder,
   - installs numpy, pandas, matplotlib, scikit-learn and JupyterLab,
   - adds the Python + Jupyter extensions to VS Code (if you have VS Code),
   - checks that everything works.

   Wait until it prints **`WORKSHOP READY`**.
3. **During the workshop:** open the notebook with
   ```cmd
   setup_workshop.bat --open
   ```

Other options: `setup_workshop.bat --check` re-checks your setup without installing anything.

### Option B: Any OS, manual setup

You need **Python 3.11–3.13**.

```bash
git clone https://github.com/prathameshkeedigi/_ML_WORKSHOP.git
cd _ML_WORKSHOP
pip install pandas numpy matplotlib scikit-learn joblib jupyterlab
jupyter lab deal_ya_doglapan_full_pipeline.ipynb
```

In VS Code: open the folder, open the notebook, pick your Python kernel, and run the cells in order (**Shift + Enter**).

> Tested with pandas 2.2, numpy 2.2, matplotlib 3.10, scikit-learn 1.8.

### ✅ Golden rules

- **Run the cells in order, top to bottom.** Later cells use variables made by earlier ones.
- If you get `NameError: name '…' is not defined`, you skipped a cell. Go back and run the cells above it.
- If things get weird: **Kernel → Restart & Run All** (in VS Code: **Restart**, then **Run All**).

---

## 🗺️ The ML pipeline (today's journey)

| Step | What happens | Cells | Presented by |
|---|---|---|---|
| 0 · Kickoff + game | What is ML? You play the Shark | 1–3 | Part 1 |
| 1 · Problem | What exactly is a *Deal*? | 4–5 | Part 1 |
| 2 · EDA | Study every column like a detective 🕵️ | 6–20 | Part 1 |
| 3 · Cleaning | Fix what's broken | 21–22 | Part 1 |
| 4 · Feature Engineering | Turn Shark thinking into columns | 23–29 | Part 1 (second speaker) |
| 5 · Train/Test Split | Lock away a sealed exam | 30 | Part 1 (second speaker) |
| 6 · Preprocessing | Make the data machine-ready | 31–33 | Part 1 (second speaker) |
| 7 · Train | Logistic Regression, Random Forest, Gradient Boosting | 34–37 | Part 2 |
| 8 · Evaluate | Open the sealed test set, read the confusion matrix | 38–39 | Part 2 |
| 9 · Dashboard | Try your own pitch | 40–42 | Part 2 |

---

## 🔢 Cell-by-cell guide with expected results

Your numbers should match these exactly (the data and all random seeds are fixed).

### Setup and game

| Cell | What it does | What you should see |
|---|---|---|
| 1 | Imports the libraries and loads the dataset | `Rows (pitches): 1000   Columns: 32` |
| 2 | Shows 4 pitches **without the answer**. Vote: Deal or No deal? | A table of 4 startups (MilletDabbaPro, SparkEVX, PulsePlusGo, MilletDabba) |
| 3 | Reveals what really happened | MilletDabbaPro ✅ DEAL · SparkEVX ❌ no offer · PulsePlusGo ❌ offer rejected · MilletDabba ✅ DEAL |

### Phase 1 · The Problem

| Cell | What it does | What you should see |
|---|---|---|
| 4 | Counts the `Accepted Offer` values | 570 accepted · 73 rejected the offer · 357 blank (no offer) |
| 5 | Creates the target column `deal` (1 = Deal, 0 = No deal) | Deal 570 · No deal 430 · **Deal rate: 57.0%** + a bar chart |

### Phase 2 · EDA (Exploratory Data Analysis)

| Cell | What it does | What you should see |
|---|---|---|
| 6 | `df.head()`: the first 5 rows | A wide table with all 32 columns |
| 7 | `df.info()`: every column, its type and how many values are filled | 32 columns, 1,000 entries; many columns have fewer than 1,000 non-null values |
| 8 | `nunique()`: how many different values each column has | `Startup Name` and `Pitch Number` = 1,000 (IDs, not useful as inputs) |
| 9 | Checks for duplicate rows | `Duplicate rows: 0` |
| 10 | `describe()`: min, max, mean, median of every number column | Max ask 25,000,000 lakh 🚩, max gross margin 550% 🚩, start years 1920–2201 🚩 |
| 11 | Missing values: % blank per column + deal rate when EBITDA is blank | `64 out of 1000` rows survive `dropna()` · deal rate **40%** when EBITDA is blank vs **64%** when shared |
| 12 | Histograms of 6 number columns | 6 charts; Ask and Started-in look "broken" |
| 13 | Revenue: raw vs log, mean vs median | `Mean revenue: ₹658 lakh` · `Median revenue: ₹188 lakh` + 2 histograms |
| 14 | Count plots: industry, city, age group, season | 4 bar charts |
| 15 | Deal rate by industry | Bar chart; Medical/Health 67% and Fitness 65% on top, Green/CleanTech 27% at the bottom |
| 16 | Deal rate by yearly revenue | Bars climb **22% → 34% → 60% → 80%** |
| 17 | Correlation heatmap | Revenue ↔ deal = 0.40; Monthly Sales ↔ Revenue and Net Margin ↔ EBITDA are deep red |
| 18 | Leakage test: a "cheating" one-line rule | `Accuracy of this one-line rule: 100%` (that's leakage, not skill!) |
| 19 | Lists the 6 after-the-pitch columns we must never use | `Columns that fail the time-machine test: [...]` |
| 20 | Finds impossible numbers | `Impossible asks: 8 \| Margins above 100%: 6 \| Impossible years: [1920, 2091, 2109, 2201]` + 3 charts |

### Phase 3 · Cleaning

| Cell | What it does | What you should see |
|---|---|---|
| 21 | Fixes unit errors and impossible values on a copy called `clean` | `Broken asks left: 0 \| Margins > 100% left: 0 \| Max ask now: ₹ 500.0 lakh` · `Rows: 1000 → 1000` |
| 22 | Before vs after charts | 3 charts: all asks ≤ 500, no margins above 100, no time travellers |

### Phase 4 · Feature Engineering

| Cell | What it does | What you should see |
|---|---|---|
| 23 | Valuation maths for one example pitch | `₹50 lakh for 5% → company worth ₹10 Cr` · `they want 10× their yearly revenue` |
| 24 | The "greed wall": deal rate by valuation ÷ revenue | ≤5× → **85%** deals · >60× → **5%** |
| 25 | Profitable vs loss-making; gross-margin groups | Profitable **67%** vs loss-making **42%** |
| 26 | Do patents help? (deep-tech vs consumer brands) | Deep-tech: **51% → 74%** with a patent · consumer brands: no real change (57% vs 53%) |
| 27 | Deal rate by city (and why we don't trust it) | Vadodara 85% (13 pitches) vs Chandigarh 38% (8 pitches): too few pitches to trust |
| 28 | Twin columns | Both pairs: `correlation 0.92` |
| 29 | Builds the 13 model inputs (`X`) and the target (`y`) | `Features: 13 columns (from 32 raw columns) \| Rows: 1000` |

### Phase 5 · Train/Test Split

| Cell | What it does | What you should see |
|---|---|---|
| 30 | 80% to study, 20% sealed exam | `Train: 800 rows \| Deal rate 57.0%` · `Test: 200 rows \| Deal rate 57.0%` |

### Phase 6 · Preprocessing

| Cell | What it does | What you should see |
|---|---|---|
| 31 | Blanks per feature, and how different the scales are | e.g. `ebitda 223`, `gross_margin 173` blanks |
| 32 | Builds the preprocessor: fill blanks + scale numbers + one-hot industry | `Before preprocessing: 13 columns → after: 24 columns` · `Blanks left: 0` |
| 33 | Packs everything for Part 2 (saves `handoff_part1.joblib`) | `800 train / 200 test rows, 13 features` · baseline 57.0% |

### Part 2 · Train, evaluate, predict

| Cell | What it does | What you should see |
|---|---|---|
| 34 | Imports models + a picture of the 3 model types | 3 diagrams: Logistic Regression, Random Forest, Gradient Boosting |
| 35 | Trains Logistic Regression; deal probability for one practice pitch | `Practice-pitch deal probability: 84.7%` |
| 36 | 🎮 **Your turn:** change `threshold` and re-run | `Probability 84.7% \| threshold 50% \| verdict: Deal` (try 0.90!) |
| 37 | Compares 4 models with 5-fold cross-validation | `Selected on training-fold Deal F1: Logistic Regression` |
| 38 | Opens the sealed test set: scorecard for all models | Logistic Regression: **79.0% test accuracy** (vs 57.0% for "Always Deal") |
| 39 | Model ranking + confusion matrix | 101 deals caught, 13 missed, 29 false alarms, 57 correct "No deal" |
| 40 | Prepares the data for the pitch-desk dashboard | No output (that's normal) |
| 41 | Loads the dashboard layout and two reaction photos (a very long cell, so just run it) | No output (that's normal) |
| 42 | 🎮 Opens the pitch desk inside the notebook | `Live model: Logistic Regression \| 800 training pitches \| 200 test pitches` + the interactive desk. It also saves `simulated_pitch_dashboard.html`, the same desk as `site/index.html` |

---

## 🧠 What you'll learn

| Concept | Where |
|---|---|
| Features (inputs) vs target (answer) | Game, Cell 5 |
| Univariate analysis: one column at a time | Cells 12–14 |
| Bivariate analysis: a column vs the answer | Cells 15–17 |
| A blank can be a clue | Cell 11 |
| Data leakage: the answer sneaking into the inputs | Cells 18–19 |
| Errors vs real outliers; why we use a log | Cells 13, 20–22 |
| Feature engineering: thinking like a Shark | Cells 23–29 |
| Train/test split: the sealed exam | Cell 30 |
| Imputation, scaling, one-hot encoding | Cells 31–32 |
| Logistic Regression, Random Forest, Gradient Boosting | Cells 34–37 |
| Threshold, accuracy, F1, confusion matrix | Cells 36–39 |

---

## ✅ Student checklist

- [ ] I ran the notebook from Cell 1 to the last cell, in order.
- [ ] I can explain what the target `deal` means.
- [ ] I can explain why leakage columns must be excluded.
- [ ] I can explain why we fill missing values instead of deleting rows.
- [ ] I can explain at least one engineered feature.
- [ ] I can explain the purpose of the train/test split.
- [ ] I can explain what the probability threshold changes.
- [ ] I can read a confusion matrix and compare model metrics.

---

Made with ❤️ by the **Data Science Club** × **AWS Club**, KLE Tech.
