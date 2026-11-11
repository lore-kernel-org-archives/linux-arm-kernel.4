Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2142760A2604
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LbJanpKe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etAfbUs8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=; b=LbJanpKe6+sK9s
	R+VBkOJEJonGx7op/89pxrRKtKiiz5b8IicQas3Hk0QwvJSTlMpXsU/P2PNUs38A0uQdhKKUWvoZM
	vuV5p2QraornBb7nOxU1JVxR2jSQ3VWfla+K/J9rX6uOORb3yGfVg5lSyWjMMlSVsmjjz5IAietAD
	AZ6fCNAlyM34mDSm9wKzEw8iyC4rFybFdEM44px5/HhqEPMXCbgPHjFJyxWzVLHow0hZaOPKSlG0K
	Wg3Gonz8jcf2zuFabwW5bJgLclyRUwQi5xfTNk3Dj+FIPuwKnyDVzAEqf8ZVQ/QYkG3HnApwqFw8o
	euXL9TjaCaa/ReFCOLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xm-00000005iAH-01Gi;
	Wed, 11 Nov 2026 06:10:50 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xi-00000005i8h-0L5v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:10:47 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1126864a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377445; x=1794982245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=;
        b=etAfbUs8X+muDJrcJtC8dPzpzqGthSMOxss3gKYMg+MhIHCNyLPAeZ0jQmVVpvXP9f
         HD03RBJypR1rk8zqP1dkpFMgAUAwOSyqAwMC/pkTr5FtHpNWJSkxt0dpJTY+b4VmLNJ9
         oHo92kilzCn8sknRXlQ2H9RYrlIsEIXOepj6dTt/r2RpA9AwINgKmP3VOj/t/1DbSF4m
         maatTgvLSixg2YvDsJ2dNhRwEJrGb+bQ+3z56HfhYjJBYP8EskTXFYSIFMPVBfZ5+r7T
         Tcv/5eqa0fz68BCmhcGVsnQ+YQG31YeBG0R5tJ5TRu1LQSQ/xevDViG5shKhZbZi2h9N
         9iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377445; x=1794982245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=;
        b=JPlmQ7vw5XklWAZBEP9Ee36kIQUfBMSTfKOFnQC6YbMAuNJYFz6i46Lil8V24tyQvM
         e2M/RfIeM+ko2uShxUXqcHIQJuuzXVMbh1YmZUFmATUTqjF0PtSnyjkSSkvkfwQkUl3Z
         Tq8iQyOvbAS3aEc3Rri58C+cgMFr7y2T6drgF3RWirKsC+BI05xTyd0bKmHSdpic6zqY
         Qrwnpo0O3zY0UD9xoEsQq9n+A/CLhZwSSFgKDLXs96piVYI2uo7S7aXoS31sUJpfS6CN
         LjvQ2u3EzgKP4hgZYYNVxcTxq15MHRtjVSAJnu04HGySR5/aXDYTCucid/S1cVmJ0qh2
         HKFw==
X-Forwarded-Encrypted: i=1; AL+hErGKKaKAT/GS9zZ5xHbTWdyF2upvFpdseIYJq4SB6Qj6tlJvl/Vn+327H3gFf80bR7GYUJlFNyJMeCBabQrKAi4z@lists.infradead.org
X-Gm-Message-State: APuU4Z8Ny6n6YfsJjGBQEsIgEit0ERb8WjSSzR7Ksb7DRXnLYIZXVH3s
	KXX60ZxcTZHCtbUppnafx3ihFu0ExvgPkoozXTI+6g1l540uQcGDJ9de
