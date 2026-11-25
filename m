Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ss5DNt1c;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=c03EA/68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ny39IB2+v/C8PeHVkJtEArwIrXSQ2C53NR3LzL5C2wQ=; b=Ss5DNt1c4kGlnG
	XVN39CG+cRx74YyW3V7jgGAgRu5Z0zLZ0jHdWe2iDjRUoTo7G166XCzt8KeoIJGLzCMuiFpr2HBF9
	1UDS6GTBvEf5DUqvc1jX4VyCeWH4CBfK18odAlSH2VPRHeOtSg2cLzvJeUcRr+6V4sM1aMiEkisJy
	iBWdEjivntM/mX/fVN7Ay50IltePkV7Snao+9yD/jpu1/C+MsOdpSE0bZDx1aOa6Z4tN3PuEYE1iO
	/Pv+vMlv5asB5GnnbkqdAwcU6CsYZv6ztKgikfxsmDbfB6d1cIbenAL+/Vz+XOemo60DHk2mRmK9h
	QBx6rsCEJTDIKX2ZXcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDue-0000000A989-0BRe;
	Wed, 25 Nov 2026 14:23:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDuV-0000000A938-2AfO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:23:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4a32576da88so3368435f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616625; x=1796221425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny39IB2+v/C8PeHVkJtEArwIrXSQ2C53NR3LzL5C2wQ=;
        b=c03EA/68A6rveL9EpCWa3BVfV7hJWIZ7sA1q1gbjMbANoWj4UUflkKvDuXWL//5dVK
         O4JircY2w38cNRngKrh0ELTs5mas2utNA5THcqSD7Ca1oxf4GgTD7vnkeP2Mi434c7CZ
         3al4kJB6xvC2A7DaPZV5QcZorw/swWxg4XuIBQ/d8FQ2u8r4uqrhTC7IQe4qGxcQ+jRZ
         lqS21looHPEZb7apERYrXS1ehKqBv4zt3WyfGly8aR+UXMgubF0xlbSplOfo1CPleMtE
         GwuKHkl2w2fYym2pJE2y7uVnvj/L57NlBG3S8/JYqIh8970cqb0+5ZR4WJfbh1ouQ68s
         mrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616625; x=1796221425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny39IB2+v/C8PeHVkJtEArwIrXSQ2C53NR3LzL5C2wQ=;
        b=MJ6B1eMpy9x/Rfl9rnpPNgYEB9hhYPWPoV2JsR1YYejrMqwh/ZgK5s/gWpw2uSdidN
         JfytK+TPzGjfsOVZFna/dQCFYmX4fdAqoMWO1N04fsErO+imTqlTWriiTOVSsXsYp1cg
         o9/qVxIlmZALG32HGgWUWgBM4q+p2GlgHJWCxSW/bR/9gBd9ddb5Y+WR5fzXegumYC7K
         gEAqT4Q4tsZBXBUdhwtUyDsCoaZfx/e7gAZVV+/HPfHTBoydyHNUKHxMr8Sp71/Ji60H
         hiVgJSjwUk2b0s/EWYdiBbdYRHEpWuRhZ9bJg8rXz7QP4C/OoAZdeWeivgawwXZrED+w
         8E0g==
X-Forwarded-Encrypted: i=1; AL+hErEYVnBqvIPt+AknDt+84SKL/8HZFJnouQ4RXh01JabYyuFX6iRtzqRfL/4Rol5Pf7FxcbK+6OhIycUqYLOcuYyk@lists.infradead.org
X-Gm-Message-State: APuU4Z9V6ge2RAESO3MOtSbeken1BX+0G62XLoeIJ8dtIhUzA/qLOpHH
	sAOdRrbUaCpR5zb6AZ3Ka/UmMlU8o3MFGeeHB4f7MRH+7Ek0QcbU0dEde/L+NStpiOayvbp+NIC
	KTiWFEvA=
X-Gm-Gg: AZFdTZeIl40wAscO0vyHQl6xiaXYAFZxVKqwpBtgljNsBIqH/NBrtgPH2uZvIsorWEV
	vD5FMNomdhBVScv1BnxlvD7wSyJ5870US5hXPg82LS+BG/3NLAiuyYrxav7tyHwvZmmY1KEwOh1
	jWa1Q3qZn2O+XeFpUe4VzLuV6zQRGA4AOtaWT2x60Q1tcpoTQrtfzAsZV6fgGN3s+nIELnDX10f
	UD0rShJgqSugUo91KbdOhf11Ez3cuoe1TbRk7oTpmCNHCl37o0NiKRFd6mi7GFjud1qu9zh8aH2
	1pboB6ESG3PYqbJBARGzvEBiK4+jc9FGjjg9yCaeWtgXAjSlufO9HlfdGTd2OqzVmZ2gHrhn9rk
	cO81FyEMf9Kqa926iYLg+eBsDJwkQfRYfyyOcunAxzvZ4Hj2O7Cbf4uep4J4MuMMA0iJaFUynoW
	PRu9dbEGKVRRDo5fyKYuiRe/Sp8iAs8ttIDw34oCilKWpOWV6gET5i0RKW3CGUvpTXEY40dnRqV
	xNfzyULJ5t+xWVpgx88ScnLTjBcjqNhEQWQWlSmQipO0aatWoZK0L3YYjOH7/4d5RiE+M9XvmsN
	20VVqSUxpA7RgG0K9O2B3a15FifTu88wrKCr57fDdJuDwHS1gmwbEfC8zFPEr/RAflPukFxR4pn
	cR3KTrX0eyNh/5wgm9AVAIw==
X-Received: by 2002:a05:6000:2883:b0:4a7:a52f:a2be with SMTP id ffacd0b85a97d-4abb3678d88mr30767537f8f.13.1795616625424;
        Wed, 25 Nov 2026 06:23:45 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:45 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:37 +0000
Subject: [PATCH v2 5/5] arm64: dts: exynos850-e850-96: add soc thermistor
 node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-exynos850_adc-v2-5-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062348_223196_0AE585BA 
X-CRM114-Status: GOOD (  12.11  )
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

The WinLink E850-96 board has a Murata NCP03WF104 NTC thermistor placed
near the SoC package die and connected to channel 0 of the CMGP ADC.

Enable the ADC node, define a dummy 1.8V regulator supply for ADC, and
add the board-level thermistor node linked to channel 0 of exynos_adc.
Regulator is represented as a dummy one because we lack PMIC support and
should be replaced with a real one when PMIC support will be implemented.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index afef32ad4ee2..1abae8b9fa49 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -126,6 +126,14 @@ reg_dummy: regulator-0 {
 		regulator-name = "dummy_reg";
 	};
 
+	/* TODO: Remove this once PMIC is implemented  */
+	vdd_1v8_dummy: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_dummy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	reg_usb_host_vbus: regulator-1 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb_host_vbus";
@@ -166,6 +174,20 @@ rtcclk: clock-rtcclk {
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	thermistor-soc {
+		compatible = "murata,ncp03wf104";
+		pullup-uv = <1800000>;
+		pullup-ohm = <100000>;
+		pulldown-ohm = <0>;
+		io-channels = <&exynos_adc 0>;
+		#thermal-sensor-cells = <0>;
+	};
+};
+
+&exynos_adc {
+	status = "okay";
+	vdd-supply = <&vdd_1v8_dummy>;
 };
 
 &cmu_hsi {

-- 
2.53.0


