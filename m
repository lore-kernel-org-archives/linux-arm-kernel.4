Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36E2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DYjGJNUl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVQ2M/3a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5kSP1RnWMSJEJYYJkds0+nXtVqYjbTw1JaXsnE/LlyU=; b=DYjGJNUlVOj8GKF0Tx+j6zPCAb
	8tx4QTr+pniSLfwpM4CTsnlkcXNmnau2yYwEtO+t827LGAkCOlWdZ8ekVMX8Q5vQwq+qlUrvO/AFN
	vLt0kSg++TBw/tv6OBr2c4vjXNlf71Tat5NE1x1Twbw3lzbntNVzSTCZZKNOH9YaeAsihshiLLB1i
	Wz3NTHkqP6y98zZtk3FfEEX8a7Q7gbrQZTWd2tvKY2ZiLZppMo0IERIiKGjg54QlBrAqq4VnFwWsT
	bLImtrYoScXNRwvBbaIl93n7Kn2zKWTqrG743cwZfEGusSJjOHxGjvPh4g31irBnfqArYotbtdkVu
	Eni2odpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqfT-0000000061X-03XI;
	Sat, 21 Nov 2026 19:22:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqeg-000000005Mn-05sq;
	Sat, 21 Nov 2026 19:21:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0AF741AD3;
	Sat, 21 Nov 2026 19:21:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795288905;
	b=FTqmv7xXu5KoR7vT1jAs381zFySbfC07WF4ReSniJIKMiFqxuj8Y6CzkIRsl2LwNucTi
	 6Ajy22+EFAoo7nT9Bvftpr9KBj6NYg9eqNX2xCjoG1nE59aFj8LNuT228bFN5oo/MhmyW
	 0rxDQss/N5n8B3cORS+i2BxzPO+7o7E7nhtD4cpmi6dTioOP0xTZD/Agr+Q9gMLR8XxMk
	 lt98URQinG6AeRKvOXh0r5qreJr90KdmTr1hWfeg7NDfuD2f5gAhgwDJqoN89R5oAJJgr
	 fmQoOycTdoWUtM4n8N4SQAlPVT31GA+kjXQUyrmQ7fkTHkpKkfA88yDDuA7Zp7WEptA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795288905;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5kSP1RnWMSJEJYYJkds0+nXtVqYjbTw1JaXsnE/LlyU=;
	b=JnW7O6tuoyVon476HuVcX5KBdISibR0N++q0wST71UXN8vmkkKSuRginkZQMQ3vgrRAH
	 amSUJKjxvyLREQBKZzWJHf2p6nZcR78QrCNAbFjOSsMDFh868vDYX+mJpuiSPBQlW+HhY
	 baWpSb9xvc6dz2g4p6s9+ckSovPwJsycYLgIxp3s5f6JhvqLw5Irm5uHuc12zbrsBEIQq
	 ox64/XVrtGkrS3nO5xTY2xoHjF4nJEsNI4jFczh1JRpiTrYHa5e3Q49oVw1mhj4uoZVVG
	 OezXmtI9LZpbBzJRMCe4oMrK6wHl9S1eKpBvZ2OP8s1Jh3083KEW5beossKRuX+OI7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CC451F000F0;
	Sat, 21 Nov 2026 19:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795288905;
	bh=5kSP1RnWMSJEJYYJkds0+nXtVqYjbTw1JaXsnE/LlyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hVQ2M/3an1gy3dwMYRx86ngxB0d3A2zET589l3fVIJVLmkA2w5IaeYLKtNU4nQ6a1
	 6NBsKc16nv4WN9aan6y+kdSSy4DUY1U4sB14r2N5oCyQCgVTRbPXcGAyynfI6gH1w/
	 EcsFIie4wPPULctzD913ripoibO0GhQxPN+1wZqp5B08jMQBRmmRgX6LHc+2vRepXz
	 5XMfLyBcgkpTWScLB4ArW5ZwTuiRPRTWZlujAs+oik1YHQAjYTQkXl9qFj9bQl/KOn
	 MK/hjc9T0VHxuKlKtw6kOKBp22148htcmcbGhHXlxKk92soDn0RQtDOLUFideVUNLJ
	 wurQ7J274rBPg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8FE674BD8A;
	Sat, 21 Nov 2026 19:21:39 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sat, 21 Nov 2026 20:21:12 +0100
Subject: [PATCH v3 10/11] arm64: dts: amlogic: Add HDMI TX PHY node for
 GXBB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-meson-drm-create-hdmitx-phy-v3-10-f8f471788076@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=JfeJFGsdjuVYuSpN9bsRq2rmNT9JvKzwp64cluLxjAw=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQzbjexud9MiJPwNeik2vrV3seiZ2naau0WM95Z1rb5r9y
 bqmsv56RykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCRI2cY/jvZCote//An5d3J
 2ct+KOmw+r/3Sj/axD9zQ/vvNfOXKggz/BU3vST5flL1rkrLKG0+mwlSv5QL97nEK+R96EpbcN+
 umAcA
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

Describe the HDMI TX PHY as a child of the HHI system controller, with
the amlogic,meson-gxbb-hdmi-tx-phy compatible and reference
it from the HDMI TX node through "phys".

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 5c2fe9dc4f80..09ad9790ebc2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -316,6 +316,7 @@ &hdmi_tx {
 		 <&clkc CLKID_GCLK_VENCI_INT0>;
 	clock-names = "isfr", "iahb", "venci";
 	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
+	phys = <&hdmi_tx_phy>;
 
 	assigned-clocks = <&clkc CLKID_HDMI_SEL>,
 			  <&clkc CLKID_HDMI>;
@@ -330,6 +331,11 @@ clkc: clock-controller {
 		clocks = <&xtal>;
 		clock-names = "xtal";
 	};
+
+	hdmi_tx_phy: hdmi-phy {
+		compatible = "amlogic,meson-gxbb-hdmi-tx-phy";
+		#phy-cells = <0>;
+	};
 };
 
 &hwrng {

-- 
2.56.1



