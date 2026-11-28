Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C191606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AMQHVQnn;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=BWWHAD7M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+5taEmbX1jQ0IsrTjrZqzivaC0BNlnCc9EtYdf6uOf0=; b=AMQHVQnn8K8IWp
	Zu4HmRkAzjubBVXZ06PODffrGB59idKMqmL4HcWWSRqdbTnWNnWSDY9zLdBd3ROV3T687ER2+nNkz
	PU+hRuVHvwc9TftMHT6JU2EB4aRnfpunp6YoZfajklTA+JLIeHufO9HmjuWpzOhdFvrei/TxNbmhv
	3eYF+dUwuYCZPR0tqjdru2dxpn7mP90LSav2HvFPCL0YttmxdPKbcbSOHdymcTb3cL6Lh2ks8hLc3
	KAJ71vrOqzW6IvAxGJYZd2V8QWj2uR2HP7JFB/idXLojKOPf83H9fgvT2n90grpBbDtEmSL4tr2pl
	6f7KEuDp2nrcrdfyUaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEwK-00000000bAk-2caf;
	Sat, 28 Nov 2026 09:41:52 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEvr-00000000b0L-24LF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:41:25 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0809;
	Sat, 28 Nov 2026 17:41:19 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: tglx@kernel.org,
	nm@ti.com,
	kristo@kernel.org,
	ssantosh@kernel.org,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	ioana.ciornei@nxp.com,
	alexander.stein@ew.tq-group.com,
	maz@kernel.org,
	lokeshvutla@ti.com,
	yamada.masahiro@socionext.com,
	robh@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] irqchip/ti-sci-intr: Remove the interrupt domain on unbind
Date: Sat, 28 Nov 2026 17:41:18 +0800
Message-ID: <20261128-f81b700d6c-u38-2@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u38-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u38-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa22187d37a03a1kunm87b2e738451d47
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHx8eVkJITE9PSBpCGkoaQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=BWWHAD7MuS5kHCPG98LnRjg/OFfnWgTBpDDOpDJ1PV/s8dbz/C+gfF1XZn9Ks8RBh/mNut++/be51/wYG4u/c7lelOmpGqsmNgxwSWqzOEIb5mRYyLRq71cTNgnvR+0omx7ZVoCl+nNOY4U9iVie1fXSGn4LUekvd/N/uDhcqaY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=+5taEmbX1jQ0IsrTjrZqzivaC0BNlnCc9EtYdf6uOf0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014124_309358_0C58ED68 
X-CRM114-Status: GOOD (  10.89  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The IRQ domain remains registered when the platform device releases
the controller data used by its domain operations. Remove the
domain as part of device teardown.

This issue was found by our static analysis tool under development.

Fixes: cd844b0715ce ("irqchip/ti-sci-intr: Add support for Interrupt Router driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/irqchip/irq-ti-sci-intr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index 1d2e5af3ac4f..d504bb8865b3 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -242,6 +242,11 @@ static const struct irq_domain_ops ti_sci_intr_irq_domain_ops = {
 	.translate	= ti_sci_intr_irq_domain_translate,
 };
 
+static void ti_sci_intr_remove_domain(void *data)
+{
+	irq_domain_remove(data);
+}
+
 static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
 {
 	struct irq_domain *parent_domain, *domain;
@@ -301,7 +306,7 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
 
 	dev_info(dev, "Interrupt Router %d domain created\n", intr->ti_sci_id);
 
-	return 0;
+	return devm_add_action_or_reset(dev, ti_sci_intr_remove_domain, domain);
 }
 
 static const struct of_device_id ti_sci_intr_irq_domain_of_match[] = {

-- 
2.43.0


