Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4228060A2602
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f22Ggfgl;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DOhzPM0y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OygdrmFY09KvJCoOLe6f0ni4hy8AuKmct+wdRcMH4GY=; b=f22GgfglrhcClc
	Xbya/wQde10SfWH1pUtlOvlSl5v3TVVzyb2+HiE4Nb+yigHABCZnAFI+3UVgWvgQimBh0CFAfEn/8
	49o8cBGK+1SfI9spBR8IJJffS1/CfStBI1jB7fl06a+5v1BjHqft6x6mzFVhkPwgD5eCL/g7Wqg9W
	a6im2UGhw54edAw9XAp9FJCpSj2qMA/TMWJAOUlFpspOnc11Vo3wWs1WRO+LOBhanXzqONwRZoN8e
	by2M8jwq1CV/J5MW5DPE9KfUmN3vhFMaje0aQva395Ehz5h1yCQ+UBM40cNyz8YUUNx9VbCc69TMm
	8yJGgD96nsAPIbvHQEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZr-00000009miV-2qH8;
	Wed, 18 Nov 2026 17:36:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZo-00000009meH-2jNx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:36:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9C921655;
	Wed, 18 Nov 2026 09:36:04 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 022913F632;
	Wed, 18 Nov 2026 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023367; bh=upgto9NrOT43Megv54sEqbwgn9RKS4Z2UQH6+PLVkvs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DOhzPM0ybgoMSi6cHvxYUpGm9ZqevR9GJS9Er7CPwy0gKh0Qt0Q9IKuBwXGM59TPr
	 733yPvUUG53upfW003994Rk/5xSFE0VY2vWc86/KyF6eeHOeX5Vp0vHX4H2YljJvtQ
	 nH+9weJI37W/i612puXE6F3wHERYbU0ErQ4F/qRI=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:36 +0000
Subject: [PATCH v3 07/14] irqchip/gic-v5: Honour ACPI ITS noncoherent flag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-host_gicv5_fixes-v3-7-13c1859e8aa3@arm.com>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
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
X-CRM114-CacheID: sfid-20261118_093608_748434_8457EF2B 
X-CRM114-Status: GOOD (  12.14  )
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
index 5f9fa80ea6aa6..9e8077dada5ef 100644
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


