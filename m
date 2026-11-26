Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4071606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 04:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UQa58Oeg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rLaFbS45qsDFACZ8jlDX1C9i6JiT8Ywhd6sZstfSSsw=; b=UQa58Oeg4DQOvo
	ceuIXst+LCbOS7IrW1xAopZUB5k3fDRMY1kBzs1Jk61uRMNot/4liSh3uB9AKpmGP3EhqOlTH13tq
	lWj3M/6EQSTIBlNrcW2KeuB6ihvEBfEmpjOB4xIPb3kc4l/N7HX+tpxx13emJFLeXsghEDkXoCy5C
	bhB0rjHYa4yzl3AQE6LL1ri4JjaES/rQgquEhze+vo6SRj9pbUWAzTyNwj67kI90pj6N6JmADF39t
	04kJLZtG8fqWesTCbY5pDKMEtQcRKPKYVoISmOWBjo9f7zYOYIv7CRojfq/yIUSlRGVJf4UY1UgPO
	XQbeUNwGwEbbYDvjRiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQhK-0000000C2vD-3KzF;
	Thu, 26 Nov 2026 04:03:02 +0000
Received: from dggmsgout13.his.huawei.com ([124.71.94.104])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQhG-0000000C2rH-2F4X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 04:03:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggmsgout13.his.huawei.com (SkyGuard) with ESMTP id 4jZjYz1DQtz1rqZs
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:02:47 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 99D79409C3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:02:51 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgAHOullrwdrepVXFw--.42150S3;
	Thu, 26 Nov 2026 12:02:51 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Song Liu <song@kernel.org>,
	Kyle Huey <me@kylehuey.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	bpf@vger.kernel.org,
	alexander.shishkin@linux.intel.com
Subject: [PATCH stable/linux-6.6.y 1/9] perf/bpf: Reorder bpf_overflow_handler() ahead of __perf_event_overflow()
Date: Thu, 26 Nov 2026 04:34:50 +0000
Message-Id: <20261126043458.2394658-2-luogengkun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126043458.2394658-1-luogengkun@huaweicloud.com>
References: <20261126043458.2394658-1-luogengkun@huaweicloud.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgAHOullrwdrepVXFw--.42150S3
X-Coremail-Antispam: 1UD129KBjvJXoW3XFW3Kry3XrWxuw1rKr4xCrg_yoW7KFy7pF
	ZrAFnIyr4qgFnF9w45Ar1qyw15Zr10qrZ8Jw4kKayFkFy8WrZ5GFyUG34YvrZ8Jry8ua47
	Xw4UtF17CryUXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIw0e
	DUUUU
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_200258_934517_BDF48C28 
X-CRM114-Status: GOOD (  18.45  )
X-Spam-Score: -2.6 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Kyle Huey <me@kylehuey.com>

[ Upstream commit 4c03fe11b96bda60610aca77002e83f37b4a2242 ]

This will allow __perf_event_overflow() to call bpf_overflow_handler().

Signed-off-by: Kyle Huey <khuey@kylehuey.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://lore.kernel.org/r/20240412015019.7060-2-khuey@kylehuey.com
Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 kernel/events/core.c | 183 ++++++++++++++++++++++---------------------
 1 file changed, 92 insertions(+), 91 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index e9849303f647..4a3125918330 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9599,6 +9599,98 @@ static inline bool sample_is_allowed(struct perf_event *event, struct pt_regs *r
 	return true;
 }
 
