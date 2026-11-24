Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E848606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NaeUAXcr;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=E5mkwEfN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LkNrwFCbU7RrRsMUzm/3wayhycT9k1ANM19ohVyL78M=; b=NaeUAXcrUI+HnX
	jjLXtm3mZcZVaK8O0rPDSAmHHuYwzObEs8RU2cVGdMqVcPuGP8A3DAObIJO5+G8kt38+4q+PhmJfg
	DdeGABV3mb44WeOfsWaCiohoJbYD1zjFIVCy3bgRstBftXYvc4FOBeBw6bLRsEXtFKnofCKsriuBX
	oyprUf2ajBjUpdnAreMfK8DAijblw7vgEQV7VUEjpwagsvke6ZMnglKSvBy81N9QSJrNcRvrgSS4F
	Bp8ASx/74nr0Z2ndPAw7RVytNaInhLj5XburDVTSkiwMUQsTRdh0SemPuKSzO9ZUKgfoNyzB9A3sz
	2nXq+W+63zer+dFjjD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVx29-00000007iIO-1gmJ;
	Tue, 24 Nov 2026 20:22:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVx26-00000007iGg-1a4n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:22:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb606491faso27314895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795551748; x=1796156548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkNrwFCbU7RrRsMUzm/3wayhycT9k1ANM19ohVyL78M=;
        b=E5mkwEfNgmDjOgog3Y9JqYEo+9hRkNXVnEcn/20JLHtJGF/EXyT4b44wCOxQ62ggTo
         ooYLy4nBSF/VvizEWht6X1jWPGuYaovYaWgg54RbdwHCe/03dOzUi3l70r726gmixdKr
         2uSCVxqc6n//YhHwRH6ZdaDh86Eapas9clENchKlWv/n5alFWMSP/vk3ZyBZ5wFMJ0WA
         A4CRgiLkRmqsG+flh4e9ahIj2Ez5oeR/CESSZH82HcZ8l5WfGV0Flh6Tu17jDieA63mK
         oZGCRFq0/lqJ05sfE4qrtC/M0jPE6bNZWFByD08rn/4B6USgczIbxUjnHz2rPIHQIJxf
         6SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551748; x=1796156548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LkNrwFCbU7RrRsMUzm/3wayhycT9k1ANM19ohVyL78M=;
        b=dXGUU5LdamwbYUaJkJ0FE9Ppu7AnXMT3cXiu+53sNe25Xgni7CSFKsMuc7IZWK2pX3
         gUjBWhk8MeN8RTq7KYJ4ft/J+UKqmdODe1Wk375mBRjS77mg/sdSwp2drSRUk2TsW4oP
         8lDqzFgqPZDbLHdN74kRzXBLsSqo08/Udiyr6wd+r6rzuWbonYOpAnFv/6fmPZnFhLLc
         WnqUCwwdBlab+iydr9rc0w+C3VhpomsU8iDa14ezSSYu2U5gSSjpbXGRco3A0PvtmgYR
         OjQ1o9pVeUMPUn1+2EDdnhSI23wHDA4YAZsMHQiBqaOBfnG6pnMI4s4fzBJf25wEaLrM
         /JmQ==
X-Forwarded-Encrypted: i=1; AL+hErHeszvQAhGBawp38ZFVMv9JvdpLAfARxOrbmFGym8ixOPcbQzn94LR1NCtj9SkOIMGZ80gJoY8gwi7G1kZXYZLa@lists.infradead.org
X-Gm-Message-State: APuU4Z/RUDWlSfB+cf7IdecgL6+rhlqlJKmo5551BY8fEY3+1Xjpi8vZ
	+PIlbosj2ysM7hyTcelsY1rF8u/Gtk16K8QlTTHkymXo+1DtCkbQZdC4JqZ4fICp9hQD1hH+TWM
	qWeCu1+jmGQ==
