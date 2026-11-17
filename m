Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09334606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dLsSdvK4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vykwKqui
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=; b=dLsSdvK4WTJYH7oEhhFhE6n4LZ
	3ZV1OII/syUHLkN0X1+V1YlbcVsATVhSr1YMaTSi4Ih/23aqTOM1wTiGYvknafXvYqkPAcEDzMpL1
	sdmmYFWnDM2wgozXrXfwnbRpmQiqKiOu62C8p8mELMHyt8WnkUe/BtlFAkaopfo7TN0BoOod0YlmR
	azC0nMZgD2L1qaAG3MK5hd0pBtW26tctYIZYy3smQhYbMVfbbO++lirPiKqdqZh7HZ1FvbIgn6XCw
	RpjwsLuccIFrivxkUWFxhlDpPEINMKYiXAPqilA95IPq/+mOORooUT1/Cur+NbthwD0nnbVBcEe3F
	fi5bxo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK44-000000065yi-03to;
	Tue, 17 Nov 2026 14:21:40 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK42-000000065wr-0Z9S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:21:39 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-380b40319bdso2284497eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925296; x=1795530096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
        b=vykwKquiatcgB1R/4SXx6JxJ4Nh1ht6lkk8SEutMdJWUV6fygCel/w1WgYaMMmXS5A
         inApjLWaTzV1KEqUb5WZf831vxGAqTJc4ApSbbtOhvuuk7eBUbGHREY+gtFaUxGXygPJ
         DdTbdeadNNpazd3D+4/Pe+82ZS6CEqh4RN36ij0+mG7aPNL8ONehOHJ/sAXOmnDBAS8e
         KJpdLBKFsQF5HpWJ2V7xAuo7bDXIjKvX2AswUrIRlEhkqDKu8BEnRJ9KvM2QYHTbOu1x
         zh/Nom9kkhOMIUg5u6fPZ7jjdlxbUnaXCO41l+RxbXGqESktoiYWBUyapOfO5Xnv32c4
         X2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925296; x=1795530096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
        b=1KZPCGB11txueNwaZ3MHwZQKD8evIf9PFIQnQf41Ptq1j+a5CtFvpVjqjwXwdWbQZX
         wUq7V7SxvzTmpRxmw3f2/Bx5b1J23CwSwCpIEsGIdW8+PHbAGHZejJvK+ofXOlSoXiFi
         FdZVLcmc32m7I2Qzs25LLeuRrSLGIC8IqTnoivywQyV79tfOejwN8PKAUu5V3DkXulev
         A7V2HDD22efMrn24HyDvNXtBZO0+1NhNjITuFB3NHCWCeM8Bg7LrAUJZqOxQ2nSJP0py
         iRoadJWe+gC3HLVBu7so7K4SBYcvz90VB5YT2ohkSAhKm8XhdsCkYN2kHjgAS07s8/b6
         ALSw==
X-Forwarded-Encrypted: i=1; AL+hErHM2coRGE5tR6MwBaN5WG+0Ey42q6IL2JgaQ4BgucFCq1hum4orZ+8v3K45u6cjqsQ2XNzk89B3maOoM+O+jI9W@lists.infradead.org
X-Gm-Message-State: APuU4Z8CcUA/fvtF65bEQT6iunW4+8O/hkqs0pmbXn3M6g/V9f7GOQ3D
	Y02NjVIbAWWzWZKbilrt2436UADxM1nDkDJfdpdh5pIGP48cOeisEOaz
X-Gm-Gg: AZFdTZeTXdpRIjCsm7Gs6h0U1Akd0WjqrehROfzaWtM/TtwvOp/LlJRZ3E/lf8gnz8N
	dGiVjkbijIg4EH7p+BIY5+iUIIbXwqp05cDAEbySC+ifIqJfdS6AZgw1tWG6kIAmjnnqD1dMd6j
	/xnZxld9aMcrp1QXJ+CExr4jlJOIuYy4I39Sr1ny2qHN3P27gv//Mi/XjnHTQr/8BJ4kjndKI65
	SSyhf7ot9VLMeA1fzL7CUxTu2sA9HKWznFwI6Nvy1FEAEe/8qDn9ZbZgm479Je+LScCzAIdUsQ0
	Z2jVSvBuF53ojcsvZ85fwuCjcvsm191pKRmMUQYMzpwDlTUVS7oWjpuW3/l9SoJl7evMyy5Zkac
	gEKfMOWGyjPrwDfxgWGzuHxHYrhJnkEbj2fZfc4DUEwxBimfjgIwwJtXmE0MLye991UMWlK++Ug
	WTrqjn/aZdWVaRjS6fWQ68jMttrTtkJP+cwxjU6t9QFEJjofu2by6pW+q6P7QMB3QuI5be/akj1
	NzJDu7IRHvFZ7iS++M/CKccJ3/tOdLsU901WzLLZPMJZC7A8QoncaGt2dZYmwJt0wnG9m7GHpw+
	s6SA9BLX1aPU546ptoLCQt3DkU8Mff7kNbA/NqE=
X-Received: by 2002:a05:693c:41cf:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-37967506841mr13477392eec.29.1794925296009;
        Tue, 17 Nov 2026 06:21:36 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm43828258eec.3.2026.11.17.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:21:35 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet
Date: Tue, 17 Nov 2026 22:21:21 +0800
Message-ID: <20261117142122.246986-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062138_183397_2CB636B6 
X-CRM114-Status: GOOD (  11.53  )
X-Spam-Score: -1.9 (-)
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

The TaiqiCat A01 has a 100 Mbit/s Ethernet port, which uses the EPHY
integrated into the co-packaged AC200 of the Allwinner H6 SoC.

The AC200 derives its 24 MHz reference clock from PWM1, so enable the
PWM controller and the pwm-clock node that supplies it. Also enable
I2C3, over which the AC200 is accessed, and describe the AC200 EPHY
package on the EMAC MDIO bus, with the EMAC operating in RMII mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

---
The AC200 MFD and EPHY drivers/bindings and the sun50i-h6.dtsi AC200
description this depends on are already merged in sunxi/dt-for-7.5.
---
 .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
index 225f42bd3b9e..9b192caeecb2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
 
 	aliases {
+		ethernet0 = &emac;
 		ethernet1 = &sdio_wifi;
 		serial0 = &uart0;
 	};
@@ -87,6 +88,10 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdca>;
 };
@@ -107,6 +112,14 @@ &ehci3 {
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
 	mali-supply = <&reg_dcdcc>;
 	status = "okay";
@@ -123,6 +136,29 @@ hdmi_out_con: endpoint {
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
+		vcc-supply = <&reg_aldo2>;
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
 	vmmc-supply = <&reg_cldo1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
@@ -173,6 +209,10 @@ &pio {
 	vcc-pg-supply = <&reg_bldo3>;
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_i2c {
 	status = "okay";
 
-- 
2.56.1


