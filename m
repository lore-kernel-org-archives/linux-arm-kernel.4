Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F05606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K6f1uzku;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AStYBrKO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NvMYVT9tNpa/axhZRuSXNm0zbETz710r1hPKh+kJCW0=; b=K6f1uzku0lFFkJ
	+1YBVJSFmvozn54HbOj52L1GWqoBfnUP5U8cECZHbGT/1RKookrTs5y60+f7GSMbywG2ScMVS6s1J
	uwNYz/zqiwRTGBCJ4DdyyRDhMUC0WevLFqwdsBZYGdQilajuqaO0cNm7UgL/LaQuohjmZDQ+aZ0e1
	1dMYgPQQYgAnbtYyoMn2Ks7Nztx4Xdj9SHAlNyHU2UDn5u6eAvPOXD8ktmZzSDZhnZA6jQNPShUpr
	/js/1yds9FhVmxKtCR8oEDmUr+0/bS74mQeZZ/7vXnUBl9fEj79n5Mveg4JZWnJ2nWb+c1LR3Z5ej
	Bv2S0+ed5cu1Rr3Ukw5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEB7-0000000ACAE-0va0;
	Wed, 25 Nov 2026 14:40:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEAx-0000000AC4S-1kxg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:40:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1BE81BCB;
	Wed, 25 Nov 2026 06:40:43 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 228F23F632;
	Wed, 25 Nov 2026 06:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617646; bh=HvYUdu8Ajz2Mxhtj7IToMSBjU1wmW4YvcJ22mLoSSFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AStYBrKOPhWI3m5OXPZ5Lou6PZJ+MLxZ7Rqd9Cycp962DX9OrPX6vjFNIz06dIn/o
	 pqNcVPx8EZEnLirv/YYS9Xqj7RKZh5yGfQdof0TaeRV6mjMHy7CRr4QxIPbAslL/6I
	 Wf9c1R+v8Zf/ZomW5Dod+isCmlo3gnrj6alWMPA8=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:28 +0000
Subject: [PATCH v4 06/13] irqchip/gic-v5: Honour ACPI ITS noncoherent flag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-host_gicv5_fixes-v4-6-0469743c47d8@arm.com>
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
X-CRM114-CacheID: sfid-20261125_064048_067982_CD91D306 
X-CRM114-Status: GOOD (  12.37  )
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

The ACPI ITS probe passes its noncoherent flag to
gicv5_its_init_bases(), but the common initializer checks a DT
property instead. For an ACPI ITS, this always selects coherent cache
settings and skips the cache maintenance required for its tables.

Use the noncoherent argument, which both firmware paths already
supply.

Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 5f9fa80ea6aa..9e8077dada5e 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1135,7 +1135,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 			goto out_free_node;
 	}
 
-	if (of_property_read_bool(np, "dma-noncoherent")) {
+	if (noncoherent) {
 		/*
 		 * A non-coherent ITS implies that some cache levels cannot be
 		 * used coherently by the cores and GIC. Our only option is to mark

-- 
2.34.1


