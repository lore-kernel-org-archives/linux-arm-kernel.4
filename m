Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4E606A882
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KYzDvX+/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TmnEL4xB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EL9gN+j85p/bUq8NOP88n+8iwVVIzyUDQlbjaBLzbvs=; b=KYzDvX+/VvJVT5
	G+CZADEAsF3jFRXUrRHVPEccM9dAaR4At2FU/eRHCh7WMVMY2dOxsNU7F+X9RKFp96KqIe+5LGGEx
	FuQWuHwCnW+keeqTQoyAikjEKklmeYFiP5rOAeyyaNzCN5PRHr0wV8vol5wYEBLOayg7/rmZ83OMV
	lkQs32fy3Bj8F4l8ogD2kWVblU64C9IvsmyZPjVqaUpkvP/3z3eNGtEMIMrF2BsEvAOsqlLOF+ndx
	v+KiCjW+ncjuk0jQ4Mwvnrc7SJP5jjB+ABW/xPKiqcYxP/+MCcj6S1iz0DpgkAJ3puyTx7M+AT95o
	cQm3UHOvKqVD/msBM8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Tu-0000000Et1t-3Jzk;
	Sat, 14 Nov 2026 00:18:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Tq-0000000Et08-3iGh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 00:18:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3540B61ECE;
	Sat, 14 Nov 2026 00:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B701F000C5;
	Sat, 14 Nov 2026 00:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794615533;
	bh=EL9gN+j85p/bUq8NOP88n+8iwVVIzyUDQlbjaBLzbvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TmnEL4xBtnSs9MrvKX4I3L2wcgnhU+EVL3BbLD2acZ2pStzfSUAZeCXj4lMd9qBep
	 wCQO7HuLIVgHsvQZu9xTWrryw3VVb+vFIBhnhynRPNb5Ue/Ve1I7tO8HmSEoihQemc
	 D9u26kFfr3+7fRMBG4M6BpOCLE9+7RHuWp/w4Zr7lr4XepUr4C2QuXpJVhcExMwXRv
	 2NELQjdE0E9rLOjDSXezLDfRFsuF6GXS7xn2sFYWYPzX9vR2bkR7LEfOAATY8Xmw6A
	 6rgnqJX23GbORci1QfWZZUKj6IHewx6JUKgcccBpm5CuTYeUeJR3APaK2o0/FOpNBc
	 /PYq7pNncFMww==
From: Andrii Nakryiko <andrii@kernel.org>
To: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	peterz@infradead.org,
	jolsa@kernel.org,
	rostedt@goodmis.org,
	Andrii Nakryiko <andrii@kernel.org>
Subject: [PATCH bpf-next 2/3] selftests/bpf: Add stacktrace_ips test for tracepoint
Date: Fri, 13 Nov 2026 16:18:45 -0800
Message-ID: <20261114001846.873499-3-andrii@kernel.org>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261114001846.873499-1-andrii@kernel.org>
References: <20261114001846.873499-1-andrii@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a tp subtest that checks the stack captured by bpf_get_stack()
from a tracepoint program, recorded only for the test's own process.
Depending on static calls and inlining, the stack may or may not have
__traceiter_bpf_testmod_test_read in front of bpf_testmod_test_read,
so accept both. Also check that the entry after it differs: kernels
without commit 6d08340d1e35 ("Revert "perf/x86: Always store regs->ip
in perf_callchain_kernel()"") report the tracepoint's caller twice.

Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
---
 .../selftests/bpf/prog_tests/stacktrace_ips.c | 54 +++++++++++++++++++
 .../selftests/bpf/progs/stacktrace_ips.c      | 13 +++++
 2 files changed, 67 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/stacktrace_ips.c b/tools/testing/selftests/bpf/prog_tests/stacktrace_ips.c
index da42b00e3d1f..a03d4c10c469 100644
--- a/tools/testing/selftests/bpf/prog_tests/stacktrace_ips.c
+++ b/tools/testing/selftests/bpf/prog_tests/stacktrace_ips.c
@@ -137,6 +137,58 @@ static void test_stacktrace_ips_raw_tp(void)
 	stacktrace_ips__destroy(skel);
 }
 
