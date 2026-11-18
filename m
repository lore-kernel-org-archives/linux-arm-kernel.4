Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F3606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3FFFfJ+0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZPdj5WJ2;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=peol6Dtu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5F3MDxW068xRY6YYuN/9OnYsD6yF5GzetAMnICxwHKI=; b=3FFFfJ+0PQffGL
	iV9lNgfDu0UoHssaihRLPYO6dYA6RtGe/6G+LDXj+/qZUQOtt1ZPLKjSKYQwV+qXv1kl2A7ui0gP8
	7ifYZ/FNAJ8/96zBhvBRyygdjQfgL3fFJa1BEUIKRD1BVO7tYPmx9CK3wvMMg2T1x0jNKsAXdKpSo
	z+XET51zg0yU4DWCZoWDsYRbmWiSq5w87pl33N3YeRYvR9EviXLwhpDBzObqMqBuGIGx1VWbpCB2k
	xr1UbgMniVlZNAg/DR4XqCN/ijVC3S+wrjAtDssjWBZuKfg5UYUq/2wxApoNJhavt1UIUeBaoG5R8
	FrsSiywlvNgSvWDyl0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZL-00000009Vfn-0WDG;
	Wed, 18 Nov 2026 16:31:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYH-00000009Ueo-40H4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5F3MDxW068xRY6YYuN/9OnYsD6yF5GzetAMnICxwHKI=; b=ZPdj5WJ2Fqbl5S6sg4RR31xwxc
	S6tlSg0leVF3jf082gc4zip8fUXvG3bNQYieCxTUWoCMJa7DC2gQt2+tWZeQqlM0ehBGy91q0P8Ml
	LpB/jryV3GiJ7Jp6g2RkQkXgFV48v/fsqAfSKv+lKSv9Ln3+kmMN2AgJNRaOWUPH5hDqpCkUeWalv
	JYSCL//7EJpIUaJf70eOPMkQvGRSJ+eyN6ccxkCU5nPaCMVj0dMq2U4HguImZ/KLZ92xNhDvAX+Y3
	V8wAsdpmO1YaDhBD6wJvw2kA33q2Aw2Ej4WtZ5psOAEYaJflcrq4sztR8agyeUXdBQ8KJTy1ZZiAc
	8/MXojCQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiY5-0000000F9OQ-25JN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11590185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019414; x=1795624214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5F3MDxW068xRY6YYuN/9OnYsD6yF5GzetAMnICxwHKI=;
        b=peol6DtuhPmnYwLXilXLOKkkIIPwx+DtSaYl5YxkgwWIv3AWT25buH6hRTGrjnl6Yj
         +kjDc/oOae09jKHfjV/NWZjib0xkDzGoYObzQyKgVsJHu2HQ23Wpaai0RhtyLiMLNWVM
         Ns26MfRaNUYZM6EapsmphvIT33QFheRtQEc1bRkPBWV0SqWX+RoYADl1fnGgg1JtaFS3
         lMW2nO7mYdgvMPVLz21g5QuZMaHPgq+to+xlLRU4kVrZOSu42ygMzLwN/0n+/7QHcvQ5
         LtnDysHDG8C9Itbn7nffisBN9bu2T5uG88+hc110Ib4+/SLnV+VguOqk9sPWOvIoK7Me
         S15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019414; x=1795624214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5F3MDxW068xRY6YYuN/9OnYsD6yF5GzetAMnICxwHKI=;
        b=nvfwjsX9JClBloQa2QZp45VqIxCj5ZaICbLKbenbI6VbbafrebzqJ6Gw114tG0wvS0
         LKGJy+UHroJzNVCGDXBz0f+mlIgUOARfr4uBBFl+oExvN35Aqk+Ze8TcThavCYHzU7Jd
         URzI3O+Pn629SUBuFhlE93ADZ3YqslN0+HMetiCvPR+kKHloc2qhSbTa7WXNHKVxCJ00
         bADOuv3vbbA0YPXg6XV06ka0unnjZY5c+/xGZwmCjEPCnAcP4iq1dELelKkFIuaItZYi
         tDyW1yEHQIV6pBwIRx1jrOYZu9LgUus1xj5RBSzLBF7p0YfVxcCMbNojHjQSKY+58dPL
         vuOQ==
