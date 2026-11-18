Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91A5606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=do5sb8CI;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N44mC8Jw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2IxC+XM4oIYxXWzVaO3Gu7vxMttrpE6a/6RE2B/WJPw=; b=do5sb8CI9epYWz
	OWFHGmcKAw2JYnaiPwafiricg/PSbb3vrC+Uqehq47s27ceeArofgqgi9o4i6St6CH+/npjc+T/HI
	vO41n3UHjKNSh7L7vGFDvJN1mnCP52c+sM2Npj5O69IaCzpmJrSF33O0rBeOkongtJxdTxGmwANfT
	XlvCl6hUHRMCraRssXLLmgWNRMpmMb/GWUpA+QfWL8CTeydy0w+lFtipgSD9rZfQHiU1Qpz92WtJe
	v1OXwA/yxYSaB4EXMFgxPh6DlqKCGDC/fCY7oucIkutC0RjPKHYSwIalr/Hs8cbMM3DUsJ1EgErCL
	JTbdWfTTl9PEPNXgfAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjaV-00000009nF7-2xMV;
	Wed, 18 Nov 2026 17:36:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZy-00000009mpN-1F9j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:36:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7A2D175A;
	Wed, 18 Nov 2026 09:36:14 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F7973F632;
	Wed, 18 Nov 2026 09:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023377; bh=sLa7wg3rPB1Xeg6t7G2lvSPsg2On2na6nvRV2ihgGeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N44mC8JwmRSbR5Hxgxkgs29edX0a0C8C5lilWNsh7ROyg32FMr782DE4qXjOp0iZL
	 CJxysKb1KY+0jFw4KSwydBLiSlJxK4+EhORa7bJ2ERpuGOug/iXPovUeaxBbfqg3Wq
	 NP/tEvLS/WSrmcn+153qho6pRbtm5EfxUVpOG0I8=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:41 +0000
Subject: [PATCH v3 12/14] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com>
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
X-CRM114-CacheID: sfid-20261118_093618_383694_39F273FB 
X-CRM114-Status: GOOD (  12.45  )
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

Device registration publishes a DTE pointing to the new ITT before
invalidating the ITS device cache. If invalidation times out, clearing
the DTE in memory does not guarantee that the ITS has discarded a
cached reference to the ITT, and hence the hardware could still try
and access the memory. Freeing the ITT on that path can therefore
leave the ITS accessing memory that has been reallocated.

Device teardown has the same problem: it frees the ITT even when the
invalidation issued after clearing the DTE fails to complete in the
specified timeout.

Retain the ITT on either failure path. Continue returning the
invalidation error, and free the ITT during teardown only after
successful completion. This deliberately retains memory on hardware
failure because a timeout does not cancel the operation or establish
that cached references are gone.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v5-its.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index db13011ef6d93..cfa86aa68bf3c 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -540,8 +540,8 @@ static int gicv5_its_device_register(struct gicv5_its_chip_data *its,
 
 	ret = gicv5_its_device_cache_inv(its, its_dev);
 	if (ret) {
+		/* The ITS may still have a cached reference to the ITT. */
 		its_write_table_entry(its, dte, 0);
-		gicv5_its_free_itt(its_dev);
 		return ret;
 	}
 
@@ -570,7 +570,9 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 	its_write_table_entry(its, dte, 0);
 
 	ret = gicv5_its_device_cache_inv(its, its_dev);
-	gicv5_its_free_itt(its_dev);
+	/* Only release the ITT once the ITS has discarded its references. */
+	if (!ret)
+		gicv5_its_free_itt(its_dev);
 
 	return ret;
 }

-- 
2.34.1


