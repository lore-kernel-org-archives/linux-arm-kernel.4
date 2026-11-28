Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F793606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xnwmN9gq;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Us7Gt2A1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CY/rfI4YKWyxTp2uoMTOvs21zzWoKyzt7WP0sTIsZNw=; b=xnwmN9gqQcRtjB
	ClQD7c/RSndBsgOwZH14gCnYbkKP3qNQYVxNc04YuZ6v49ctW5LeWANni/XlYF3MyRenNplOXnE73
	4MA0Z5npoit7i0UdlA0o5xDbe0UzmwVHCOeuvkteLaVmSsWGgTiWXj0bvks9aJVvQlB+88q6Hjedf
	f5Cw/qX18oZeh55w4L/Lkr4gpy5deSzEXjC2lMDGueMCdvMJO4YQzUNnSAVqVRJqJ0W0PGMOxE6YA
	wXWe4vqvKuJz22U1QuTRFsE9WWUlaBqAUi06Nr8a0bDk8R+HTN5dnJ1sBIDjmn9vRa366J0+xNte8
	sVphbsBurMPL87W/Nd8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEvt-00000000b2l-3soy;
	Sat, 28 Nov 2026 09:41:25 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEvo-00000000b0B-2Rz5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:41:24 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0808;
	Sat, 28 Nov 2026 17:41:17 +0800 (GMT+08:00)
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
Subject: [PATCH 1/3] irqchip/ls-extirq: Remove the interrupt domain on unbind
Date: Sat, 28 Nov 2026 17:41:16 +0800
Message-ID: <20261128-f81b700d6c-u38-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u38-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u38-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa22187cab503a1kunm72d526e6451d44
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGU8dVktCQ01JQklKSxhMQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Us7Gt2A1TpQGhLJz9/rhRn8E3bMMKQSznhGMVELXFBhtmukc5Lqu2eZsH9i+F9J1Ej3BCaMfEjiFaWJcSi7Mx01+LnxSAkbKHjlm1+80Tt9o3BqbmCQKTFOzFDp+zUc4iAGmDYgy4cb9EswsJ7Cn/ScPjsNlvrPIc3ec2/GfF34=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=CY/rfI4YKWyxTp2uoMTOvs21zzWoKyzt7WP0sTIsZNw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014121_922864_C3577728 
X-CRM114-Status: GOOD (  11.38  )
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

Fixes: 05cd654829dd ("irqchip/ls-extirq: Convert to a platform driver to make it work again")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/irqchip/irq-ls-extirq.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-ls-extirq.c b/drivers/irqchip/irq-ls-extirq.c
index b791cb03a44a..ae8e9c918ac8 100644
--- a/drivers/irqchip/irq-ls-extirq.c
+++ b/drivers/irqchip/irq-ls-extirq.c
@@ -168,6 +168,11 @@ ls_extirq_parse_map(struct ls_extirq_data *priv, struct device_node *node)
 	return 0;
 }
 
+static void ls_extirq_remove_domain(void *data)
+{
+	irq_domain_remove(data);
+}
+
 static int ls_extirq_probe(struct platform_device *pdev)
 {
 	struct irq_domain *domain, *parent_domain;
@@ -209,7 +214,7 @@ static int ls_extirq_probe(struct platform_device *pdev)
 	if (!domain)
 		return dev_err_probe(dev, -ENOMEM, "Failed to add IRQ domain\n");
 
-	return 0;
+	return devm_add_action_or_reset(dev, ls_extirq_remove_domain, domain);
 }
 
 static const struct of_device_id ls_extirq_dt_ids[] = {

-- 
2.43.0


