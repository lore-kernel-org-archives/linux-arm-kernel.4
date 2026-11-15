Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC693606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MwPK/J+P;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fHhG5lAg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=; b=MwPK/J+P89pQhh
	dzSs/lSuwzjJR47jIlRNzUZG3Blu4Cs/hgtsHYDWPpGC5oMNKS7pqc/ynJcT+AdNWhzX/I9AbvlKo
	r+hvpVA+bV3kgaoYDkBFOAxjpMhLEVpiFMGZ7oL4GbwiZGUkMTbrdGwiGALXuiDgb+lLbimgQNtWZ
	Ie3ESXsPUoB/afAccLcWLHw6+zUZ5VW6AxM7P6CABMlg+WKOkWRLyA4COucYnZymUx9ro0sDVuFc1
	9K7MDOdMZm+4I6HcGi9ESwhQXuu/8KSXJ6j3lnqnD7+mkWeUYiiNLhJm8n0Q7f6JW+ii4W4MYfulz
	extCpRrEOpekRMK5I9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdlo-00000000Exo-3MMN;
	Sun, 15 Nov 2026 17:12:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdll-00000000Ewd-1HO0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:11:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so26560375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762715; x=1795367515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
        b=fHhG5lAghXwFZTC7DQsiHLj7JY08PqNdPOrvExmFBi3u0BUhgkeS2m0KjLNmK4zJO+
         N22815sec4I97hW52Wj9iE9LHtOzRwfq8bAz40FWK8NGCn/zhjUJUNUfiJJ6yIKu5XwP
         RSRSaMeYQ1Q2PvF4ioJRWlJwloAd4fSmFaZfq4nXyCUCpMGLsEs8pWbNApVOR7yov9Kv
         Vy4JC5VO1BLyxGk5rPu7EkzC1jVoO+t9D76cFj9cfWru0W/W1Vg52W3oMhCnXD5wYZPj
         fqslP3SFSIaVZq/mHFYVy8mhwMMULTTetBYUmPqS+jYz+sGmB5MLK8fFfUgL0Qli07ga
         Z6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762715; x=1795367515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
        b=qZFZ7nbU8V9EuCsvHWwbb6N8tgee2L8I69h4+MJq/Z6ddOED5xu3OjYnKNDGGyvCSy
         8vWbvANH1LJELFenfzlk8jLq6yKSlIBJqLxz3yR0WjlsI517W9FXQCnQ1YSsWMhtL5W/
         PxAH1A8WQwO36SO7Tgc545Efx/6B0gK+KzCCd5Yb/Jvp+jVNb4RA4D9ZVP5iDU1eTNUb
         leSeDXJcBNkHqjltKpF+IBB+q78LZf36RW7TLsY6F7mVmBKhcgi0Z5zObUWB6Pyc2jma
         fu0QKDggB5DCRniSEbOvME+v7NZmcg1JdcwEVhfV9pOsTlYHMG3a3Aq1nNNEvDqU4AJ2
         yleg==
X-Forwarded-Encrypted: i=1; AL+hErGjxLTHjsZpSuUI3cw+C/HW0xIefQW4tBAeqgVI0lHIzS3b0K5kWsnbVxEopWgQZI8HPD3LurZwLeCMGDhsA8/r@lists.infradead.org
X-Gm-Message-State: APuU4Z8qmp4Uiw4OgoDmoDg8MDvoKT7or/BhnvBDNI0TiezoQfX76kHt
	MVvUzIViKaxpkVwP4hm+sRKJSEnzWNSVR4hDECgdJUPj881oI/Xx7ZKU
X-Gm-Gg: AYBFou0ren9pZcmULiZDx6AZZzLorzlkjP9aSZjAK6iMJj0OUbI8OcIP/HeEBti99f0
	c0L3ATpP2/8r4FBUOJazJQFwYodRn8Q+uVQcd98QKSK6nKSFuGymjH/IePzuP3w+s42q8dT/AUC
	thBFWJDeT1RXVGn8c6z/tSCsVBJEAqbrB5ZkK3Nhj7bT1khHoc8eMO/zjzIfuKQ/SWq1rxaGud2
	CIxHA/5UnBqHrwKFEeSjicw0cYRdMMRBEwJ6vKTA765a1Soey6fQWHZ3ctLQdJqXIqtSZ6e9Q9C
	bdgxJikBdvFpFf/KAx73fRI7/aywIDeVKkEg8sqQZMCHm8wHd4PpavIBk0jjcVms8DyGq7LBlWy
	rkxftJdCroh4bv5AkeQV+0tudiGoaxrhEIHUnbZyD2bSyO9Xdr4aYWktWmNZkfUagyTVh1vAxjH
	WDxlW+pmJD0DEWsWYh1A5Dpii9UVksjsfVgyIiMoigoQ/es9qz7o0hgE1OwSjnI4jlyWd32fAAX
	sl80Zl/WAMMih0AMyf+xGW9yQSFjQg4OuKYgaKU6KiKqQlZDNzxFz5U63CLlgGqnN1cSai0uJUk
	yBor/uABr3A+7YwAJMgs67VChT6UWJfgPU10oR0SBPC4MnLUzrAs9V9CgnxC5sxhjNV+mM4R7/B
	9l4ZVzJhyk5xdpg37pH/xAZiN21DyBBXDKPoQagOiqfZwifHlp7720JMsYWvvXBlFMvMCJkhP0o
	Rrg8ytNYOXvneKVkldYFabkHBh2WCWsQ8HTYW0mdpe+ofI+Y9Uxovd15kCTcDGn1me2q+kwkTj5
	rx0HmHNT8ozDQ==
X-Received: by 2002:a05:600c:8b38:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb55a7b45bmr192615255e9.10.1794762715336;
        Sun, 15 Nov 2026 09:11:55 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:54 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: tanix: Enable Ethernet
Date: Sun, 15 Nov 2026 18:11:48 +0100
Message-ID: <20261115171148.37784-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_091157_356914_59DF0F51 
X-CRM114-Status: GOOD (  12.58  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Tanix TX6 and TX6 mini have a 100 Mbit Ethernet port connected to
the PHY in the AC200 companion chip that is co-packaged with the H6.

Enable the PWM controller and the pwm-clock it drives as the AC200
reference clock, enable the I2C bus to the AC200, and describe the
AC200 Ethernet PHY package on the EMAC MDIO bus, so that the EMAC can
use it over RMII.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index f08077175549..d101001b6f70 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -11,6 +11,7 @@
 
 / {
 	aliases {
+		ethernet0 = &emac;
 		serial0 = &uart0;
 	};
 
@@ -85,6 +86,10 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpu_gpu>;
 };
@@ -105,6 +110,14 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&ac200_ephy>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_vdd_cpu_gpu>;
 	status = "okay";
@@ -120,6 +133,29 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+};
+
+&mdio {
+	ethernet-phy-package@1 {
+		compatible = "x-powers,ac200-ephy-package";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vcc-supply = <&reg_vcc3v3>;
+		nvmem-cells = <&ephy_calibration>;
+		nvmem-cell-names = "configuration";
+		x-powers,ac200 = <&ac200>;
+		x-powers,xmii-rx-clock-inverted;
+
+		ac200_ephy: ethernet-phy@1 {
+			compatible = "ethernet-phy-id0044.1400";
+			reg = <1>;
+		};
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -163,6 +199,10 @@ &pio {
 	vcc-pg-supply = <&reg_vcc1v8>;
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_ir {
 	status = "okay";
 };
-- 
2.43.0


