Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CD1606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u6wwL1Ta;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XiFe5oD/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r26WQ59IqfWku6my78Fvj1TQoD8mcQLm6t708jMQ8v0=; b=u6wwL1TaHcxviH
	QziD/b1qFcuxuN4a7hQf98ESN1SIU0Ge3B0LXz/qxeY2ZR/Vi1MFbJWz46LBbQ1Pi7xmTTtoVrO7x
	TgCTvOihc4yLr6yCheJyL3g54oAFwqs3rItTOfewSQQ9Iy5gBjSNMghQk7mDgS/N1z2BD05ehLSNx
	hVTwKLBn2UOCbaVq+h2QoY7j49v+wmjM3ZE3Meeq4Zrx95qWfOCi/nIQkslCXdMl2YLr5IiO2cSEB
	ydbrapYisJiesEc0aACHDtTdFGduramEla9VTuyRxiGlg+0FJP9ErzS+ldDfg1/RqY7MzmxcJ5dcb
	xmUfYdG0YypYdzi9nUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUmy-0000000A3JV-0I62;
	Thu, 12 Nov 2026 13:24:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlN-0000000A15B-2dL1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:23:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B2031477;
	Thu, 12 Nov 2026 05:22:46 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 030AD3F632;
	Thu, 12 Nov 2026 05:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489769; bh=NZ65FEkLnuSD6i4OVP2Dn+Wm6TtMIqU1yk3rhV/TBto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XiFe5oD/1jGYsd2MjbBndOSc8avndnCHP1eBpMJR0XmyR74A8GOxayEjFnm8yXaVR
	 13NoEozy6UckARrU9EbXXlytXRpiI6lZ0s90GAgRn2CUi4AzmNVvneKljFcGOHiJQG
	 2QnVSLtun+ByZ0ebUs3WlyhETQnA5TAEN53fkcDY=
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
Subject: [PATCH v2 37/39] genirq: Trust local irqchip when considering IRQ for NMI
Date: Thu, 12 Nov 2026 13:20:40 +0000
Message-Id: <20261112132042.129062-38-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052249_889618_A64FA66B 
X-CRM114-Status: GOOD (  11.30  )
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

Generic IRQ code sanitises whether an IRQ can be considered for NMI
use. Currently, it only considers IRQs managed by the root irqchip.

GICv5 IPIs belong to a logical domain built on top of the LPI domain.
Consequently, generic IRQ code rejects these IPIs for NMI use, even
though their hardware state is managed by the root LPI domain.

One way to allow GICv5 IPIs to be used as NMIs would be to adjust the
sanitisation logic to account for this domain hierarchy. However, the
generic IRQ code can instead trust the local irqchip.

Remove the root irqchip check and use the local irqchip when
considering an IRQ for NMI use.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/irq.h | 2 +-
 kernel/irq/manage.c | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index f485369b1b4f..92d3ad639ae8 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -563,7 +563,7 @@ struct irq_chip {
  * IRQCHIP_ONESHOT_SAFE:              One shot does not require mask/unmask
  * IRQCHIP_EOI_THREADED:              Chip requires eoi() on unmask in threaded mode
  * IRQCHIP_SUPPORTS_LEVEL_MSI:        Chip can provide two doorbells for Level MSIs
- * IRQCHIP_SUPPORTS_NMI:              Chip can deliver NMIs, only for root irqchips
+ * IRQCHIP_SUPPORTS_NMI:              Chip can deliver NMIs
  * IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND:  Invokes __enable_irq()/__disable_irq() for wake irqs
  *                                    in the suspend path if they are in disabled state
  * IRQCHIP_AFFINITY_PRE_STARTUP:      Default affinity update before startup
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index ec3ecb0e48ce..9c32607f1ac3 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1377,11 +1377,6 @@ static bool irq_supports_nmi(struct irq_desc *desc)
 {
 	struct irq_data *d = irq_desc_get_irq_data(desc);
 
-#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
-	/* Only IRQs directly managed by the root irqchip can be set as NMI */
-	if (d->parent_data)
-		return false;
-#endif
 	/* Don't support NMIs for chips behind a slow bus */
 	if (d->chip->irq_bus_lock || d->chip->irq_bus_sync_unlock)
 		return false;
-- 
2.34.1


