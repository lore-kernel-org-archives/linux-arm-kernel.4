Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0114E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wT8k+/jq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FkCUFDNf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMG4Tvr0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ec1tqy+OijvQ1oTn+CcDpDl1Xq4ijIg/8Ri8zyKyFyU=; b=wT8k+/jqehAkcR
	RWA8yRQAvY9ooeceLQMpRbhu8O1UAwi7Yxui5zHaJtVBaHBhQsw+oVMB+VFVMDmXlPhiXT/C7fMdw
	7c6+oyqcY2GFvXDwY1cRRQRlYBcCyx5V5wKPU0CTSh+YH5EfdHCcQ49xl08uuO4OCGdlTobLxJF9x
	PumCdSLHvps/P320P4coPjfA8jDfp8enrQ71wK2x06tGiRG0l5GkhweTNVDUINF0TgWQWWCCJm6zA
	Npg2Fx4S4cL6s7g+lAk4+v5R151hZTh609Azak0e8HTqRKL9FWZi/46OseVEtLXa6/sJv6BVnz1hY
	yBMqNsEiao9szpmEfdNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQJV-00000002hx4-1m0Y;
	Mon, 23 Nov 2026 09:26:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQHD-00000002haE-0abt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 09:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ec1tqy+OijvQ1oTn+CcDpDl1Xq4ijIg/8Ri8zyKyFyU=; b=FkCUFDNfIUJOR0YUBFXOV4rHjI
	JrQmNgSat3oUYyJ7H//QbcClhv/8x/zayIDyxNRQFPl6Uz9ExnrTBcu0LFXGmPWixXzZtA1uPrV/E
	l8pXH8kDCKtZ/X6k3A9seFblGP+U6f/BqM2bdtxIGNGHQEzFyCwZZaeV/+qxMECFgWsY2wFvsSunk
	5XU2B+wS0FBCH3T4LdZ0XMzHD3B9Z7N/BQbeTZFW7lUaXgDX4Peq94qKAYXlMcUi+FiLGCRdNDA+l
	JPTGODEP65znod9+YyexdN8KqJLw+ONrUbvAmCwJ0VijRRdTD2ulyfDeRjaWLi0HYEhjixOwiCky6
	ayc4g4Qg==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQH8-00000002uw8-49Ru
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:23:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2710145f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425829; x=1796030629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ec1tqy+OijvQ1oTn+CcDpDl1Xq4ijIg/8Ri8zyKyFyU=;
        b=yMG4Tvr0BOE/n3E2AEvwNwDmfoehmNH0ytn9q8T7aokpODGCoOQFpXcDBObHhqeLqY
         whgj2oVECBAqaWtgpGwv/d0gDBZ04Pr40XmV7BqhWdgnxhRpvsLdyd7lJ/zak2M6rSLr
         rvPYF/XcUBIz4hgwy6gRZbBPR3N9Qs2epKkOBmIfHNbCrnIJ/2DDOQ8pYQBuYHkOxvUd
         097tOfXIrgoIIndFh8q/Jb5cHvXNiaNPX2mxRJF6qvfdILDzO05bjF/So4UB2IdEQmtG
         YMdCCWH0KsCfnRZj0jh/QHeezEIg3edIzvI6e1fqHu33aRSIe31HFl921Zbk9uHXG73n
         YzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425829; x=1796030629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ec1tqy+OijvQ1oTn+CcDpDl1Xq4ijIg/8Ri8zyKyFyU=;
        b=0o8+PYFzHTu1TAQaZEKSJz0xAz2Kvi1VzX0OllGjWfCVisAuZxmLFnp+rXp2F4qUEw
         eZKUiWA1Q4wWlqdJat/C5+7LqCbLfYXMin1y3Q3XAhPYkSF2a+LnqNssuOT1C/WJqQ/B
         6MF9awmyu22d+fAc6rn+7cyIO4X49cKYaZnkYHPD6b2tLBoTtGm2+4hybcq4SdV9ILD/
         FUK5Fn+6mHM9oRBeUXZKeqjSXLLzsaIDMQVm/Mj/fnUouEcaFWzmj0uUFIfzolsYT8Zz
         Kno6S+nI1ZOx99wNrkg5rjeGv0LnZ5MYqMFlKJMWGJ49eD8Cx4Ohw4MzrVfLBsBHXhOd
         rLhg==
