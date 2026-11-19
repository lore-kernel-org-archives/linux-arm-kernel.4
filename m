Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A84E60A3804
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VrxSQTgS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amef0XUq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oYsF550BKQfD0j7JfAbm7aTzYOcUaHqA28bpz7Hm6Kg=; b=VrxSQTgSRNBART
	IIC+BdEyaZEdUOZptiSQppen9n2Dkt8hDsbzVKfzp7sxF+7nzbfzi+SldqXBOM2qYyEpMRtoHPu2z
	9QBLL8UZ40Kn1e6PRjx+l8AQleV9nzuqvIELBJHQ8Nt5SW1SpDjfy41XRG76sINYI4V7EZR3RK6Kt
	s7eI1K6qbPi6RWIAlOQnfJUStRXClsTnAEnyFtnlPgTeNIT+ifg2fKJR2LcwVYFmr//hi7J4wu9Mi
	UbOqgPDsnlYBgI3I1Je6omwXLtjMa0R0tmq0U4gep1CME6Cyy/e/xZedOnYUup6jLioRXBO/vsYCI
	UYOVSfGj6L7d6lgU+3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU88K-0000000DGY0-3MSw;
	Thu, 19 Nov 2026 19:49:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU88J-0000000DGWm-122d;
	Thu, 19 Nov 2026 19:49:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C30E54559D;
	Thu, 19 Nov 2026 19:49:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117762;
	b=FPhqopQPF1bedJGGGX5g9orw1xspN58iIsJ1Kec1VQYkiAbLqJFx4l3eaQbOnGjqTigk
	 GpjOor+U9B0PqZdtGGn1qOi/8zg9BzJw3n2j/Kw1j/wanxQQ8gje53G2+7XwFi2zEjAiL
	 7Y4WnP0ikLXAb76Mv5mF2OOnNoO3UaEKYDc+sSaZLajyQs4gElgFI5YIEUC4pRsLAQp3e
	 U8GO2CLe3v0yzXwhZAIkLifsxGoFUTfEt78nJGO/uAO8GqDaq5A1QhQ0jfKxMTntceaXD
	 b6WeqBnygRZFxlOFnZSg57ARjS33Ert+Nncji/KauJ9ochjumJAhCAsPWkgHNKfmjtA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=oYsF550BKQfD0j7JfAbm7aTzYOcUaHqA28bpz7Hm6Kg=;
	b=x3K+m43iBhfUAMwH0DvsPdzrRtApgJGcF0P/61cXF0Dut409djYiVrgpJv62At46Nf8z
	 JBtTxjwR/icraU8MuODJ1S9XeSJ++xCAPeRiBVcDfuZqDt7eZPMcbuMpXTW11Q34223XL
	 A44LqF3Pj+tWo66ifEnhrCSwVROphAegC/DwZVI8XCHa/Jn3W5pqH7fMHQCwFEYUICFzo
	 r1BKj5ag0ukJo/8IlZUkqlATuDhPKmuANfn/r0zg/4CJ/PHaBea7OOevO8ZqTIZ4pb5Vw
	 n6ZU3dPhrfiVuZVhYGFIe4LsZqxzVAR5EhGYHZoz9upw6WwWnOZCqfKsGdxGU+3GKpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C538D1F000C9;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117762;
	bh=oYsF550BKQfD0j7JfAbm7aTzYOcUaHqA28bpz7Hm6Kg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=amef0XUquXJyPkEXncgm2Adqdwxb0MNPVluOCxXD7B5vKPzOXrKy9h5pvQWZL7bD/
	 McDgFweh7ePUAn3edL8pQIBTr7ycHl9nOoo9IB+0a7hbzLtqpFqfwNp3BAsiPtHuOZ
	 EGwTB9La2LxC8NsBGcyBKV9jucJh2B0dCt3aG0PFjXQdGXM0ayBzuX5RPOwoTZqO7V
	 B3wlfTJXcIl+3NCZYwjaCZ1fo06eWgCcgjVdy9svSL5n7i6fdAW/y6h6LxL4E9zWTF
	 kG5PZH9oyOJA4mk3Wk2uMXL6T4DBRBxDRFDD9ASOUyBjyv7mMesLTxTkhiCE5mxKEX
	 lrcV+BKbflrrA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 523BB4B408;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Thu, 19 Nov 2026 19:49:19 +0000
