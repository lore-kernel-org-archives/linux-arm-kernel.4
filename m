Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE9E606BDB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CTSgYsZN;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CUOObnwM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Lw3qKSNbN4hz3Jc1cpyCWweNlOBTCykjd+brmlscD7Y=; b=CTSgYsZNwVaqwy
	opu4Z3j+JNgfBB9LaUff0LONhOyyBHZKW+YWLPo1Zc8XvwtvRStTBO6hHEi6KL3udvUo6HbS2mnHQ
	5NBPkFiEmJuADbkJbcp9UJ0WQSp2C4S1zROfOQALtIrJiKIJToWF3Y0kTTU4yixEaZR+kqLLlw/wa
	EMjsCqnO7OstO5X0Uxkd8CjEqqup81NVBY2+Y7HXdDn6N6YkxOCeFpxPMSxOgLlAp531yiCroiGf1
	SDFVTbiNYmT1cYf6KCBnEt0LeWccnRp8rA5QYtAmeHjud5xb+XbrS73gSL6jmSK0LR8aKPOdRzneM
	uLSl/07blSMH6Dss7ZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRow5-0000000CQOH-06fT;
	Fri, 13 Nov 2026 10:55:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRow0-0000000CQMG-1du8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:55:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E06371C00;
	Fri, 13 Nov 2026 02:55:04 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B23963F673;
	Fri, 13 Nov 2026 02:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794567307; bh=LEf+1vXrAc9uWP+E08EDnDlvFIEOjLT7EK8mZNHIzGY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CUOObnwMRjA9BOm/c7n1/95VTjMMHGwyYOlOr+DFS97WkC8jb9voX5UvO571X93vI
	 IEOVYMCClwDz7siu6SD11qXej+XRV9o7NOw7y2sccnFNNRX3we6DeEKCMhhEGkdJvS
	 qvHjSVUp90JddwAwRfXNQEpFJNbPtKzhROunwuw8=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 13 Nov 2026 10:54:53 +0000
Subject: [PATCH 2/3] perf cs-etm: Use the packet instruction size for stack
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-perf_fix_gcc15_failure-v1-2-eae592c5ff64@arm.com>
References: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
In-Reply-To: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Robert Walker <robert.walker@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567301; l=1680;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=LEf+1vXrAc9uWP+E08EDnDlvFIEOjLT7EK8mZNHIzGY=;
 b=4XRdn06lAFNnamoomk1N7++y4cIUmiZqCxMfKc8r7N/TrPI8AtFgbpVGIQoShPyZKc2m6Vn1U
 +YxhLp+InyyAdYyCuxpdVUC8BNlQa8hRy35sZQWwRpDA+BkFfGrsApy
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025508_533513_80CDF677 
X-CRM114-Status: GOOD (  10.93  )
X-Spam-Score: -4.4 (----)
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

cs_etm__add_stack_event() uses the last executed instruction of the
previous packet as the branch source. The decoder already records this
instruction's size in last_instr_size, including for T32 instructions.

Use the recorded size directly instead of reading instruction memory
again. This removes an unnecessary read and the dependency on DSO data
when updating the thread stack.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 25f12bd110934a204d79244f45317085b7a81666..312d4a734e84faa0d24c4ac1fee16f4dae4c2398 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1626,7 +1626,6 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
 {
 	struct cs_etm_auxtrace *etm = etmq->etm;
 	u64 from, to;
-	int size;
 
 	if (!etm->synth_opts.branches && !etm->synth_opts.instructions)
 		return;
@@ -1638,11 +1637,10 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
 		from = cs_etm__last_executed_instr(tidq->prev_packet);
 		to = cs_etm__first_executed_instr(tidq->packet);
 
-		size = cs_etm__instr_size(etmq, tidq, tidq->prev_packet, from);
-
 		/* Enable callchain so thread stack entry can be allocated */
 		thread_stack__event(tidq->frontend_thread, tidq->prev_packet->cpu,
-				    tidq->prev_packet->flags, from, to, size,
+				    tidq->prev_packet->flags, from, to,
+				    tidq->prev_packet->last_instr_size,
 				    etmq->buffer->buffer_nr + 1,
 				    etmq->etm->use_callchain,
 				    tidq->br_stack_sz, 0);

-- 
2.34.1


