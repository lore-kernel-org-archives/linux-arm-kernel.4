Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9236082BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CAhY9UK7;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HRyUv+Vy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NJbzZ1rJU+QBfldfCtIUj3qILBrc3I/5agYUjCN+MFM=; b=CAhY9UK7OD7q7fLWGtvwEEpc4B
	Z8Cyj80kAElpgqvXCEAGsmtYexyQixawRK6la2c4C6Z0voS64jQllvM5Pd9WPuAtruEvfasfw6a7c
	VRlV8XQk1B+dIsqsbItcmfG91EVdS3/b2Q4mQVXHKjZp8oREX9pNWSgZe3eDbEQYRYooew4psia2R
	ZXxtOXhGvINbdRruFPwBETnjOjkFJ3VE6PdQatFj8kTmIbBacAUjX3ag0qNyHZwqy9hrKErqqfNJG
	4GjMnkPlUiaMtVS4RIKJ0E2NcQB9C57kt/3y5mtH1aRjW+90bLXAbuAJZnjFNDfJJqq0yCySDCwI8
	kigkFh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTl-0000000EumV-0WPe;
	Sat, 07 Nov 2026 15:37:17 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTg-0000000Eujf-15ZC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:13 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c41dae9db9dso189332166b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065829; x=1794670629; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NJbzZ1rJU+QBfldfCtIUj3qILBrc3I/5agYUjCN+MFM=;
        b=HRyUv+Vyiyq3EwcsL32rG11z/z2B127rOTNYp3OoAgX0F3H6n4xsMpG3aLZBJ2F0qF
         FJLUM0uue/bImpzJiDqaoPOR6Em5PBoC61zFE6YivSjXN5r0bh71Q8WbFL411i21h/sS
         CXlEMoVvh8cwccwufNNUnb2Fvr6/Uk0c6A2MW421+Tgp88dz4EsIKvi0B+m0d/NjgrjQ
         jCvzap6/XNUcf+d7ZTCPpaOUSqQOgF4UQ788PGkYwVoqtWV42Km41p51/cM5QXyikilb
         HTlVSIDTswIWgcJbDt+sI7W2NrEY4e/L/X2Beo7Urmuypqb1Qys30Qtm8GH4HeXMLtUc
         +Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065829; x=1794670629;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJbzZ1rJU+QBfldfCtIUj3qILBrc3I/5agYUjCN+MFM=;
        b=yABNsS1/+UFWTJyh6OfK/RQ5R/OAyg2k/NKSDTuGLRxwryJRwQjcuQbJq6QxVxDwGt
         uqrl7UX9erN9yqUxDhwcz11ULx3/SrmjVab4hnSv7uEj8FG5WWFlq8ytDYdUwMl8af6M
         w60IuV5GAzHRdXWJPJE7OmmNUL3tOVhASw6EtkX33zzylM+C16fBTGl2ncaexH0LdH38
         8GFiV5ra1DgzhMxUS8tLAel57uPkne2NjJzfoFfjcbpFvFOjB1uRBNi1xh4+k1nVj1u0
         Imry1y4g78zjB3Jh8Ya2oak9zjM5v+S6nsm+8LGzj3/JjH4sUEyOPGRJCpm1VUm2ugSn
         WjKQ==
X-Forwarded-Encrypted: i=1; AL+hErHcrB6aWIXv6IUWk8o3h2qQk5KskYf+6KC7yOZrFGqFSxnUiVuE4+ev3JIsEtubeNRuw7yGZYpwzHBHr6Bz5B4S@lists.infradead.org
X-Gm-Message-State: APuU4Z/9Mw0e2Lac/c6ywJ3N+j3M8c17cMwle+9awcbkgVcmFNKzpvT2
	P6KBY1SdLkpbd4BVmI8H2nmN4H5V1uTPPZ/wgDl/U8fNzwvJHMLFLIjtFklZdd0Xr6gNawh5M6p
	j9A==
