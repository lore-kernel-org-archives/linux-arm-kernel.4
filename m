Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AF7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CaY7w0Wn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KOO5psqO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iTZHOJPC+4Yb22OVu5mKo/4xoJU1hTDHyydQLaMYB/g=; b=CaY7w0Wnka7Ay5
	met/k727uWStgKakc31sqRVkH3koSNeefrR5GDT7rcJ3sqTq+VWvRQ1jHO1btOXaX8+BfA3PIlurR
	IydGwfu5Aci1+nmhNcDmuMDlQYRgdRet32NPED/KbgfCr/O1rqPVXPBZhyObD4q6TS7Ste9dSzO9h
	8h9j3chci6diTiPNPh9RYyRkso+ySFhEFqz9hvd4/S+HNYU3ryizcI4bP5UsWosiUqYerRoIi858I
	DYmcXkGzBjY2oSeNXo9ggaJh0sStZ9K82mp2emtxyCpLAOH1ywbANsylMEbz5+QfiCQtyy/SHHbkX
	1gEoULdOKfX4lnMKd2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Fc-00000003ymJ-2iyy;
	Mon, 16 Nov 2026 21:28:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4FN-00000003ybk-3Cxn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:28:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4a358881793so194766f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864496; x=1795469296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTZHOJPC+4Yb22OVu5mKo/4xoJU1hTDHyydQLaMYB/g=;
        b=KOO5psqOmW5MDeSvskbvJBVXv6gaX4ADUtbp6FVaMYLpXPa6BCRvPP9WVw/0kNrJcM
         5MhsLOp3gZ3p+SqdbyuOiyV9ukGv5ATnmRrTpNYIusEjl1m7bz2nhiI3OUgI5j3e1YEk
         lVoWhGF3WilrE1pMfTff9RZGB5mQ5Oyjz6S7SQMqdBUnC3vJqPFD1xmWoFbu7mRtTeF1
         qNQxcFm8eWGnUwBQoevThKrTJoSwELtcFbnfeW9xAHKxwZ1FXxv4RsOfXniY/ymHYG1t
         vfdzZiQldRaUnntpB72jN9dYA6tT1356clSNv8EriBx5ma5tf3WMO3BQlZxJ74P3PP2Q
         TGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864496; x=1795469296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTZHOJPC+4Yb22OVu5mKo/4xoJU1hTDHyydQLaMYB/g=;
        b=GLcmDmnJNmpA7EstxAr0jNeNZrhSdhcCv9JtrK8nnb1rtDX+qO5dueWHdW6xQ4QjKh
         UF1o13s0VWtfIlopnGzjxuprYFz4R73iHDHuXOWKHsL7G7rbUD/qQ98+e8bpEEcwInQM
         P7VnlH9qCDDIbcLPc7jgchBmDtSpM8+jicMoZV+fCoOzMnfkRxc1cyFt4Sc2lkR8nZIk
         M5anzXi4DOWD7TPmrSfZoCm9KEBtC4SWK59pqEOBRzLsTn9eAE2mY75KNMvFfUHikkl7
         SgV7OcYdv67TDeOU8v0Hh3kX/Z3MS30NVKyInggQLNPi9W+Xt2akR4/OXZrkEZSoV1Hp
         EYAg==
X-Forwarded-Encrypted: i=1; AL+hErG3iaJmeRxhdU5pFZiTdat1RreqpXOSFKweFy5kFhcD1NlGnYvodo+kiyw+mpWqmJJTgKM3I7VWGPKV1ktiE0e7@lists.infradead.org
X-Gm-Message-State: APuU4Z+xrdmgXAG+RkwWEEqqML+ywHGKl3PXqQ3kLvNfBxW8lp5jmrBM
	lzVWK+9eMhb/pTgmzmVtdizLpltXoEp/z3pJiBuIzy9zWPvqaOcrLyiP
X-Gm-Gg: AZFdTZc2vXTt3cZGSCZf8mYtLVdD5au5EWJU1nzKLGryEKtu7lqpsl+K6Peslnfu5Mr
	NH9pSxtbcR5cejuES8SsO3kl2VAnKQiflP5KhuftkgoyI630qffwRKpugNebra+HQaAxfGfVaaE
	ON7XrPZYuonMOmzK9UTRCwH/yI1rPiSjExicSPGWHVegPaskWF5W4MUj6/h82dlJo0TTG7A4Nel
	gR6B3wGVgM7AI0oEKzwxXBRI7QtHrJlPseXWtF5ITPyD1Z2X+6VClPPZCwZIF0P8HONk9vEobsC
	VL98pA5Yns4gqeAOlhXvBZfJbGmCJuYQnqaYoT5vYBsGZc2NLRWAqXLTVSdFvCOYZEmuG//DuIo
	RqZeGzNEKspWt27ZZSt4SGhi2yL8pbtED3HNyXJdBcbWsKoX9aI+2XRFclrP6naEppsXD1kqMxH
	vtL9PD2jjeT+mjzmJgFwS50pTrL2HjRjhmEX1aPhE8m6qPpbkYRkKG7kVfLfgcHGN2qZKg5Bx1p
	RiV8yd8mItqRi6r3gbkf19g2k4TSdKdmWo7NizI+VVz04OlfWQNXAz780sEAWdlgdBOre+2JMAW
	HOGYQHt3TD98acqrG6fqDOVEjVOHG5LMd39rg4vP