X-Forwarded-Encrypted: i=1; AL+hErGK7onqNV8H5n4pRs6adhSA0UX+NiZ6UCT5GF6XGEvsXoyOvr4Y4cRxHnNckL9IWG6FNtiSMalSWJhr6X3+0DrK@lists.infradead.org
X-Gm-Message-State: APuU4Z8r/HVth2FgotKX9DehjQSIo4TZ9ZCcppxyWd+jqLyJ23HQJT8n
	dxeEkBfUiejtocvMUDgF1N1H3Ch9eSw7bNnxuyjmLziW4p/bCr0rAWkWKq4/lyR0Ja0=
X-Gm-Gg: AYBFou1kkJAUYdp9JepZrz5uHliU/IxDzqI6Oy8wdS3YFv16X9twJHtTqE1qZRKnxxo
	4ZloaWpJG8mgEebj3UkjXwHtLnQ/unqd98vWgOZ5kWCJdti28TLL8Q/8H5TONPyFcoQJi8t7l9T
	Jscec+asGY/Ykg6AkidZgTKEcOfUBENm4dhatpwFsoSPvkUu8hHQELlG1HH8TpLbHF+TPUQHiU6
	V11bs28thmigda2GEdxDCN+IKMdtxe4QlYgKqG49PYP0j26zQZnDMthuaRuVxP6Y2SpRrjsUWmI
	Gqvx/ypvAZDMzClCJpgLs93C4s14zoPKWpxFySKRNrwWPGxnaE9DoEjcgARAq4ulDPOzfnBhglO
	k0PNgUQTUuHFDr7M78a5+q7kuEw8/cxAQUdQN5RN1ELlnlcJKLtbmKZ0wp89m5CLxitPJzjTvq5
	TEKuH8uMVCfgb0Jro5jAFE3Pql3WBosnyo81336Ekd3cc+1OI97lOkrX104L2Ik9rcjtU4HXI5l
	Ay6StAM6EZzVXJfUhlQBvvmz/Yy4aerbCdxDw4I/H/0WBF0RtZ5oPyRW6eul9TGgpmdYw763dZc
	pYhv29cptPNZIXvLGtKYfwwEJb2MgPN7
X-Received: by 2002:a05:600d:82c6:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb7da13982mr64688585e9.7.1795019414262;
        Wed, 18 Nov 2026 08:30:14 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:13 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:46 +0000
Subject: [PATCH 24/34] perf cs-etm: Share the thread ctxt between frontend
 and backend
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-24-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_163018_524854_960EFF56 
X-CRM114-Status: GOOD (  15.44  )
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

The decoder stops at every context packet and resumes only after the
frontend has processed it, so now we only need to keep track of a single
thread context.

The thread gets updated when the frontend processes a context packet.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  4 --
 tools/perf/util/cs-etm.c                        | 73 +++++++------------------
 tools/perf/util/cs-etm.h                        | 10 +---
 3 files changed, 22 insertions(+), 65 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 7a1d50ca5949..06c57326ac80 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -468,10 +468,6 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 		break;
 	}
 
