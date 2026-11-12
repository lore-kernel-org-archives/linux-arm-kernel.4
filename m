Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79652606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v0N808yy;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h6mUDFZT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EiGp4z2BWpmeRaiKapJiy06TQhHBWSJOXWeLytcOlpQ=; b=v0N808yy4USu8W
	Y88o+MQ3bNfwaxHM4FArTaqHSMiiW2bw3uIN8XCsIzKizn7F88+TLUbwOrNNaaIQfHmp98+Mx9w7R
	66Up0uZgqjUuaQb74HFnR2iCpHZaG5WmL8HgGIIZOQLmmhtWqd2AhsM6c1sQETFc7Gq0NGnX1aR4+
	BbiBa3XpPTezMF6eXQscZLLx/hWyELo818uvr4g32HZOz6MiI/qMwgwO8xQ5x/pnil85tDF4Yk77R
	8M49RdUZv4DdQgbgm6vnBUqf6maav4d30vrpXvlB/iq1IJh+whAS0whxOrb26JFSLaaDnvtEKCp7X
	BGiAJo4KnPgI4gAXOM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUmy-0000000A3Ju-1uJs;
	Thu, 12 Nov 2026 13:24:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlP-0000000A18i-0joj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:23:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C42501576;
	Thu, 12 Nov 2026 05:22:47 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8583D3F632;
	Thu, 12 Nov 2026 05:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489770; bh=RRSCLsKBk/IK3VLcJE7CTxtAV/aPelC1JmZFNF/7b9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h6mUDFZThQU19SLpi6RqW3Jeihzv/sa5r3mYb39JjjwkwOuXNpIXTQYB5TDK6yec3
	 TWB7+Hp/tvkpeopvz87kinishbQaRHR1DdFaDv++yEe6hreTctPzdafN9DAnKOTuW9
	 8VGZinR2zjpg4ZcdN78mw+PBHFnxaUjCwlnnqh6k=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com,
	ashok.raj@oss.qualcomm.com,
	maz@kernel.org
Subject: [PATCH v2 38/39] genirq: Do not call add_interrupt_randomness() in NMI context
Date: Thu, 12 Nov 2026 13:20:41 +0000
Message-Id: <20261112132042.129062-39-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052251_696908_580C7CE4 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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

handle_irq_event_percpu() calls add_interrupt_randomness(). Similarly
to 512718bbc51b ("genirq/chip: Don't call add_interrupt_randomness()
for NMIs"), calling it while handling an NMI is not safe.

Stop calling add_interrupt_randomness() when handle_irq_event_percpu()
runs in NMI context.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 kernel/irq/handle.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
index b7d52821837b..114fd63b0210 100644
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@ -245,7 +245,8 @@ irqreturn_t handle_irq_event_percpu(struct irq_desc *desc)
 
 	retval = __handle_irq_event_percpu(desc);
 
-	add_interrupt_randomness(desc->irq_data.irq);
+	if (!in_nmi())
+		add_interrupt_randomness(desc->irq_data.irq);
 
 	if (!irq_settings_no_debug(desc))
 		note_interrupt(desc, retval);
-- 
2.34.1