+#ifdef CONFIG_BPF_SYSCALL
+static void bpf_overflow_handler(struct perf_event *event,
+				 struct perf_sample_data *data,
+				 struct pt_regs *regs)
+{
+	struct bpf_perf_event_data_kern ctx = {
+		.data = data,
+		.event = event,
+	};
+	struct bpf_prog *prog;
+	int ret = 0;
+
+	ctx.regs = perf_arch_bpf_user_pt_regs(regs);
+	if (unlikely(__this_cpu_inc_return(bpf_prog_active) != 1))
+		goto out;
+	rcu_read_lock();
+	prog = READ_ONCE(event->prog);
+	if (prog) {
+		perf_prepare_sample(data, event, regs);
+		ret = bpf_prog_run(prog, &ctx);
+	}
+	rcu_read_unlock();
+out:
+	__this_cpu_dec(bpf_prog_active);
+	if (!ret)
+		return;
+
+	event->orig_overflow_handler(event, data, regs);
+}
+
+static int perf_event_set_bpf_handler(struct perf_event *event,
+				      struct bpf_prog *prog,
+				      u64 bpf_cookie)
+{
+	if (event->overflow_handler_context)
+		/* hw breakpoint or kernel counter */
+		return -EINVAL;
+
+	if (event->prog)
+		return -EEXIST;
+
+	if (prog->type != BPF_PROG_TYPE_PERF_EVENT)
+		return -EINVAL;
+
+	if (event->attr.precise_ip &&
+	    prog->call_get_stack &&
+	    (!(event->attr.sample_type & PERF_SAMPLE_CALLCHAIN) ||
+	     event->attr.exclude_callchain_kernel ||
+	     event->attr.exclude_callchain_user)) {
+		/*
+		 * On perf_event with precise_ip, calling bpf_get_stack()
+		 * may trigger unwinder warnings and occasional crashes.
+		 * bpf_get_[stack|stackid] works around this issue by using
+		 * callchain attached to perf_sample_data. If the
+		 * perf_event does not full (kernel and user) callchain
+		 * attached to perf_sample_data, do not allow attaching BPF
+		 * program that calls bpf_get_[stack|stackid].
+		 */
+		return -EPROTO;
+	}
+
+	event->prog = prog;
+	event->bpf_cookie = bpf_cookie;
+	event->orig_overflow_handler = READ_ONCE(event->overflow_handler);
+	WRITE_ONCE(event->overflow_handler, bpf_overflow_handler);
+	return 0;
+}
+
+static void perf_event_free_bpf_handler(struct perf_event *event)
+{
+	struct bpf_prog *prog = event->prog;
+
+	if (!prog)
+		return;
+
+	WRITE_ONCE(event->overflow_handler, event->orig_overflow_handler);
+	event->prog = NULL;
+	bpf_prog_put(prog);
+}
+#else
+static int perf_event_set_bpf_handler(struct perf_event *event,
+				      struct bpf_prog *prog,
+				      u64 bpf_cookie)
+{
+	return -EOPNOTSUPP;
+}
+
+static void perf_event_free_bpf_handler(struct perf_event *event)
+{
+}
+#endif
+
 /*
  * Generic event overflow handling, sampling.
  */
@@ -10513,97 +10605,6 @@ static void perf_event_free_filter(struct perf_event *event)
 	ftrace_profile_free_filter(event);
 }
 
-#ifdef CONFIG_BPF_SYSCALL
-static void bpf_overflow_handler(struct perf_event *event,
-				 struct perf_sample_data *data,
-				 struct pt_regs *regs)
-{
-	struct bpf_perf_event_data_kern ctx = {
-		.data = data,
-		.event = event,
-	};
-	struct bpf_prog *prog;
-	int ret = 0;
-
-	ctx.regs = perf_arch_bpf_user_pt_regs(regs);
-	if (unlikely(__this_cpu_inc_return(bpf_prog_active) != 1))
-		goto out;
-	rcu_read_lock();
-	prog = READ_ONCE(event->prog);
-	if (prog) {
-		perf_prepare_sample(data, event, regs);
-		ret = bpf_prog_run(prog, &ctx);
-	}
-	rcu_read_unlock();
-out:
-	__this_cpu_dec(bpf_prog_active);
-	if (!ret)
-		return;
-
-	event->orig_overflow_handler(event, data, regs);
-}
-
-static int perf_event_set_bpf_handler(struct perf_event *event,
-				      struct bpf_prog *prog,
-				      u64 bpf_cookie)
-{
-	if (event->overflow_handler_context)
-		/* hw breakpoint or kernel counter */
-		return -EINVAL;
-
-	if (event->prog)
-		return -EEXIST;
-
-	if (prog->type != BPF_PROG_TYPE_PERF_EVENT)
-		return -EINVAL;
-
-	if (event->attr.precise_ip &&
-	    prog->call_get_stack &&
-	    (!(event->attr.sample_type & PERF_SAMPLE_CALLCHAIN) ||
-	     event->attr.exclude_callchain_kernel ||
-	     event->attr.exclude_callchain_user)) {
-		/*
-		 * On perf_event with precise_ip, calling bpf_get_stack()
-		 * may trigger unwinder warnings and occasional crashes.
-		 * bpf_get_[stack|stackid] works around this issue by using
-		 * callchain attached to perf_sample_data. If the
-		 * perf_event does not full (kernel and user) callchain
-		 * attached to perf_sample_data, do not allow attaching BPF
-		 * program that calls bpf_get_[stack|stackid].
-		 */
-		return -EPROTO;
-	}
-
-	event->prog = prog;
-	event->bpf_cookie = bpf_cookie;
-	event->orig_overflow_handler = READ_ONCE(event->overflow_handler);
-	WRITE_ONCE(event->overflow_handler, bpf_overflow_handler);
-	return 0;
-}
-
-static void perf_event_free_bpf_handler(struct perf_event *event)
-{
-	struct bpf_prog *prog = event->prog;
-
-	if (!prog)
-		return;
-
-	WRITE_ONCE(event->overflow_handler, event->orig_overflow_handler);
-	event->prog = NULL;
-	bpf_prog_put(prog);
-}
-#else
-static int perf_event_set_bpf_handler(struct perf_event *event,
-				      struct bpf_prog *prog,
-				      u64 bpf_cookie)
-{
-	return -EOPNOTSUPP;
-}
-static void perf_event_free_bpf_handler(struct perf_event *event)
-{
-}
-#endif
-
 /*
  * returns true if the event is a tracepoint, or a kprobe/upprobe created
  * with perf_event_open()
-- 
2.34.1


