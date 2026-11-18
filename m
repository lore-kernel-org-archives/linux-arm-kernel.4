Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C19B606A7D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=isS+3XgV;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=d9orMSjY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yCjoTJR6LdbvR/cwt8ZPonwz8Vxbe4mw4fGpbe7vuDc=; b=isS+3XgVH1FJOF
	RYp1o8+0rGGlS9nVUJ2wocL1RAl0VtTSjFeJkGJdUlrhH/VeoayYAymsMXe8ntLNeEMlJT/T1E5ho
	UTeUJJST/3tH0KJZbHqffpC5hZbDc52Kg25bSHvBA9oWFG7Esoi+WZLD9SmBRb6l5HvgXmNPkjJ5P
	tH1k1QX1U4AJPhz77th506fTyiQrtDgRzlXft9wCynQ60qE7la+sAoD5iwZUmFTAMO7oj6jYagvqr
	7JA/j3Xb1NF2jkMYL2cZxXGTrF+jHWjNQuC4gtKSq/Pj6srBnuFxiT4QBIwLiZO6KVIld/gdPQyds
	lLE8f6uhvG/TBBWphcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYs-00000009V1h-0kcs;
	Wed, 18 Nov 2026 16:31:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXy-00000009UIB-1g2W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so9999765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019408; x=1795624208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCjoTJR6LdbvR/cwt8ZPonwz8Vxbe4mw4fGpbe7vuDc=;
        b=d9orMSjYUufXP0/JUGeCY0KbwupLF4rQJirAJmDmELQAaTvz2vCVno39umGRSY9aTF
         6qX8m2yOIojWl7OVAAf3aiMkymgeoKpbTabk7bF5O050ccBgGOCzw1Pmu5erERaHXWqO
         Hld/V3zJwWXPm5jwZFZFDS/uWmFtCRTOChemKVTGnI3opwLhFaUAiDS/1gl01nr7MrLD
         7TJkfErYxFBxdskVh7HGq30HKTbfRlxHlR0aa2RKaKZkQkz3Egst4V6mQwii8cJ/l6Gf
         5P9SjLtnjFqytpbXzhVcWHlr7fEd8frwKsoFowjy/RCPX2W49Q96xivR9gPfgFf+8cgN
         9r1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019408; x=1795624208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCjoTJR6LdbvR/cwt8ZPonwz8Vxbe4mw4fGpbe7vuDc=;
        b=xRjLMw8+D8EdieCvnOAzCW4McFM8JyWQN3dIet5Ywu3V3q+tXRJ4Aw0pQ/D1bgNdGY
         qB9/LjFS1yVgDnJMr5cYpzcGgQH7AAvcbdOblgUsRSZNtb25sqw6eR7ZsEN/hzUewpq/
         KfPWzCPFEChfCLBmV5buknARmnPMMsu5FdJcqdkLXO3jIceKKfHU6vUizdrL7zK1qTZ/
         cuQbg32cOJCqFeDTuuPe2v0Uy9ra21N/BoBOknZ2JnkRCRJPIXQGsce9shApU5uO7u+l
         qpKKQXxYxqIaYm3kJILo3UrMSeJqvTaASfCUNV/wABAZcVBIHPpfrkrv2RWUFqQkdap0
         V2DA==
X-Forwarded-Encrypted: i=1; AL+hErGZd0ZnrrtHKWMC+N1PGBvNqzWjkKVsupyc5HBQjQ2b9312BiNjf0kbIe3EOE7DZa5hZMiwwJlKPVrD3Pa6LTpN@lists.infradead.org
X-Gm-Message-State: APuU4Z/3PlTQmGipBeiHewyoJd+LQNla8tWbyivcyhPAChPK7nsPAg6E
	fdg+j/ABSIeSbtDWbJCtX3Q2GL/eSUmd0RMkI2wTcyKIqpby+DVxUfrRfzffeyQUyK0=
X-Gm-Gg: AYBFou2AfxrCOj55wXcWK/w/tXzdDbC0MO8mT+R6GbgXOzqQP2HAxANKNLzrZJ3vwlE
	caLu0w1F3kEUgUV8bytQ+PuXxP0VC3/bIvpGybAbLECIOwXsaw3rbJC550hqdZt0lDXiYCX8FUa
	7zJz7vUiy+kq0RtmkM98tuMl3BugedX9H17pcBkdIfP7aFwcCATvKTNK15YjkL3IR2D2kSJBBrJ
	H+TVQ3vV30sfdgI+cexQ++IYczRsdGCOfhDspt1osqMpF7R5lNwYPQgj+hrpNla6Z7oD++2kOrt
	c85z4/0J6CE4qSqiHEDufQQ8uj+V1S8WYo6JVDciH/C8P28YXOGaVpB5z1xJbZr2+igS8Pjd95h
	tpvT3t+hUzmEndcHXGvK0FnE0/nJI9gMVYpZLdUEd1SLVVtfSrDzQgO3l6dOxppjOA5Uyyn+MDX
	dDN2aZxO0gBASYFNustgsY0pcERgBZLdE+LzWOkdJo0nUiL0XP1KpyugWj+qgoDkIFBpfp0F1C7
	Xcg2w4TIjegc8wBOjNN8svz7eFrIZ3+yFCJ383w5ePQHdaQpO7uRRvsr04iA0c+JDPvo83stgqh
	ma+Fl59HTuC42Z5pqZ7474SMN1lJwP3+
