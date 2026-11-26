Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E822E606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fQsrpLQX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WybqTIQq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yN5H3rKOI/8+8/yT1waYVkwONxbU+zHepwtMaoJjEe4=; b=fQsrpLQX9ePvTL
	ztq+0PE4fbrlowtYR7Oabs4qwXhiItx6gy1Oh2rqvrAM87HGAIIPzwM+wTBKyts1SRdp4bn7K0UNo
	dY/o98NLIJ6uGWgJgraVkuV/q1b3gM3tJUlB/MOxowl1n5nwQkV9BkOfpbjzmyOcVtCFU+dpIlprc
	9FT5C95cbe3hh/MtOkMuJ2BOsodxXkNP5EEUFfqEpONCCp5tuzChRaBaig+ACz51CdBEZhGJHVU9w
	RjGeGPzXx2it/Nzrk0rhoTx9qFnX4AXnAKsUTOznjfDidrJr3k97rE9BqbisFMtqZ2JzEsURYRfi6
	OebPEvQdl7pyT+kObD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPGe-0000000Bttz-2YJv;
	Thu, 26 Nov 2026 02:31:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPGR-0000000BtqP-0RrS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:31:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so36091955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660269; x=1796265069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN5H3rKOI/8+8/yT1waYVkwONxbU+zHepwtMaoJjEe4=;
        b=WybqTIQqOwlZ+LB35nFx17x+o+/D50CPYX++L6fEeMU3xkN0Mso6oe3DKnFSZn6Tjb
         KCr4pbClWfIiwIKte3qRFimuwtq/AjsQap7C4JEUScohsR7LvhBOjFPbmXUYqyb/BdoF
         hnrvjOVGB/gF9H87Rtx6hsoxUc1mVTdleRC1scpZ3GKucxt0dPNNsXRZ4F01C5IKYa/Q
         P9JwQRZX04T8mvRo4V1J3Iz8fy4ZGzYI+8Gl6cHJFYj8kF77AtU0tDmkELikujtRg6bN
         WiHu/Tt3M29bxFx91gb65m0tpmrH5yAqPwmGWrPgkzRjM2H/PuxiRg7/Fq1ENaOx5Ntw
         Wlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660269; x=1796265069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yN5H3rKOI/8+8/yT1waYVkwONxbU+zHepwtMaoJjEe4=;
        b=1vnWwVsyimx0ZDFej2fv8bkPkhB5hmcU/CmOALx6/e0qw65k8SbjEbPFy3knONlgdt
         RQ7VVIIiMNATWdDfUBuyrLsHenkqQ3whU8zg0Lr1NflSeqNJcJWwQdvpe1al++XOGgMz
         HuzKzNZALPiMRN5bv8UqQI6PDC9oJioGZgeBmrGJNy8EWmntD7AvZuksazTcUN59b4AF
         5gISCicjkSRGPSrJCajC4m4ZFrzCheVByluedWpsxEo+2UHbhKZPb4pt07MEBwZI8cH6
         uNbn2RPiELsOIAX6xGYkcwHOUBxcEGYtzLR0wDdW6/CfALaANakttYd6NZUitc/WL8PV
         9SZA==
X-Forwarded-Encrypted: i=1; AL+hErExULh8tjnaMDO0F04Ll79UVEoNACrO6CYMWqbfKmWRM96Oubm0z44E2zVdcB/PfMTPHOIHVnQZbDa56KXvoD53@lists.infradead.org
X-Gm-Message-State: APuU4Z/ldYFKOxWRZin8BfKqA8Xi0E6HH1lA8OKiS2V9PoQajvQReucd
	sPzjhyV/l6XJodOy8CyYuZOH5SRG/IGFIzibNlhL2yN46rHh8kjYggqN
X-Gm-Gg: AZFdTZd7fRgFveTotjAJUa5rCgkOM6rVf8yPklrOTEaVQ8jh8jgufEdMnH7Rn8PqSpK
	7BvrfPaQZ1WwCG2lZ7V53SmWrXYhpjDyCn3rt+SVgGileaF14fxW3izMOLOgX4Ug9qrCUKVRswU
	5cAxjozesD6T1RnFd7ll4rC0pOOABLJ33WY26zlvn2RixHyRtry8/f3XkBQ54R4H0ucJffPhqzI
	EwxXPo5/qWQaPSYPDHLzj7ie1qDJRXzDmILqgPVnKeRY3HGd8OAqmHvayqQfHx+MOj4WjJi0ugb
	qJvjzVEqBydlDvq87aQAI/t5qqrA5K1tT1WgQhDH6gRgh/wf0RITIyIpb+BtpXF5igXBPUdN/Z8
	ga3EBg8RCB55MR2jgmiJKR4Sn30r/ISL9YFeZkYrSJ4Vpb9LCXBKZTxEwyK8TJ/Su2DKaW6LG5k
	Mp3krAfM9qF0hsK41+QihDr0KGae7bXA5iTc5JJItX8Z5rSY2pK45WHr130OmoqOJKWO/rpBZB/
	6gSzhetngMXREDIKgk7D5WQaRYZq18a8OqsobsJyOxIc7AwAzFXOExFy0ux/FpPh4NXs6xF39m8
	JAD4o31+SrfpvuqABUFPZjrqd9RqO0zX+cYZMhHfqRG07x+7XD+118c2HjB9uvKHvD2F1MDZhIm
	unBWG+HBHxQc/e0DAYYdm5BtH+OTHKL8pUo+lsZNl0pp3E+UTsy/6tY46XWhdoyGPoKfbz/4DT3
	MBtRllsDVo9TaLk2B+87AodeQfMDwmv+LuS1YeqQ==
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr456668815e9.30.1795660269096;
        Wed, 25 Nov 2026 18:31:09 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b10e-d501-d0c4-b021-8d77-e472.310.pool.telefonica.de. [2a02:3100:b10e:d501:d0c4:b021:8d77:e472])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm37722445f8f.20.2026.11.25.18.31.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 18:31:08 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: Always inline preempt count and reschedule checks
Date: Thu, 26 Nov 2026 03:30:53 +0100
Message-Id: <9546998cffeaf365f8f67901a48ef103945dc342.1795631277.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1795631277.git.kmehltretter@gmail.com>
References: <cover.1795631277.git.kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183111_159543_52ABA831 
X-CRM114-Status: GOOD (  13.58  )
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

The preempt count and reschedule checks are plain inline functions,
which permits out-of-line copies in instrumentable text. The checked
notrace helpers added by the following patch use preempt_count(), while
preempt_enable_notrace() uses should_resched() with
CONFIG_DEBUG_PREEMPT and __preempt_count_dec_and_test() without it.

Force all three operations inline so noinstr callers keep them in their
own section.

Reviewed-by: Hongyan Xia <hongyan.xia@transsion.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/include/asm/preempt.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index f3a5c2cd193..805f7b33baf 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -7,7 +7,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __always_inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }
@@ -75,13 +75,13 @@ static inline int __preempt_count_sub_return(int val)
 	return pc;
 }
 
-static inline bool should_resched(int preempt_offset)
+static __always_inline bool should_resched(int preempt_offset)
 {
 	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
 	return unlikely(pc == preempt_offset);
 }
 
-static inline bool __preempt_count_dec_and_test(void)
+static __always_inline bool __preempt_count_dec_and_test(void)
 {
 	/*
 	 * We must load the combined 'preempt_count' after decrementing
-- 
2.39.5 (Apple Git-154)