X-Gm-Gg: AZFdTZeDMrvd5K5PV0tS8kOqvdb6HpvqB/VVNlojErTtY0pwVhLB8Ql36Kctff9TquY
	T8zE6RiCbWP8le6RUjnXgnxkrXEL1Ma/QHkvxh5FoIcpvP3oDwWTwjZ0uKel4iNVRIh2PdlcHpM
	nlyUBrl6UPjMbTeMoxkseRf0LcAZE2Ttm4PJcvpf1fx9hnTzPiJZuq7CGKgV+pMzxObdXQJrGBn
	vglcQ1EcsaV+739clVyI8afq3PNabNx4bQ3QtkVOeHdnR1egT68H7DjjlORU2/O5Tllxn7HHVMn
	G3WxpABmBAla/u/Zb7Pte+yn/Z+IN9Xy428lnm5kWAl0YRzVJZCL0YEcGbGZ0/ORlFDOKTf+rQb
	OgBVvCsPy4TXtUg98Jgb/Arv1x2tU0eQoRNRVBjmlH74SjgWILgUjhN/W+omwaFQTkM45AGTOub
	pq0z1a+XGqlm8EV4dN4F9E7o74G3dDKyRGYVZgDraiWJ4h5+dEdzB5or8kOlGjEUxUVoUO0v02G
	z5ipsbtL0MBx5UL5s99TsZvuhCTxyFENr8rzvtmPS2pJMwfXzVVmv9MvKRtWkeJr+e141fwsxM8
	+WSPCeEV0Ps3CagX+SKdl3pFCkckmJtVygIBHXBDwcWFrJU3wD8rKdwkUkVwr1SZ5vPR5uxETt0
	2CTC0zSoq61A=
X-Received: by 2002:a05:600c:840d:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb88820cedmr326668745e9.22.1795551748576;
        Tue, 24 Nov 2026 12:22:28 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm35130525f8f.21.2026.11.24.12.22.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 12:22:28 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: fabrice.gasnier@foss.st.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: stm32: add the factory calibration data to stm32h743
Date: Tue, 24 Nov 2026 21:22:20 +0100
Message-ID: <20261124202220.23721-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124202220.23721-1-gerard@teslabs.com>
References: <20261124202220.23721-1-gerard@teslabs.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_122230_455173_DF35FDBF 
X-CRM114-Status: GOOD (  11.45  )
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The temperature sensor and internal voltage reference calibration data
of the STM32H7 are stored in system memory, at 0x1ff1e820 (TS_CAL1),
0x1ff1e840 (TS_CAL2) and 0x1ff1e860 (VREFINT_CAL).

Describe this area as STM32 factory-programmed data, and pass the
calibration cells to ADC3, which the temperature sensor and VREFINT are
connected to.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 arch/arm/boot/dts/st/stm32h743.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index 2f19cfbc57ad..ecb6aba3b0db 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -70,6 +70,25 @@ clk_i2s: i2s_ckin {
 	};
 
 	soc {
+		romem: efuse@1ff1e800 {
+			compatible = "st,stm32f4-otp";
+			reg = <0x1ff1e800 0x100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ts_cal1: calib@20 {
+				reg = <0x20 0x2>;
+			};
+
+			ts_cal2: calib@40 {
+				reg = <0x40 0x2>;
+			};
+
+			vrefint: calib@60 {
+				reg = <0x60 0x2>;
+			};
+		};
+
 		timer5: timer@40000c00 {
 			compatible = "st,stm32-timer";
 			reg = <0x40000c00 0x400>;
@@ -572,6 +591,8 @@ adc3: adc@0 {
 				reg = <0x0>;
 				interrupt-parent = <&adc_3>;
 				interrupts = <0>;
+				nvmem-cells = <&vrefint>, <&ts_cal1>, <&ts_cal2>;
+				nvmem-cell-names = "vrefint", "ts-cal1", "ts-cal2";
 				status = "disabled";
 			};
 		};
-- 
2.45.2