X-Received: from ejpc8.prod.google.com ([2002:a17:906:54c8:b0:c3f:c35a:7704])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:c0a:b0:c33:dbe8:291c
 with SMTP id a640c23a62f3a-c4d35448ab9mr515861766b.20.1794065829385; Sat, 07
 Nov 2026 07:37:09 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:08 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-2-d84ea5f30f94@google.com>
Subject: [PATCH 02/24] kselftest/arm64: Test lazy PSTATE.TCO handling
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Collingbourne <peter@pcc.me.uk>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073712_339036_E7BF5384 
X-CRM114-Status: GOOD (  20.82  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reproduce a bug introduced by commit 38ddf7dafaea ("arm64: mte: avoid
clearing PSTATE.TCO on entry unless necessary") where TCO wasn't cleared
when it should have, by detecting that the kernel misses MTE faults when
accessing (tagged) memory of a process running sync MTE.

Cc: Peter Collingbourne <peter@pcc.me.uk>
Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 tools/testing/selftests/arm64/mte/.gitignore       |   1 +
 tools/testing/selftests/arm64/mte/check_lazy_tco.c | 152 +++++++++++++++++=
++++
 2 files changed, 153 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/.gitignore b/tools/testing/s=
elftests/arm64/mte/.gitignore
index f6937f890039..70ebc3883a26 100644
--- a/tools/testing/selftests/arm64/mte/.gitignore
+++ b/tools/testing/selftests/arm64/mte/.gitignore
@@ -4,6 +4,7 @@ check_tags_inclusion
 check_child_memory
 check_mmap_options
 check_prctl
+check_lazy_tco
 check_ksm_options
 check_user_mem
 check_hugetlb_options
diff --git a/tools/testing/selftests/arm64/mte/check_lazy_tco.c b/tools/tes=
ting/selftests/arm64/mte/check_lazy_tco.c
new file mode 100644
index 000000000000..28174495056a
--- /dev/null
+++ b/tools/testing/selftests/arm64/mte/check_lazy_tco.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2026 Google LLC
+/*
+ * Validate that the kernel does not leave PSTATE.TCO set on kernel entry =
and/or
+ * thread switching, when it should be clear i.e. when kernel accesses (su=
ch as
+ * uaccess) are expected to be tag checked.
+ */
+
+#include <sys/wait.h>
+
+#include "kselftest.h"
+#include "mte_common_util.h"
+#include "mte_def.h"
+
+#define BUG_EXIT_CODE	99
+#define MAX_TRIALS	32
+
+static void handle_signal(int sig);
+
+/*
+ * We validate that uaccesses are tag checked by tricking the kernel into
+ * triggering a tag check fault while accessing user (tagged) memory. If t=
he
+ * kernel does not report an error, we assume that PSTATE.TCO was set, sil=
encing
+ * the hardware exception.
+ *
+ * To achieve this with robust userspace-kernel synchronization, we alloca=
te a
+ * signal handler stack in PROT_MTE memory, tagged with 0x0 so that our si=
gnal
+ * handler can safely run without triggering tag check violations from SP
+ * (untagged) accesses. We only re-tag (with a non-zero value) the uppermo=
st
+ * granule of the stack, where the kernel must write user->next_frame.
+ *
+ * When the parent process sends SIGUSR1 to its child, the following happe=
ns:
+ * - TCO should be cleared before the uaccess
+ * - the kernel writes user->next_frame to the tagged stack granule
+ * - (if MTE is properly enabled, a synchronous tag fault is raised)
+ * - if the fault was detected and handled, SIGSEGV should be delivered
+ * - if it was not detected or raised, the initial SIGUSR1 is received
+ */
+static void setup_sigaltstack_tripwire(int sig)
+{
+	size_t sz =3D MT_ALIGN_UP((size_t)MINSIGSTKSZ + 2 * (size_t)getpagesize()=
);
+	void *altstack, *top_granule;
+	struct sigaction sa =3D {};
+	stack_t ss =3D {};
+
+	/* Enable non-zero IRG, needed for tagging the sigaltstack. */
+	if (mte_switch_mode(MTE_NONE_ERR, MTE_ALLOW_NON_ZERO_TAG, false) !=3D 0)
+		ksft_exit_fail_msg("Failed to enable MTE tag generation\n");
+
+	altstack =3D mte_allocate_memory(sz, USE_MMAP, 0, false);
+	if (check_allocated_memory(altstack, sz, USE_MMAP, false) !=3D KSFT_PASS)
+		ksft_exit_fail_msg("Failed to allocate MTE sigaltstack\n");
+
+	top_granule =3D (char *)altstack + sz - MT_GRANULE_SIZE;
+	if (!mte_insert_tags(top_granule, MT_GRANULE_SIZE))
+		ksft_exit_fail_msg("Failed to tag sigaltstack top granule\n");
+
+	ss.ss_sp =3D altstack;
+	ss.ss_size =3D sz;
+	if (sigaltstack(&ss, NULL) !=3D 0)
+		ksft_exit_fail_perror("sigaltstack()");
+
+	sa.sa_handler =3D handle_signal;
+	sa.sa_flags =3D SA_ONSTACK;
+	sigemptyset(&sa.sa_mask);
+	if (sigaction(sig, &sa, NULL) !=3D 0)
+		ksft_exit_fail_perror("sigaction()");
+}
+
+static __noreturn void stress_test_lazy_tco(void)
+{
+	const unsigned long sync_ctrl =3D
+		PR_TAGGED_ADDR_ENABLE | PR_MTE_TCF_SYNC |
+		(MTE_ALLOW_NON_ZERO_TAG << PR_MTE_TAG_SHIFT);
+
+	if (prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0) !=3D 0)
+		_exit(KSFT_FAIL);
+
+	for (;;) {
+		if (prctl(PR_SET_TAGGED_ADDR_CTRL, sync_ctrl, 0, 0, 0) !=3D 0)
+			_exit(KSFT_FAIL);
+		if (prctl(PR_SET_TAGGED_ADDR_CTRL, 0, 0, 0, 0) !=3D 0)
+			_exit(KSFT_FAIL);
+	}
+}
+
+static void handle_signal(int sig __always_unused)
+{
+	if (prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0) & PR_MTE_TCF_SYNC)
+		_exit(BUG_EXIT_CODE);
+}
+
+static int spam_signal_until_child_exit(pid_t pid, int sig)
+{
+	int status =3D 0;
+	pid_t ret;
+
+	do {
+		if (kill(pid, sig) !=3D 0)
+			ksft_exit_fail_perror("kill()");
+		mte_wait_after_trig();
+		ret =3D waitpid(pid, &status, WNOHANG);
+	} while (ret =3D=3D 0);
+	if (ret !=3D pid)
+		ksft_exit_fail_perror("waitpid()");
+
+	if (WIFSIGNALED(status) && WTERMSIG(status) =3D=3D SIGSEGV)
+		return KSFT_PASS;
+
+	if (WIFEXITED(status) && WEXITSTATUS(status) =3D=3D BUG_EXIT_CODE)
+		return KSFT_FAIL;
+
+	ksft_exit_fail_msg("Unexpected child wait status %#x\n", status);
+}
+
+static int check_lazy_tco(void)
+{
+	for (int trial =3D 0; trial < MAX_TRIALS; trial++) {
+		pid_t child =3D fork();
+
+		if (child < 0)
+			ksft_exit_fail_perror("fork()");
+
+		if (!child)
+			stress_test_lazy_tco();
+
+		if (spam_signal_until_child_exit(child, SIGUSR1) =3D=3D KSFT_PASS)
+			continue;
+
+		ksft_print_msg("Detected invalid TCO state\n");
+		return KSFT_FAIL;
+	}
+
+	return KSFT_PASS;
+}
+
+int main(void)
+{
+	int err;
+
+	ksft_print_header();
+
+	err =3D mte_default_setup();
+	if (err)
+		return err;
+
+	ksft_set_plan(1);
+	setup_sigaltstack_tripwire(SIGUSR1);
+	ksft_test_result_report(check_lazy_tco(), "Check lazy TCO clearing\n");
+	mte_restore_setup();
+	ksft_finished();
+}

--=20
2.56.0.455.g6c5a503b38-goog