X-Received: by 2002:a05:6000:46d0:b0:494:6f49:246d with SMTP id ffacd0b85a97d-49c723fc541mr17987138f8f.24.1794864495960;
        Mon, 16 Nov 2026 13:28:15 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:28:15 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:32 +0000
Subject: [PATCH v2 16/16] arm64: dts: qcom: Add Samsung Galaxy XR
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-16-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=6344;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=1ceRxoHtuoc37RBkrjEp5dIGC9ilXDeWVydgwcwUuNs=;
 b=ffL4jQ4y6R1yL8AMBK2e+HI53Lg1Nn5IBjzJW9syTcRdWo2Ml24H9ePG9R1xigjtFMJOUcNmk
 mlLeN2+jgNuDn7jvJmHv6gui9wN+LTGBvQbJEu7n/TIp/SNNvyo+oqd
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132819_451377_5F8AD104 
X-CRM114-Status: GOOD (  15.73  )
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

Add the device tree for the Samsung Galaxy XR headset, which is based on
the Qualcomm Halliday SoC (SXR2250P).

Supported so far: the PMICs and their regulators, the power and volume
down keys, USB in high-speed peripheral mode and UFS storage.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/halliday-samsung-xrvst2.dts      | 218 +++++++++++++++++++++
 2 files changed, 219 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 9553e3aaeccb..b6f739b625d7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -24,6 +24,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-sip-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= halliday-samsung-xrvst2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830.dtb
 
 hamoa-advantech-som-db5830-el2-dtbs	:= hamoa-advantech-som-db5830.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts b/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts
new file mode 100644
index 000000000000..6fcc1aaafd59
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Stanislav Aleksandrov <lightofmysoul@gmail.com>
+ */
+
+/dts-v1/;
+
+#define PMK8550VE_SID 5
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "halliday.dtsi"
+#include "pm7550.dtsi"
+#include "pm8550ve.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmk8550.dtsi"
+
+/delete-node/ &adsp_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &video_mem;
+
+/ {
+	model = "Samsung Galaxy XR";
+	compatible = "samsung,xrvst2", "qcom,halliday";
+	chassis-type = "headset";
+
+	reserved-memory {
+		video_mem: video-region@87c00000 {
+			reg = <0x0 0x87c00000 0x0 0x700000>;
+			no-map;
+		};
+
+		adsp_mem: adsp-region@88300000 {
+			reg = <0x0 0x88300000 0x0 0x3400000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp-region@8b700000 {
+			reg = <0x0 0x8b700000 0x0 0xf00000>;
+			no-map;
+		};
+
+		sec_xbl_ramdump_mem: sec-xbl-ramdump-region@a7d00000 {
+			reg = <0x0 0xa7d00000 0x0 0x300000>;
+			no-map;
+		};
+
+		uh_heap_mem: uh-heap-region@b0200000 {
+			reg = <0x0 0xb0200000 0x0 0x40000>;
+			no-map;
+		};
+
+		uh_guest_mem: uh-guest-region@b1000000 {
+			reg = <0x0 0xb1000000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		splash_mem: splash-region@bfc00000 {
+			reg = <0x0 0xbfc00000 0x0 0x7e90000>;
+			no-map;
+		};
+
+		sec_debug_pool_mem: sec-debug-pool-region@800100000 {
+			reg = <0x8 0x00100000 0x0 0xff000>;
+			no-map;
+		};
+
+		sec_debug_log_mem: sec-debug-log-region@8001ff000 {
+			reg = <0x8 0x001ff000 0x0 0x901000>;
+			no-map;
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vreg_l1b_0p912: ldo1 {
+			regulator-name = "vreg_l1b_0p912";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b_1p2: ldo3 {
+			regulator-name = "vreg_l3b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_2p504: ldo13 {
+			regulator-name = "vreg_l13b_2p504";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_3p072: ldo15 {
+			regulator-name = "vreg_l15b_3p072";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l2c_1p2: ldo2 {
+			regulator-name = "vreg_l2c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vreg_l1d_0p88: ldo1 {
+			regulator-name = "vreg_l1d_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vreg_l2f_0p88: ldo2 {
+			regulator-name = "vreg_l2f_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gcc {
+	vdda-refgen-0p9-supply = <&vreg_l2f_0p88>;
+	vdda-refgen-1p2-supply = <&vreg_l2c_1p2>;
+};
+
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 224 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l13b_2p504>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l3b_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l2f_0p88>;
+	vdda-pll-supply = <&vreg_l2c_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+	qcom,select-utmi-as-pipe-clk;
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l1d_0p88>;
+	vdda18-supply = <&vreg_l10b_1p8>;
+	vdda33-supply = <&vreg_l15b_3p072>;
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <76800000>;
+};

-- 
2.55.0


