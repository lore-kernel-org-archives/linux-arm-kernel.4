Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7B3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cqgHMuEX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/YX0PP4Zxh16j/BSheyi86NeF15fh1qBY+KjbTX1UYo=; b=cqgHMuEXw8Awo0
	44dnGlS1J7rFUiqQpWBOYdmrlG4PNfc3DSHrBCeNep946+2Ec98EKw+BN/qYcoJhRQCVnxLjaOLNB
	GOsMAZaHdCWM/1HHI33MlHveDL6DeRDLS6/9MPfGQyq7+b3ojt0JDT6B5RWU6ujjfaC+4/Zc+Se+l
	DJYlmX+Gxg8luDDl3qWsJFwOKBeTL7PqyiywBhIjs/1RrFI5oc4Q/TAk9tDk+WHk0PjH8rKwAYSjK
	uKTJS511tMn1PmYuFTWW2zz49EWqOIgNab2hdXP/p9wianz2GI9hHLvdJacYJWhhQMAhipKwVJfWz
	HYT+oDrxYOZP1TQzeMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQZA-0000000C24J-04Go;
	Thu, 26 Nov 2026 03:54:36 +0000
Received: from out28-218.mail.aliyun.com ([115.124.28.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQZ6-0000000C23B-12Kl;
	Thu, 26 Nov 2026 03:54:34 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1255369|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0101656-0.000535806-0.989299;FP=16590024859856888869|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045099153;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.kASpfNp_1795665264;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.kASpfNp_1795665264 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 11:54:29 +0800
From: Xiaolei Wang <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: rp1: use raw spinlock for gpio regmap
Date: Thu, 26 Nov 2026 03:54:19 +0000
Message-Id: <20261126035420.1836760-2-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126035420.1836760-1-wangxiaolei01@kaihong.com>
References: <20261126035420.1836760-1-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_195432_439167_5071EA3C 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The rp1 gpio irq_chip callbacks run in atomic context: irq_set_type()
is called with the irq descriptor's raw spinlock held, and the driver
itself also disables preemption/interrupts while accessing the GPIO
registers.  On PREEMPT_RT, however, the gpio regmap is created with the
default spinlock_t, which becomes a sleepable rt_spin_lock.  Writing a
register field from that atomic context therefore attempts to sleep and
triggers a "sleeping function called from invalid context" BUG.

This is reachable from ordinary userspace: requesting a GPIO line with
an edge trigger through the GPIO cdev ioctl ends up in irq_set_type(),
so any application using edge-detected GPIO lines hits it on an RT
kernel.

  Call trace:
   __might_resched
   rt_spin_lock
   regmap_lock_spinlock
   regmap_field_update_bits_base
   rp1_gpio_irq_set_type
   __irq_set_trigger
   __setup_irq
   request_threaded_irq
   edge_detector_setup
   linereq_create
   gpio_ioctl

Make the gpio regmap use a raw spinlock so its lock matches the atomic
contexts the registers are accessed from.

Fixes: 4732f079cd19f ("pinctrl: rp1: Implement RaspberryPi RP1 gpio support")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/pinctrl-rp1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index dd0e85c2ca33..99566a25ecb4 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -1693,6 +1693,7 @@ static const struct regmap_config rp1_pinctrl_gpio_regmap_cfg = {
 	.rd_table = &rp1_gpio_reg_table,
 	.name = "rp1-gpio",
 	.max_register = 0xb11c,
+	.use_raw_spinlock = true,
 };
 
 static const struct regmap_config rp1_pinctrl_rio_regmap_cfg = {
-- 
2.34.1


