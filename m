Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F170F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xe+ALvYs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oru2Ae+a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jnPu9C8U78zwh2haTTxt6kMsYkBetNfurHLTgZHI+MM=; b=Xe+ALvYswz7HZMrCZpWNPJ5xAZ
	0gOIgRRB0NeyibW2C5dEflfE+WreDb2xvX32x+zUqNtpESFJ/iD/y/LpsAMFrRsnbKGr0PPVYAkRg
	eTxHXEjDTWqfbxhdQc/fsnqATEPHFta2AiR8ojWzrpRvcfZIYbowQ0GOTe+i5+M59EsJJg+0BZIcJ
	0gdptub7gf9m+JiHppxvz3RfdrMSLlmhmpe69wNhl6pj6J9a2aNtCvrGSOirn7GpmtQFvxnlJdpXE
	tEtF+6gOPWT09k/Rbgp/1O1rZ1tCEDTw8tygt2D7t2PAV+Q56SzHNrpl78ga9oiUACEy8aJzaqpo9
	eOeUuPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqfC-000000005mN-0ZGL;
	Sat, 21 Nov 2026 19:22:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqef-000000005M5-2Oiq;
	Sat, 21 Nov 2026 19:21:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0511C614AF;
	Sat, 21 Nov 2026 19:21:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795288904;
	b=HjEimbA8kNlnLxNZOoiOBaW14cnprR5jm3uYpW5VvnuJmm2jSYzBCgOw8rVFtuKscAB1
	 JBncKBMm+YUrKeiXU7+yMrLXPWScE8Zbz6riW5BvR9J0iD0PokCsloHUkYK7TnUlTuVNB
	 BcEqMhUdJS3ZOpm1sNvvZOnmX2/rfHwgs5mUdC/yFIActmHn4i+ek3tulwlsRe+7PaRME
	 FKRaOUuM3jNELi+FzIJcdIpTNIz7PV0TkDVeWMmP8kbPeT1tHCWUZfPPocJkFwBED1/z4
	 DTtiWMe++n25IYZPpGQLcusmtJsLsd7/cLsegkkuDbdNEDMou6BMHcTHa7qInmhhwQg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795288904;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jnPu9C8U78zwh2haTTxt6kMsYkBetNfurHLTgZHI+MM=;
	b=YiPnsH0CXAw8s3a5s1RL8q20ZEP2ieU2qCs6m8tvTXeodFEwpT/1w1W9tdYmuU8bKtJq
	 TOhKKuwsrLnVJdk2nMrJ6GcO9ewAY5mAz9ZF3RaL7ZKVNgdFJsToiAxrIb1l0zKEvFh0q
	 U9yALxWo9+qLjDR529foOa6Lw8wsSva4hUE2hLEuZR/c6HrUh24kwtnFEt1ZgXaTZdDPA
	 blK7j/fMm67K1Az2yEMdqht48KFit/xnnlbOlxPdOb7SF7TzgH30esrZv9bvpFVRnJiBO
	 51ywnhQKjSf4YL0fXB35WVowU9MO/b1zbvTR52DHbhJOANmYv8A1XsX6QT5KESMVN0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 871341F000EB;
	Sat, 21 Nov 2026 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795288904;
	bh=jnPu9C8U78zwh2haTTxt6kMsYkBetNfurHLTgZHI+MM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oru2Ae+ajoP0yRJ8H5yYpzPqDzukwm3xtyKfFnnnwsmrFv/uujfjQim2ZSYxBsQ6e
	 SqWwryQUX+wdES8i/hPul9O+dq7omNjJeldCmO+AAQIcWZ7S/JDazqXvpasdGm9maV
	 As+V4ArixMK+zzA6AWoVCxbhKMe9ZXzEIW8XLioH3Z6tmr2K2pZ/1jtwTEXeJFgOVT
	 6171kSwjes731BVzDGM/2vdwg0vfUu1ffxKiMFj5rfyr3joKQAOyRpU13tctnRmdPJ
	 OTHHySRhxzKTKaCWfaIoh7vre/z9CYqULJk35icMp2vRVurb04kMcPxY1O2Qu9gDJd
	 DeArtZe8RRn2g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3FCEE4BD7E;
	Sat, 21 Nov 2026 19:21:39 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sat, 21 Nov 2026 20:21:09 +0100
