Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3984660A263B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V2Q2KrNR;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=F98UCwi9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5fkeFCaDG41DZYF7IvV8UUkr7pM8RaBUzj0UR3hY470=; b=V2Q2KrNRdNozAl
	HZRYgfvVJX9VyTOdVICX3QgiXp1Dgqi7hvm7vgRQjUH0eRncr1cva70wTKm/280Our/bzNp31AayG
	dJiEfVyZ45GGul/m4JOX1jdLIZPB5R3rUuvPPyT5fI7E7/xe599Z0sKkkU0mNXMpy7dUkzmfvA2WF
	nkQaHireUyHG86Ju/TL9Y1htu9KP4GHygrpRw8czJMxvwmMqvs2qLdJKhHNdaKdA8fw6pGzxkuVRq
	CfqMJHG4FBUw9BAAj+Vm2XhMd07IPQS/jBqCFx/wwgnx/kx6nOG2O8rfEY10FDxpDFsL3P3Ry07G8
	tFQYleYR7rEC1WI76ioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZq-00000009mgc-40LM;
	Wed, 18 Nov 2026 17:36:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZi-00000009mbY-1X2K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:36:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8516D1596;
	Wed, 18 Nov 2026 09:35:58 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C37F23F632;
	Wed, 18 Nov 2026 09:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023361; bh=40kNhZdUlRxGoDSPD1exXdec4Ru2AT99R7S68imoT9I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F98UCwi9GcfyhsAfsZmrYLeyUHQ8S69KHl7noWpv8Kw/2DpQ8G87TCrGWROF4i7Xt
	 iYrGehei+uAj2snutjWxOjcB/j7ZEhqc/EXGuU87RZzffKa9CgAtnEF9MI4j2RX3Rz
	 oOHmdZ5NPkBll0aglvD1ODL0e9DsVnfGW5R8XAsk=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:33 +0000
Subject: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
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
X-CRM114-CacheID: sfid-20261118_093602_469195_93B6008C 
X-CRM114-Status: GOOD (  12.79  )
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

If the IDLE poll after IRS_MAP_L2_ISTR times out, the mapping
operation has not been cancelled and could arguably still happen at a
later stage. Clearing the L1 entry and freeing the L2 IST can
therefore race with hardware completing the map and accessing the
freed table.

Retain the L1 entry and L2 IST on failure. Reject a subsequent
allocation that finds a nonzero but invalid L1 entry, so it cannot
overwrite the entry while the earlier mapping may still be
pending. Mark the retained table as intentional for kmemleak on both
success and failure.

Fixes: 0f01013258768 ("irqchip/gic-v5: Add GICv5 LPI/IPI support")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v5-irs.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index ead76560ea08f..78deb46baa784 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
 	if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
 		return 0;
 
+	/* A previous map timed out; do not overwrite its pending L1 entry. */
+	if (READ_ONCE(l1ist[index]))
+		return -EBUSY;
+
 	l2ist = kzalloc(l2size, GFP_KERNEL);
 	if (!l2ist)
 		return -ENOMEM;
@@ -235,13 +239,11 @@ int gicv5_irs_iste_alloc(const u32 lpi)
 	l2istr = FIELD_PREP(GICV5_IRS_MAP_L2_ISTR_ID, lpi);
 	irs_writel_relaxed(irs_data, l2istr, GICV5_IRS_MAP_L2_ISTR);
 
+	/* The map cannot be cancelled, so retain the table even on timeout. */
+	kmemleak_ignore(l2ist);
 	ret = gicv5_irs_ist_synchronise(irs_data);
-	if (ret) {
-		l1ist[index] = 0;
-		kfree(l2ist);
+	if (ret)
 		return ret;
-	}
-	kmemleak_ignore(l2ist);
 
 	/*
 	 * Make sure we invalidate the cache line pulled before the IRS

-- 
2.34.1


