const questionTemplate = {
  0: {
    'sectionName': 'General Information',
    'questions': {
      0: {
        'question': 'what is your age Range?',
        'options': ['15-20', '21-30', '31-40', '41-50', '51+'],
      },
      1: {
        'question': 'what is your height Range?',
        'options': ['<5ft', '5ft-5.5ft', '5.5ft-6ft', '6ft+'],
      },
      2: {
        'question': 'what is your blood group?',
        'options': ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'],
      },
      3: {
        'question':'Menstrual Cycle interval in months?',
        'options': ['1', '2', 'more than 2'],
      }
    }
  },
  1: {
    'sectionName': 'Mental Health & Emotional Well-being',
    'questions': {
      0: {
        'question': 'Do you often feel stressed, anxious, or down?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'I rarely feel stressed, anxious, or down.',
        'options': ['Agree', 'Disagree'],
      },
      2: {
        'question': 'I generally feel calm and relaxed.',
        'options': ['Agree', 'Disagree'],
      },
      3: {
        'question':'Do you experience mood swings or irritability frequently?',
        'options': ['Yes', 'No'],
      },
      4: {
        'question':'Do you have trouble focusing or experience brain fog?',
        'options': ['Yes', 'No'],
      },
    }
  },
  2: {
    'sectionName': 'Sleep Quality',
    'questions': {
      0: {
        'question': 'Do you have difficulty falling asleep or staying asleep?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'Do you feel well-rested after sleep?',
        'options': ['Yes', 'No'],
      },
      2: {
        'question': 'How often do you experience daytime fatigue?',
        'options': ['Rarely','Sometimes','Often','Always'],
      },
    }
  },
  3: {
    'sectionName': 'Quality of Life',
    'questions': {
      0: {
        'question': 'Do PCOS symptoms impact your daily life?',
        'options': ['Mildly', 'Moderately', 'Significantly'],
      },
      1: {
        'question': 'Do you avoid social situations due to PCOS-related issues?',
        'options': ['Yes', 'No'],
      },
      2: {
        'question': 'How often do you feel self-conscious about your body due to PCOS?',
        'options': ['Never', 'Rarely', 'Sometimes', 'Often'],
      },
    }
  },
  4: {
    'sectionName': 'Menstrual & Reproductive Health',
    'questions': {
      0: {
        'question': 'Do you experience irregular or absent menstrual cycles?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'Have you been diagnosed with polycystic ovaries via ultrasound?',
        'options': ['Yes', 'No'],
      },
      2: {
        'question': 'Do you experience severe menstrual pain?',
        'options': ['Mild', 'Moderate', 'Severe'],
      },
      3: {
        'question': 'Have you ever undergone hormonal blood tests (testosterone, LH/FSH ratio)?',
        'options': ['Yes', 'No'],
      },
    }
  },
  5: {
    'sectionName': 'Weight & Body Changes',
    'questions': {
      0: {
        'question': 'Do you gain weight easily, particularly around the waist?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'Do you have dark patches of skin (acanthosis nigricans) on your neck, armpits, or groin?',
        'options': ['Yes', 'No'],
      },
      2: {
        'question': 'Have you been diagnosed with insulin resistance or prediabetes?',
        'options': ['Yes', 'No'],
      },
    }
  },
  6: {
    'sectionName': 'Hair & Skin Changes',
    'questions': {
      0: {
        'question': 'Do you experience excessive facial or body hair growth (hirsutism)?',
        'options': ['None', 'Mild', 'Moderate', 'Severe'],
      },
      1: {
        'question': 'Do you suffer from severe acne that does not improve with skincare treatments?',
        'options': ['Yes', 'No'],
      },
      2: {
        'question': 'Have you noticed scalp hair thinning or hair loss (androgenic alopecia)?',
        'options': ['Yes', 'No'],
      },
    }
  },
  7: {
    'sectionName': 'Hormonal & Metabolic',
    'questions': {
      0: {
        'question': 'Do you experience frequent sugar cravings or energy crashes?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'Do you feel extreme fatigue even after a full night’s sleep?',
        'options': ['Yes', 'No'],
      },
      2: {
        'question': 'Have you been diagnosed with high cholesterol, high blood pressure, or heart disease?',
        'options': ['Yes', 'No'],
      },
      3: {
        'question': 'Have you undergone adrenal hormone testing (DHEA-S, cortisol levels)?',
        'options': ['Yes', 'No'],
      },
    }
  },
  8: {
    'sectionName': 'Family & Medical History',
    'questions': {
      0: {
        'question': 'Do any of your biological female relatives (mother, sister, aunt) have PCOS?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'Were you overweight or had metabolic issues from an early age?',
        'options': ['Yes', 'No'],
      },
      2: {
        'question': 'Have you taken birth control pills long-term, and did symptoms appear after stopping them?',
        'options': ['Yes', 'No'],
      },
    }
  },
  9: {
    'sectionName': 'Lifestyle & Stress Factors',
    'questions': {
      0: {
        'question': 'How often do you experience high stress levels or anxiety?',
        'options': ['Rarely', 'Sometimes', 'Often', 'Always'],
      },
      1: {
        'question': 'Do you have digestive issues such as bloating, IBS, or food sensitivities?',
        'options': ['Yes', 'No'],
      },
      2: {
        'question': 'How often do you engage in physical activity (exercise, walking, yoga)?',
        'options': ['Never', 'Rarely', 'Sometimes', 'Frequently'],
      },
    }
  },
  10: {
    'sectionName': 'Employment & Work Environment',
    'questions': {
      0: {
        'question': 'Does your work environment contribute to stress levels?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'Do you feel your work schedule allows for a healthy lifestyle (diet, exercise, and sleep)?',
        'options': ['Yes', 'No'],
      },
    }
  },
  11: {
    'sectionName': 'Relationships and Social Impact',
    'questions': {
      0: {
        'question': 'Do you feel comfortable discussing your PCOS symptoms with others?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'Has PCOS affected your relationships with family or friends?',
        'options': ['Yes', 'No'],
      },
    }
  },
  12: {
    'sectionName': 'Self-Perception and Adaptability',
    'questions': {
      0: {
        'question': 'Do you feel in control of your health despite having PCOS?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'Have you adapted lifestyle changes to manage PCOS symptoms effectively?',
        'options': ['Yes', 'No'],
      },
    }
  },
  13: {
    'sectionName': 'Treatment and Alternative Therapies',
    'questions': {
      0: {
        'question': 'Have you tried medical treatments for PCOS?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'Are you currently using any alternative therapies (herbal, acupuncture, etc.) for PCOS?',
        'options': ['Yes', 'No'],
      },
    }
  },
};