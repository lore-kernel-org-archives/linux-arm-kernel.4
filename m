Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205C5606B20C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FgrSdBZE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YOLVLY64
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+vDV9gxuiMjIN5ig6o5fnYNWGsi3VvCcP9sIBt1qAlo=; b=FgrSdBZEoc+ocwy4gLAWZ0UEbn
	ok/VcAFn8lE9X7atvOD00xlnSc1TJ1j71wQLrslVCsnsXqqyPL1OJDNzez66Pao1tOC8dMXbjDpoL
	fMCUOU26B06g3oQQhiLqF2EgYDHCaKkkxHGkSGCKNOIrrWJuQ8Lz3BYvpKas1U89b7PGaqKU3dop1
	l66XhfXv0gw1/S49G3P3sL4mdUcawnSslDUK3RDwq+4mUdAdFJVgJUNtVHXGOwyOyRfnYnlkdJyCM
	T9aaq2D3vHhwo7lgO8MCLsJo8tqrW/W+PWhEUulSGxZCRXVEVsygpftm7oCsrbnXB94gEWAgnJdZZ
	W5B6JMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTD1-0000000Fu3R-1Jvd;
	Fri, 20 Nov 2026 18:19:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTAa-0000000FtHE-2kTZ;
	Fri, 20 Nov 2026 18:17:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6592046CA6;
	Fri, 20 Nov 2026 18:17:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795198628;
	b=gSJ3k2LR8Cn4jaX2cZQAMy0OrJ6DfNOOw1QxObkS/qkhxNAvaS9tqhW0MDOScoIpvMIF
	 BseZ9qWBBg7yqTUZFT/ZAfKmNqSKq1nKvMd+vA6ItqMfMHpuCE6bntqIel3p6Ra3WWgGJ
	 pehEJ7JXOzlFVFckapTP80WmDCd9TbwwFF2c2mJQUSsUoq3kj4+DH9LqWEoUfxvS7TRkA
	 6vjPc4551/zN+MKirK0l18UbZs1z74mxuVt/4IWfGjyzFIm97iNRoQaT5zRapHdniD//M
	 Qf27qWZkK0c5Y4zdborGuN1kvhB6tuYy/VRoMcMkQ0X0eHK7eyA1/EFlYWmOdrZwAeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795198628;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+vDV9gxuiMjIN5ig6o5fnYNWGsi3VvCcP9sIBt1qAlo=;
	b=teF+uREmjPghyGaiC8YGB9FXad3xgcN+pDMWtJcLy+d6z3V838BGvjXThYrn69TitG8c
	 tdF+d1Mi0rkmwiZiafGk/+HcBt/u2H4eb2ntrhayJ3X6bjEHqwTJLWCwlq+ejmSNHKfQj
	 vxmFJ6rUIgXZOvyfiwLRpt/n0qyiErNZ6l5OD2q8K72VfYGY+oUS/JSTkK2yaBrSvmYIR
	 7ACgEaY8Qm589XUDOEOJIfin+oLksAs/wdyc4AF+N0eUvanTEVaS+nFEYJZyQ4Lyadh98
	 x3e6x9rzxLdnXC8dkd4J6UD+sQvy2YaCfzf0YV5gLkkFJSn0DjAVH5+K2TRC/e9PvqA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB4E91F01566;
	Fri, 20 Nov 2026 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795198628;
	bh=+vDV9gxuiMjIN5ig6o5fnYNWGsi3VvCcP9sIBt1qAlo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YOLVLY6440/N1QBouAqGkpPtN97sQ7MPPWRwFuJE+7T0VQHkCAFH4dhzKzkoQe37B
	 c3hDb1XOft1OOxPrBNq82/603Tr4kI9dDYpxeCdxC+qcWRIKzgyOB2FqngLdTyi3B6
	 cJReh7vheDzQxeXNfCLTIsecinUi74Izwf/PGNBtLYtCvEerfERhbckB2fdxOXvnEY
	 eSC8uxWkaeP+5tiAp0OM1Jw3AL8z9mc/1nEvJc32o79FNvV/h+m3W8PyiNPCCPN9gx
	 hHuVYSN9241PGbopEdatiefCWE5ImcmozdDpdsQWX9E5FbZGPUBR93jmIRDdCDdrcF
	 aMx4Xj1XroHKw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6662F4B955;
	Fri, 20 Nov 2026 18:16:33 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 20 Nov 2026 19:15:48 +0100
Subject: [PATCH v2 09/11] arm64: dts: amlogic: Add HDMI TX PHY node for G12
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-meson-drm-create-hdmitx-phy-v2-9-93d622d9bb07@aliel.fr>
References: <20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr>
In-Reply-To: <20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=96ezTxgocDNVGkQVkrXP3m6ZHN0B1G+z/JYBO9mFeTE=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQzZDX+mZM1Pa9s0tPse8yXtBIc8ih2fxX8ujT5lMndA/Q
 UzvzEfNjlIWBjEuBlkxRZb+uZYn3l0+eubrHvUUmDmsTCBDGLg4BWAiNosYGb6effLzo9+WinT5
 j0FyohWO/S3tafosc8X7Wnz3BjGkzmL4X1JmskB47r6tSV/jIqqeOilJHORf0701Kvffhu/Loxq
 ruQE=
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Describe the HDMI TX PHY as a child of the HHI system controller, with
the amlogic,meson-g12a-hdmi-tx-phy compatible and reference
it from the HDMI TX node through "phys".

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3135566df880..7f9eda4298e9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -210,6 +210,7 @@ hdmi_tx: hdmi-tx@0 {
 					 <&clkc CLKID_HTX_PCLK>,
 					 <&clkc CLKID_VPU_INTR>;
 				clock-names = "isfr", "iahb", "venci";
+				phys = <&hdmi_tx_phy>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				#sound-dai-cells = <0>;
@@ -1683,6 +1684,11 @@ mipi_analog_dphy: phy {
 						#phy-cells = <0>;
 						status = "disabled";
 					};
+
+					hdmi_tx_phy: hdmi-phy {
+						compatible = "amlogic,meson-g12a-hdmi-tx-phy";
+						#phy-cells = <0>;
+					};
 				};
 			};
 

-- 
2.56.1



