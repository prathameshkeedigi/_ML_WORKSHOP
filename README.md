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
| `deal_ya_doglapan_full_pipeline.ipynb` | The workshop notebook: 43 numbered code cells, with all results already saved |
| `Shark_tank/shark_tank_simulated.csv` | The dataset: 1,000 pitches × 32 columns |
| `site/index.html` | 🎮 The interactive **pitch desk**: open it in any browser, no setup needed |
| `setup_workshop.bat` | One-click setup for Windows |
| `README.md` | This guide |

---

## 🎮 Just want to play? Open the pitch desk

Double-click **`site/index.html`**. It opens in your browser, works offline, and needs no Python. Enter a pitch (industry, ask, equity, revenue…), submit it, and click the photo to see whether our trained model says **Deal** or **Doglapan**.

---

## 🚀 Setup: everything happens inside VS Code

You need **Git** and **VS Code**. Do the setup **before the workshop, with internet**: it downloads the libraries (about 5 minutes).

Pick your laptop: [🪟 Windows](#-windows) · [🍎 macOS](#-macos) · [🐧 Linux](#-linux). Then everyone does [Step 3: open the notebook](#step-3-open-the-notebook-and-pick-the-venv-kernel).

> 🔁 **Already did the setup before?** Run it again (Step 2). It adds the new **data-profiling** library used in Cell 23.

## 🪟 Windows

### Step 1: Clone the repo and open it in VS Code

Open **Command Prompt** and run:

```cmd
cd Desktop
git clone https://github.com/prathameshkeedigi/_ML_WORKSHOP.git
cd _ML_WORKSHOP
code .
```

VS Code opens with the `_ML_WORKSHOP` folder. You can close Command Prompt now. **From here on, stay in VS Code.**

> If `code .` says *'code' is not recognized*: open VS Code yourself, then **File → Open Folder…** and pick `Desktop\_ML_WORKSHOP`.

### Step 2: Run the setup in VS Code's terminal

In VS Code, open the terminal: **Terminal → New Terminal** (or press **Ctrl + `**). Run:

```powershell
.\setup_workshop.bat
```

> Type the `.\` at the start. VS Code's terminal is PowerShell, and PowerShell needs it.

The setup takes a few minutes. It:
- finds 64-bit Python 3.11–3.13 (and installs Python 3.13 with `winget` if you have none),
- creates a private Python environment in a `.venv` folder inside the workshop folder,
- installs numpy, pandas, matplotlib, scikit-learn, the Jupyter kernel, ipywidgets and **fg-data-profiling** (for the automatic EDA report),
- adds the **Python** and **Jupyter** extensions to VS Code,
- checks that everything works.

✅ Wait until it prints **`WORKSHOP READY - notebook found and kernel verified.`**, then press any key.
❌ If it ends with **`Workshop setup or launch did not finish`**, show us the message above that line.

> Some yellow/red lines that say `WARNING` or `RuntimeWarning` (about "TCP" or "Proactor event loop") are normal. Ignore them.

Now go to [Step 3](#step-3-open-the-notebook-and-pick-the-venv-kernel).

## 🍎 macOS

### Step 1: Python, then clone and open in VS Code

Open **Terminal** and check your Python:

```bash
python3 --version
```

You need **Python 3.11, 3.12 or 3.13**. If you get something else (or "command not found"), install Python 3.13 from [python.org/downloads](https://www.python.org/downloads/) (or with Homebrew: `brew install python@3.13`), then close and reopen Terminal.

```bash
cd ~/Desktop
git clone https://github.com/prathameshkeedigi/_ML_WORKSHOP.git
cd _ML_WORKSHOP
code .
```

> If `code .` says *command not found*: open VS Code, press **Cmd + Shift + P**, run **Shell Command: Install 'code' command in PATH**, then try again. (Or use **File → Open Folder…** and pick `Desktop/_ML_WORKSHOP`.)

### Step 2: Run the setup in VS Code's terminal

In VS Code: **Terminal → New Terminal** (or **Ctrl + `**). Paste these lines one by one:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install "numpy>=1.26,<3" "pandas>=2.2,<4" "matplotlib>=3.8,<4" "scikit-learn>=1.4,<2" "ipykernel>=6,<8" "ipywidgets>=8,<9" "fg-data-profiling>=4.19,<5"
code --install-extension ms-python.python
code --install-extension ms-toolsai.jupyter
python -c "import numpy, pandas, sklearn, matplotlib, ipykernel, ipywidgets; from data_profiling import ProfileReport; print('WORKSHOP READY')"
```

> If `python3 --version` showed 3.13 but you have several Pythons, use `python3.13 -m venv .venv` in the first line.

✅ The last line must print **`WORKSHOP READY`**. Now go to [Step 3](#step-3-open-the-notebook-and-pick-the-venv-kernel).

## 🐧 Linux

### Step 1: Python, then clone and open in VS Code

Install Python, `venv` and Git (Ubuntu / Debian):

```bash
sudo apt update
sudo apt install -y python3 python3-venv python3-pip git
python3 --version
```

(Fedora: `sudo dnf install -y python3 python3-pip git`.) You need **Python 3.11, 3.12 or 3.13**.

```bash
cd ~/Desktop        # or any folder you like
git clone https://github.com/prathameshkeedigi/_ML_WORKSHOP.git
cd _ML_WORKSHOP
code .
```

> No VS Code yet? Install it from [code.visualstudio.com](https://code.visualstudio.com/) (the `.deb` or `.rpm` package), then run `code .` again.

### Step 2: Run the setup in VS Code's terminal

In VS Code: **Terminal → New Terminal** (or **Ctrl + `**). Run the **same lines as macOS**:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install "numpy>=1.26,<3" "pandas>=2.2,<4" "matplotlib>=3.8,<4" "scikit-learn>=1.4,<2" "ipykernel>=6,<8" "ipywidgets>=8,<9" "fg-data-profiling>=4.19,<5"
code --install-extension ms-python.python
code --install-extension ms-toolsai.jupyter
python -c "import numpy, pandas, sklearn, matplotlib, ipykernel, ipywidgets; from data_profiling import ProfileReport; print('WORKSHOP READY')"
```

✅ The last line must print **`WORKSHOP READY`**.

## Step 3: Open the notebook and pick the `.venv` kernel

*(Same for Windows, macOS and Linux.)*

1. In VS Code's file list on the left, click **`deal_ya_doglapan_full_pipeline.ipynb`** (the one in the main folder).
2. Click **Select Kernel** (top right of the notebook) → **Python Environments…** → choose **`.venv`**. Its path ends in `.venv\Scripts\python.exe` on Windows, `.venv/bin/python` on macOS/Linux.
3. Click into **Cell 1** and press **Shift + Enter**. You should see `Rows (pitches): 1000   Columns: 32`. 🎉

> If **Select Kernel** doesn't offer Python environments, the extensions were just installed: press **Ctrl + Shift + P** (Mac: **Cmd + Shift + P**) → **Developer: Reload Window** and try again.

You're ready. During the workshop, just open VS Code → `_ML_WORKSHOP` → the notebook, and run the cells one by one with **Shift + Enter**.

### ✅ Golden rules

- **Always open `deal_ya_doglapan_full_pipeline.ipynb` from the main `_ML_WORKSHOP` folder.** Never open the copy inside the hidden **`.ipynb_checkpoints`** folder: that's Jupyter's auto-backup, and running it gives `FileNotFoundError: Shark_tank/shark_tank_simulated.csv`.
- **The kernel must be `.venv`.** If you get `ModuleNotFoundError: No module named 'sklearn'` (or pandas), you picked the wrong kernel: redo Step 3.2.
- **`ModuleNotFoundError: No module named 'data_profiling'`** in Cell 23 means your setup is from before the report was added: run Step 2 again.
- **Run the cells in order, top to bottom.** Later cells use variables made by earlier ones.
- If you get `NameError: name '…' is not defined`, you skipped a cell. Go back and run the cells above it.
- If things get weird: click **Restart** at the top of the notebook, then **Run All**.

---

## 🗺️ The ML pipeline (today's journey)

| Step | What happens | Cells | Presented by |
|---|---|---|---|
| 0 · Kickoff + game | What is ML? You play the Shark | 1–3 | Part 1 |
| 1 · Problem | What exactly is a *Deal*? | 4–5 | Part 1 |
| 2 · EDA | Study every column like a detective 🕵️ | 6–20 | Part 1 |
| 3 · Cleaning | Fix what's broken | 21–22 | Part 1 |
| ⭐ Bonus | 🤖 The automatic EDA report (data profiling) | 23 | Part 1 |
| 4 · Feature Engineering | Turn Shark thinking into columns | 24–30 | Part 1 (second speaker) |
| 5 · Train/Test Split | Lock away a sealed exam | 31 | Part 1 (second speaker) |
| 6 · Preprocessing | Make the data machine-ready | 32–34 | Part 1 (second speaker) |
| 7 · Train | Logistic Regression, Random Forest, Gradient Boosting | 35–38 | Part 2 |
| 8 · Evaluate | Open the sealed test set, read the confusion matrix | 39–40 | Part 2 |
| 9 · Dashboard | Try your own pitch | 41–43 | Part 2 |

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

### ⭐ Bonus · The automatic EDA report

| Cell | What it does | What you should see |
|---|---|---|
| 23 | 🤖 Generates a complete EDA report with **data profiling** (takes ~30 seconds) | A progress bar, then an interactive report below the cell: **Overview, Alerts, Variables, Interactions, Correlations, Missing values, Sample**. Also saved as `eda_report.html` (open it in any browser) |

### Phase 4 · Feature Engineering

| Cell | What it does | What you should see |
|---|---|---|
| 24 | Valuation maths for one example pitch | `₹50 lakh for 5% → company worth ₹10 Cr` · `they want 10× their yearly revenue` |
| 25 | The "greed wall": deal rate by valuation ÷ revenue | ≤5× → **85%** deals · >60× → **5%** |
| 26 | Profitable vs loss-making; gross-margin groups | Profitable **67%** vs loss-making **42%** |
| 27 | Do patents help? (deep-tech vs consumer brands) | Deep-tech: **51% → 74%** with a patent · consumer brands: no real change (57% vs 53%) |
| 28 | Deal rate by city (and why we don't trust it) | Vadodara 85% (13 pitches) vs Chandigarh 38% (8 pitches): too few pitches to trust |
| 29 | Twin columns | Both pairs: `correlation 0.92` |
| 30 | Builds the 13 model inputs (`X`) and the target (`y`) | `Features: 13 columns (from 32 raw columns) \| Rows: 1000` |

### Phase 5 · Train/Test Split

| Cell | What it does | What you should see |
|---|---|---|
| 31 | 80% to study, 20% sealed exam | `Train: 800 rows \| Deal rate 57.0%` · `Test: 200 rows \| Deal rate 57.0%` |

### Phase 6 · Preprocessing

| Cell | What it does | What you should see |
|---|---|---|
| 32 | Blanks per feature, and how different the scales are | e.g. `ebitda 223`, `gross_margin 173` blanks |
| 33 | Builds the preprocessor: fill blanks + scale numbers + one-hot industry | `Before preprocessing: 13 columns → after: 24 columns` · `Blanks left: 0` |
| 34 | Packs everything for Part 2 (saves `handoff_part1.joblib`) | `800 train / 200 test rows, 13 features` · baseline 57.0% |

### Part 2 · Train, evaluate, predict

| Cell | What it does | What you should see |
|---|---|---|
| 35 | Imports models + a picture of the 3 model types | 3 diagrams: Logistic Regression, Random Forest, Gradient Boosting |
| 36 | Trains Logistic Regression; deal probability for one practice pitch | `Practice-pitch deal probability: 84.7%` |
| 37 | 🎮 **Your turn:** change `threshold` and re-run | `Probability 84.7% \| threshold 50% \| verdict: Deal` (try 0.90!) |
| 38 | Compares 4 models with 5-fold cross-validation | `Selected on training-fold Deal F1: Logistic Regression` |
| 39 | Opens the sealed test set: scorecard for all models | Logistic Regression: **79.0% test accuracy** (vs 57.0% for "Always Deal") |
| 40 | Model ranking + confusion matrix | 101 deals caught, 13 missed, 29 false alarms, 57 correct "No deal" |
| 41 | Prepares the data for the pitch-desk dashboard | No output (that's normal) |
| 42 | Loads the dashboard layout and two reaction photos (a very long cell, so just run it) | No output (that's normal) |
| 43 | 🎮 Opens the pitch desk inside the notebook | `Live model: Logistic Regression \| 800 training pitches \| 200 test pitches` + the interactive desk. It also saves `simulated_pitch_dashboard.html`, the same desk as `site/index.html` |

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
| Automatic EDA report (data profiling) | Cell 23 |
| Feature engineering: thinking like a Shark | Cells 24–30 |
| Train/test split: the sealed exam | Cell 31 |
| Imputation, scaling, one-hot encoding | Cells 32–33 |
| Logistic Regression, Random Forest, Gradient Boosting | Cells 35–38 |
| Threshold, accuracy, F1, confusion matrix | Cells 37–40 |

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
