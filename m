Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xjzJvluH;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QX3F+Vzy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SMSogha4JmnSjGt+CAW8t4lsMFrLPPJEQVNhzcJN1kg=; b=xjzJvluHqgFyjW
	M9u+NNBky+C+B1Otif2Mm5TUyUNir5deQP8jYgMIkcFgilBR2l60X2mfF/ilUWKFyrmClMROFoMO0
	ziE9PZj4ihNrGiLYlE6e15HPCKdhfEJ4R5LS2pEsxR4YOJthL5EfX1PwoPydR9Yb6NoV7kmhVqDl2
	lIUAA/wqpEnl6nH2P8Ysiz96SxdwehcftyE1M58VGXn+YWLhxdWuZFZcSKrSy62naEMlkMb2EBPZE
	n/pqygYRwOEjlyJ/8Jl2RP4Kv/FcHkd9B1KfJ9Cm5xxt0EsgDwkoi6JU+opuuajC7UN+MiYKmYSWP
	pveeJ2nkiVJ3gkR9w7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWECn-0000000AD8R-1e2G;
	Wed, 25 Nov 2026 14:42:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEB8-0000000ACBY-1Xxr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:41:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 251991C00;
	Wed, 25 Nov 2026 06:40:54 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A2C23F632;
	Wed, 25 Nov 2026 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617657; bh=/9AiJma5tBJHN6uAi+hEyWMtZ9lFT3cZO6KP2ELOVJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QX3F+VzyPlP++saPPVMqnI54TDQVGLIF/tn2MUVbQRCR7VkdKYFbYzYlkVesNe9i+
	 0qYiE/8CKOKxEb30t2sDp72+GmhgY/3JXgwqf/RoyMAQSwdkJKvBTThgM2PuIVXUmf
	 h4roxROpQSunNCpxbsFeMxhB2UXRkPUtVYri30To=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:34 +0000
Subject: [PATCH v4 12/13] irqchip/gic-v5: Clean a level 2 device table
 before making it valid
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-host_gicv5_fixes-v4-12-0469743c47d8@arm.com>
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
X-CRM114-CacheID: sfid-20261125_064058_592705_3F014916 
X-CRM114-Status: GOOD (  11.58  )
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

From: Fuad Tabba <fuad.tabba@linux.dev>

gicv5_its_alloc_l2_devtab() allocates a zeroed level 2 device table and
writes the level 1 DTE that points to it with VALID set. Unlike the
other ITS tables, the new table isn't cleaned to the PoC first. On a
non-coherent ITS, the zeroes can still sit in the CPU caches when the
ITS reads the table, so it can take stale memory as a valid level 2 DTE
for a DeviceID that nothing has registered.

Clean the table before the level 1 DTE is written.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 37835d1600fb..959277c74b68 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -433,6 +433,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
 	if (!l2devtab)
 		return -ENOMEM;
 
+	gicv5_its_dcache_clean(its, l2devtab, BIT(span) * sizeof(*l2devtab));
+
 	its->devtab_cfgr.l2.l2ptrs[l1_index] = l2devtab;
 
 	l1dte = FIELD_PREP(GICV5_DTL1E_SPAN, span)			|

-- 
2.34.1


