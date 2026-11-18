Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CE6606A7D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J2tBqv1I;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uDoTW5af
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9TvI/tcWqsDiAaR0SImg0w5hNJWOXoXa6vuM34fV/cU=; b=J2tBqv1I5j5yVm
	oeACPChW0vAZwh+W4srpkwJowk2XSq4l9zSscg3HIOsSKA2shhNkbcotY2FBDHQUx2gdxhaJjmTcB
	UyZLru5Qls4sEhccN72opQyGG5TvTfSXPoLyaAid9hMeSqgIBkUu2+KNbFG7ovsxAsINzAZ66I/w2
	s/mmGHRwLJd3VjjDEDD/lLegyaMJmwYWC4ne/d22TCu4me1yB2uvYwshRSo9+/fXCul3nSYiNkSTB
	SMybt1eVju+m+kulZZkFW8p3UCy4IKOKUkteR2G7RVFb9RwXpTXi9EPRHo0YJbnUT1PUgXlgU+R/b
	Ge6n1IwadPlOxhPKiKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYr-00000009V0E-2lfs;
	Wed, 18 Nov 2026 16:31:05 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXp-00000009U3j-08Sk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb61185057so10022015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019398; x=1795624198; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TvI/tcWqsDiAaR0SImg0w5hNJWOXoXa6vuM34fV/cU=;
        b=uDoTW5afmfHhxkxzcHMgMYvHrcvYSHeuI27K97GpjSjQ/ocqYyEy86/fXdedRlKu+0
         RJ88ZttLGXU46kJlte1hWfieyjXjNdQWbCQvH1UBmijm/4wnC7g7zGY8pbiM+ltYkfdz
         DcbbVTFHzxx0cL49hMUruUtPa68ui1bnxdVucm1PPToIJGP+qJ6H0mAc6+QvJPfi6DJK
         DzLmj4H8Z1WONd1LiEbpf3UU+WR3zO3imJci+PorTQ3JnTD9Ja8BkeOMPjCRpvSXjZpl
         2ffCtCMGbUbuR0PD1wO7j1t5G57H8Ss1xJ9nRkStNHPGQA8z4uLL6y3NYM+0t1lB4vqt
         RL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019398; x=1795624198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TvI/tcWqsDiAaR0SImg0w5hNJWOXoXa6vuM34fV/cU=;
        b=WKYlUj1YZJ48QCJnFhwnj8vnaCAwXDDGESZXz5ZbfmXMhVqF0K2YJAFiaLOHe8Rkl7
         0XeZLfcxzuEUPZMKQU8BIpFTUb7JrNRffmDqEr7Q8oSKeEtx+lCFtECE/d8q07+cg3b3
         YDyDCq189mfm0mn6viM3MlF2ka2hIIoK5YuC6r/Vy4XqRPInyfCMdeL+nwz3QZdNaoSm
         rtrdDlllG3lfzdWTjECUc2FxnNRJre6eJfeKFpO8jEGstw8+fAFMMkQbYkKkPJUrjXYI
         khalFytXkmV/HyCifloczpreQJA4LJpZFSGIMaDBullnCBywZVVZuExB5ZGL81mfhxtk
         VLaw==
X-Forwarded-Encrypted: i=1; AL+hErFnu9n/ZDsWq6n+N414q7EUVJr7Bva1UyJbyLoQZP9sldLLtT0oTS5mkfT2hOmHzmaN4NIHXR2zBZroimF3mI0Q@lists.infradead.org
X-Gm-Message-State: APuU4Z+OKjoNg+NRqVFWlagiQgQlPAr/b4LHXRI83Ln7inZ1ID6ZQ2mJ
	O4fTkqwOWvHGr/IEKPPUGsV5T1QYCRBM6okx3i6A8QGXJTbsMSfTvi0qSVPUYMYugsg=
