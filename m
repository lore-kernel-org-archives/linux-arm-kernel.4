Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E926606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c24IR3Ve;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RT2tYONm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UFIBjGWnu7kUv1HS0pe9AtlRnGt7OnF4wenQyP+Eucs=; b=c24IR3VeR6vvBc
	4gZMCPeKq4dmTbctEeRvU8i4NZgZliYeXFj63IHQSNDEh6Cu+NwLJkGh0MbKzskJy9xbIGRVWpNTS
	vPumvucN44DuRijIMCo1I0/GjHkqgrleyvAQ3T1I4Gzf65/W7p0D/0YGb5DFRCPO1asGmo6Ha1d75
	2N9Lm6Ip7Xvh80mhnw5X88gnQEaHjyGm2dAXrfTANcWCf6QIEsU7ulv6VrhcsdosUUs5xd9YjAkW8
	wurvK2RyzuLQyRUcEy7KEKIy7FLIIYicjXcTVWn/4bUYahY6hViJitJGanUTVUAOP2UFyNQ+fu33s
	6J5w98T/hLin4v5TBbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjaV-00000009nE4-0nZb;
	Wed, 18 Nov 2026 17:36:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZs-00000009mjm-2Uz3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:36:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5A111596;
	Wed, 18 Nov 2026 09:36:08 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DF113F632;
	Wed, 18 Nov 2026 09:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023371; bh=nEQtFOIdNM+BVYEiFqeLIqurLRXANKzdtjAsgB1fOsY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RT2tYONmSgICU7pi0B8KTkzM3YOliLTMjJf3qys7j6z1iAkb1fWI146+KQWeaNs5J
	 hcnMXoGtL87YTj8iEJZsgxB1++m/C/sTM0MaN5K2EvNu1sccXuIeJZYJ0a2KTWrME0
	 Xcqf6oHDdm/pyeaq/M0L0ITbsB+xJFdqL8OnIDPY=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:38 +0000
Subject: [PATCH v3 09/14] irqchip/gic-v5: Invalidate ITS device cache
 before freeing ITT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-host_gicv5_fixes-v3-9-13c1859e8aa3@arm.com>
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
X-CRM114-CacheID: sfid-20261118_093612_741136_D8D7D21B 
X-CRM114-Status: GOOD (  12.84  )
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

A cached device table entry can still reference the ITT after its
memory is freed via kfree(), even if the DTE has been marked as
invalid. Once the memory has been released, it could be reallocated,
and it would be unfortunate for the hardware to interpret this as a
valid ITT.

Invalidate the device cache and wait for completion before freeing the
ITT during device teardown.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 876437017ccc5..dce5bfd1a78dd 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -556,6 +556,7 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 				       struct gicv5_its_dev *its_dev)
 {
 	__le64 *dte;
+	int ret;
 
 	dte = gicv5_its_devtab_get_dte_ref(its, its_dev->device_id, false);
 
@@ -568,9 +569,10 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 	/* Zero everything - make it clear that this is an invalid entry */
 	its_write_table_entry(its, dte, 0);
 
+	ret = gicv5_its_device_cache_inv(its, its_dev);
 	gicv5_its_free_itt(its_dev);
 
-	return gicv5_its_device_cache_inv(its, its_dev);
+	return ret;
 }
 
 /*

-- 
2.34.1


