Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3F6606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V7ptAspG;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AlplqCvC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wP0EsqHQjgsrQXbVB1hh1kUixP0fbbetL/gjkhCcYPE=; b=V7ptAspGXfv0JN
	EuxAFFafSd/yjNVc3Pz8860zOu6axcHhDODPLNLkZP/snjQAzDB67tb7P9ty4+9oV41FK6+sifU86
	x/EFnpX8uPzFElIzFoXJ9XRWfUwC/BsP+4IEMCX4IwVpaDUp/sGDXYVCqqsnR1N3ei6ec3cLaXrBj
	a8lxVHhQ1QsE7luoc0DRSb/OtjA8DlDUeKQk4zSxanH+bzjbQSUFgQmnZ2HQKojSOhEP5UxA5GYr9
	JHTow4fGmcLPaCHEwGinBfXb63ey0iYlJMtjp7cwQKwo+rGXvBd/69e/P4z7ijV38sa/bSg6I4xPb
	PGypHSGIGJ9gJgoQ480Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2Ak-0000000Eyrm-3wKI;
	Sat, 14 Nov 2026 01:03:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2AO-0000000EyVE-27rv;
	Sat, 14 Nov 2026 01:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794618166;
	bh=+715V88lFL2xyfiIvg+gLJGYekEgJMm4EkTZJ8soaGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AlplqCvCVYZ+wKgkHcaKLekzMfWssBsPzzB+J6czVg36oGtc/fvBAmMs+RNiXqIAY
	 iBi1SdwZZ/tQTzaTkKfbl7FGzOsa1wHaBaUuSN69Gf0gEfLknjNIpBkmYDU9Z0tthp
	 PT/2IdbuhWy+pzpNR05wMa4k22yx/bDNE5X4rpYmu/Lo/Fc/BxMjtMrM1iBz5RtGFw
	 GRZtMOLCLTfYo0ZxY84P/21rNA+rQ7TyaR/QezsnBix7YIF3g9BW/HFOonMpxiPZGd
	 eGsdEQB6WktdqQkyIalp/0dea2hssS1PqYknA5sB4K4inQuVLY6Ang2+56hEjiO7ZG
	 zKCI6sCd/XhJw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C40317E12E0;
	Sat, 14 Nov 2026 02:02:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C80BA480038; Sat, 14 Nov 2026 02:02:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 02:02:04 +0100
Subject: [PATCH v19 5/6] usb: dwc3: core: only access GUSB3PIPECTL under
 lock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-5-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3324;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=+715V88lFL2xyfiIvg+gLJGYekEgJMm4EkTZJ8soaGg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3szU8b8wImR7sGB0lNz/TIcOHZLsFi48Bu
 vFbb7/2iq4uI4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq97M1AAoJENju1/PI
 O/qa1OYP/jRTmHZFSym5VDKOx8YKpWAhMLcRWb9DiUQcLE12MX7yuy8IOP5s2/01QT+eLZ5fs+8
 p4Raimdcn7+P293+SIBn/27k56TTUB0MlNzwxAvrqFOjR0h4wuDFbFDcGW+q433waAHSYomGoy6
 xHt7WH5HFRpTW7g/xkwYk6ONWps31E5mD8OA0T7ICPh1XsN6bR0XW1h9Amd5sKZ1lLk2zebtJ33
 3Tps1etGlBNZeV2TPqylSZFJkg60Pk5KthcJXppmhskfJXZRkNqKAhXwrLtwVRrJ+kvQuGxDxGh
 bHg5a5/DrkG6F6W95XqgauDywGE2BZY6nclFrsZ8cnx0F9uI0nY8haNpcWZ7TSGyYSZJHu6/NVj
 IxK72JHjoyX6G5iuaBEvgeA39rjoO7aoNpIywsHtO2Ycp8TlnK1tln53/5tUuqEogtx1XO460ae
 NB8/C/jNLeoKOC9YDuw4ZUVYR1gtquzUUBlDemi6BnY5pQB/9iQc5qaL6XgFONRVYcwu25DJIcN
 tbP8Wk8lOdhdUrrM6pDBpvoMJDaUtHuswrSYL9np2tk48Vg8HSzITs3Amfs8DUkfWfPtKGVD/Hs
 wNWP4GsVuiv2hynIysUTq4H0xONT7pHZBDcT+5JCen44seE+UY46y5Qc842/lRAe2M7slScqC9k
 WBRnzlpDVySUWg1SKUCsx0g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_170252_752238_6466B12D 
X-CRM114-Status: GOOD (  14.30  )
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

Update dwc3_enable_susphy() to take dwc->lock while updating
GUSB3PIPECTL to protect the read-modify-write cycle from other users
accessing the same register, which is soon introduced.

Note: technically there is already dwc3_ss_phy_setup() as a second user,
but it runs and finishes before any call to dwc3_enable_susphy() should
happen.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/core.c | 19 +++++++++++++++----
 drivers/usb/dwc3/glue.h |  2 +-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index daf5aec07fbf..0cb1b33a7c98 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -108,11 +108,13 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 	return 0;
 }
 
-void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
+static void __dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
 {
 	u32 reg;
 	int i;
 
+	lockdep_assert_held(&dwc->lock);
+
 	for (i = 0; i < dwc->num_usb3_ports; i++) {
 		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(i));
 		if (enable && !dwc->dis_u3_susphy_quirk)
@@ -133,6 +135,13 @@ void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
 		dwc3_writel(dwc, DWC3_GUSB2PHYCFG(i), reg);
 	}
 }
+
+void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
+{
+	guard(spinlock_irqsave)(&dwc->lock);
+
+	__dwc3_enable_susphy(dwc, enable);
+}
 EXPORT_SYMBOL_GPL(dwc3_enable_susphy);
 
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
@@ -150,7 +159,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 	hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
 	if (hw_mode == DWC3_GHWPARAMS0_MODE_DRD && !ignore_susphy) {
 		if (DWC3_GCTL_PRTCAP(reg) != mode)
-			dwc3_enable_susphy(dwc, false);
+			__dwc3_enable_susphy(dwc, false);
 	}
 
 	reg &= ~(DWC3_GCTL_PRTCAPDIR(DWC3_GCTL_PRTCAP_OTG));
@@ -1624,7 +1633,8 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 
 	switch (dwc->dr_mode) {
 	case USB_DR_MODE_PERIPHERAL:
-		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE, false);
+		scoped_guard(spinlock_irqsave, &dwc->lock)
+			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE, false);
 
 		if (dwc->usb2_phy)
 			otg_set_vbus(dwc->usb2_phy->otg, false);
@@ -1636,7 +1646,8 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 			return dev_err_probe(dev, ret, "failed to initialize gadget\n");
 		break;
 	case USB_DR_MODE_HOST:
-		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST, false);
+		scoped_guard(spinlock_irqsave, &dwc->lock)
+			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST, false);
 
 		if (dwc->usb2_phy)
 			otg_set_vbus(dwc->usb2_phy->otg, true);
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index d738e1739ae0..3287ec44f634 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -172,7 +172,7 @@ void dwc3_gadget_exit(struct dwc3 *dwc);
  * This is usually handled by the dwc3 core code and should only be used
  * when skip_core_init_mode is used and the glue layer needs to manage SUSPHY
  * settings itself, e.g., due to platform-specific requirements during mode
- * switches.
+ * switches. It takes dwc->lock internally.
  */
 void dwc3_enable_susphy(struct dwc3 *dwc, bool enable);
 

-- 
2.53.0