X-Gm-Gg: AYBFou0XokCmkMELNSk/QK0o40is94VkmkBqgWXDefaCObRUEK8AkYjjf25YdAlPXUg
	qDGE7KwbHNK7fyRdGlRBmp6hdbkKOHG7zsqq7tWYfBu+WdLCEDvT3yirM33N6zSFQlAhcZzJ2Bw
	1lwmTtYU/YFYor69ZRWLcgx3hVG7Q3TaqyArwpxbK/AVqHrqV7czEhMEp8LZkdtE0ugJ+XMrhaf
	N64cRhS+B3P1L607+JPPQuCL7NzIcZGmTp1Bnocal8ciMDvH4xE0G6OJA/mkZ8cj46W5O6mICU8
	Be+IHDsvxOIdRaOXXSuI4bxoc9/+mCT2papzP6MbsMuTAjyiLvgq/O5b+LjNPjlHS7zYZMLRBTa
	WhBUBfRX6oo1edjGFcCAd9IMkULX1dUh6ErAc8XLLVJb8XFKaawS7Y3bKdAElh8qwJamd1cPMWE
	9YFUS5EcDYSVpMN3RbMOzZqRPGSieSbCpL+f+rJN5RHTbJdERujZ6KTOTkB3LjuPQ4Bo5nn0nU3
	vI7NuDliLunx0TVYEblqDpjcFP6WmDJXPXPrEmYXagEgOREXZ3sQ8gXgRDSxX50hW0dBQ+BLbh5
	jzWutJqZxeiYjH0+hVxzL0FkFRmOEuqY
X-Received: by 2002:a05:600c:8b8a:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb7da2240amr67857325e9.6.1795019398311;
        Wed, 18 Nov 2026 08:29:58 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:57 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:32 +0000
Subject: [PATCH 10/34] perf cs-etm: Remove old pipe mode support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-10-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083001_124988_68EF1AD8 
X-CRM114-Status: GOOD (  18.33  )
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

Pipe mode hasn't been supported since we added several peeks to
cs_etm__process_auxtrace_info_full() that require random access. Even if
it was supported, we would have to buffer the whole file anyway to make
fully ordered decoding work. You don't know if one core stopped tracing
for good or whether to wait till very end of the file for the next one.
IntelPT has the same issue, see 'perf-intel-pt.txt#Pipe mode'.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 38 +++-----------------------------------
 1 file changed, 3 insertions(+), 35 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index fb4582dc378e..11ebfdf1e933 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -66,7 +66,6 @@ struct cs_etm_auxtrace {
 	 */
 	bool per_thread_decoding;
 	bool snapshot_mode;
-	bool data_queued;
 	bool has_virtual_ts; /* Virtual/Kernel timestamps in the trace. */
 	bool use_thread_stack;
 	bool use_callchain;
@@ -3126,33 +3125,7 @@ static int cs_etm__process_auxtrace_event(struct perf_session *session,
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
-	if (!etm->data_queued) {
-		struct auxtrace_buffer *buffer;
-		off_t  data_offset;
-		int fd = perf_data__fd(session->data);
-		bool is_pipe = perf_data__is_pipe(session->data);
-		int err;
-		int idx = event->auxtrace.idx;
-
-		if (is_pipe)
-			data_offset = 0;
-		else {
-			data_offset = lseek(fd, 0, SEEK_CUR);
-			if (data_offset == -1)
-				return -errno;
-		}
-
-		err = auxtrace_queues__add_event(&etm->queues, session,
-						 event, data_offset, &buffer);
-		if (err)
-			return err;
-
-		if (dump_trace)
-			if (auxtrace_buffer__get_data(buffer, fd)) {
-				cs_etm__dump_event(etm->queues.queue_array[idx].priv, buffer);
-				auxtrace_buffer__put_data(buffer);
-			}
-	} else if (dump_trace)
+	if (dump_trace)
 		dump_queued_data(etm, &event->auxtrace);
 
 	return 0;
@@ -3454,12 +3427,8 @@ static int cs_etm__queue_aux_records(struct perf_session *session)
 						 cs_etm__queue_aux_records_cb, NULL);
 
 	/*
-	 * We would get here if there are no entries in the index (either no auxtrace
-	 * buffers or no index at all). Fail silently as there is the possibility of
-	 * queueing them in cs_etm__process_auxtrace_event() if etm->data_queued is still
-	 * false.
-	 *
-	 * In that scenario, buffers will not be split by AUX records.
+	 * No entries in the index (either no auxtrace buffers or no index at
+	 * all).
 	 */
 	return 0;
 }
@@ -3867,7 +3836,6 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	if (err)
 		goto err_free_queues;
 
-	etm->data_queued = etm->queues.populated;
 	return 0;
 
 err_free_queues:

-- 
2.43.0


