Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39144606A680
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R5deZ0ot;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N6MBKZud
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=W7RwPOrM34RBS0W4DzG8D6rusWopzOWgRex6lMhtHNY=; b=R5deZ0otGFLPkjiOhSUJCKtm1Z
	Lw97V3OaBhw29JzQQz1UzLDh5wfzIJg5KuJwtXVGM0zAj+TRt0t0mltL0c9e/dW8PKmz1sgYL4gGC
	ReIVwpe92uLJjlzcEgbIs2ieF5BvDKUR1luUd4q6ejxqcrmIcCobb1WqqSqJetTD8D8HZMvhgT4B/
	HeDhqIyPT6lV/HjE1pC35M0TPXjguIC2XPZ9HCNW+gA9NcsMrtasLM/exTyKYyKrd8jbcNj0g5djN
	XLU9PPq+RiLp0ZlN8oJLdEl//19lCiBR8wzM1DXT2khgK1uwRWxhPEVp+lrph1TRoVo97RUl23/rw
	Gtl0HBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUo6r-0000000HVFA-3HZJ;
	Sat, 21 Nov 2026 16:38:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUo6o-0000000HVE5-2NVZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 16:38:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so22435645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 08:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279115; x=1795883915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7RwPOrM34RBS0W4DzG8D6rusWopzOWgRex6lMhtHNY=;
        b=N6MBKZudKfUM6trcjjbKCZJgS0PH3CG5Rfo2D3XOnxpcsTWcnAUVQxFE7wk22VlS2s
         h61aCoEIGJnLLyeqgCvJuPXPqJ2H9ujTpZ51ACgwgKgkOYzjW/Om3vQRQNPWpjq+O2ek
         fmuy58bPo8gU8fj7fh47cmvs1TMpRDDJJBXm8G1HXbH/2gKfsQwsrF7J8LaNJgOgmUdo
         Yu7tfvqLQcsN2FG/16xoYbCGjWQdU/CuMNlB5yL8eJDZH6/9PcCLnoFTOT8PalaqOjzK
         IptlFfk68jaADgPK+Fc7sFiCNThaW7iv++iRTWw0ttsgoE1YMUzVMXzZT4RuaJyCzo/K
         Q3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279115; x=1795883915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7RwPOrM34RBS0W4DzG8D6rusWopzOWgRex6lMhtHNY=;
        b=SiVQnXRU2ZQR5KCsoOYejNClHIUfgNF1rfXn8tDwZGqmSs1vUO/zAyEpRhdgMezA94
         Zu6V011454Zdo4Ne05luDtQqLvX10+jwRem8YbV2oEBmgPycUNDJqj7vDUVPnbXzHiA9
         6Plctvx+lrSoz3bGd+8ae1wv0O7c06/hswGwUwqco8ul7YKSNXZadb0+88yyyiok1iLZ
         hK6b4y1vZBTEaocaazs8b2RP6dqRycEy9YrvX5W1iGA6vqzygYK6iJS6VKFNTnWsFbt6
         C2nan5Q0dVKdO2GW5LPhf1jQ4Bcqd5jSE+Vl/s7BSY9rbpSOjLm9HBb3bObG2A4AkG4I
         C9gw==
X-Forwarded-Encrypted: i=1; AL+hErFu9Nwr9s5yLWl4cQ1F5+bEzmkxDPLQvAAP5WPT6FdC3Al47ArjAaRois3EyrMUX7oJAv1bmPBNVy5NhEUTevjc@lists.infradead.org
X-Gm-Message-State: APuU4Z/XNobp6Ou4HevmgZ51q6CzPhJ33Pq0L4bN1yV9c8xsXnk51kKQ
	OXwCVT5e06HA4aFajxlaihGYhTaXGcj2jyh6SzdM/94ae4OCY8QblW9S
