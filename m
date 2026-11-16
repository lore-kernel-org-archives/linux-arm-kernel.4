Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22D1606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kwrpy7j2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDCPEoBp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wJhyoVPyEIrD5yY2pde0MNrXE6PDsUwt9Ka8QuL+Adc=; b=kwrpy7j2YxYFhe
	EhK1nVDcQM66c0LgmuOyX1Ci/pn7KXges4zRPu8Bl3/vHnNMqneC8GG4tA30Bz5ka05mx55mFJla8
	o+ineZ8eGQKL49NDCw+rA9h/o6Fy5DmFaJrx1Q7QK3bZknnJeQ5rfZYOG5twobsO/RsdphqdX4ygo
	PMNowOJcRkwCJfnIh7622sQjIatcrkm/26+ljWjqCcWeL9W37PTb9lXFMglmg1yyWBXqFgcl5tiW8
	OEUj2KS8U0O1H+WykYlH1eNZaq8NNGu0YIszGmRS9tAr+0mjnE6Vg8aqFrPA7mYnL0O5VsTEKih3B
	3To7+yv9vJbXP+qb/zpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYG-00000001TUr-00Bq;
	Mon, 16 Nov 2026 07:54:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrY6-00000001TRN-0AqB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:54:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso32866065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815683; x=1795420483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJhyoVPyEIrD5yY2pde0MNrXE6PDsUwt9Ka8QuL+Adc=;
        b=WDCPEoBp9Eq5ei+6HEO9drtkQDx0P9nqKJhYpxS/2/p0HRg7Pazuc35SxaBH0ZIBDw
         AUYLIYAOMp6gvsAuIuubALLCH7vsYjPo+NI15/QxkNDLrLk++Pp/3Keq6JzX0wfPdGM5
         4QnPfF7cRssrf/X+pM4ptqpbxEOH8HlzkcMY2wG91C+R5UwFzh7ZD4YujmNashICAqVf
         jeqevG9d4VNif8Pz0z0/A0mZ1WejojSUk7DL3m7xuJxXZQ8OQDYYe4TxosnIf/oSdg6i
         19hTy4z2HEaoFzUj+eSLTPPgHeXva71HNY5uOJ3lSL4EQ1kq7FD0SW11zp3LPkFm7w1o
         IgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815683; x=1795420483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJhyoVPyEIrD5yY2pde0MNrXE6PDsUwt9Ka8QuL+Adc=;
        b=oF/1N0l1zo7wF1ho5R+ryFnxtQZ/O0SLjmvbfZITgCkylCk1ePV1xfXzE9+ADAicpF
         bGkMpxekeZBN0FE6YGK8lIapQR1Djk7dQXkIf/MTQpbMOtZySA2jw4lQU6DioijY8tfr
         I2AJ7DWOHtG0QiUJIM4NvlqlljbZpU1375N+NC/qfpUSok1VQRNBsjlDZReEyshgRGsP
         ayszyHIohLTYVfKpflz64naEvpBpmDwTH82tw1kKFG1VIxw1EGAVIVmaNPZzxu8HFA08
         rPbwMMrYL0KMmXI5+XRv3t2Qd6qTmjyztqvWBJ/YeaJcmyxPapG8XYVTIRDZ1199mB8D
         2CeQ==
X-Forwarded-Encrypted: i=1; AL+hErHFBSbxKFL7QKOpUUW96IQ5x8Xbz02K6GleM8h9OAk6I+g8gc6+ylSkdpzxiPRAbSQuUX/7diffGGY/BVSc9uI1@lists.infradead.org
X-Gm-Message-State: APuU4Z9GHHZ4trAU6cMVrPUsdBMVmle7YwOlprWOWtGntpPM2+rHEJ1Z
	Kho7IYc8Et8eXTnZZ0TR1DDlLYunfNkn9AnKdxr3vkFNT+NhZcFZ0TtC
X-Gm-Gg: AYBFou1eeG1VDCtO0wTCD9YpSJiWphK+b4Ysr8x73t+rPGgnS2d4hVO5gJ95zXXHFzH
	iguHpOSukWP3mwGmXggdxohziM8iWLWhVWyRDOEzlP4yp5XnrbmL7bH8a5wj6tzuvpRDV7XEqes
	WJmNYq3FUnNyA7gKCRyOoyRnbQ6ajCUrLC2s5ogYPgpcJ1M68MkmRBPxs3bW3KoqLJ+HfRl1/K1
	wESBrgUVduAxhhCd3p2wz4oV+l4cfS2tnOg4LzXdk5o1Vsnh3ICvlGiXzGYD7pq1B2MsopSVfsM
	WuWBQTHLF2mNHz967CivcnkZ71cuiFESd4Dvz5SugdKVmUj+Cd8pWrEw9PO6iR0JjZVlWFFwF0L
	nfWhftLA+Go45g+/X6VBrf+I0f4+s9huk4Pq9KLLqb6cv9fczk/dfw3ZxS+ufEB7V9jFS4rm30G
	EANCM22QB6gbwjMHnDAQml+hGYWjBbOlYoDTkF6BlJw5on0/FwqaOlrulu0vcEAteA6NHbc4rV7
	MQOeByxvikJSANhjPM0e0kLZANHMgSf/2Mwbc+3c1fqg5M4qgP9pKu1gsS2hK3w7VfzV8ukVlVd
	GB+GrnbJuGdpse0WcxSDEyS83Vv32mewm4p8Sjy3uVlr9q1jgspvJkOlcpc3el5twXR+lNQBZRb
	2UF+CPCD/0I9uCj42WoeAaTB2vT8ZzB1V3TtFLQ+C2KoUgFkKBlJrdT+yY4ZRWDUATo4+/gMe6C
	5gAS/W7dU=
X-Received: by 2002:a05:600c:8b23:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb6f6a1e5amr67223255e9.2.1794815683432;
        Sun, 15 Nov 2026 23:54:43 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-148-032.95.117.pool.telefonica.de. [95.117.148.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm210329875e9.14.2026.11.15.23.54.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:54:43 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 1/3] arm64: Always inline raw preempt count updates
Date: Mon, 16 Nov 2026 08:54:22 +0100
Message-Id: <23dc25d010cfeb8eddde12be5212fd73bf1cd5c4.1794814699.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794814699.git.kmehltretter@gmail.com>
References: <cover.1794814699.git.kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235446_096687_6A804F10 
X-CRM114-Status: GOOD (  12.27  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hongyan Xia <hongyan.xia@transsion.com>

Raw preempt count updates can be emitted out of line by the compiler.
For a noinstr caller, that puts the update in ordinary instrumentable
text. Force __preempt_count_add() and __preempt_count_sub() inline so
their code stays in the caller's section.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
[kmehltretter: split out the arm64 preempt.h hunk and rewrite the changelog]
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/include/asm/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 75a592b7f47f7..f3a5c2cd1936d 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -41,14 +41,14 @@ static inline bool test_preempt_need_resched(void)
 	return !current_thread_info()->preempt.need_resched;
 }
 
-static inline void __preempt_count_add(int val)
+static __always_inline void __preempt_count_add(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc += val;
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
-static inline void __preempt_count_sub(int val)
+static __always_inline void __preempt_count_sub(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc -= val;

