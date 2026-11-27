Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71E2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RUwwq0zP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gslis+xZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3ySlJUTZg8+yNINn5sfi2SIyHBWA5zVWlGALJ4M1cgM=; b=RUwwq0zPCX9/hi7QBn8KPIFhby
	jpN83rHExBMeMByH0zQCwz5h0r+ge4VYcSt7nIwjF8+IkkUpW91lVLUXUsENjNSAXv0LwyUWmGOPV
	RVaUfvcP2B9AqOexgOLvxSN5E97ps94VYEGkE8tJv12GvAJZe2TNQ0lShAtcqB5pq7++VIU7D7gOj
	HtdbfwUYTEBxOX9/GNkADaB6JuFdvz/QyKwQJ4EFKNjCeE6BoEYmDJSX5hL3OMcfu8rwZSUKM2Q4h
	JSPAfude2HsEdqHZz2TLN5J5+K4jXR4nt36PBMGPBYX7NeFrtuiheIw5R+Cc30Y2c6BhHIE/9QcTJ
	8m6WYW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxv9-0000000Goe6-1iYi;
	Fri, 27 Nov 2026 15:31:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsl-0000000GmtX-30ZW;
	Fri, 27 Nov 2026 15:29:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FAB4431E2;
	Fri, 27 Nov 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795793343;
	b=fLe02NPJmq5u8U4ngZMHcCcfzyneC2tVGsuTQplmvZKnTzPgAWiK8svfyAz1dAVbvPEY
	 cNoRAgqWIcbuj5JJ3lhF2YBjUHcjBQMB+eWr10xTghRQC5nmcznFU8EuZe8em9oeBvYlT
	 kUCHNACRu26Vz9Lem0jsTnaFQOdgwp3RH4ZVrlNZKLVlqBw+ICYwSupamcGb1mCMEcdZn
	 tNR5Ah3C722kZ9qox3AjDxGSl7otSAcnNB0AfCrQtDsx9qILTSiKAk3UjN96OfmSvLxR9
	 Ie9LjZivbidioanFkWICIugToXjsbYxp2I6/EN0yMfbEtCXbIpLuoA84S0M1SVy4mxA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795793343;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3ySlJUTZg8+yNINn5sfi2SIyHBWA5zVWlGALJ4M1cgM=;
	b=kxhEj9o5ovLPQ6FJmIrSihrfAbh3zjK0hapvJ6sQ9Q+qv1KYWCZbPOMU3cEYznWRVzC6
	 INIIYNQe1vW9XQvQhm9GIFkwLxKcxQwawf9eSwjFO+xq74JEwZpoy1ibYiJLlUcpwYJ1Z
	 T7Om+Z0YAKoOwsehj0LROHa0k/TKNrUIQu1UcAyV0M/IOBXXrHIZLBK6zuNDRPT/yGWYG
	 58nzYRtwM3X7maExHImfgOMLiluZpxpSyToz4MtDMYvdVBkR09Pr6lOFm6+8zMze+o1t2
	 rerQ0A4WM0jT32buDdHmkam0E7XmrqmTX5uVyuzRsUgBaEEmJivUCrToWMktU8sVrdg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12B9F1F00937;
	Fri, 27 Nov 2026 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793343;
	bh=3ySlJUTZg8+yNINn5sfi2SIyHBWA5zVWlGALJ4M1cgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Gslis+xZnS+2REIpiQdcNiZNM+Y1zSfDdY5/FlxxP5IRzih44CgiqlmFRMuiSFReA
	 bxKrQyUstSGutE5TZyYLf4D5m2XF4zi6BFDlBLuI5P0EugAQrR1VvtqofQylPv1or6
	 uTaxJy5oAKZa9mUYqpAFHIBZT7LN3i3gkda5ygtpCO229UF0DhRUfRsv6XeRgo5Y4m
	 SDUSaOMZrlC8v6RRdLbVoF6v6HYWLunRkldkupFGlYDK698wMh0lpIRg5d7ahaTsco
	 77pCOzds15gaUh3aPJXhaYmU26IcDZTIAYGjwkNSVY/xEnvRWTNBrMWhAJzG//Odhg
	 FkKfUGdjg3MkQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6E59E4DC9C;
	Fri, 27 Nov 2026 15:28:30 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 27 Nov 2026 16:27:13 +0100
Subject: [PATCH v5 12/12] arm64: dts: amlogic: Add HDMI TX PHY node for GXL
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-meson-drm-create-hdmitx-phy-v5-12-88c43eb95468@aliel.fr>
References: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
In-Reply-To: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=JP7lAwalWZ4HUjkBJydQfX0hMiglUBnijIXqwFKtcOI=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQzbnwllvI19u+fvVaHv1Eu48TfcX1xSshKMrH1TdmiOxa
 0k+Vw1DRykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCRi1qMDDdMjt5QZFwiHnrz
 SX39vxktgTL9uueeB85O6Ffk5PnCHM/wh7tb9uiX3YcnsTlLMug5WR9/kX5kypvpZ8/zL1v4yvo
 GCzsA
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
the amlogic,meson-gxl-hdmi-tx-phy compatible and reference
it from the HDMI TX node through "phys".

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index f257fe3860f7..d205eec1cff7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -328,6 +328,7 @@ &hdmi_tx {
 		 <&clkc CLKID_GCLK_VENCI_INT0>;
 	clock-names = "isfr", "iahb", "venci";
 	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
+	phys = <&hdmi_tx_phy>;
 
 	assigned-clocks = <&clkc CLKID_HDMI_SEL>,
 			  <&clkc CLKID_HDMI>;
@@ -342,6 +343,11 @@ clkc: clock-controller {
 		clocks = <&xtal>;
 		clock-names = "xtal";
 	};
+
+	hdmi_tx_phy: hdmi-phy {
+		compatible = "amlogic,meson-gxl-hdmi-tx-phy";
+		#phy-cells = <0>;
+	};
 };
 
 &hwrng {

-- 
2.56.1



