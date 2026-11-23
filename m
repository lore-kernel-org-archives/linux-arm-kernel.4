Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5EF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BbVj65wz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BRisrUeD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDp9keZJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=; b=BbVj65wzMIPJZJ
	yYG2eh48TELfX8RgHfVrSzpUKqF1Md5mShuNY76tFXOmAG6YiqM82XOQTdSSLi18L+6DVOODiibRN
	BFEJXd6BdpkFmI4Y4BnMZhmtVBAAo9wppvSnxfmuK5O7G/LhSug6iMTHTgCqbQaD8ku/4gp0+O76W
	jfe+5s5Q9ro1I0kL69dbwLFTI165rBKXI7JDhw3GEDedQFXUmphORjiuXmy7niaAUoXAROVDsa+tS
	AXOPHWmD8bI2Ja8pZDIGTaTXDa5W8c4uKAWfD2K7SY1v5oIFXMJ7KWYcecMtrTwCEcxFBKyL+bEdg
	OzcLXU/0RIScvkgNtJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQJX-00000002hxq-2iCF;
	Mon, 23 Nov 2026 09:26:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQHD-00000002haF-3ZsO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 09:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=; b=BRisrUeDFaXdwS6NHikOWEramC
	SJO+DdgYzFgHFs0Bc7NIkB4B6Z/R5x8av2MzaBBukE2tCpdKahKXvRrvA4K463l3+FZhLAednNnF7
	qmBUnS8P2ine67xc6pqHk1dpRwwybZPbxIhedfb0DoPL1/EwCJKXFRJqfV5Hn4yijajeHiO8bb/ub
	9l2NCSuuI1ZGCqijO/oqi4yoT5nh9mnxM15X7CdgRbBHSZY3+PpwSlafpqvSDv9/Hi969Vu+3eK9F
	wd/CPbNAMJEOo0pXh3kaJrdIyRNJD01GZBupgB//7erJ9nDFnCe44QYPheZOnM+wEPuTZqOElgzCx
	x9YJuspw==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQH9-00000002ux0-3iqi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:23:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-497614c95f0so1659758f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425830; x=1796030630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
        b=RDp9keZJwta2yEwFThYtTFr/7W5luWLAyVWDRl2cZaIyrDlF9OfvxbsHHTdRuexjkp
         3MQjMXTOi9b/8P5AuhqkpmvHWZHtzJfAVCghC/FUi3UFvpELKgVOHNxKOVTubefUILcb
         RrVKfDJaKxaS1BiaY+jkvXiHNCsZ1WQfaIxy0ZhxkFceXbyFuhvg05QD/QDiapJZatgF
         leBYkOlGjEiSgHM9Y7+6Q9m1UUd1LBBITDrIPtzhDvq/737PT/RJ7FZH3M8tnxvVijm2
         ZTlnDlQOTsaWcnmWuQD5aO4CVNl8GPtWDPrucfNz5Krm4MZMNqG5zVcUaOQEGkGF248h
         yXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425830; x=1796030630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
        b=AMwCMn4KMciz2tfEcdC8Myw77pAom2u/R/bMOIsRjGHm35rs3z00jhSbfDrj3kIUq5
         F9KUJc/hIUTSCGNBPFC3AEhjToR1GcjfTb4KN17w/l9QulSSrAmPNAQGUzfx4epsAAER
         HNpwtQgM+uKISJRM5RrlcfymvEnMqxK3PgRZYxkj1RUFrLb6PkglAGCYJwRGbHMFHSka
         ke6W4JV/kGwJyVB9XoXOr0NsK+EVJlDY5maDbIZP+IhB0A/E9lcddVHemKkeq6A4Vc+P
         cryihxFgNYOpm0aErKxTy5C849VYlX+nuUuMC4894d/UF7FHYX/TTrn+A4jHImIMCYzl
         ClvQ==
X-Forwarded-Encrypted: i=1; AL+hErE31f+spV7CZXIZawhntgSFtGQbH+j6kQTeLc+/sAET/0WcWziMZBlZvz3Hm4qqWfK/zirp86zFPOTiJkhTo181@lists.infradead.org
X-Gm-Message-State: APuU4Z/W7tNeOn06JU3lynXJgbkxyBp+Tsfgl+lTCB0M3+w4h++OOPkp
	TIU6giFz/H0RWtH/pknQ7V+OS4A75jElA2cYIWXW7s6zyCcxV9lJiCHF
X-Gm-Gg: AZFdTZczJtgZ0hUFyL/d5uY6UExGJ0JeHK0vTYscSlz2RvWXVZV9kMtpRb28biQerFY
	BoYlCqd5eCqiZChtqC9KZmNoO16Xw3xqnxBrGaoOBlY1dArxzU2X0bt5QChNiqY5Pfz18DHOMpe
	t7b7utOvXR+/udoJreLkz/QVBCaDNNf0VoU7prBKqzkKQigP4wkV6wwqVY1IpeDbUnsaTyTNYLY
	Bfa4k+xt3a5zGytrKm1QOLApGX5xacuwALsbMyW+kd3fSN6kkPOAJfyPmhTQjQbK4VQ7wcZHt8A
	loLl7ogAPGYMNcHJOXWBTfaBQO3G/n5lbQZrMpn47FivvLpYZcwA3DyqXE9AKsS5GAwLiPft7Mk
	esQ4sA0be8JMb17THiDY00gK2Hy7Bd8A25zMwEyHA3DuQ8oGh45GsuER49XAyq5nv+4IfopFi/F
	P+Q3GIdtoRKcCjweTXWPvW1Sx1r2A3AmqEc4i9crmStavGZL9NKJNmJnX4IfV+Mfc+HfZ5EpeJ1
	tUCP5boUo09VyYPkWi53YqTunv3x7NZdgtdxNiXw20a42ixcSRve9pugc+lgURaX2DvA3PfVaEh
	QE4D43a1fzK86ytf6eN//ZHX76L535CUJD43rX7LutI9Q9udMqTZ2tY45JKUBoVI8DgCMx7nW03
	gZ5o5fuffxLTsZPivWqj+CWARYnnAhvb/bxBabmEWlwtNasal+F1Q/sk=
X-Received: by 2002:a05:6000:4b1e:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-4abb0f3c23bmr21423643f8f.12.1795425830233;
        Mon, 23 Nov 2026 01:23:50 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:49 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: exynos: Enable USB in Exynos7885
Date: Mon, 23 Nov 2026 10:22:41 +0100
Message-ID: <20261123092244.1792040-5-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_092353_334800_4755F10F 
X-CRM114-Status: GOOD (  14.34  )
X-Spam-Score: 0.1 (/)
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
we do not support it.

It is though, perfectly capable of USB 2.0 high-speed mode, both as host
and device.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Keep dt nodes ordered by unit address.

 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 6b994b487107..8dd8d666b9bf 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -480,6 +480,42 @@ i2c_7: i2c@11cd0000 {
 
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
+				/*
+				 * SoC in theory supports SS but no device has it.
+				 * Actual capabilities unknown.
+				 */
+				maximum-speed = "high-speed";
+			};
+		};
 	};
 };
 
-- 
2.56.1


