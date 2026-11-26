Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF31606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LZ6YpVzX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPlvyI9G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bvbkF+FagNR8/UNuqVZVR2ljn+gIjPoOIFfVu2xdwBA=; b=LZ6YpVzXIbNK51
	8bcuZlMCQCKxEFz06YRfdPEtdNGNqHqK655lRtNvroHO1oxO1NU18sITd1B3DW30RkOzUE5lKLvMn
	3hZRVSazOlmUw4S5RhT+/ayJYsB+Ytc9/SMFyQsREZwSu5qk5i1AyyVxRwEpbyEwpKRsD0vg7X5nJ
	XLzP2CS5RFvKsd1qcg99ZY1ZtSat+tWAuBpJMVD9cMV8JARh/4HGIVTcsR0qcyWCUTzIie6h/UTXT
	ksD0GskfexmH3wC4O30aCFH4oOeUga6sNdOlasa/Jkpd/7RMeepJm99LGwWZ/+B6xcoxev52W1Oze
	Ql4oFmjrbFfR4Q5U2mRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPGe-0000000Bttp-2BHC;
	Thu, 26 Nov 2026 02:31:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPGO-0000000Btpw-3nx5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:31:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4a42b34e930so5623956f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660267; x=1796265067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvbkF+FagNR8/UNuqVZVR2ljn+gIjPoOIFfVu2xdwBA=;
        b=zPlvyI9GK/VKTCc5xvz6r9nfx7xhdym5G+NvqGZzsGvYSK2ARUjaAuuz143m1fmT5X
         lCgvM2BRd8FxE0zinLNB4yedKkUCcWeHuOa9/SAE5u3ex+6MGfgEw/brq2MooV8rCC+g
         QxWuZI9BZn7kLVdG6TlSWW2v6s/I+rs1xryzIqUCYSwViK4wDGwhRuY9F6Mk1Pb/ObMa
         YjfjX8tQsxwDPwGk1IWwRreyTcZeTK+rhnPTF2ahIiaFIoKth94934bx3+dmVA8OdSap
         SLcaBUuW2y0VukG5ATpguPIBh6C2wG/5VVBxHhPubPWh6SypXWigDTnwLyT1AN3B3IcS
         GlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660267; x=1796265067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bvbkF+FagNR8/UNuqVZVR2ljn+gIjPoOIFfVu2xdwBA=;
        b=c/fuBesz0IHnSlmZ/lu3wKQT/+A87jv0BZMumVMqMRPmMUlM4j33nXpBDBnu10U0x5
         5OEOTFleyz4WOmXdY1McMFa3lzYqB9v9Tn+lAvwesjNjeDWWVZQnd6vdaz/8aat7G3TX
         6i+VgA3WaYMJzPiS6hTp+sdA+Io/1hfrefjKGb1ZFTvyNDVsELKpG9IyofgLI+1bHpSW
         VwilflYcunwbfXdSjNOA99XREd1mpLR97qWF/mnXBDF9118JqptoDfWJ5t1FcwJMu7zc
         ClhSufJeFGREutoONO+VjS3E4KkBTp3Chh5mMDDw69nSEZhPwWFsmelb6hJIitDK9Q+m
         ermA==
X-Forwarded-Encrypted: i=1; AL+hErHE8RWx/96BZTHOMnbyT+ieQqpA+V++TcdLoB02HtEx8LX33MrkqscpuZZdGAb30oStoJHp+wdBBk/QWmaHHK9Q@lists.infradead.org
X-Gm-Message-State: APuU4Z+hArro1LRYIqRka6L3EH5ZiVJKVArkn3m1D/eSBE2JCB3/Z1V6
	pVdRCsA8cG5rf4DdEybmgjvaz0FHuCSt415r2BHV4pOializo7r2hm+y
X-Gm-Gg: AZFdTZcuvAaOnTWTO9WgED9KjPbSQ8noK6uV52ZOAmMu7WNONcipH6p0E71R0mCOkz6
	J1DMjQV6sVBr7vpbVwJCJoOobX0lWdeVGX1tKzEQWddUQDP9Lm8iiLL0ynMuJ5hyf9yWzz0ZZFY
	Rk8ZLRZAtyoK/DOk5MklwSBvoGO1EFeE17D9U3Besv8jTJCYWmhFvPC/jwkbyTvjMSSMArYfqH7
	cfUxLr3hIGG8y6XUIDqAWs8OklDAcGfwntKoeIG+XcSsORIhhZiulk4AGSodCXreNEmE2q4iqay
	XTluDVy0OaJf+MzHaQ7cXEPDCjgP1S0dh0fQ3q+MQCGHGhXRHis8X9HpV9bPV16vdvYDRJ/GB31
	VHhrv5c9HGj7KuzC5yea9x1vs7aUVkd+q4wek4251cJ1jncLt8+ruyu6GhHyzCQrHDEpS7o78nz
	cTCXWKmKu2b34wK1+MCJCFayYzcVNxXVrg00TuhuZB8aeXA6+UR2J1mAC3+mKUfTorHr1NacAWF
	6zTpRJbslgX0aQLFOQc9SsIxZxBFm9HoYHA8YE0llrmA+NGqRUt/yn+b6NuNk5EVTnKZKSZlZ7M
	DFX2bnyZl9hxAgmiq3MeHrVyimC7IRUrAyZQBWLeHO3hfBFB+nwENb7G8l9vrbVmvLwfdatgn1U
	u+MAX9rPaNEG731a1Gjg2crryFa805+FVPf1EhtrccUoLE1f0hNK1/CHnPX2J6DTMO0ZClMv1My
	Io8Y6IrW3mQ1s2WpHyKC+LDpfFPPgqMIrplEM86g==
X-Received: by 2002:a5d:6f07:0:b0:48f:fcac:a5e2 with SMTP id ffacd0b85a97d-4abb47b243dmr35992009f8f.38.1795660266905;
        Wed, 25 Nov 2026 18:31:06 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b10e-d501-d0c4-b021-8d77-e472.310.pool.telefonica.de. [2a02:3100:b10e:d501:d0c4:b021:8d77:e472])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm37722445f8f.20.2026.11.25.18.31.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 18:31:06 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Song Liu <song@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH v2 1/3] arm64: Always inline raw preempt count updates
Date: Thu, 26 Nov 2026 03:30:52 +0100
Message-Id: <5ba8c2a33188f43f0b1d99d6ba97c8ea2e285f94.1795631277.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1795631277.git.kmehltretter@gmail.com>
References: <cover.1795631277.git.kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183108_961309_2EBC8426 
X-CRM114-Status: GOOD (  13.00  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
Reviewed-by: Hongyan Xia <hongyan.xia@transsion.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/include/asm/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 75a592b7f47..f3a5c2cd193 100644
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
-- 
2.39.5 (Apple Git-154)


