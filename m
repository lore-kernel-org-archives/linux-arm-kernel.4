Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE8A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YfX2PB3u;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xj7YhviZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sAsssef8M9BJYAqaDb1o+lxM6zblF2emqCfzY+ds9V0=; b=YfX2PB3uktTPKJ
	PHOuOF7ZaDsvFrtPz4p5wawNw/T4+9HUpFPWXNFldWLtcAgPhifJ+8UefEGFPD9mxVkdgeK3s7Fkk
	Yek8iQo2Q1sXxU3flFr45nhhDCUwTUMv6VYreQH7n2F7glAJ52aSxDXDf6TfvI7Bp6oIMdhAQGADL
	bZgz55kWMk8j7/6+xZZMvTcokFlLGSb404OohbQgm8OZ+0aPe8oQw/FkB+7YI2QyQWHuEW/eSJS43
	BzFNlNnGykWQYC+RzQt2aE10WaU0bY+h1IxokWya2JgplP/pb5OEkVB4U/iHEEUYx4bDxQOzlQPt8
	WEmEEHF29s88uSzI+aaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuAy-000000058tp-1oBa;
	Tue, 10 Nov 2026 22:18:48 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuAv-000000058sB-1soJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:18:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=poGMcKRdZmSpH1Ecviaj76ja+0kiijnp7goli5bqW2k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794349123; v=1; x=1794953923;
 b=xj7YhviZxetTEE/fW5dXZ6GcTw0osoFGmRGhEy8gdbWxdhAs5I+BKbWbYceySw0CdXiCgbtK
 Xuo7t+kQ5W95LCZOYREhaiQybfM9qh6SlyeBRyrgAhI1eoJ7NwxGtrE1+N9Ppsmciuk9MuE9/OV
 udVO9lCjou136ab4pJotWWbQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id d7adb2b07faa7b1e;
	Tue, 10 Nov 2026 22:18:43 +0000
X-Mizu-Trace-ID: d7adb2b07faa7b1e
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bradley.morgan@linux.dev
Subject: [PATCH 2/2] arm64: signal: drop redundant bounds check in parse_user_sigframe()
Date: Tue, 10 Nov 2026 22:18:36 +0000
Message-ID: <20261110221836.3265929-3-bradley.morgan@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110221836.3265929-1-bradley.morgan@linux.dev>
References: <20261110221836.3265929-1-bradley.morgan@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_141845_634240_6C7D8D03 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

We already check limit - offset < size right after reading head->size
before the magic switch. Then once the switch finishes, we turn around
and check the exact same thing again.

None of the switch cases touch offset, limit, or size before reaching
the bottom, and extra context branches off with continue anyway. So the
second check is completely dead. It has been sitting here since the 2017
frame layout rework.

Drop the duplicate check.

Signed-off-by: Bradley Morgan <bradley.morgan@linux.dev>
---
 arch/arm64/kernel/signal.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 20d5f19921e0d..d152735d632e5 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -1003,9 +1003,6 @@ static int parse_user_sigframe(struct user_ctxs *user,
 		if (size < sizeof(*head))
 			goto invalid;
 
-		if (limit - offset < size)
-			goto invalid;
-
 		offset += size;
 	}
 
-- 
2.53.0


