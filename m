Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D56606A7D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ecy9Ioau;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gO1DGLIT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p5DfdVn/AdFJR7mLtmlVcoQWNFblslFrL6J6esnTWlo=; b=ecy9Ioau+5BvCF
	+t/ViGG6NL/6CPTGsk8bXVtwabKIrpq+s/0SUTN+oWRprHK1cdlH24JW5rJg/fKLkEuRLzshR9kRG
	d+/GFBfl4LhLqgTNrnY6npqVSUgMjJvqLph2nPc4upg3P6V213t3roS51vXqcDGCF0E6e/fg8vEkc
	kCKMzpkyA3ftMllUSMa3LEqUnDzMKqEgjXWLopMVAwHcBIK7kR++DPHj9bnUttrB71YqlP7Yyhj/D
	c0j9jv+GKS5n6KthB8fcUgpM5MkzXxy0G+7naruBxPU0rqsJoFdYRAUhZibKW1J0Lqlpprz5ypsDN
	AaUsZgTv/DfWRcD/LLCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZG-00000009VXL-3KYq;
	Wed, 18 Nov 2026 16:31:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXp-00000009U4J-3z5k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48b001cd92bso728705f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019399; x=1795624199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5DfdVn/AdFJR7mLtmlVcoQWNFblslFrL6J6esnTWlo=;
        b=gO1DGLITGPn48ikOeDGRfJHhe+SLRY76bd2PJd81jVNfAqznCvaPqgbBTr6JjghBaq
         bMkru7wGO6EZLaYfdimYufeSJ9vYX4cwnXTnFBxT76H4EujtEaZfhtl7Nu9AWKgEswbJ
         OCkwajN98RTK/k0N4ndfaCKV7edHYKSioqZaHcKzOdkFPscSMftDAiKEbofDQY+1Zue0
         9shGj7RRRuyr0bVHVlt9AGzAu/xtVdx9u47naBAB1vx92jTrblJGwhMxDFgL5xW8b+qd
         DJsK5Fh7AmVf1igcitmNZ0HigvYS7tx+sFM+2XNHioEgKEmSwV4/j8xYqNmPgVpA16KA
         Fnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019399; x=1795624199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5DfdVn/AdFJR7mLtmlVcoQWNFblslFrL6J6esnTWlo=;
        b=YSu5mgwLfWNoiF+eC3E09U3ZrMO19hDYPop08W2CD5vwHNX6p5xCtT3pPEXDAG0OlI
         JuOlWFjEe6SxaKxlLLYcqZoLnmUWxecJsbPZVe1GTSYk1yK1hfdkUJXIAD1tgYIz14Us
         P/hXuTlgWGaDGGMkMDKeGJHqSHvw9cCkkj8QWhBAgRCZTPE/m6zlOYsMbL1eIdz7X0WL
         8mGwszkC2xU2bojJs8R67ys6EUCb3A/vs8BsoNPk76cQt4Yf+eI5PQq1FRT4pvyOyDH5
         8cqyHrQbz/6zbbidbfVIPuPOZfCR+bI7pRlT3X4qZlmUwsHFtWPxsJNCyWcJxcoDsfSc
         Trzw==
X-Forwarded-Encrypted: i=1; AL+hErEk66dV0pGmBYS6pXxAW21WfuY9HJPed4ppYOmxJEnfmAqCOMqbh0TKy6a5B+iiCUq5LhLAqM9qjljlomCjlPSD@lists.infradead.org
X-Gm-Message-State: APuU4Z9TR45aA5K9kiVIef7klVlDAMwUoRCZV02MeIDI46WAvU3fnA9F
	f7Msh93XkxnAE8t0y01ugw0sttjPnVhu0k0S5rulJ5mAynHPyHohJvCMTXRwujNtDFo=
X-Gm-Gg: AZFdTZeFoscI0QPCeDD4CZXViIBFB/PV3FltwFMCeYRoO0vuHcA9eDfDOdNzIgEmwE3
	wEq+CptW7QjMkAR5opPgLzL7UsFSPdIS/WfwumxSf+qUZ25lANN1wL74c2/PyEk9xY09T0Cc5ch
	pTgOihOXGtTsm5W5/igBzE1aj2hPF579gVqdnBFST3PVFMCTsz74RwFavS0eJoSGXcbwFjx6cls
	209bYZ0iEySfe3NS4QsLWLRbdIlH4q7qFECThqi3uJcwiz85xsvZm/eJ0XJLdNjrh3ErhEpxye6
	xtbex+O4eC8iHR/tzysCHCUxLHa49qf5udUcubJn3YBxcErcnYPi5jwGki3YknYQmdAkxij6CwG
	MwEYpPcIblk5gznQkqjFDHKQXf34NTiqt5rId/n51tdVyeVLJUfzIQahD5YJE/IWI1kSJ4Gte6B
	ugX2/KQ1sQKFpk997maoO6FzDxivzbaibFXcnsm98XYUXSk5p7QXKNM58kgXmfRRalshX7JnKkj
	j4kc1wY9MBGoA7qG4GfJ+yZjtNuuUTBD3ykpzIyIRnVdQUEWN12fnlh/TrQbAV9hAq2KdE6istv
	YmZ1N1OY/D8dgR+RW0ZCMrWXY5LMipul