+static void test_stacktrace_ips_tp(void)
+{
+	__u64 traceiter_addr, read_addr, *ips;
+	struct stacktrace_ips *skel;
+	struct ksyms *ksyms = NULL;
+	struct ksym *ksym;
+	int i;
+
+	skel = stacktrace_ips__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "stacktrace_ips__open_and_load"))
+		return;
+
+	if (!skel->kconfig->CONFIG_UNWINDER_ORC) {
+		test__skip();
+		goto cleanup;
+	}
+
+	skel->bss->my_pid = getpid();
+
+	skel->links.tp_test = bpf_program__attach(skel->progs.tp_test);
+	if (!ASSERT_OK_PTR(skel->links.tp_test, "bpf_program__attach"))
+		goto cleanup;
+
+	trigger_module_test_read(1);
+
+	ksyms = load_kallsyms_local();
+	if (!ASSERT_OK_PTR(ksyms, "load_kallsyms_local"))
+		goto cleanup;
+	traceiter_addr = ksym_get_addr_local(ksyms, "__traceiter_bpf_testmod_test_read");
+	read_addr = ksym_get_addr_local(ksyms, "bpf_testmod_test_read");
+
+	/*
+	 * Depending on static calls and inlining, __traceiter_bpf_testmod_test_read
+	 * may or may not be in front of bpf_testmod_test_read.
+	 */
+	ips = skel->bss->tp_ips;
+	ksym = ksym_search_local(ksyms, ips[0]);
+	if (!ASSERT_OK_PTR(ksym, "ksym_search_local"))
+		goto cleanup;
+	i = ksym->addr == traceiter_addr ? 1 : 0;
+
+	ksym = ksym_search_local(ksyms, ips[i]);
+	if (!ASSERT_OK_PTR(ksym, "ksym_search_local"))
+		goto cleanup;
+	ASSERT_EQ(ksym->addr, read_addr, "stack_cmp");
+	ASSERT_NEQ(ips[i], ips[i + 1], "stack_dup");
+
+cleanup:
+	free_kallsyms_local(ksyms);
+	stacktrace_ips__destroy(skel);
+}
+
 static void test_stacktrace_ips_kprobe(bool retprobe)
 {
 	LIBBPF_OPTS(bpf_kprobe_opts, opts,
@@ -238,6 +290,8 @@ static void __test_stacktrace_ips(void)
 		test_stacktrace_ips_kprobe_multi(true);
 	if (test__start_subtest("raw_tp"))
 		test_stacktrace_ips_raw_tp();
+	if (test__start_subtest("tp"))
+		test_stacktrace_ips_tp();
 	if (test__start_subtest("kprobe"))
 		test_stacktrace_ips_kprobe(false);
 	if (test__start_subtest("kretprobe"))
diff --git a/tools/testing/selftests/bpf/progs/stacktrace_ips.c b/tools/testing/selftests/bpf/progs/stacktrace_ips.c
index 6830f2978613..df10ef3cb14d 100644
--- a/tools/testing/selftests/bpf/progs/stacktrace_ips.c
+++ b/tools/testing/selftests/bpf/progs/stacktrace_ips.c
@@ -53,6 +53,19 @@ int rawtp_test(void *ctx)
 	return 0;
 }
 
+__u64 tp_ips[128];
+int my_pid;
+
+SEC("tp/bpf_testmod/bpf_testmod_test_read")
+int tp_test(void *ctx)
+{
+	if (bpf_get_current_pid_tgid() >> 32 != my_pid)
+		return 0;
+
+	bpf_get_stack(ctx, tp_ips, sizeof(tp_ips), 0);
+	return 0;
+}
+
 SEC("fentry/bpf_testmod_stacktrace_test")
 int fentry_test(struct pt_regs *ctx)
 {
-- 
2.53.1-Meta


