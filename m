Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE92A6070084
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b3iOcyNW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqKj3Ioi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xfIMJABMJNp7QfwugcM4fcD/xpFndn0xBvRbdTIn/Sc=; b=b3iOcyNWA0m3Pp
	6UtIhGbTHOHasQNJe/c95Q4iiodIJ+EftnTquEAkT6NxTN5bAW7gGyEdW5LjXIHQyrIX/At38FvdY
	BGqcxDBIF24MRKGBnDvG5Z+4tPiMfXNV64chaG0zebFGrYfMMKrZNJcmkPMaYC3jzXpP1ZiLPTegT
	4/vIWh3x+SZWBSzayNc6Vwe1GzEunubACmiZ4GZ60I7nlqIRo08ASdx5Nps43VCM6oUfTyHCTrxR+
	z1zDr78Qn7vNEr5xSVrW9S6vuqbhXCdbH0tgzn8v1Q5rwGqG3LUNo5cLwm6J7v7zkm4hhiO8o8DjN
	K+oM7X9H95nzlGXvpPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBN-00000007XWz-1mg7;
	Wed, 11 Nov 2026 19:40:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBL-00000007XVn-2wk6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6865C407C2;
	Wed, 11 Nov 2026 19:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1062B1F00A10;
	Wed, 11 Nov 2026 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426031;
	bh=xfIMJABMJNp7QfwugcM4fcD/xpFndn0xBvRbdTIn/Sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eqKj3IoihIJtj+pHl6B8puHU40wNPYe2V2gaPVH3AOkaOMoeTzbdkSeUT6encYtG0
	 wiH/FgZU5F+65y/CYibJDFk07vfQJQu4/AcxJP1YjJFR55Fdt70JVgpIUmNm74xV8H
	 QaUaJOG58G7MZEqxd+7Slv4Dn+/GvJQevPD+UPxoaK+9gnS47bormzdOPbSEeCnjUA
	 NMsZi2MF1KjfiC3qCxj9jH5D/Q9H/BrCq8ey89ko8aZ0ww42h6uWYqbi60xF8JhxXP
	 oF1+9qJF1Bp6VGyCnZoCNSeDt1IyAuuSbJZHBAfyTwOatY5gJ//LfRO8IvktPd4Xy0
	 pG5tpebrYJASQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:14 -0600
Subject: [PATCH 04/12] arm64: dts: hisilicon: Describe ADV7533 supplies
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-4-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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

Add the ADV7533 power supply phandles for HiKey and HiKey960. Both
boards have a dedicated HDMI 1.8-V supply. HiKey has a 1.2-V PMIC rail,
while the ADV7533 on HiKey960 uses its HDMI 1.8-V supply for V1P2.
Describe the respective 3.3-V rails as well.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index acecd2dfeeba..1b0ba3dd2cde 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -192,6 +192,14 @@ wlan_en: wlan-en-1-8v {
 		enable-active-high;
 	};
 
+	fixed_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -571,6 +579,12 @@ adv7533: adv7533@39 {
 		status = "okay";
 		compatible = "adi,adv7533";
 		reg = <0x39>;
+		avdd-supply = <&ldo3>;
+		dvdd-supply = <&ldo3>;
+		pvdd-supply = <&ldo3>;
+		a2vdd-supply = <&ldo3>;
+		v3p3-supply = <&fixed_3v3>;
+		v1p2-supply = <&ldo3>;
 		adi,dsi-lanes = <4>;
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 229116477f1d..5f31569cf494 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -505,6 +505,12 @@ &i2c2 {
 	adv7533: adv7533@39 {
 		compatible = "adi,adv7533";
 		reg = <0x39>;
+		avdd-supply = <&ldo15>;
+		dvdd-supply = <&ldo15>;
+		pvdd-supply = <&ldo15>;
+		a2vdd-supply = <&ldo15>;
+		v3p3-supply = <&reg_vdd_3v3>;
+		v1p2-supply = <&ldo22>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <1 2>;
 		pd-gpios = <&gpio0 4 0>;

-- 
2.53.0


