Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7337606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RdXPvIng;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KATnxScb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fDbH24IqyXGeJwrHjekd3y0pkWs6pa3ajDlC4H0B9Rs=; b=RdXPvIngN/A2EE
	KDwtnsQF5JqXjLgU8gBSp/nWwHPLShBNdfPlq2RCutrPA6aQ5R01FjEkrK0TWz0N0dZsCQAdd5aS9
	3Xg34CSuLzVFM4wPrsTSEnDD1J+vjrFvtsaNFhZ0pja+yO9ICN1Yri8hgVj/JED8Auncbu75QZk4D
	S6RMoRytahHRp06EbDdympdBjThilycu4DUIec/zUKPmjl32GI5B4nqx3ZXto1LvS3nFfgCElkcIL
	fLeT5VdZNIZ9ouLG+BI2qPpIbHsWrwHgzYRtbWJBECUKiXlEPXPxN6Cm3UNboKm/EIfukFNkNyvK9
	877YZ/RcdARVvVBiJyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuAy-000000058tV-1Nqg;
	Tue, 10 Nov 2026 22:18:48 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuAt-000000058rf-1PF3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:18:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ucW0CbkgsYickmF4J+LbDhp0k/VR5j5+Ym5RT6WHGS0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794349121; v=1; x=1794953921;
 b=KATnxScbwb64vWmiiVtuCVXVGjDEVGbtOnd1iqIBXx5KJnfO9Nb2ZxFJWUwTE+Hrs5AEsKsz
 yvZnA0NemMEkt04T/1BB5QczwompSqODfu9lYqlkfYdD18QVO8OuW1fqx+vivQ2Cfce1t8fSzha
 5xT7yCctpxAYjRm1CitCAV7o=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 53003b696ba808b5;
	Tue, 10 Nov 2026 22:18:41 +0000
X-Mizu-Trace-ID: 53003b696ba808b5
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bradley.morgan@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH 1/2] arm64/fpsimd: signal: Require ZA context when restoring ZT context
Date: Tue, 10 Nov 2026 22:18:35 +0000
Message-ID: <20261110221836.3265929-2-bradley.morgan@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110221836.3265929-1-bradley.morgan@linux.dev>
References: <20261110221836.3265929-1-bradley.morgan@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_141843_517859_98A34BB9 
X-CRM114-Status: GOOD (  12.49  )
X-Spam-Score: -2.8 (--)
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

When restoring the signal frame, restore_zt_context() checks whether ZA
is enabled via thread_za_enabled(&current->thread). However, if user.za
is omitted from the signal frame, restore_za_context() is skipped entirely.
If the signal handler touched SME prior to rt_sigreturn(), ZA remains
enabled in current->thread.svcr from the handler context, causing
thread_za_enabled() to succeed and restore_zt_context() to write userspace
ZT data without restoring ZA state.

Require user->za to be present in the signal frame before restoring ZT.

Fixes: ee072cf70804 ("arm64/sme: Implement signal handling for ZT")
Cc: stable@vger.kernel.org
Signed-off-by: Bradley Morgan <bradley.morgan@linux.dev>
---
 arch/arm64/kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 6a06a4e352b1d..20d5f19921e0d 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -678,7 +678,7 @@ static int restore_zt_context(struct user_ctxs *user)
 	u16 nregs;
 
 	/* ZA must be restored first for this check to be valid */
-	if (!thread_za_enabled(&current->thread))
+	if (!user->za || !thread_za_enabled(&current->thread))
 		return -EINVAL;
 
 	if (user->zt_size != ZT_SIG_CONTEXT_SIZE(1))
-- 
2.53.0