X-Received: by 2002:a05:600c:34cb:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb7da4c5d3mr66218705e9.34.1795019407665;
        Wed, 18 Nov 2026 08:30:07 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:07 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:40 +0000
Subject: [PATCH 18/34] perf cs-etm: Don't special case per-thread mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-18-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083011_133663_AE8C5307 
X-CRM114-Status: GOOD (  22.27  )
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

This was always an extra edge case to have to understand, and keeping it
would require another new special case in the following change to add a
timestamp decoder tree per trace ID. Removing it makes both cases
simpler and nothing is really lost anyway. The only change needed is to
seed every trace ID context with the TID from the AUX record, rather
than only updating the single special context.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 34 ++++++++++++++--------------------
 tools/perf/util/cs-etm.h | 10 ----------
 2 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 5c98c7960f82..accd4ffc19aa 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -51,13 +51,6 @@ struct cs_etm_auxtrace {
 
 	/* Trace timestamps are available and not disabled by --itrace=Z. */
 	bool has_timestamps;
-
-	/*
-	 * Per-thread ignores the trace channel ID and instead assumes that
-	 * everything in a buffer comes from the same process regardless of
-	 * which CPU it ran on. It also implies no context IDs so the TID is
-	 * taken from the auxtrace buffer.
-	 */
 	bool per_thread_decoding;
 	bool snapshot_mode;
 	bool has_virtual_ts; /* Trace timestamps can be used as kernel time. */
@@ -717,14 +710,8 @@ static struct cs_etm_traceid_queue
 {
 	int idx;
 	struct int_node *inode;
-	struct intlist *traceid_queues_list;
+	struct intlist *traceid_queues_list = etmq->traceid_queues_list;
 	struct cs_etm_traceid_queue *tidq, **traceid_queues;
-	struct cs_etm_auxtrace *etm = etmq->etm;
-
-	if (etm->per_thread_decoding)
-		trace_chan_id = CS_ETM_PER_THREAD_TRACEID;
-
-	traceid_queues_list = etmq->traceid_queues_list;
 
 	/*
 	 * Check if the traceid_queue exist for this traceID by looking
@@ -2225,15 +2212,22 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 	/*
 	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
 	 * different threads. When the TID from the AUX record on a CPU changes,
-	 * re-initialize the thread using the AUX record/buffer fragment TID so
-	 * we can start decoding even if the context ID packet was cropped or
-	 * they're disabled.
+	 * re-initialize the thread for each trace ID using the AUX record/buffer
+	 * fragment TID so we can start decoding even if the context ID packet
+	 * was cropped or they're disabled.
 	 */
 	if (etm->per_thread_decoding) {
-		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
-							CS_ETM_PER_THREAD_TRACEID);
+		struct int_node *inode;
+
+		intlist__for_each_entry(inode, etmq->traceid_list) {
+			struct cs_etm_traceid_queue *tidq;
+
+			tidq = cs_etm__etmq_get_traceid_queue(etmq, inode->i);
+			if (!tidq)
+				return -ENOMEM;
+			if (thread__tid(tidq->decode_thread) == etmq->buffer->tid)
+				continue;
 
-		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
 			thread__zput(tidq->frontend_thread);
 			thread__zput(tidq->decode_thread);
 			tidq->frontend_thread = machine__findnew_thread(
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index 71b1ef321625..ffe3a33885a7 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -195,16 +195,6 @@ struct cs_etm_packet {
 
 #define CS_ETM_PACKET_MAX_BUFFER 1024
 
-/*
- * When working with per-thread scenarios the process under trace can
- * be scheduled on any CPU and as such, more than one traceID may be
- * associated with the same process.  Since a traceID of '0' is illegal
- * as per the CoreSight architecture, use that specific value to
- * identify the queue where all packets (with any traceID) are
- * aggregated.
- */
-#define CS_ETM_PER_THREAD_TRACEID 0
-
 struct cs_etm_packet_queue {
 	u32 packet_count;
 	u32 head;

-- 
2.43.0


