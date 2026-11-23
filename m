Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D204C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3oF1yJ4c;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JXuixt2q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iFZ0PWQVKiQkqOudwBnU9+K/nhj0AUrbePeCCn9dkhg=; b=3oF1yJ4cj1FWOQ
	Kd2ScvizT0sU9Tfx6E6TUvRkL6McAk/vIIbCrDAKb0T9jUesbPF05PMdQbm+Vv3ajUbkHTfHR1vZC
	f+GFa9QGX88+LMTQSLnOBa3tUPclmgdcVyitVjKVHngJxOmcY7DmHMWFrGWnjpgDokaM12wmebc5y
	wxKmBbEzLfT/ARev3uSgPCK2xFzuCFp1n6GD0C2G9HBQgToxYHURcyn/6HGrAa0OUD425F8/V4U8y
	RJqrpbULwEAYGcfd+QLMGKQCLsoAndwbDJbA6P/hIujI6hAY8G3dbnGGvnAcGYdj4OjfzSHisguDJ
	tBDpI/+JmJVy0ls2J1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSBJ-00000003ASK-1NWH;
	Mon, 23 Nov 2026 11:25:57 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSBB-00000003AO2-0Itx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:25:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DA4782020E7;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFZ0PWQVKiQkqOudwBnU9+K/nhj0AUrbePeCCn9dkhg=;
	b=JXuixt2qSHm3stvhhzSTUJksk4b7CwsSdmp45JRp5USpu0bHDqaIJgLLX3oghBWvzFrpo+
	62nl88uFxI6e4/GgEE9A2KDaOHgsUltQr/sCDxMg/iMbTbfO1zG6FmSbwWqfYJtghkOsar
	FOyYDLJVYEyGEP+V9E55q7ggdU1U543vJuWc0x9JjBDzh+Y4tBIhEimmaPjfHjhaSj+QUM
	+l7SFB71p6V57J7nIz60uuRurdCPkMHxjkagnXiBBr9Mg6f91JHDxaIkdl4AcZ61/J3TDv
	b79f9N6iSHHbiQqQBofxA0yzA40gxEvHHNj7nuJLpKizlLvjzt7FDrHHoevSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFZ0PWQVKiQkqOudwBnU9+K/nhj0AUrbePeCCn9dkhg=;
	b=GZoL0LI6NpALD2b2fuMGKxgaC/yY65lx/ZgErUcGNHIbQIn9M8UvDnzNvl2Ir97mM9+Ztp
	TKqtxa1D04uWxT0v3gBXsve52WYZXO3mnWpYonQofKkAZQzaTMhAC9RTeHvmzyDRvOF8FN
	jXcWwShYCJ1vvKvphP+9zaUx4CyFxB7PJUObeQeisLmtxMH+DbBJEjIiULl/trL5TJ+8/V
	YRXY/Cur9zamPM5ydqXOewi69cVkx1qAUG5uX10Ggd3BdlgXnvyFLvqhBCuXyxs+VYiie6
	r8F3Amlrd1Vtwd9fNq5z6kImN+jVe2r2U57Wc1XOELkScq7/NoT1iB5losQEIw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=DkbzSujDve+LbqaxGyAq6D6NqmI47r1bhQLys5tYYXzwzPPcQdIcweQijsxTHt8/E3UArv
	xpUxdEKoUuSIWCB2sDPiCfmZ55Jttg4NsnytQD6YodoOF8LAbCT9gsbSBODb2qyGUofuL9
	SjwwQFbvGOEJSHbpb1HmlWYlLjtVNXXoWuc4ciZ51Zxt43VmoefxBaP2A6yeKvq2n6WETh
	8yJsdG1fWb3m7OVIR9pFnrpRCNKE+zf+ObHTr4aamt/dT2ewyF0oPA0UqwjH+V6VP/bN7q
	i105NZcDFkwzC8NhsKe1m48HUx4wvR++qd1WG/CT3xvTAF05S4n+6JvvRhmBvA==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB4-0016XI-0y;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:19 +0100
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Describe USB2 VBUS supply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-imx93-frdm-fixes-v2-5-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032549_270894_F869B7EB 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

The FRDM-i.MX93 USB2 Type-A host port receives its 5 V VBUS supply
through an SGM2526 load switch. The switch's enable input is tied to
the always-on VDD_3V3 rail, keeping VBUS enabled whenever the board
is powered.

Describe the switch output as an always-on fixed regulator and
reference it from the USB2 PHY's vbus-supply property.

This provides the PHY with its actual VBUS supply instead of
falling back to a dummy regulator, which else triggers a warning:

        usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests (id=vbus)

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index e81b2342c50dc..bde2cab5b0c0c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -62,6 +62,14 @@ reg_pcal6524_vcc: regulator-pcal6524-vcc {
 		regulator-always-on;
 	};
 
+	reg_usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -399,6 +407,10 @@ &usbotg2 {
 	status = "okay";
 };
 
+&usbphynop2 {
+	vbus-supply = <&reg_usb2_vbus>;
+};
+
 &usdhc1 {
 	bus-width = <8>;
 	non-removable;

-- 
2.56.0