X-Received: by 2002:a05:6000:46c5:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-4a63b50cdfamr4894691f8f.45.1795019399370;
        Wed, 18 Nov 2026 08:29:59 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:33 +0000
Subject: [PATCH 11/34] perf cs-etm: Track threads in timeless mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-11-dad4d90747f6@linaro.org>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_083002_099090_CF713DB1 
X-CRM114-Status: GOOD (  18.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Associating TIDs with PIDs is useful with and without timestamps. This
is an old assumption from when timeless == per-thread mode so remove it.

Update the comment to say exactly why this needs to be done and move it
to a single function so it's not repeated.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 53 +++++++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 11ebfdf1e933..67e3e2becd0f 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2984,23 +2984,22 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
 	return ret;
 }
 
-static int cs_etm__process_itrace_start(struct cs_etm_auxtrace *etm,
-					union perf_event *event)
+static int cs_etm__associate_tid(struct cs_etm_auxtrace *etm, pid_t pid,
+				 pid_t tid)
 {
 	struct thread *th;
 
-	if (etm->timeless_decoding)
-		return 0;
-
 	/*
-	 * Add the tid/pid to the log so that we can get a match when we get a
-	 * contextID from the decoder. Only track for the host: only kernel
-	 * trace is supported for guests which wouldn't need pids so this should
-	 * be fine.
+	 * TIDs share their maps with their PID, but the association between the
+	 * two is only tracked by Perf on COMM, FORK and SAMPLE records.
+	 * Trace doesn't generate normal samples, and COMM and FORK may be
+	 * missed when attaching so pass the relationship using other record
+	 * types.
+	 *
+	 * Only track for the host: only kernel trace is supported for guests
+	 * which wouldn't need pids so this should be fine.
 	 */
-	th = machine__findnew_thread(&etm->session->machines.host,
-				     event->itrace_start.pid,
-				     event->itrace_start.tid);
+	th = machine__findnew_thread(&etm->session->machines.host, pid, tid);
 	if (!th)
 		return -ENOMEM;
 
@@ -3009,19 +3008,18 @@ static int cs_etm__process_itrace_start(struct cs_etm_auxtrace *etm,
 	return 0;
 }
 
+static int cs_etm__process_itrace_start(struct cs_etm_auxtrace *etm,
+					union perf_event *event)
+{
+	return cs_etm__associate_tid(etm, event->itrace_start.pid,
+				     event->itrace_start.tid);
+}
+
 static int cs_etm__process_switch_cpu_wide(struct cs_etm_auxtrace *etm,
 					   union perf_event *event)
 {
-	struct thread *th;
 	bool out = event->header.misc & PERF_RECORD_MISC_SWITCH_OUT;
 
-	/*
-	 * Context switch in per-thread mode are irrelevant since perf
-	 * will start/stop tracing as the process is scheduled.
-	 */
-	if (etm->timeless_decoding)
-		return 0;
-
 	/*
 	 * SWITCH_IN events carry the next process to be switched out while
 	 * SWITCH_OUT events carry the process to be switched in.  As such
@@ -3030,21 +3028,8 @@ static int cs_etm__process_switch_cpu_wide(struct cs_etm_auxtrace *etm,
 	if (!out)
 		return 0;
 
-	/*
-	 * Add the tid/pid to the log so that we can get a match when we get a
-	 * contextID from the decoder. Only track for the host: only kernel
-	 * trace is supported for guests which wouldn't need pids so this should
-	 * be fine.
-	 */
-	th = machine__findnew_thread(&etm->session->machines.host,
-				     event->context_switch.next_prev_pid,
+	return cs_etm__associate_tid(etm, event->context_switch.next_prev_pid,
 				     event->context_switch.next_prev_tid);
-	if (!th)
-		return -ENOMEM;
-
-	thread__put(th);
-
-	return 0;
 }
 
 static int cs_etm__process_event(struct perf_session *session,

-- 
2.43.0


