Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E215F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eif2O08N;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=usDx2SXs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aVb1PLs+TxasDtfaL7ziCenkQAm6flyH0SSnHwDVW0E=; b=Eif2O08NHezkD/
	iJ3klFBwMUPePkXtCCj0DcsELD1GILTEK9hWqXBmNH+NEbM70Q3aRWQsO3FaWQH13U0fMYXriC26t
	zg21a9MuPLMgJBgZq3njSR/qQV/ZizKMm4jKuUIGKuOyveeZS5/7yWf2cTniPLszPP5Q/IanmukYR
	6YtC1WfPPA/1hd/pL2Skex6kkMS43w6ZVl23o/Ew6aOd8uS/u3BLoOT58xnt2BwAWOwePJUWWS8E/
	VCmAfVTL1hztcZZY1H8iO9zepOSoh3lkH2r70UOuK9oLFbPUyHswnx8Y9qItJWavA5L6uKxRvCpV5
	94nVnC06HcVngycQ9RTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEB8-0000000ACBz-1Hx4;
	Wed, 25 Nov 2026 14:40:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEB4-0000000AC7J-1SXO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:40:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A60D21BF3;
	Wed, 25 Nov 2026 06:40:50 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15C1B3F632;
	Wed, 25 Nov 2026 06:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617653; bh=RKui/rQSOjHQatfegtez/VOcvA/uhjJnfqpZvOVJLuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=usDx2SXsXp1iOaH+sROfeuCydVBQN5rWsJClWx2Uq8aMINVhtbbeqlv3tV/N6WcMx
	 V2wbxieV2hlqZ1Zt5y9kZfYJz0+/r/MmG6YKVGUy/QKPISnTEQNNl83oEGB61+akr7
	 l0+h+nyK2NrYnt+vNfxN+XhpwIg5WTyg0g1Eo6xo=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:32 +0000
Subject: [PATCH v4 10/13] irqchip/gic-v5: Release ITS MMIO region on DT
 probe failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-host_gicv5_fixes-v4-10-0469743c47d8@arm.com>
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
X-CRM114-CacheID: sfid-20261125_064054_443775_91B8D385 
X-CRM114-Status: GOOD (  10.49  )
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

of_io_request_and_map() reserves the ITS configuration frame region.
If ITS initialisation fails after mapping it, the error path only
unmaps the registers and leaves the region reserved.

Keep the resource description and release the region on that path.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5-its.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index e7db4449fe91..db13011ef6d9 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1188,6 +1188,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 static int __init gicv5_its_init(struct device_node *node)
 {
 	void __iomem *its_base;
+	struct resource res;
 	int ret, idx;
 
 	idx = of_property_match_string(node, "reg-names", "ns-config");
@@ -1196,6 +1197,11 @@ static int __init gicv5_its_init(struct device_node *node)
 		return -ENODEV;
 	}
 
+	/* Save the region to release if ITS setup fails after mapping it. */
+	ret = of_address_to_resource(node, idx, &res);
+	if (ret)
+		return ret;
+
 	its_base = of_io_request_and_map(node, idx, of_node_full_name(node));
 	if (IS_ERR(its_base)) {
 		pr_err("%pOF: unable to map GICv5 ITS_CONFIG_FRAME\n", node);
@@ -1212,6 +1218,7 @@ static int __init gicv5_its_init(struct device_node *node)
 
 out_unmap:
 	iounmap(its_base);
+	release_mem_region(res.start, resource_size(&res));
 	return ret;
 }
 

-- 
2.34.1


