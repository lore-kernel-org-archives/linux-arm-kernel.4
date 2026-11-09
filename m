Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4226606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UmGxjTJH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EIiHA/jn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RuOhAvZnPjP1XPHFbitmFrHHdHIPhu/o1Rlh2k3boNo=; b=UmGxjTJH/jiUDf
	qGRbLwcxXOQF3vqq5RMLBODXo4vEJIK7jHPp6U+/T6SNjpRc5ACwKr87anGIGo1BYr/tSmdgaDet1
	MBpu4opHxKybk2kug8fvaZAuEN47LlpA+S52NDV8vV/MO8y/ENelHxXWAgIFrZgjuMa1VWQpind79
	w7KzMMng6YxOScbdRxsguUWRxusNMjPAksPzPnPHE40pkzAWjbgFL/9Bkz+xY+e5HEY/HKR+L7Pk4
	Maof19z0Z5CQc4kYOS7BDkrttimYk2VibCRKtJW5HetgaoEWKFt8GwlOnX8pH7IjOsoDazEFzLMI7
	xlIfPiVWoWINhgUQ0/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO7q-00000000c4r-3PX2;
	Mon, 09 Nov 2026 12:05:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO7p-00000000c3u-0GKh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:05:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8168A63193;
	Mon,  9 Nov 2026 12:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9429B1F0089F;
	Mon,  9 Nov 2026 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225924;
	bh=RuOhAvZnPjP1XPHFbitmFrHHdHIPhu/o1Rlh2k3boNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EIiHA/jnHvo+Q4fpvT8AJOyb2hpOJY7Xo9vMny81pnTTP4xxoyuWC2gRSKz4nw+f7
	 vZuiWM6/9cL7w6O9dQjHrrvVLyWmsheXkoPwm9iiXuOETC0zQurR5JjE2S4z8ASP7e
	 rjU5+0PyNPxmONuxlmN+MbIrdWuSerwdAud1UIbuzvyn8mb50OOM8MPqN5eFkS+yrH
	 BPd+uz+qRkC3tHmfgoyj3amIn3bnNLznREzxXgOyE8HLPQwMrXaT7Cc8kEpaLoTAY4
	 z52qrphTGlnFIfOo54i5BRzjhKJFuLwz3foLVPpES4nlVrKmWlx/Naki/dR4qzP/ys
	 c5V6fWR8imoJw==
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
Subject: [PATCH v2 3/6] kasan: Always inline kasan_hw_tags_enabled()
Date: Mon,  9 Nov 2026 19:44:56 +0800
Message-ID: <20261109114500.20298-4-jszhang@kernel.org>
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

The arm64 MTE entry and exit helpers call kasan_hw_tags_enabled()
from noinstr code. Although kasan_enabled() is __always_inline, its
wrapper kasan_hw_tags_enabled() uses plain inline.

With CONFIG_KASAN_HW_TAGS=y and CONFIG_CC_OPTIMIZE_FOR_SIZE=y, GCC
emits kasan_hw_tags_enabled() in .text and calls it from .noinstr.text.

Mark both definitions __always_inline so the runtime check inherits
its callers' instrumentation restrictions.

Verified that the out-of-line symbol and calls disappear from the
arm64 entry-common.o object after rebuilding.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 include/linux/kasan-enabled.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 9eca967d8526..14a9e9fd6c6b 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -35,12 +35,12 @@ static inline void kasan_enable(void) {}
 #endif /* CONFIG_ARCH_DEFER_KASAN || CONFIG_KASAN_HW_TAGS */
 
 #ifdef CONFIG_KASAN_HW_TAGS
-static inline bool kasan_hw_tags_enabled(void)
+static __always_inline bool kasan_hw_tags_enabled(void)
 {
 	return kasan_enabled();
 }
 #else
-static inline bool kasan_hw_tags_enabled(void)
+static __always_inline bool kasan_hw_tags_enabled(void)
 {
 	return false;
 }
-- 
2.55.0


