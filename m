Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7AD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g2x3WDVs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amjwSK6F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=; b=g2x3WDVsNyXgv7
	L/xRSboW9SM1tlCRwLJ7ajS4E9Vsq/Ya9BTMmW+zfxNSKJUC4Y6SFtW+cJtaxN0REshSocimQQb1o
	1u4e0KcgOOlDmSXGSg5pqHKR2vJ8hsiAMgcHNGXGBv6x4nPuQCrP0rqKkBMfCkA9xkadfq9DVrOeX
	5mYm1HQVHNq7pKsXHuei31op/qWIENSbaYNQGfkNOTLNkGskybuOFxTU/dblp2RZVy7dAQo3vvls1
	jY9yEF28cBefaoPlYYBUP+cHlvx6DtuuZcPcGQq8yEiK+4lD0Ktj0QM2V3bq9arvWY7yyRydoh2bO
	vTjorn+U3Fi4hin88LQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEQK-0000000AGbm-2Zd6;
	Wed, 25 Nov 2026 14:56:40 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEPp-0000000AGNP-2fNx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:56:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3371871f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618568; x=1796223368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
        b=amjwSK6Fi4dA5IQBKSuUKhfnsT9iHWVscCk5156cNfgakXXxEDwMD6pGA9wpItUhGp
         XJzgSTEIZ9zNAGKhb64QnluN4TraPrP3wA92LaWFDqeRKHE+PzUPingjTailav8AxqU8
         570FwF0M874eJUg+zOy6t48iLQQSoWeMDDoG0qtpScgmsFrYuLI00wVhr5/CjgdLh7PO
         9aSF2n4sm+WkUkUkjqyzZhCSA8PoTqH7QqPrKzWtG4HUyhCm5IXisIZ+ejiBJS9QWo8a
         5hBFrTWDgxxdGA2SQHKyYG+s2BopdHnxMxR40OAW93shPtbAYUYc27B9a0k8OI5FffIN
         un4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618568; x=1796223368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
        b=oP8Sn/kNOwvNZPo9Uu9YVRgFkKDks7CBbx9J5ySO+PRV0e9pUtlPa31JqerhV+R8u/
         R91K0EjvS3E5j7XDT0vb3ZJSzMsdk2JilOOIKlCJyhJrumGury9p6lOhwPPuMt77pJMJ
         KhEKwx382diuVnxUJwZPvkyZ7miB4gnTHE+oewk2qBoTiVoRzcyYqPZpM2Tw5SaBuTmW
         EWx5P88sCLH1lZSBxgC0DYge2Zp7NiTcuuiUBhhLlJn+IArNuPUQAAxGksDWICWNi5N3
         CIqOBEx5fBz07JQXX2VGqIuaCzudQjlqzjZ+LDtluhVJYLnMwAA5XBT4QG+HsExD8ZJu
         +G4Q==
X-Forwarded-Encrypted: i=1; AL+hErEiZaYKIVa4OBINsu4FIpwQSV+b9qZvSJ3B/vbrwYYtculEUKnhIdIRVuzVrzzr/9I7im8N4EVPoHgaDb1Qa9e7@lists.infradead.org
X-Gm-Message-State: APuU4Z/TwvzucEQNH9uahoXK+9r9uyT25A7KFbxCXf5Wz6Ed8yaNIS4d
	l9pYayzwjYm2v4przDJvb8H6j9rUSeSpMae4MPR1YLm0FhbEhsUJgMYNcBLn9SYvoS99cw==
X-Gm-Gg: AZFdTZfpphYfhSmFxeMHfJre09F+wIoc0yt3UbWsQXFpFXI1oYKeiE2ucdMf1ItcFr0
	gQ5a222VYNTT+9HKJnCVFFzigj0A6v4QmPbC4CSIT4h5SMDB8HIplTKujZ+FgzGcObs4UC9DyJe
	I2d6Q5QPhnufyskzI9IL94SsDft8G8MBNoTGLDgQ2NfCKYyDh+juL9eDZn1NF6+hXOk6rWxqT1U
	CJoEa+qvLF14kl0WHGKd9ptX2c/b/p4EHaROymLY/iikNrR6ZXkzElzg89+QkkH9uz48pB8mSrU
	CuvI7RwIx2hDnqJRT5Jqn7+clerNPuVePB1Cv3hYYuMHqIJMC6Eny8JDz71H5i9orMAdbx9zbMY
	1P5QNQkL7Qw2U5zGH7G5748RzzkoFeXNC2MlEqnZDN+fc/XD56auevUIT0xpUVb+7Lj2Qp3sYqA
	RSwnhDUANNXrw4uAienwaZ/CK0O4aIWXBHLmg7GHLa1kqLhey5YcwfEf1SJ6/GLQwc5Cc80JMnN
	mn+g9dt48OtNwsKnnZU5ZgwAlhFt/yx5u/nB/npjcif71k2pMGs4zIgrbWw4jZMBlFtp1VK7rMN
	mG4qfqkhEVm20IO0GQkNHr+rPI82zLP1UXH7W4h8p3XTjGzXWoKfuQzzSrElblWIXvYYR6xfYXB
	5ZhKyR+flGdMP7C0bxxoyIRGAEtrlXx+hIg==
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr23328733f8f.38.1795618567632;
        Wed, 25 Nov 2026 06:56:07 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:07 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/5] arm64: dts: exynos: Enable USB in Exynos7885
Date: Wed, 25 Nov 2026 15:54:55 +0100
Message-ID: <20261125145458.2594179-5-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065609_716504_665BE276 
X-CRM114-Status: GOOD (  11.75  )
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

Add USB controller and USB PHY controller nodes to Exynos7885 SoC DTSI

The SoC theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we disable it in device DTS.

It is though, perfectly capable of USB 2.0 high-speed mode, both as host
and device.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Keep dt nodes ordered by unit address.

Changes in v3:
 - Move maximum-speed property to device dts.

 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 6b994b487107..33899f5fc5e5 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -480,6 +480,37 @@ i2c_7: i2c@11cd0000 {
 
 			status = "disabled";
 		};
+
+		usbdrd_phy: phy@135d0000 {
+			compatible = "samsung,exynos7885-usbdrd-phy";
+			reg = <0x135d0000 0x100>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_ACLK_20PHYCTRL>,
+				 <&cmu_fsys CLK_FSYS_USB20PHY_CLKCORE>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos7885-dwusb3",
+				     "samsung,exynos850-dwusb3";
+			ranges = <0x0 0x13600000 0x10000>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_BUS_CLK_EARLY>,
+				 <&cmu_fsys CLK_FSYS_USB30DRD_REF_CLK>;
+			clock-names = "bus_early", "ref";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+			};
+		};
 	};
 };
 
-- 
2.56.1


