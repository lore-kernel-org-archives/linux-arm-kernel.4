Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B78606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 05:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WaxUXo+s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gO4fXpmHkGGnhp/y5ktDMWAcVpm6cOdhfAwLKdNSs34=; b=WaxUXo+s4GR1Fn
	RfaVVffkDJu+OrTc3DZgQtGGN5/t0BEgkg572O1gGwzOZDkwbxYC2/n9REnnEqrYBR8r5HnWRBzLc
	n1vqh+ax9FqdlVdgdjpY5oS1693qN2eVn9WYMmeFWbQlVUe4b83K8YUciwIgZ6kKWnH/1LpDkNPv0
	OgXNtaU7E8WsFI5hcwsx6zd4iDXdRSzoEP5V5RgEsFCfIUjK6MkQdGFsWi7/uFJGCHVuNCM2q9Yj3
	6eEMWuY5enj+sw/ypKE7YiVaOyd4jV5/h35dGiPLHPnxtdxdHnbVUslGGHHGS8JUExg8zpel3zTu6
	jDWlrX/f3tSC047n6mAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjuA-0000000Bh6d-0LtH;
	Fri, 13 Nov 2026 05:32:54 +0000
Received: from out28-170.mail.aliyun.com ([115.124.28.170])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjts-0000000BgyK-25bk;
	Fri, 13 Nov 2026 05:32:38 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1082897|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.214202-0.00041429-0.785383;FP=9475219001989795462|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045099153;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.k13i.Sy_1794547951;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.k13i.Sy_1794547951 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 13:32:32 +0800
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
Subject: [PATCH v2 4/4] pinctrl: bcm: Add missing SGPIO entries to the BCM2712 AON tables
Date: Fri, 13 Nov 2026 05:32:21 +0000
Message-Id: <20261113053221.3131068-5-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_213237_089027_31539657 
X-CRM114-Status: UNSURE (   9.92  )
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

The BCM2712 AON controller describes six SGPIO pins as pin 32..37, but
the AON function tables stop at the last normal GPIO: pin 16 for C0 and
pin 14 for D0. Both are indexed by pin number, so dumping the pin list
walks past the end of the table:

  A=/sys/kernel/debug/pinctrl/107d510700.pinctrl-aon-pinctrl-bcm2712
  cat $A/pins

pinctrl_pins_show() hands desc->pins[i].number to pin_dbg_show(), so the
list jumps from the last GPIO pin to pin 32, where a valid mux bit makes
brcmstb_pinctrl_fsel_get() evaluate pin_funcs[32].funcs[] outside the
array. The set path walks the same table for any DT node that assigns a
function to aon_sgpio0..5.

Add the entries as pin 32..37 to match pin_regs[] and pins[]. The values
are from the downstream driver (rpi-6.12.y), which keeps separate C0 and
D0 tables; they differ on the HDMI1 and PMIC pins, where D0 selects
vc_i2c0 and vc_i2c3 while C0 uses vc_i2c4 and vc_i2c5. The empty indices
in between are harmless, their mux bit is zero.

Tested on a Raspberry Pi 5 (C0): "cat $A/pins" triggers a KASAN
global-out-of-bounds report in brcmstb_pctl_pin_dbg_show() with the
driver as-is. The D0 table is not runtime tested.

Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
Cc: Jonathan Bell <jonathan@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Cc: stable@vger.kernel.org
Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c b/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
index 752b78e2c0d8..1720c220cf3e 100644
--- a/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
+++ b/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
@@ -510,6 +510,12 @@ static const struct brcmstb_pin_funcs bcm2712_c0_aon_gpio_pin_funcs[] = {
 	BRCMSTB_PIN(14, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_i2c3),
 	BRCMSTB_PIN(15, ir_in, aon_fp_4sec_resetb, vc_uart0, pm_led_out, ctl_hdmi_5v, aon_pwm, aon_gpclk, _),
 	BRCMSTB_PIN(16, aon_cpu_standbyb, gpclk0, pm_led_out, ctl_hdmi_5v, vc_pwm0, usb_pwr, aud_fs_clk0, _),
+	BRCMSTB_PIN(32, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
+	BRCMSTB_PIN(33, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
+	BRCMSTB_PIN(34, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, ctl_hdmi_5v, _, _, _),
+	BRCMSTB_PIN(35, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, _, _, _, _),
+	BRCMSTB_PIN(36, avs_pmu_bsc, bsc_m2, vc_i2c5, ctl_hdmi_5v, _, _, _, _),
+	BRCMSTB_PIN(37, avs_pmu_bsc, bsc_m2, vc_i2c5, _, _, _, _, _),
 };
 
 static const struct brcmstb_pin_funcs bcm2712_c0_gpio_pin_funcs[] = {
@@ -585,6 +591,12 @@ static const struct brcmstb_pin_funcs bcm2712_d0_aon_gpio_pin_funcs[] = {
 	BRCMSTB_PIN(12, uart1, vc_uart2, vc_uart0, vc_spi0, usb_pwr, vc_uart2, vc_spi3, _),
 	BRCMSTB_PIN(13, bsc_m1, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3, _),
 	BRCMSTB_PIN(14, bsc_m1, aon_gpclk, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3),
+	BRCMSTB_PIN(32, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
+	BRCMSTB_PIN(33, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
+	BRCMSTB_PIN(34, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, ctl_hdmi_5v, _, _, _),
+	BRCMSTB_PIN(35, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, _, _, _, _),
+	BRCMSTB_PIN(36, avs_pmu_bsc, bsc_m2, vc_i2c3, ctl_hdmi_5v, _, _, _, _),
+	BRCMSTB_PIN(37, avs_pmu_bsc, bsc_m2, vc_i2c3, _, _, _, _, _),
 };
 
 static const struct brcmstb_pin_funcs bcm2712_d0_gpio_pin_funcs[] = {
-- 
2.34.1