Subject: [PATCH v3 07/11] drm/meson: dw-hdmi: Drop manual HHI clock and
 memory PD setup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-meson-drm-create-hdmitx-phy-v3-7-f8f471788076@aliel.fr>
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
In-Reply-To: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4251;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=Va7r71zAoY5+1f1lapvKRBrSntc7NXGNh523dnCyfas=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQzbje9OcD/7Kd5K+Zr+Wmi6e4TxZJFfbXuGk1eTZf6ed2
 TTR//z+jlIWBjEuBlkxRZb+uZYn3l0+eubrHvUUmDmsTCBDGLg4BWAinq2MDDtub9yuddBV4GYX
 3+89ChqamQ+PsBc3H31U7iZ+q0Ujh5vhn0bKxpu7Cmw/eJQ0Giy68ZzpEDv/5iNPNPPTQqR83qs
 k8QAA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

meson_dw_hdmi_init() programs two HHI registers by hand: the HDMI clock
mux/divider/gate (HHI_HDMI_CLK_CNTL) and the HDMITX memory power-down
bits (HHI_MEM_PD_REG0). Both are already covered by resources described
in the DT:

 - the HDMI clock is selected and rated through assigned-clocks
   (CLKID_HDMI_SEL parented to xtal, CLKID_HDMI at 24 MHz), and gated
   through the "isfr" clock, which the driver already enables at bind
   time;
 - the memory power-down bits are handled by the VPU power domain
   referenced by "power-domains".

Remove the open-coded register writes. Take an explicit runtime PM
reference in probe and release it on removal, so that the domain is
guaranteed to be on for the lifetime of the device.

The driver now relies on runtime PM to power the HDMITX memory, so make
it depend on PM.

Those properties are optional in the binding and were only added to the
in-tree DTs in v6.11, so DTs without them would no longer get the
registers programmed by the kernel. This is not a concern in practice:

 - the DT used by the kernel often comes from U-Boot, which used a DT
   based on Linux v6.2 before v2024.07 and has used the DT synchronized
   with Linux since then, matching the v6.11 DT with the clock changes;
 - U-Boot already sets HHI_HDMI_CLK_CNTL and HHI_MEM_PD_REG0 when
   probing dw_hdmi, since v2019.04, so both registers are already in the
   expected state when Linux boots, even with an older U-Boot and DT.

The risk of regression is therefore very low.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/gpu/drm/meson/Kconfig         |  1 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 31 ++++++++++++++++++++++---------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index 417f79829cf8..6645665f6038 100644
--- a/drivers/gpu/drm/meson/Kconfig
+++ b/drivers/gpu/drm/meson/Kconfig
@@ -17,6 +17,7 @@ config DRM_MESON
 config DRM_MESON_DW_HDMI
 	tristate "HDMI Synopsys Controller support for Amlogic Meson Display"
 	depends on DRM_MESON
+	depends on PM
 	default y if DRM_MESON
 	select DRM_DW_HDMI
 	imply DRM_DW_HDMI_I2S_AUDIO
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index eb33c70f29c3..20a821936b3a 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
@@ -102,8 +103,6 @@
 #define HDMITX_DWC_CTRL_REG	0x18
 
 /* HHI Registers */
-#define HHI_MEM_PD_REG0		0x100 /* 0x40 */
-#define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
 #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
 #define  PHY_CNTL1_INIT		0x03900000
@@ -599,12 +598,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 {
 	struct meson_drm *priv = meson_dw_hdmi->priv;
 
-	/* Enable clocks */
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
-
-	/* Bring HDMITX MEM output of power down */
-	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
-
 	/* Reset HDMITX APB & TX & PHY */
 	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
 	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
@@ -829,9 +822,29 @@ static int __maybe_unused meson_dw_hdmi_pm_resume(struct device *dev)
 	return 0;
 }
 
+static void meson_dw_hdmi_pm_put(void *dev)
+{
+	pm_runtime_put_sync(dev);
+}
+
 static int meson_dw_hdmi_probe(struct platform_device *pdev)
 {
-	return component_add(&pdev->dev, &meson_dw_hdmi_ops);
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to power on HDMI TX\n");
+
+	ret = devm_add_action_or_reset(dev, meson_dw_hdmi_pm_put, dev);
+	if (ret)
+		return ret;
+
+	return component_add(dev, &meson_dw_hdmi_ops);
 }
 
 static void meson_dw_hdmi_remove(struct platform_device *pdev)

-- 
2.56.1



