List<List<String>> chunkQuestions(List<String> questions, int chunkSize) {
    List<List<String>> chunks = [];
    int totalQuestions = questions.length;
    int fullChunks = totalQuestions ~/ chunkSize;
    int remainingQuestions = totalQuestions % chunkSize;

    // Add full chunks
    for (int i = 0; i < fullChunks; i++) {
      chunks.add(questions.sublist(i * chunkSize, (i + 1) * chunkSize));
    }

    // Add remaining questions as a separate chunk if any
    if (remainingQuestions > 0) {
      chunks.add(questions.sublist(fullChunks * chunkSize));
    }

    return chunks;
  }