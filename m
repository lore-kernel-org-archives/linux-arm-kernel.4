Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D01A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WRvikJ8c;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xfxevGJZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ku14Tz46TuTtJ1EhMyeHXoEtmOlUZzn240TsfezwQUI=; b=WRvikJ8cbw0+OU
	A/IDGXQ6l2BMPNC9F95eeJHZTmWVKxIurskKwguS8ds29lq8D/HiiCvHM9d1mGx7kifGjcKSlOXZK
	B/JJ15lv6yEElNzUZCwNDeaDSnullx+tGEcyKh2k+V/wFBdHfYjHl9ZCscHTjX4VsVf063G7ryEXE
	Tfdrl/WP7tRKGRndANcmWmqakGc0FkVTgaAUQyvcfVLkItGHE5L+aE6jcQRK1Dr855/ESjhWedEgN
	nD7URvXUiyV+g5iAUVfqvglMmkYFX439fquufiE2hfkXPt/qgx/S8N9P9zgV1vYKu36plHU7NygtF
	vInImXwP13Ivj6GdysRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuiw-0000000G0E0-02VP;
	Fri, 27 Nov 2026 12:06:42 +0000
Received: from out-40.mta0.migadu.com ([2001:41d0:1004:224b::28] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuij-0000000G08G-2dma
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:06:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rOgSkdivV16y0OtLZahaCadDyr2dew92S4kqD2VOpo8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781186; v=1; x=1796385986;
 b=xfxevGJZrsmswq0apadRjAM46BFCNeKzJOt267M0+p44fNyK5TyCyiOnaWPP6RFctaERxeWh
 DuEzI9RN5BEPqXJqb5fqvMrTcoLY56ak5n9baIBYb6lgz6q36BFziToyeetXpZSqzBIwb13NVfr
 TAuhHWRMLKdIYMJfOUhLYtr4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5640ad402cc0b5a6;
	Fri, 27 Nov 2026 12:06:26 +0000
X-Mizu-Trace-ID: 5640ad402cc0b5a6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 3/5] irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
Date: Fri, 27 Nov 2026 12:06:21 +0000
Message-ID: <20261127120623.891129-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120623.891129-1-fuad.tabba@linux.dev>
References: <20261127120623.891129-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040634_337045_2A676494 
X-CRM114-Status: GOOD (  10.02  )
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

Commit e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
dropped the ALIGN() of the ITT address in MAPD, on the premise that the
ITT pool returns 256-byte aligned blocks. However, the pool's minimum
allocation order is get_order(ITS_ITT_ALIGN), which is 0, so its
granule is a single byte. An ITT whose size is not a multiple of 256
leaves the next device's ITT misaligned. MAPD drops the low bits of its
address, so that device's ITEs land on the previous device's ITT.
QEMU's emulated ITS has 12-byte ITEs, so two devices with 32 vectors
each are enough to hit it.

Create the pool with a granule of ITS_ITT_ALIGN.

Fixes: e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 6932dd0a02c42..5756ffe4ec13e 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5854,7 +5854,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
 	bool has_v4_1 = false;
 	int err;
 
-	itt_pool = gen_pool_create(get_order(ITS_ITT_ALIGN), -1);
+	itt_pool = gen_pool_create(ilog2(ITS_ITT_ALIGN), -1);
 	if (!itt_pool)
 		return -ENOMEM;
 
-- 
2.47.3


