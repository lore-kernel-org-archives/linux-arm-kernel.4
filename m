Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E14E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FWc7uce7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XN9bvZhm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=klz0ua7T6gOS3jTSOaOt3eR/Zr0NsCWeM1Q/VVaJnPE=; b=FWc7uce7R3WE1l
	pdHfWgH/KFozDZA7GVMrBZPQEQuRJqR/IvWlQc+aDvUJuhEbGJg1U5u6jpV4829J0MM0IL49viv5P
	84s63GDGCw6tUJwCpPc4dXPBSYRF/Y2Tt67vhfbC4ax8EzVrsWi8dtxSgLXr7ZLXkDIi6+kHP9mlK
	Rjd0GnSySJavzGx/NkNLXn+CWP4ToLDZ0Va3eJQrxv8Q4l/Sbgrw0h98iw9DjfmR5lnhpcTKk+OeV
	xu3sEq+z+4g1u2ctbafnT5YIFuTB/Y26kt9ZZWjh3xLOaMAnJe370KIm92D6hqqyVa1/WHGIToxDF
	KKp3N8sRxzqyd3XtYZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV2-0000000Bfr5-3V3E;
	Thu, 26 Nov 2026 00:38:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUJ-0000000BfT6-1BV5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EFBA6138C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A6C1F000C0;
	Thu, 26 Nov 2026 00:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653442;
	bh=klz0ua7T6gOS3jTSOaOt3eR/Zr0NsCWeM1Q/VVaJnPE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XN9bvZhmWXl5198o1h97bVCErQYf0RFDXJhCMiNjDniORlyEESZQH8zMmN1O0kFe4
	 ZdqanQxOsIUjh0NtaHD8kMXqoAO2AUOZZFf+gujDTPmbNtWuleeZ2MYT+aypaVGgOp
	 lTIy0F9vn1TlRrNkeoKUsHS9EkJyNa/+nSMwEiziaqWQl10f0e9RlUD7N5NMKMwx3X
	 onYzT1bhBBB+SiJEr2WYDSSypbzVmlYoJtW2ujxenSJ0xAHaCDiwvOJgyn7hnBzcFE
	 Z0xWUTVkmX0IwIKktemFb7Q3A/TW2iAHMsXpRWIKFQqucMqFRSdsr3UEcpkYUaUiD9
	 1RKRSEv6MGUdQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:10 +0100
Subject: [PATCH 06/20] ARM: dts: ux500: Correct STUIB magnetometer supply
 names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-6-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
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

The AK8974 driver and binding use avdd and dvdd for the analog and
digital supplies. Name the STUIB supplies accordingly so the driver
can request them. Found with CHECK_DTBS=1.

Fixes: df44ad87abcb ("ARM: ux500: add the sensors to the STUIB board")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href-stuib.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href-stuib.dtsi b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
index 729e7e1fbfa7..a7a7146980bd 100644
--- a/arch/arm/boot/dts/st/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
@@ -91,8 +91,8 @@ ak8974@f {
 				/* Magnetometer */
 				compatible = "asahi-kasei,ak8974";
 				reg = <0x0f>;
-				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&buck_vio18>;
+				avdd-supply = <&ab8500_ldo_aux1_reg>;
+				dvdd-supply = <&buck_vio18>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&magneto_stuib_mode>;
 				interrupt-parent = <&gpio1>;

-- 
2.56.1


