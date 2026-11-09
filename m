Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1519B606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PZ35eloE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifqPUIQb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6LYzOqgVWc34uRY6ovO7R7m1hhJFjX7us7aa10zp4XA=; b=PZ35eloEM0BWaF
	ZTBmcKb2SbyGX/60AImVRVxlUQClf8lOk3LjFjyAZJg3QVbd1TuVYo0wdSWM7eXiwGgK5hebrDtG4
	gQpYSj+IkNYOfVQnzEdS1q+//o75YcsR0TruY0Dp7s+SZLNzNoTcs8YqzXWRMEUE3cFMN6bGWkWdE
	arHaKmGmYaGvy/GgkbeLjK+p6UIdfIRYylN4CABugA1Euy8xFUl0+N0b/uyhbrLRLHSM6/4Zeo4nC
	oZ1uSx01nRD4beIlIpm0PFLCtcmPcvBR+x4BP4OSXP5hL+wAB/vcCmTIRK20XfQeX6hQHVIyz076X
	X68WzJYmrnYTebaYj3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO7y-00000000cB3-0d8G;
	Mon, 09 Nov 2026 12:05:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO7w-00000000c9y-3HNu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:05:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 710DA458A5;
	Mon,  9 Nov 2026 12:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEAA1F0089F;
	Mon,  9 Nov 2026 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225932;
	bh=6LYzOqgVWc34uRY6ovO7R7m1hhJFjX7us7aa10zp4XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ifqPUIQb4197CXOoo3zkk/P+62IWE3W6hw3VXHH7BmaZDJzTj/sylmfjzUn/heM/o
	 Dy3qocNvWVFwIqtPRM05SK7rH7jllGShFdSL1cRyz7QQ/mkOqRGeBPNiZRUO8mrxRm
	 FIachU3c43wQuZXo5Uct+uIktJlmVTYkENycEl9wY+AjWuGD9c6TxAz1oGp/9/UG2+
	 XGuWNxEDTKXdIbIkn+pWSeDgW1jw3znXhbtuXBKg7H3oAZHzcnibIYvO90zTJhWf1j
	 3bP/GAN+qstiydBQLS9s63mMSLiQr3I7JY3AW6z//o+NeybqI0nzbTP8tHEzysVNuR
	 YHkTNUk0CoDNQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH v2 5/6] arm64: lib: Disable branch profiling for architecture library code
Date: Mon,  9 Nov 2026 19:44:58 +0800
Message-ID: <20261109114500.20298-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109114500.20298-1-jszhang@kernel.org>
References: <20261109114500.20298-1-jszhang@kernel.org>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

arch/arm64/Kbuild disables branch profiling through subdir-ccflags-y.
However, arch/arm64/lib/ is built separately through libs-y and does
not inherit that flag.

Consequently, CONFIG_TRACE_BRANCH_PROFILING can introduce explicit
profiling instrumentation into library code, including helpers used
while applying alternatives. noinstr does not suppress instrumentation
inserted by the branch-profiling macros.

Disable branch profiling in arch/arm64/lib/Makefile to extend the
existing arm64 policy to this directory

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/lib/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 38ffd359123c..59d714865c00 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -1,5 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# Built via libs-y, so the flags in arch/arm64/Kbuild do not reach here.
+# Branch profiling isn't noinstr-safe.
+ccflags-$(CONFIG_TRACE_BRANCH_PROFILING) += -DDISABLE_BRANCH_PROFILING
+
 # KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
 KCSAN_SANITIZE_delay.o := n
 
-- 
2.55.0


