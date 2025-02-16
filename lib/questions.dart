// const questionTemplate = {
//     0:{
//       'sectionname': 'Mental Health',
//       'set' : {
//        0: {
//       'question': 'Do you often feel stressed, anxious, or down?',
//       'options': ['Always','Very Often', 'Sometimes', 'Never']
//       },
//       1: {
//       'question': 'I rarely feel stressed, anxious, or down.',
//       'options': ['Yes', 'No']
//       },
//       }
//     },
//     2: {
//       'question': 'I generally feel calm and relaxed.',
//       'options': ['Yes', 'No']
//     },
//     3: {
//       'question': 'I do not frequently experience anxiety, stress, or low mood. ',
//       'options': ['Yes', 'No']
//     },
//     4: {
//       'question': 'Do you frequently have trouble concentrating or feel mentally foggy? ',
//       'options': ['Yes', 'No']
//     },
//     5: {
//       'question': 'I rarely have trouble concentrating or feel mentally foggy.',
//       'options': ['Yes', 'No']
//     },
//     6: {
//       'question': 'I usually find it easy to concentrate.',
//       'options': ['Yes', 'No']
//     },
//     7: {
//       'question': 'I do not experience mental fogginess.',
//       'options': ['Yes', 'No']
//     },
//     8: {
//       'question': 'Do you often feel emotionally drained or notice mood swings before or during your period?',
//       'options': ['1 (Never)','2 (Rarely)', '3 (Sometimes)', '4 (Often)', '5 (Always)']
//     },
//     9: {
//       'question': 'I do not feel emotionally drained before or during my period.',
//       'options': ['Yes', 'No']
//     },
//     10: {
//       'question': 'I rarely experience mood swings related to my period.',
//       'options': ['Yes', 'No']
//     },
//     11: {
//       'question': 'I feel emotionally stable during my period.',
//       'options': ['Yes', 'No']
//     },
//     12: {
//       'question': 'Do you tend to eat more when you are stressed or emotionally upset? ',
//       'options': ['Yes', 'No']
//     },
//     13: {
//       'question': 'I do not eat more when I am stressed or emotionally upset.',
//       'options': ['Yes', 'No']
//     },
//     14: {
//       'question': 'I rarely increase my food intake during stress or emotional upset.',
//       'options': ['Yes', 'No']
//     },
//     15: {
//       'question': 'I usually maintain my regular eating habits, regardless of stress or emotions.',
//       'options': ['Yes', 'No']
//     },
//     16: {
//       'question': 'How would you rate the quality of your sleep on a scale of 1 to 10?',
//       'options': ['0-2', '2-4', '4-6', '6-8', '8-10']
//     },
//     17: {
//       'question': 'I often feel my sleep quality is poor.',
//       'options': ['Yes', 'No']
//     },
//     18: {
//       'question': 'I am generally unsatisfied with my sleep quality.', 
//       'options': ['Yes', 'No']
//     },
//     19: {
//       'question': 'I rarely feel well-rested after sleep.',
//       'options': ['Yes', 'No']
//     },
//     20: {
//       'question': 'I generally feel fresh after waking up.',
//       'options': ['Yes', 'No']
//     },
//     21: {
//       'question': 'I generally feel energetic and happy after waking up.',
//       'options': ['Yes', 'No']
//     },
//     22: {
//       'question': 'I rarely feel irritable after waking up.',
//       'options': ['Yes', 'No']
//     },
//     23: {
//       'question': 'Do you frequently have trouble falling asleep or staying asleep?',
//       'options': ['Yes', 'No']
//     },
//     24: {
//       'question': 'I generally fall asleep quickly and stay asleep through the night. ',
//       'options': ['Yes', 'No']
//     },
//     25: {
//       'question': 'I rarely have trouble with falling asleep or staying asleep. ',
//       'options': ['Yes', 'No']
//     },
//     26: {
//       'question': 'I do not experience insomnia or disrupted sleep.',
//       'options': ['Yes', 'No']
//     },
//     27: {
//       'question': 'How many times do I wake up in the middle of the night? ',
//       'options': ['Yes', 'No']
//     },
//   };


//   // 39: {
//   //   'question': 'I generally feel calm and relaxed.',
//   //   'options': [
//   //     '2-4 Hr Sleep',
//   //     '4-6 Hr Sleep',
//   //     '6-9 Hr Sleep',
//   //     'more then 9Hr Sleep'
//   //   ]
//   // },

const questionTemplate = {
  0: {
    'sectionName': 'Mental Health',
    'questions': {
      0: {
        'question': 'Do you often feel stressed, anxious, or down?',
        'options': ['Always', 'Very Often', 'Sometimes', 'Never'],
      },
      1: {
        'question': 'I rarely feel stressed, anxious, or down.',
        'options': ['Yes', 'No'],
      },
      2: {
        'question': 'I generally feel calm and relaxed.',
        'options': ['Yes', 'No'],
      },
      3: {
        'question':
            'I do not frequently experience anxiety, stress, or low mood.',
        'options': ['Yes', 'No'],
      },
    }
  },
  1: {
    'sectionName': 'Physical Health',
    'questions': {
      0: {
        'question': 'Do you exercise regularly?',
        'options': ['Yes', 'No'],
      },
      1: {
        'question': 'Do you experience fatigue often?',
        'options': ['Yes', 'No'],
      },
    }
  }
};
