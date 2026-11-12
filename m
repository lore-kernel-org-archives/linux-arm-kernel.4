Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC6B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jo5ffaxg;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Mc7sHSCI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sfLHcWpnq20caHJHCxxcMBF8FhCQ66tT+/gp4ILq9r0=; b=jo5ffaxgkXMIXGVM36+7zaF3x6
	37a35RrORblK5FNEHAFii831jjVp+wqFD7rQeW9UKE0r8PbN35K1tafdvhC+q9L6+ohASWE2PgWJl
	bbUb4rQX1f+I/tkPt1CT50fUUJ9zO621fxPYalluZvvL68H04lPxNhgYmd+cACcy97+V8/ptkIrjU
	jg6c5s1NPVc3FkBxhR6D901Nryjj106T24wr1bdmWntIitJR2nVtC5aqdr+oKyJZuyfGs5CItUIXq
	4iYipNYqrLCpKbdvyIJmOEypbAzIpd0VtSBj2qMGLx0LyTObEX5ioCrk6zQDhTjDx206yr5klgvR5
	PwVMXgOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTRd-00000009ndz-3HZX;
	Thu, 12 Nov 2026 11:58:21 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTRb-00000009ndW-1cQK;
	Thu, 12 Nov 2026 11:58:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76D18A0064;
	Thu, 12 Nov 2026 12:58:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794484695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=sfLHcWpnq20caHJHCxxcMBF8FhCQ66tT+/gp4ILq9r0=;
	b=Mc7sHSCI2CgJp4mgP7GG45uP/g/da4TRVl3aPYcP384KJOcb7Z0uaFPXLfv6M19OeX0Z2q
	SMMcfT9PUOvLXXI/hF276MyJc9jjklZNvnvlPksAWcQUAQN7h5IyIUEr+6OxC7SPig7h+q
	rTVTs/6uOCMcTxNBZeasPHEzpRoc+sddLfYBGplDIr/tPkBs7z6rPdjzsCRLZf4ZtyMLZj
	C2iZMrz1M/by+q4+wusT1MmDDrXVvAunoKdHRZHf4qdefAmnxF8qINQ3LaEE+1+cpBCLca
	u+ZD8HBtp61/PWhgxqdEqfeSUwDNtcdqlE/G27Ng7WvFdGDMzj4N+pCRFHaAkA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Thu, 12 Nov 2026 12:58:11 +0100
Subject: [PATCH] irqchip/bcm2712-mip: Fix multi-MSI allocation for
 non-power-of-two counts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-bcm2712-mip-msi-align-v1-1-68090868c979@tipi-net.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZOS/QRGiZrzJ22Go2I7YbjYow9
 u5WPX6H/9/BpKgYnJsdirzUdM0V1DYQr2NeBPVSDezYE7mAU0wciDHphskUx7suGb0/8Rxi5x1
 1UNutyKzv37cf/rbndJP4+M7gOD7j2DNjeQAAAA==
X-Change-ID: 20261107-bcm2712-mip-msi-align-6632f7c96019
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stanimir Varbanov <svarbanov@suse.de>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_035819_589788_F0F86FAB 
X-CRM114-Status: GOOD (  15.35  )
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

ilog2() rounds down, so a request for three vectors reserves only two
slots and the third can overlap another allocation. The alignment is
also applied to the bitmap index and ignores the msi_offset that is
added to the message data.

Reserve exactly the requested number of slots and align the start of
the message data block to the vector count rounded up to a power of
two.

Fixes: 32c6c054661a ("irqchip: Add Broadcom BCM2712 MSI-X interrupt controller")
Cc: stable@vger.kernel.org
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
Found this while working on a series that uses all 20 MIP1 outputs on
BCM2712. Even though I can reproduce this on a custom Raspberry Pi CM5
based board, I'm not aware of any bug reports regarding this (yet).

The fix has been tested on Raspberry Pi CM5.
---
 drivers/irqchip/irq-bcm2712-mip.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm2712-mip.c
index 06a6ab6270ad3..a0f45df0e4c87 100644
--- a/drivers/irqchip/irq-bcm2712-mip.c
+++ b/drivers/irqchip/irq-bcm2712-mip.c
@@ -71,15 +71,24 @@ static struct irq_chip mip_middle_irq_chip = {
 
 static int mip_alloc_hwirq(struct mip_priv *mip, unsigned int nr_irqs)
 {
+	unsigned long hwirq;
+
 	guard(spinlock)(&mip->lock);
-	return bitmap_find_free_region(mip->bitmap, mip->num_msis, ilog2(nr_irqs));
+	hwirq = bitmap_find_next_zero_area_off(mip->bitmap, mip->num_msis, 0,
+					       nr_irqs, roundup_pow_of_two(nr_irqs) - 1,
+					       mip->msi_offset);
+	if (hwirq >= mip->num_msis)
+		return -ENOSPC;
+
+	bitmap_set(mip->bitmap, hwirq, nr_irqs);
+	return hwirq;
 }
 
 static void mip_free_hwirq(struct mip_priv *mip, unsigned int hwirq,
 			   unsigned int nr_irqs)
 {
 	guard(spinlock)(&mip->lock);
-	bitmap_release_region(mip->bitmap, hwirq, ilog2(nr_irqs));
+	bitmap_clear(mip->bitmap, hwirq, nr_irqs);
 }
 
 static int mip_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,

---
base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
change-id: 20261107-bcm2712-mip-msi-align-6632f7c96019

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>