X-Gm-Gg: AYBFou33yblamSZc938phWpXBF4q3cRzgG3FvXGuQO0NPoWBkNhcmFQ7xXrw+OijRid
	EEjhTVf5w1ZK+xAPelm238MrY2ADoNlTzia5IyRLvSCLcZBYKi6gmQxC0pbGR77pSaJ/GqLzBAp
	/CGNfXU/Q9XBS6ob8b6+Ux5N0LNgFvd95mpTu8i59juyIY/rLUctEz7c4QErrymq1ZqwXgL+fO6
	ABhT+KELlRotiktoc03ehL/Hrzk4E2reyNUIGOxQR17WJphwxliPLb4lx9KosVwbFV7sM5peTfu
	14Qp4wdNltR7iQPIaAVUOTTlaAMpiAedr6/grLb6VCk8qJnJbc0umaBTHyya3qaOR0jFbbP4h2N
	7NioWO+FyeeZch+Shnn4x+bLjofpVMhVZLAnS1cS56Z8RxIKBkOG8EzyVnU+jja/1Z2FFH8oZnV
	4zSXkDmQRAcOZWMtpaulEJOsy1Z6T3mSkswki59it6rO2mGvmG1CKONnAuPFnK6lnQ8iY1/WnSA
	Y2Kh1bYJMJTDaiMF2fbXYRTOqJKxFeiXMqUgx9ejBVEBTdPrhaSzx+GL1ARERZsmDgxhUAXTpRr
	0nKOokLgX09HK+a8r9clkdQm3dZXjggl2USlcgQ945B9fys6iM/C5wHHgAiKfcv4Ik5K
X-Received: by 2002:a17:90b:4c86:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3b182eec306mr1365020a91.18.1794377445217;
        Tue, 10 Nov 2026 22:10:45 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:44 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:42 +0800
Subject: [PATCH v2 1/5] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ventura2-dts-update-v2-1-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=s3+YaNI0kXS1WHGDFc6jVaitSFXgSkUDG8m8Ajnq+tw=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af0ExsDKf8CzltHQES6RXvy0dPDeU8+5oV26
 lfnR1gJmmmJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9AAKCRClg0K3CVbE
 gX0hB/9kK2OVIxktjiccv5Qt+4sOvnD+74ZO2VgbmyXsfBFOqFRZnegmkamGZX8PQLnnR2zXCt7
 9legz4pUNFwgTdQAbuzSYYU3ACZhEfDbRixgiSPS7789/S8NXF9D4zsBTCi0bdTidgZ2hpYxdmk
 PJNAxo8ln23bwohai178LtE6cpDKMpZhQ+rCLsmEFwultsfybdutBrZyTx/h4WWRqrw9Fxbzyf2
 IBzozq+mFgPINyD7bU7gQ4dIecIDT+jmWP6Vc954uAhiD6H4dCuBAPyMwcaSaA+oKFepdVvty4k
 TwpozOspNnjpkbU8EMfhdjnlJ6ySp3iowSD1WSUKc1rEfCGj
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_221046_133878_D60BB2E1 
X-CRM114-Status: GOOD (  11.78  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ventura2 has three LTC2305 2-channel 12-bit ADCs: one behind channel 2
of the PCA9548 mux on I2C bus 0, and two on I2C bus 3 at addresses
0x08 and 0x09. The bus 3 ADCs read the valve voltages.

Describe the ADCs and expose the bus 3 channels through iio-hwmon so
the voltages are reported as hwmon sensors.

The ADCs use their internal 4.096V reference, so no vref-supply is
described.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts     | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index f3dbdece3076..50e652cc37a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -190,7 +190,8 @@ iio-hwmon {
 		io-channels =
 			<&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
 			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-			<&adc1 2>;
+			<&adc1 2>,
+			<&adc_op_fb1 0>, <&adc_op_fb1 1>, <&adc_op_fb2 0>;
 	};
 
 	leds {
@@ -392,6 +393,12 @@ i2c0mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			adc@8 {
+				compatible = "lltc,ltc2305";
+				reg = <0x08>;
+				#io-channel-cells = <1>;
+			};
 		};
 
 		i2c0mux0ch3: i2c@3 {
@@ -583,6 +590,18 @@ &i2c3 {
 
 	status = "okay";
 
+	adc_op_fb1: adc@8 {
+		compatible = "lltc,ltc2305";
+		reg = <0x08>;
+		#io-channel-cells = <1>;
+	};
+
+	adc_op_fb2: adc@9 {
+		compatible = "lltc,ltc2305";
+		reg = <0x09>;
+		#io-channel-cells = <1>;
+	};
+
 	dac@c {
 		compatible = "adi,ad5612";
 		reg = <0x0c>;

-- 
2.34.1