Subject: [PATCH 3/6] phy: exynos5-usbdrd: support Exynos7885 USB PHY
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gta3xllte-usb-battery-v1-3-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=4041;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=0vg/X3UExBZ1rUkseyLY5OJLxLcF7MB1/Qmq/onbtak=;
 b=9OthLMMVqY+YTTHZvjYUSjxbFnYEGcuT6VI0DHA0eiiVbF8M2VWKX8BSxVVy5tltkkoQ4um1p
 UV6Jtx1R3ceDGmOqOOVak2DLMEoBUo6kT1JaUOt0Q44fnvanfVPSQ3J
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Virag <virag.david003@gmail.com>

The Exynos7885 SoC has an Exynos USB PHY that theoretically supports
USB3 SuperSpeed, but all known devices using it only have USB2 and the
vendor driver has USB3 function stubbed out, so we'll only support USB2.

Apart from this mysterious USB3 capability, it's the closest to Exynos850
out of those supported. Unlike other SoCs though, this one doesn't set
the reference clock by default, so we have to set it manually.

For this, create a set_ref_clk_rate property in drvdata that can be set
to a predefined value to set the clockrate to.

Signed-off-by: David Virag <virag.david003@gmail.com>
[Umer Uddin: Rebased onto krzk for-next branch]
Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 27 +++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 087d552eb511..8f00586f11a6 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -23,6 +23,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
+#include <linux/units.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
 
@@ -483,6 +484,7 @@ struct exynos5_usbdrd_phy_drvdata {
 	int n_clks;
 	const char * const *core_clk_names;
 	int n_core_clks;
+	u32 set_ref_clk_rate;
 	const char * const *regulator_names;
 	int n_regulators;
 	u32 pmu_offset_usbdrd0_phy;
@@ -1847,6 +1849,15 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 			return dev_err_probe(phy_drd->dev, -ENODEV,
 					     "failed to find phy reference clock\n");
 
+		/* Some SoCs (e.g. Exynos7885) leave the reference clock unset */
+		if (phy_drd->drv_data->set_ref_clk_rate) {
+			ret = clk_set_rate(ref_clk,
+					   phy_drd->drv_data->set_ref_clk_rate);
+			if (ret)
+				return dev_err_probe(phy_drd->dev, ret,
+						     "failed to set ref clock rate\n");
+		}
+
 		ref_rate = clk_get_rate(ref_clk);
 		ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
 		if (ret)
@@ -2107,6 +2118,19 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynos7885_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynos850,
+	.phy_ops		= &exynos850_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOS7885_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+	.set_ref_clk_rate	= 50 * HZ_PER_MHZ,
+};
+
 static const struct exynos5_usbdrd_phy_tuning exynos990_tunes_utmi_postinit[] = {
 	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
 			     (HSPPARACON_TXVREF |
@@ -2929,6 +2953,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos7870-usbdrd-phy",
 		.data = &exynos7870_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos7885-usbdrd-phy",
+		.data = &exynos7885_usbdrd_phy
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index db8a7ca81080..73d9c509dae6 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -665,6 +665,9 @@
 /* For Exynos990 */
 #define EXYNOS990_PHY_CTRL_USB20				(0x72C)
 
+/* For Exynos7885 */
+#define EXYNOS7885_PHY_CTRL_USB20				(0x674)
+
 /* For Exynos7870 */
 #define EXYNOS7870_MIPI_PHY_CONTROL0				(0x070c)
 #define EXYNOS7870_MIPI_PHY_CONTROL1				(0x0714)

-- 
2.56.1



