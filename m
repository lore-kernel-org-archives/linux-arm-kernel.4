Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C219606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FGVhgCHk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ny4JfpmN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NRnWJRy5OZoGWnZZjBJ8XtvBGGIF/0syqYZSB2DkB98=; b=FGVhgCHk1fsxEY
	k/0Md/OvnHPxOd6a+wNcKsVzgxv4h9PtZJKagnxsd5DTmoaA40YzOv8gUqE2cgoF0CK6yVmlc3k/g
	n9wvEcodEZqyrX89mRxTOUABf6z/BUwq13mb3bcpUaGvkOH+W/fuxsv1CoMvE0WmW093aRxqAxNXV
	5KPD5DPfXnAxZfYO3Sdtid56uBOFfyOsDq0FGyHF0CljlW1c1PDGPJfWchpvPOzv7Yv6Vv0Fy74Fh
	7/DtA+wWEEF3VXJA7JjLooYdNILbP2BGTdO0/PPj0QKzTfcCJ5tXQ/seanIhUbXbUcG3uQYhAEFFw
	6d0M4xwkjoD+bHPM8Uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEB7-0000000ACAi-2IXa;
	Wed, 25 Nov 2026 14:40:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEAy-0000000AC3I-2vWi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:40:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 715C81BCA;
	Wed, 25 Nov 2026 06:40:45 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D64A33FA7A;
	Wed, 25 Nov 2026 06:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617648; bh=0yoQwIc6dd+KsACgxSIpHNRylt0YTx0b2RXO38cnf4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ny4JfpmNNcYYQTe7GDn/+DbU3stRClLnCjvlgQbF9mRUdxLx60kHAdmYKjujSPEN1
	 Nvc5JV2F7uir3wMrZbxXnsFaLWve/4Z2Jtb0bBkbT/P8tVuco3wwiahmEMSBxjM/Gs
	 5lNtm1sYWloIiKvyoob6M0HAu775XkVRf+nhVms4=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:29 +0000
Subject: [PATCH v4 07/13] irqchip/gic-v5: Use firmware node name in ITS
 warning
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-host_gicv5_fixes-v4-7-0469743c47d8@arm.com>
References: <20261125-host_gicv5_fixes-v4-0-0469743c47d8@arm.com>
In-Reply-To: <20261125-host_gicv5_fixes-v4-0-0469743c47d8@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fuad Tabba <fuad.tabba@linux.dev>, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064048_809672_18D2C212 
X-CRM114-Status: GOOD (  12.44  )
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

The common ITS initialiser can be called with an ACPI firmware node.
If firmware leaves the ITS enabled, the warning dereferences the DT
node pointer, which is NULL on that path.

Use the firmware node name for the warning and drop the DT-only
pointer.

Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 9e8077dada5e..876437017ccc 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1109,7 +1109,6 @@ static int gicv5_its_init_domain(struct gicv5_its_chip_data *its, struct irq_dom
 static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_handle *handle,
 				       struct irq_domain *parent_domain, bool noncoherent)
 {
-	struct device_node *np = to_of_node(handle);
 	struct gicv5_its_chip_data *its_node;
 	u32 cr0, cr1;
 	bool enabled;
@@ -1129,7 +1128,8 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 
 	cr0 = its_readl_relaxed(its_node, GICV5_ITS_CR0);
 	enabled = FIELD_GET(GICV5_ITS_CR0_ITSEN, cr0);
-	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n", np->full_name)) {
+	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n",
+		 fwnode_get_name(handle))) {
 		ret = gicv5_its_disable(its_node);
 		if (ret)
 			goto out_free_node;

-- 
2.34.1