X-Forwarded-Encrypted: i=1; AL+hErFDQwdcXlRWOZVa956ZFBktanIBQlbydavU0YJQIzAMUkYCu2XNEMQGmK52+UgzZ3VNXGMCrpB05WTnauxXPoZk@lists.infradead.org
X-Gm-Message-State: APuU4Z8t7P8MKXGTj0uymVZVR7OQPAZzZohyiRaZI5QksgduAMGkxLk0
	OZ2uvt/ux3pSL1zCIrIBcl61Cyyx7yTWeci7UsVSJTOorph7sZUeJq08
X-Gm-Gg: AZFdTZfe4ZtOqZxi0qopeyc12DMwMBowvKMqQoHN1ZcY3Rwtkk1mzUBN7KMt9j6dGYB
	1x67o2VR1AGGoxdG5SYZDh3Z00azYzpdSMzFIXMeBRT9NRZEBTb7Iym+y12Z+RvfOTFN3agtcTu
	E4hlJSgokoWvX5NjGud22djug5LkYAthk/CSrGL7U8vrhHTui2JMyJprFXGuZcAHHFpXY2/8wcv
	MAszsXyiE9jdWUTTWxwnKO6yai2XNruJPbJ/keLr41CIz+AwX5mkDOm8DlnN4Ejaml4JrbJbkCC
	U4Shyvk/G9O4tk50SRSShK/3r6mRqKVlhJQWgwWLadJwYMvvWsgDLltDn2bvC2oElj8FtZNTh4a
	DCch5KonKazDzSTc5ifjxmPHN9PZo8Wsch4V4G/NtCZ6zFmYSfNvnZkaj8kyslhi5V+lZjXkyLm
	+aXgpgo7t1oRB00cxcpegTShC8f/TTEoBI7hAGOAaDwxkmagkbkmH9nMNmJ9v488SjGhe+mbmTe
	F/KjOEUD3/wajtrG3tWrGyh7zWet5x2/x/ftaH8ywHTWITbov1fbHRYey15Zuu59LZMp6nGdH1w
	45ToSnIe/a0jr0CBs7U6lLbQ4MNq+RiTp6XjAXZBuCCNDHdzyt5P48SzvPMZ7ahJCNHoLEZR0i6
	uajY1woPweTbJKevPU9fx+EHY/VhYS4bfvA==
X-Received: by 2002:a05:6000:184b:b0:4a7:1fca:e548 with SMTP id ffacd0b85a97d-4abb7d46559mr21264569f8f.39.1795425829165;
        Mon, 23 Nov 2026 01:23:49 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:48 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 3/5] phy: exynos5-usbdrd: support Exynos7885 USB PHY
Date: Mon, 23 Nov 2026 10:22:40 +0100
Message-ID: <20261123092244.1792040-4-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_092351_073929_91417836 
X-CRM114-Status: GOOD (  18.41  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Exynos7885 SoC has an Exynos USB PHY that theoretically supports
USB3 SuperSpeed, but all known devices using it only have USB2 and the
vendor driver has USB3 function stubbed out, so we'll only support USB2.

Apart from this mysterius USB3 capability, it's the closest to Exynos850
out of those supported. Unlike other SoCs though, this one doesn't set
the reference clock by default, so we have to set it manually.
For this, create a set_ref_clk_rate property in drvdata that can be set
to a predefined value to set the clockrate to.

Co-developed-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use unsigned long for set_ref_clk_rate
 - (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
   error.
 - Add Umer Uddin's Co-developed-by: tag for his improvement.

 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 26 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 087d552eb511..77bba791212d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -483,6 +483,7 @@ struct exynos5_usbdrd_phy_drvdata {
 	int n_clks;
 	const char * const *core_clk_names;
 	int n_core_clks;
+	unsigned long set_ref_clk_rate;
 	const char * const *regulator_names;
 	int n_regulators;
 	u32 pmu_offset_usbdrd0_phy;
@@ -1847,6 +1848,15 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
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
@@ -2095,6 +2105,19 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynos7885_usbdrd_phy = {
+	.phy_cfg                = phy_cfg_exynos850,
+	.phy_ops                = &exynos850_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy = EXYNOS7885_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+	.set_ref_clk_rate       = 50 * MHZ,
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
@@ -2929,6 +2952,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
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


