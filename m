Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01871606A882
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GSp6q2gc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkW4NSW9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uRzzNp8+l9gRwXTNApOrbQ44C8yLgFZjz1n5Da+b05s=; b=GSp6q2gcRGmshz
	wq7tGhzrG/rqtC05gpDWpHPLHBNmS/gU6EabeQGolirGTbFMnpsH36zTHWdvXe91zN8YNMukFJavd
	4mPcK+prshJ5MT6iq97W/Ja83fnayy8it+MAwfNvKYT9masmsSrH75R00NfumfXbnQX3OiKUpQVl1
	znRdgnkNPrhYil5EpFIIo4WmiyJS8OYNPjOmTpOHSxYCfo1oJDGbXABxSBwHo7pHhTERhArmgsUcm
	HSDTaV1MI2rgrGNc2DyhY8NycGUN0tT6DSf0bzP05BKvxwyQ79eVkdvnvMXKqT7/Xc+g9xoIlQzOo
	kwEtgOkayhAjAXYib4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Tu-0000000Et25-3hNK;
	Sat, 14 Nov 2026 00:18:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Tt-0000000Et1G-3iXR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 00:18:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A74A61882;
	Sat, 14 Nov 2026 00:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57C81F000C6;
	Sat, 14 Nov 2026 00:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794615537;
	bh=uRzzNp8+l9gRwXTNApOrbQ44C8yLgFZjz1n5Da+b05s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FkW4NSW9WlPAokFObd2LOJFvrs6xixuSNhcOIx/2/HjhvN/u0LTsSPZbHANtp+4gA
	 lWXKwDDMpvXyVo9WzDQuiq8dqiV7ep/lixs6vit1E2wr0AjX6FRg9krMJsgv+HDPQK
	 s+frX6kSsHcqARBHa0THR6HF3sFBLlHNt2ZvIx6HEX64WwRF61cl0K5H5+x60G61bN
	 x8lUBrzE8MMgGQwvYKYCrn/14J9MRtXSCVwLGDP0BxUHMyIhfEW0dD3ud1nu5GYi2S
	 BcDVpl27uAKYA54X9oJGpSOLhAr4YvaGtvC3XvLVx+8dbwUQNfNxgiES+MZN+sfvK9
	 B/XJKYG6yjPow==
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
Subject: [PATCH bpf-next 3/3] selftests/bpf: Run stacktrace_ips raw_tp, tp and fentry tests on arm64
Date: Fri, 13 Nov 2026 16:18:46 -0800
Message-ID: <20261114001846.873499-4-andrii@kernel.org>
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

The raw_tp, tp and fentry subtests check stacks unwound from
perf_fetch_caller_regs() regs, which arm64 reported with the caller
twice until perf_arch_fetch_caller_regs() was fixed. Run them on arm64
as well, where kernel stacks are always unwound through frame records.

Leave the kprobe and fexit subtests x86-only: on arm64, kprobes at
function entry miss the probed function's caller, and fexit stacks
have an extra entry for the traced function (kretprobe subtests pass,
but don't use these regs).

Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
---
 .../selftests/bpf/prog_tests/stacktrace_ips.c     | 15 +++++++++++----
 .../testing/selftests/bpf/progs/stacktrace_ips.c  |  5 +++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/stacktrace_ips.c b/tools/testing/selftests/bpf/prog_tests/stacktrace_ips.c
index a03d4c10c469..aee46543f390 100644
--- a/tools/testing/selftests/bpf/prog_tests/stacktrace_ips.c
+++ b/tools/testing/selftests/bpf/prog_tests/stacktrace_ips.c
@@ -2,7 +2,7 @@
 #include <test_progs.h>
 #include "stacktrace_ips.skel.h"
 
-#ifdef __x86_64__
+#if defined(__x86_64__) || defined(__aarch64__)
 static int check_stacktrace_ips(int fd, __u32 key, int cnt, ...)
 {
 	__u64 ips[PERF_MAX_STACK_DEPTH];
@@ -47,6 +47,12 @@ static int check_stacktrace_ips(int fd, __u32 key, int cnt, ...)
 	return err;
 }
 
+/* arm64 always unwinds kernel stacks through frame records */
+static bool unwinder_ok(struct stacktrace_ips *skel)
+{
+	return skel->kconfig->CONFIG_UNWINDER_ORC || skel->kconfig->CONFIG_ARM64;
+}
+
 static void test_stacktrace_ips_kprobe_multi(bool retprobe)
 {
 	LIBBPF_OPTS(bpf_kprobe_multi_opts, opts,
@@ -106,7 +112,7 @@ static void test_stacktrace_ips_raw_tp(void)
 	if (!ASSERT_OK_PTR(skel, "stacktrace_ips__open_and_load"))
 		return;
 
-	if (!skel->kconfig->CONFIG_UNWINDER_ORC) {
+	if (!unwinder_ok(skel)) {
 		test__skip();
 		goto cleanup;
 	}
@@ -149,7 +155,7 @@ static void test_stacktrace_ips_tp(void)
 	if (!ASSERT_OK_PTR(skel, "stacktrace_ips__open_and_load"))
 		return;
 
-	if (!skel->kconfig->CONFIG_UNWINDER_ORC) {
+	if (!unwinder_ok(skel)) {
 		test__skip();
 		goto cleanup;
 	}
@@ -244,7 +250,8 @@ static void test_stacktrace_ips_trampoline(bool retprobe)
 	if (!ASSERT_OK_PTR(skel, "stacktrace_ips__open_and_load"))
 		return;
 
-	if (!skel->kconfig->CONFIG_UNWINDER_ORC) {
+	/* on arm64, fexit stacks also have a frame for the traced function */
+	if ((retprobe && !skel->kconfig->CONFIG_UNWINDER_ORC) || !unwinder_ok(skel)) {
 		test__skip();
 		goto cleanup;
 	}
diff --git a/tools/testing/selftests/bpf/progs/stacktrace_ips.c b/tools/testing/selftests/bpf/progs/stacktrace_ips.c
index df10ef3cb14d..11dfebd4ddb2 100644
--- a/tools/testing/selftests/bpf/progs/stacktrace_ips.c
+++ b/tools/testing/selftests/bpf/progs/stacktrace_ips.c
@@ -19,14 +19,15 @@ struct {
 } stackmap SEC(".maps");
 
 extern bool CONFIG_UNWINDER_ORC __kconfig __weak;
+extern bool CONFIG_ARM64 __kconfig __weak;
 
 /*
- * This function is here to have CONFIG_UNWINDER_ORC
+ * This function is here to have CONFIG_UNWINDER_ORC and CONFIG_ARM64
  * used and added to object BTF.
  */
 int unused(void)
 {
-	return CONFIG_UNWINDER_ORC ? 0 : 1;
+	return CONFIG_UNWINDER_ORC || CONFIG_ARM64 ? 0 : 1;
 }
 
 __u32 stack_key;
-- 
2.53.1-Meta