X-Gm-Gg: AZFdTZdXqNco/ONuOTd8+sdOrPVtoK371ddCoOXseZZZ2loaTe+75uHb2CFz6YFvRjp
	Iz/2WbHr2g9ojMfR4l0WgKfNlNkdmRzAH+0+/JZ4g9bxgVRRn0J8GEu8DC5gj9SEhIr+zfxKr9S
	mhVQOAwI5sQZm+iVZIuTKfmauRH+5UeAx6cZ+uznDJ8JlhjLv9zntKfHdYUzdoBF95fl31rCaq7
	OWJLmSWCU4ziIXhx86coqwblN4fYcLw3/x51s9PNB7z3sX4/DnPCd3jRRfppqPf9aFkTiSc1/oS
	HMTmuZXUDWfIwMb3KgWoWIrfwTwQS4eZHuEKKPyV9DrKtBZMfGlG7aLZxSIt7NWiFAuPOojYRKa
	6RguHbwV/plO32oJWfkUJvZFlmXMZNFFmXgn9r+rSzB5n9fMAHOSXlgzugtDW5pvEaAUnBr5Gv3
	EpEaieIv8QqaAwfLYyXfp6FArSYfe85uRmA8EcoKTeKGn6PjmoOndgJmIHBNNI/acpqFFY9U71R
	huix3qMYZu5Dql2WFWBHuXSgX7wFvHNbgOn7mrudIA8j411apJ5bo29X4ut11/UXgB4Dwbtt/cs
	1F7EBLVHr4+dE+WIyfTB7S3lcamKxStWsBtIjWRx/7YDkKOJJawbi2B7C0FPyptZbiAhASqP
X-Received: by 2002:a05:600c:4585:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb8881b8e4mr148088995e9.17.1795279115254;
        Sat, 21 Nov 2026 08:38:35 -0800 (PST)
Received: from localhost-live.home.vlan10 (053da81f.dynamic.tele-ag.de. [5.61.168.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm313834635e9.13.2026.11.21.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:38:34 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Radu Rendec <radu@rendec.net>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH] irqchip/irq-bcm2712-mip: Drop MSI_CHIP_FLAG_SET_ACK
Date: Sat, 21 Nov 2026 16:38:09 +0000
Message-ID: <20261121163809.86620-1-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_083838_615764_46A097AC 
X-CRM114-Status: GOOD (  13.15  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit f35508b93a2f ("irqchip/irq-bcm2712-mip: Set EOI/ACK flags in
msi_parent_ops") made the PCI MSI device chips ack through
irq_chip_ack_parent(). Neither the MIP middle chip nor the GIC below it
implements irq_ack, so any ack is a NULL pointer call.

The MIP vectors are handled by handle_fasteoi_irq(), which never acks,
so this only shows when mask_ack_irq() runs, e.g. when a chained
handler is removed. The RP1 driver does that on every teardown since
commit 82aa033fef52 ("misc: rp1: clear chained IRQ handlers on
teardown"), and the kernel panics:

  pc : 0x0
  lr : irq_chip_ack_parent+0x1c/0x28
  Call trace:
   __irq_do_set_handler+0x248/0x24c
   irq_set_chained_handler_and_data+0x6c/0x94
   rp1_unregister_interrupts+0x3c/0xa8

The MIP hierarchy has no use for an ack, like the drivers fixed by
commit fb0ea6e4878a ("irqchip: Drop MSI_CHIP_FLAG_SET_ACK from
unsuspecting MSI drivers").

Fixes: f35508b93a2f ("irqchip/irq-bcm2712-mip: Set EOI/ACK flags in msi_parent_ops")
Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
The panic was reported on BCM2712 with 6.18.61 and later when the
rp1_pci probe fails (https://github.com/openwrt/openwrt/pull/26530#issuecomment-6975561491).
Tested on a Raspberry Pi CM5 with 6.18.64 and the Raspberry Pi
downstream patches: with this patch, unbinding and binding rp1_pci
again completes without a panic. Applies unchanged to v7.4-rc3 and
builds there without warnings (W=1, GCC 13 and clang 18).

 drivers/irqchip/irq-bcm2712-mip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm2712-mip.c
index 06a6ab627..12d9e3846 100644
--- a/drivers/irqchip/irq-bcm2712-mip.c
+++ b/drivers/irqchip/irq-bcm2712-mip.c
@@ -163,7 +163,7 @@ static const struct irq_domain_ops mip_middle_domain_ops = {
 static const struct msi_parent_ops mip_msi_parent_ops = {
 	.supported_flags	= MIP_MSI_FLAGS_SUPPORTED,
 	.required_flags		= MIP_MSI_FLAGS_REQUIRED,
-	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI,
 	.bus_select_token       = DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PCI_MSI,
 	.prefix			= "MIP-MSI-",
-- 
2.43.0