-	if (cs_etm__etmq_update_decode_context(etmq, trace_chan_id,
-				elem->context.exception_level, tid))
-		return OCSD_RESP_FATAL_SYS_ERR;
-
 	ret = cs_etm_decoder__buffer_packet(etmq, tidc, elem,
 					    trace_chan_id, CS_ETM_CONTEXT);
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index e2e84561c0c9..97ed12d03555 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -604,11 +604,9 @@ static int cs_etm__init_traceid_ctxt(struct cs_etm_queue *etmq,
 	queue = &etmq->etm->queues.queue_array[etmq->queue_nr];
 	tidc->trace_chan_id = trace_chan_id;
 	tidc->decode_el = ocsd_EL_unknown;
-	tidc->frontend_thread = machine__findnew_thread(&etm->session->machines.host, -1,
+	tidc->thread = machine__findnew_thread(&etm->session->machines.host, -1,
 					       queue->tid);
-	tidc->decode_thread = machine__findnew_thread(&etm->session->machines.host, -1,
-					       queue->tid);
-	if (!tidc->frontend_thread || !tidc->decode_thread)
+	if (!tidc->thread)
 		goto out;
 
 	tidc->packet = zalloc(sizeof(struct cs_etm_packet));
@@ -652,8 +650,7 @@ static int cs_etm__init_traceid_ctxt(struct cs_etm_queue *etmq,
 	zfree(&tidc->prev_packet);
 	zfree(&tidc->packet);
 out:
-	thread__zput(tidc->frontend_thread);
-	thread__zput(tidc->decode_thread);
+	thread__zput(tidc->thread);
 	return rc;
 }
 
@@ -908,8 +905,7 @@ static void cs_etm__free_traceid_ctxts(struct cs_etm_queue *etmq)
 
 		/* Free this decode context from the array */
 		tidc = etmq->traceid_ctxts[idx];
-		thread__zput(tidc->frontend_thread);
-		thread__zput(tidc->decode_thread);
+		thread__zput(tidc->thread);
 		zfree(&tidc->event_buf);
 		zfree(&tidc->callchain);
 		zfree(&tidc->last_branch);
@@ -1168,7 +1164,7 @@ static u32 cs_etm__frontend_mem_access(struct cs_etm_queue *etmq,
 				       u64 address, size_t size, u8 *buffer)
 {
 	return __cs_etm__mem_access(etmq, address, size, buffer, 0, packet->el,
-				    tidc->frontend_thread);
+				    tidc->thread);
 }
 
 static u32 cs_etm__decoder_mem_access(struct cs_etm_queue *etmq, u8 trace_chan_id,
@@ -1183,7 +1179,7 @@ static u32 cs_etm__decoder_mem_access(struct cs_etm_queue *etmq, u8 trace_chan_i
 
 	return __cs_etm__mem_access(etmq, address, size, buffer,
 				    mem_space, tidc->decode_el,
-				    tidc->decode_thread);
+				    tidc->thread);
 }
 
 static struct cs_etm_queue *cs_etm__alloc_queue(void)
@@ -1472,30 +1468,6 @@ static int cs_etm__etmq_update_thread(struct cs_etm_queue *etmq,
 	return 0;
 }
 
-/*
- * Set the thread and EL of the decode context which is ahead in time of the
- * frontend context.
- */
-int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
-				       u8 trace_chan_id,
-				       ocsd_ex_level el, pid_t tid)
-{
-	struct cs_etm_traceid_ctxt *tidc;
-	int ret;
-
-	tidc = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
-	if (!tidc)
-		return -EINVAL;
-
-	ret = cs_etm__etmq_update_thread(etmq, el, tid,
-					 &tidc->decode_thread);
-	if (ret)
-		return ret;
-
-	tidc->decode_el = el;
-	return 0;
-}
-
 bool cs_etm__has_timestamps(struct cs_etm_queue *etmq)
 {
 	return etmq->etm->has_timestamps;
@@ -1590,13 +1562,13 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
 		size = cs_etm__instr_size(etmq, tidc, tidc->prev_packet, from);
 
 		/* Enable callchain so thread stack entry can be allocated */
-		thread_stack__event(tidc->frontend_thread, tidc->prev_packet->cpu,
+		thread_stack__event(tidc->thread, tidc->prev_packet->cpu,
 				    tidc->prev_packet->flags, from, to, size,
 				    etmq->buffer->buffer_nr + 1,
 				    etmq->etm->use_callchain,
 				    tidc->br_stack_sz, 0);
 	} else {
-		thread_stack__set_trace_nr(tidc->frontend_thread,
+		thread_stack__set_trace_nr(tidc->thread,
 					   tidc->prev_packet->cpu,
 					   etmq->buffer->buffer_nr + 1);
 	}
@@ -1607,14 +1579,14 @@ static void cs_etm__sample_branch_stack(struct cs_etm_auxtrace *etm,
 					struct perf_sample *sample)
 {
 	if (etm->synth_opts.last_branch) {
-		thread_stack__br_sample(tidc->frontend_thread, tidc->packet->cpu,
+		thread_stack__br_sample(tidc->thread, tidc->packet->cpu,
 					tidc->last_branch, tidc->br_stack_sz);
 		sample->branch_stack = tidc->last_branch;
 	}
 
 	if (etm->synth_opts.callchain) {
 		if (tidc->kernel_start)
-			thread_stack__sample(tidc->frontend_thread,
+			thread_stack__sample(tidc->thread,
 					     tidc->packet->cpu,
 					     tidc->callchain,
 					     etm->synth_opts.callchain_sz + 1,
@@ -1652,8 +1624,8 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
 	sample.time = cs_etm__resolve_sample_time(etmq, tidc);
 
 	sample.ip = addr;
-	sample.pid = thread__pid(tidc->frontend_thread);
-	sample.tid = thread__tid(tidc->frontend_thread);
+	sample.pid = thread__pid(tidc->thread);
+	sample.tid = thread__tid(tidc->thread);
 	sample.id = etmq->etm->instructions_id;
 	sample.stream_id = etmq->etm->instructions_id;
 	sample.period = period;
@@ -1748,8 +1720,8 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq,
 	sample.time = cs_etm__resolve_sample_time(etmq, tidc);
 
 	sample.ip = ip;
-	sample.pid = thread__pid(tidc->frontend_thread);
-	sample.tid = thread__tid(tidc->frontend_thread);
+	sample.pid = thread__pid(tidc->thread);
+	sample.tid = thread__tid(tidc->thread);
 	sample.addr = cs_etm__first_executed_instr(tidc->packet);
 	sample.id = etmq->etm->branches_id;
 	sample.stream_id = etmq->etm->branches_id;
@@ -1994,16 +1966,17 @@ static int cs_etm__context(struct cs_etm_queue *etmq,
 	}
 
 	tidc->kernel_start = machine__kernel_start(machine);
+	tidc->decode_el = el;
 
 	ret = cs_etm__etmq_update_thread(etmq, el, tidc->packet->tid,
-					 &tidc->frontend_thread);
+					 &tidc->thread);
 	if (ret)
 		goto err;
 
 	return 0;
 
 err:
-	thread__zput(tidc->frontend_thread);
+	thread__zput(tidc->thread);
 	tidc->kernel_start = 0;
 	return ret;
 }
@@ -2052,7 +2025,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
 
 	/* Reset last branches after flush the trace */
 	if (etm->use_thread_stack)
-		thread_stack__flush(tidc->frontend_thread);
+		thread_stack__flush(tidc->thread);
 
 	return err;
 }
@@ -2164,15 +2137,11 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 			tidc = cs_etm__etmq_get_traceid_ctxt(etmq, inode->i);
 			if (!tidc)
 				return -ENOMEM;
-			if (thread__tid(tidc->decode_thread) == etmq->buffer->tid)
+			if (thread__tid(tidc->thread) == etmq->buffer->tid)
 				continue;
 
-			thread__zput(tidc->frontend_thread);
-			thread__zput(tidc->decode_thread);
-			tidc->frontend_thread = machine__findnew_thread(
-				&etm->session->machines.host, -1,
-				etmq->buffer->tid);
-			tidc->decode_thread = machine__findnew_thread(
+			thread__zput(tidc->thread);
+			tidc->thread = machine__findnew_thread(
 				&etm->session->machines.host, -1,
 				etmq->buffer->tid);
 		}
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index 115def9c6abb..c41a7b5dd62f 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -260,21 +260,13 @@ struct cs_etm_traceid_ctxt {
 	u32 packet_count;
 	u64 cs_timestamp; /* Timestamp, in ns when has_virtual_ts == true */
 
-	struct thread *decode_thread;
 	ocsd_ex_level decode_el;
 
-	/*
-	 * Samples use the EL saved in their source packet. A branch sample
-	 * cannot change thread, so the thread is kept in the frontend context.
-	 */
-	struct thread *frontend_thread;
+	struct thread *thread;
 };
 
 int cs_etm__get_cpu(struct cs_etm_queue *etmq, u8 trace_chan_id, int *cpu);
 enum cs_etm_pid_fmt cs_etm__get_pid_fmt(struct cs_etm_queue *etmq);
-int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
-				       u8 trace_chan_id, ocsd_ex_level el,
-				       pid_t tid);
 bool cs_etm__has_timestamps(struct cs_etm_queue *etmq);
 void cs_etm__etmq_set_traceid_ctxt_ready(struct cs_etm_queue *etmq,
 					  u8 trace_chan_id);

-- 
2.43.0


