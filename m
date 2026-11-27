Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32BC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RPoEPUTP;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=TFexu2oi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=U4SptANc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Cv4+1Xfr839+h7qcIeYZ/jNwJfWC9c1igxZwvPTAJ+0=; b=RPoEPUTPI1JMPq9ErDXh9KaQfV
	QtHADhcvzCCSWcfLGqvH3qwrrmR8WTGtheJBKe3k2VlHGN4ekQZ6AbWVFV8FosQ+NtvEoy92ap+rc
	CRW7Tlnihjnlqs8MHj/nObVsXxDwfOMd76AcGdHeJHWxav0PG48MYX8C7LD/zGKsspmKIA5DRYKu+
	LsnZHmf5fOOhIaxAx44/+9JmvSfX5A3uZ5lyfXA7IjNIZppow7ZLvLhsVLx5FbiWXMVWS3JcKyjWd
	RY2I2c9IgAhcTzBGZU6d/iDKJg6QApB+qzBcY+Ovz3QduPimZDYCFGpS0pzVmQ3/LNRIU4lmSc5UO
	7pI0vWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrFJ-0000000FFIX-2vr0;
	Fri, 27 Nov 2026 08:23:53 +0000
Received: from flow-a5-smtp.messagingengine.com ([103.168.172.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrFG-0000000FFHp-17kj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:23:52 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id A71881380D0B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 03:23:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 27 Nov 2026 03:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1795767826; x=1795775026; bh=Cv4+1Xfr83
	9+h7qcIeYZ/jNwJfWC9c1igxZwvPTAJ+0=; b=TFexu2oiLqPXqW6iJnEDF8gtd7
	3hkqAn1fPh+i5sLJzaBXdfXqgmjT+X7E9j/CvIJ6gQSzP2oQ1mLcKXorNxKL4L++
	C4IQ7GKDIHWuJ4lM5ek5QEtrEPabJN/xnB0rZn2PGlg4vAzvfkvD5cY43q1osAMo
	F1NKkYcTgrFi7qhvB03NRNQHnpHrUjUkhTrwFDuxk+ihhca4RghR7N9H2XMk33vY
	tons1AJ8Tvi+Rqdsh79CvGehvTFsqYpTpKMKUwreXILIPRBoDZQuUvQCa+coVbo5
	ytzW267w8AcOkvlMlTXVBvmG6gI7//jbIuml0cP4FijqJ5dsjxegXK0lK+mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795767826; x=1795775026; bh=Cv4+1Xfr839+h7qcIeYZ/jNwJfWC9c1igxZ
	wvPTAJ+0=; b=U4SptANclt5YgEsq+wm79HWhRnldb0IA8LPcVX09ywri2l05xIf
	SPSiyGGfCGwV7cVOGl+cZGsh6QMix+64raT0DUyY1EKdZamR2yodGR8+Xi1kmgur
	BZVlUb/GG1psGYRNh0adLwr4WAUtLq1az02W1XzZelAtDbQRV11GXSbFs6NS+dQ8
	zlYJNy8R/riqSfJvD4rFYSF26bN7sgMTI0W4kQUU0bbYCX2QyB4k41FHM4DdBgZf
	WpX2VoZ7LnZW7WdBo9IgbVISQgyY/rr2pgtz/vwmzZf14robRBcgAOk1h275boRa
	qBZLhpcQJWmzV0SgjUdETJh34FhW6Ux0SRQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795767826; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:JmHD2FYa7s+zjjbDTzr1OBtrtFRkakexaVqFXXX1uxFbkWw
	9KBpfTYG+iehnbpfb0x1Wg5Qgcilx0WtJfKqFhDqpcbrqc/y5aZcdeS5QeRghFG9
	wKSc87rTtqkos8i9rDYaC0VoEghQZrUkbvL8nKzN1MukBM2NVkP/FeoXb9oU4UYV
	92Cqp4AjYSal8HizdX5teu7ghLFo7EqxQcBZTbcwyM7lH54F5ZOyK2KtOS5k947L
	/mN6sm9ZtozEXlk6vFFLHvbcdtA/Q2z7R69WXr1ttoHJyYBMyCAT4uh0qQScZSOm
	/mDLUtudjc3GWSDusUUfto8FHzj5c9iBUGLxlkA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:rygoyZPL1u+UVUmkNGGaiiqQfcN/RqjD9KBaruIY4Fg=:Rn3DoyUg+bNZtxOMK4Zjb7TItUkllrEEKyE8Mqlia8o=;
X-ME-Sender: <xms:Ej4Jaw3ySWLz6lqp5GFvyQwH_27JnqMUSdvWK24V_e22x0Awom_lXw>
    <xme:Ej4Ja3qkuyrNP8JefuP5l7oFeo1RgFc4p3253ZQ32nXsczSiHKW5MHUi-OscVYqO3
    Z1RW2k9JVoRmR2lBJ4OBAy4tfrICvU09mirqMy2OyjLLXMk9RLMyPpq>
X-ME-Received: <xmr:Ej4Ja9XcyKeHHJTgtuicRsM2JZKbSDtCqkQO62VQ-8d4h6-ixj-veZPwC9377SaNJWFuDgvd>
X-ME-Proxy-Cause: dmFkZTGjqEJdCCdkToT1ymEPOxN7ZB6H8+j3Xlolm6YU09DyG4QPfDv+eCsmWTDd2bQ4BT
    E8yhE1qvj70nkFTa/nN0PxFDePnjYXlndXvEGJegnV0j8GUf/JjHauMzxhtxqEynQS+fxI
    eOPd9cOsc3bUwvRSDkoPJLz78gey0XShzEjfmDbl+py4vPIoq2fzlgjhguILc5aii/Mg//
    Eiz/xQJx+3CPYbjrOkPO/X28szkIwdeVlJwbDF6EJuJ9nTb5I72UHcZNvHREPUCY4Pb8Dp
    Yjq+STILo7DVsNKtOgm7Q8npT1ZYWUyUzNtF3ZnyR1EPbShfYkmqCmasmanXJNIIwVsVU+
    iLhLkABVUa3DGWpzvSXu40TZHQ9mtUfRvFDsTvCWdyB5s3yFVqcZ5Fmzf+YnTAivMX6Saz
    +3aZLLV8pjRm6wLCQUflKxMtWTgPqC927FPLw+KElRlAiMuvHq7e+4wBfvWwXYdUjhIz5P
    yEB1RIilec+63Givv3DD34Za2tFzof9ozHvc9Uz0O8f8FQooOQsF2mul9AR9HueW1dy50w
    NXQar2IVf+Zj1klAd94Tu+xefgQmue3UU0MnibtOeVEjT7un63DnWF/YnvPXnnBw2vsu5q
    K5fNSh5/l3saF3WKQQ7qpdNfT6/eXxgVvtNLAkKTPga0KsjfVyh/tRI8oNKQ
X-ME-Proxy: <xmx:Ej4JawpmvmHBZiziakneIzj77V8vcW2CgZjKB5-qhgLVqzwA0mP6GQ>
    <xmx:Ej4Ja0BGFMdRcImb25-Bt2q1rsED1EE-_N61H_BIPg8mkQl8g0gMJA>
    <xmx:Ej4Ja8jgwRaIFreKyx2QdgqTxhCaN5bBxIbW86OnLiJlgvxDGGvsmw>
    <xmx:Ej4JaybOoBzIl07ZqOXDpqAUXT4pA0rJ9zyGYpZeXZOq6BX8pqYcSA>
    <xmx:Ej4JawkxbLTSSwHpnadAOiLKV0HsLTxMtr__Z2xkQf9hLjLoK_60Nkz3>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Nov 2026 03:23:43 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add Bluetooth to ArmSoM CM5
Date: Fri, 27 Nov 2026 21:23:40 +1300
Message-ID: <20261127082340.644739-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_002350_497405_63ACBB22 
X-CRM114-Status: UNSURE (   9.86  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The CM5's BCM43752 (BW3752-50B1) has its Wi-Fi described, but uart4
has no Bluetooth child, so hci_uart never probes it.

Add it as wired on the module schematic, with the HYM8563 32.768 kHz
output as LPO. The binding has no BCM43752 compatible, so use
brcm,bcm43438-bt like rk3568-9tripod-x3568-v4.

Tested on a CM5-IO: the firmware loads and a scan finds devices.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
index 71ea11e1f8ce..667e37100637 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
@@ -548,6 +548,22 @@ &uart4 {
 	pinctrl-names = "default";
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio1 RK_PD4 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wakeup";
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_host_wake_h &bt_reg_on_h &bt_wake_h>;
+		shutdown-gpios = <&gpio1 RK_PC7 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
 };
 
 &pinctrl {
@@ -557,6 +573,20 @@ hym8563_int: hym8563-int {
 		};
 	};
 
+	wireless-bluetooth {
+		bt_host_wake_h: bt-host-wake-h {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		bt_reg_on_h: bt-reg-on-h {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_h: bt-wake-h {
+			rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	wireless-wlan {
 		/* GPIO1 PC6 - WiFi power enable / reset (sdio_pwrseq) */
 		wifi_reg_on: wifi-reg-on {
-- 
2.43.0


