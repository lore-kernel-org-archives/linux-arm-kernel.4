Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D73606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 00:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p0V2QWf+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoI86i7F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BDgkQRI+JQ6/3Xe6aC3pArUDoRD90RfmWAAnosSnIDI=; b=p0V2QWf+9j1vVT
	PLXQWTRjbskaV9yUvg3aqOoabC6gF7op2rs11N/mrG9dB/MyE6MnXJ8YXVZA4xT/dB2w/21GlrYPY
	9ovOZjG7FeStP9VLnYZjYRTRy7QtFkTNWEUz4lGfxb0xCP+Xj3sFCdHZqtHayESrplVwaQuI8G+pH
	5Ig3ExCGsV1THR78MzIggYohTdXLbq1v9p3oSbqdMy7TB4Xq36C4lEb8HIwZL+1U2L3vF4SEJoRF5
	GPzI3Xuk3e/JdnaRT19ebkZ49Ks0Og1Zsmx9nLzb5PcG+N9O8IRCAITyani9Vr+I/1sjjT9L5wS+6
	LgwgNSQl+FN05LNexA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpao-0000000AXpT-3jVk;
	Thu, 19 Nov 2026 00:01:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpae-0000000AXkR-26su
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 00:01:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6814634A8;
	Thu, 19 Nov 2026 00:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994211F000CA;
	Thu, 19 Nov 2026 00:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046483;
	bh=BDgkQRI+JQ6/3Xe6aC3pArUDoRD90RfmWAAnosSnIDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AoI86i7F3japdZ6N18MULTKUyPichZVZ9seADer6xMnKtKWcfV6b+aXpsjF9KHXef
	 px/Md5PhzmjK9mLUrxSBYsGSdG+tDR1/jO0xR+MX4GB6DvlnO2OUwPMlVskg01+oQl
	 3cGiTLzmN67ZJ33oeyKuN/qNsEnGNuDRw7u2eO7qNjaBerPs/feoN3tOFqCfEY0GdQ
	 /bepLjtBVt22Av95Pcheiq0Qg5uM/yU0eKLm05cbSjlXg17bFWXwNugpb1X1YAtEll
	 bPgscaUx8x7wPpaCQrsbN+8ieYlTZdxRKTtOSinfGSTVgaOgTus0POiP7c/ZVBbGDs
	 LRaPXgGc396tA==
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
Subject: [PATCH bpf-next v2 3/3] selftests/bpf: Run stacktrace_ips raw_tp, tp and fentry tests on arm64
Date: Wed, 18 Nov 2026 16:01:12 -0800
Message-ID: <20261119000112.2377949-4-andrii@kernel.org>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261119000112.2377949-1-andrii@kernel.org>
References: <20261119000112.2377949-1-andrii@kernel.org>
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
perf_fetch_caller_regs() regs. Now that arm64 perf_callchain_kernel()
skips regs->pc of such regs and no longer reports the caller twice,
run these subtests on arm64 as well, where kernel stacks are always
unwound through frame records.

Leave the kprobe, kretprobe, kprobe_multi, kretprobe_multi and fexit
subtests x86-only: on arm64, kprobes at function entry miss the probed
function's caller, and fexit stacks have an extra entry for the traced
function. The kretprobe subtests pass on arm64, but don't use
perf_fetch_caller_regs() regs.

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


