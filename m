Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD28606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 05:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LL0GJxuT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CIXe5LJ4qzFLroExPsOBA24IMOj8Guk7Wz5iq+3EgJc=; b=LL0GJxuTxytB/j
	JqC0Se3k2YlHV96skrg9WtrhaTUJ9c9irJmi4R1W5V0AdhXT2qGEZPWa4xOJQGHfjNR73T1CbCMzk
	Mc2BsFQlxQ/O467nQWuRGLDb48Ul9xRIkpjc20Qa4NB9m7cfKgxjKm/sJbKaSIAFUIZrveQML6FS0
	qqyzSTDy6Q/wzn2E3A7IU0dH6iMXM6v8xvlCbhSdKOgNBC9WGgoaI9b8Bsruo8BUDBHUl/GUn5PLV
	j+gngZaIKP2xxzT/KBqDuBUtrR31APLCbCjhN35lnGHUjwcYmZ/DlaVAed7zcL/CNPOcH1lL67pWN
	H2JggZy9wpDyI6H7HRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjtv-0000000Bh0g-1yI3;
	Fri, 13 Nov 2026 05:32:39 +0000
Received: from out28-73.mail.aliyun.com ([115.124.28.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjto-0000000Bgxh-2AcB;
	Fri, 13 Nov 2026 05:32:34 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1246013|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.00493924-0.00066682-0.994394;FP=3278358288537443492|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083032240;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.k13i.Ms_1794547944;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.k13i.Ms_1794547944 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 13:32:28 +0800
From: Xiaolei Wang <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
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
	Jonathan Bell <jonathan@raspberrypi.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] pinctrl: bcm: Fix off-by-one and out-of-bounds access in fsel_get()
Date: Fri, 13 Nov 2026 05:32:18 +0000
Message-Id: <20261113053221.3131068-2-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_213232_834889_1E706BBD 
X-CRM114-Status: GOOD (  10.81  )
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

The FSEL field is a 1-based function number: 0 means GPIO, 1..n_funcs
map to funcs[0..n_funcs - 1], and n_funcs + 1 and above are rejected.
brcmstb_pinctrl_fsel_get() indexes funcs[] with the raw value instead
of subtracting one, so readbacks are shifted by one slot: value 8
indexes funcs[8], past the array end, while 0 is reported as funcs[0]
instead of GPIO. The setter programs the mux correctly, so only the
debugfs readback is affected.

Map 0 and out-of-range values back to GPIO, warn on the latter, and
index funcs[] with fsel - 1. Tested on Raspberry Pi 5 with KASAN: the
"alt8" readback no longer splats, and field 0 reports GPIO.

Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
Cc: Jonathan Bell <jonathan@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Cc: stable@vger.kernel.org
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/bcm/pinctrl-brcmstb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
index f46b27155c3c..2b942ca7196b 100644
--- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
+++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
@@ -66,7 +66,16 @@ static unsigned int brcmstb_pinctrl_fsel_get(struct brcmstb_pinctrl *pc,
 
 	val = readl(pc->base + BIT_TO_REG(bit));
 	fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
-	func = pc->pin_funcs[pin].funcs[fsel];
+
+	if (!fsel)
+		return pc->func_gpio;
+
+	if (fsel > pc->pin_funcs[pin].n_funcs) {
+		dev_warn(pc->dev, "invalid fsel %d for pin %u\n", fsel, pin);
+		return pc->func_gpio;
+	}
+
+	func = pc->pin_funcs[pin].funcs[fsel - 1];
 
 	if (func >= pc->func_count)
 		func = fsel;
-- 
2.34.1


