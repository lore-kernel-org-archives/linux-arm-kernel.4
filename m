Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A309606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NO+mJZ92;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TIHKyRTJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=; b=NO+mJZ920tFpw+LH8qrORVW/Oh
	LLqskaf0aWWNp5E0nPcAzC7zlJsxpuX8MI5dK/5Roq1wYAdmAJ6bCp6JKpV6Z0rvHx/gET/IjrKur
	BLqw3qJGXR5WQZAIJb11UyyTcB2vz07s39+dZ+zQnLRTd5CGqPuXhvt24kF01Ddckl05lG7JjZ6GM
	02g4GvYxmqdbQTC3QiJNqSCyFrwi0VAgxaxFItl6Q128DWFi3sruu6lqKVY6a6Or6D3S/iRYvmfvK
	ViMwFrG1r3bp9h0f3D5Cq37rv2EA02BU3Rb79TAKKA99chlbXwzcATnOiYurQfMiCYa6+swCsFbCK
	ZV7LRkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTewA-00000008sIz-2ffF;
	Wed, 18 Nov 2026 12:38:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTew7-00000008sHR-1DOc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:38:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so591449f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005529; x=1795610329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
        b=TIHKyRTJFFSpMXS+HquANL69a/DVeDiZ+0AZeJb1WF9FPzWpPgqUzt691Tf22H/aVb
         r4S4flu5T8HOuoskZDxFQuJEJAXuBvn68RWcoRQWt/jeJ7LgVa4WiY6OMikGS31S0X2d
         vWNpUnNN/WqRCMK3Lvb8L2BXF9NBH/kjXJ0v9zdma9tA9NNh+UfMuvKLt50Yp/Np/5fK
         cMMfIS9EFtyweGo7ILDh6mxvhDM8Mcd/GJH7JicAFTpyoZIk15bvVko+vhV8AiGwTSkC
         u8lRtsZnorjMq4G7P/m6eaEl+6syGjCXS9fnh2/OkCyCnjbOxu2/pDtoXhsOY8um1/tH
         6rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005529; x=1795610329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
        b=JGIeMYzrmgA5m6UaGx1fLPeePHYRcl3U5f66qkKLSos2C+0+ypQgj1cdRcs93w//Zx
         HyvTqpi9jrCkN2P1fn/aSdVnOXuLyLUzpC4e15YGcnHQd0QCXnQFNC1gqqSZEVARvQff
         Y9kth+LNaMRpBWhcPWFe/CnbF/wg4iKfL3MjmGaXUYBxV7HcaZaQyOdQfa9eUGbx/KLH
         tnTOsYbF81e+ydHTh7/4gvct4v/6G+Cu9wDHot77+NYUaorFC3JkOeJ7Cu36au578lgB
         s1NRYPhiZ7FYq3J7J3r5+IO9fxNpmGey2yh/aeuT1Y2LOY+pN56F5ZOWxdLNA6Vmeftd
         rKSw==
X-Forwarded-Encrypted: i=1; AL+hErHEFW7fXD+Ku/JogOPZhFaeW1bx9FsJioehfFB/pKSHrgV4UZniN1B+ABaOOZdpBeFGVjnZGgoWZVBDHVxdQXOf@lists.infradead.org
X-Gm-Message-State: APuU4Z9yV+ywrkU8BbD+HIWi5AzwU2WGPY2+nNUuqov2vO8SPLiTU0Bg
	StiSy8aj3WA9mL3HYf9ux0Z5zCyib5mRytsuYVqM7zebq3Ok9I0octrX
X-Gm-Gg: AZFdTZcwKUh1Cp0AgXWTSQT3e7aOOxE3TMWo58+SotQRQrlOMcNiqHBGxZQIIp3aZMI
	iZy8MAzwXisLR45ib00OsnFoDT6OSHZiYlLnSslALdaGM87qWTyRScWGirhkP2iIzMIxqDtkdWQ
	w65fJScwQW357KmlmbBaK5p/sjigdY3DAlC5tdURXrNgRJXai1hBd7naT0Dh42mlQap4ajwxEt5
	HNUAm/EYKE6tN66B0cbRQb0yDsSnqTkbYEn4OeK3+/eauSOBCCrjwEd64ckbnMK3kkVBMUf1rJC
	GGprzgWF4+dxfYVot8cU0a/yPuy5KE1XCvu6p/eLqCYl7lidghFePgGZ2gGsJaYmRCHDxZ0ejrY
	8svvf3ir9rQfGWSZCcIneXERI3Ka5dp63ogDObkRKEytk1IJvQNHQok1LRFLc6FRTpCdSrz4pX7
	meCbpJaxyaeXcNsJtjvF7IquDcgwYmxPVwgAw6IQ0fyt1xBd/v83ZT1H/ZYBY8g56nlUGzGo19v
	ckbNbIw3orOCHbUOe5/m+kC7jyzNWBDRiKrtt+jPAcEJqnLZsAUzrfpm7aa+AdMPWFrUEp5K3t6
	FO4kQavZBd1Ma8XkUPgrD/oiyuUJeuWLbw==
X-Received: by 2002:a05:6000:1a85:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4a7ed957d61mr1616041f8f.22.1795005529035;
        Wed, 18 Nov 2026 04:38:49 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:370f:e244:9816:c590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2efcdsm4539201f8f.5.2026.11.18.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:38:48 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH] arm64: dts: freescale: imx95-aquila: Add ath12k calibration variant
Date: Wed, 18 Nov 2026 12:38:37 +0000
Message-ID: <20261118123837.651915-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_043851_351315_8D7289F7 
X-CRM114-Status: GOOD (  12.28  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila iMX95 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
module reports the same PCI and QMI IDs as other WCN7850 designs, and
its board data also comes in variants for different regulatory domains
(US/EU/JP, UK/CA low and high). The IDs alone therefore cannot identify
the right board data.

Describe the Wi-Fi device behind the PCIe1 root port and set
qcom,calibration-variant to the US/EU/JP board data.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Depends on the qcom,ath12k binding changes in ath-next:
- 75bc725cd92b ("dt-bindings: wireless: ath12k: allow calibration variant for WCN7850")
- "dt-bindings: wireless: ath12k: Make WCN7850 supplies optional"
  https://lore.kernel.org/all/20261117174154.549590-5-ivitro@gmail.com/

Until they are merged, dtbs_check reports the missing supplies and
qcom,calibration-variant for this node.
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index a1870f7b2eca..a73d137af2c4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -621,6 +621,14 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		qcom,calibration-variant = "Silex_SX-PCEBE_US_EU_JP";
+	};
+};
+
 /* Aquila I2S_1 */
 &sai2 {
 	pinctrl-names = "default";

base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.53.0


