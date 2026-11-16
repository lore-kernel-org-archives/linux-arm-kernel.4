Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAF1606A880
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JsMXbhB6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ira3p/M0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3+LDIf7xcOUg0Ytv5NF1ZKANWMIYF3HNRlqe1V/Gd84=; b=JsMXbhB6xk70YM
	NMQTS3tVXF6lVZLpOq2+V440pqB91pyGAmuH2GS9fxUbBgtMRnVdweb/8MqvbkmqjobqAP4531v/c
	P/iVAQCKxjKO4IMuAluPrdG+ENoPGNxz1wkoleNBtY5Ifu8E4sDFxUUiqCbcsz3Q4nEDt4PrXHHrS
	XWiweH1I7TnZnq2gEVOFVSBGzliI+6oeCbGtm6GtMamrJql+5sfr+X+5738OVZ7LafM2O9mddBIB/
	SgHQsBWimJRPHdNC5/bmqMQc7lF9ar7vAq4IxVOLNpKDvxGMDyPC7Q00AcXVj09QagNzwJEh5Ggpg
	cc06Nif0hdIfMqM+C7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxc6-00000002o7r-29Ix;
	Mon, 16 Nov 2026 14:23:18 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxc4-00000002o7J-1V2k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:23:17 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1b3b4944a0eso1517975c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794838995; x=1795443795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+LDIf7xcOUg0Ytv5NF1ZKANWMIYF3HNRlqe1V/Gd84=;
        b=Ira3p/M0HHspyzDyBufOASda2GPOOHSlMnA8RGqjdchqCZFV4t7sCpuXinyrjvZ0HK
         3z4nB3D1DXXB5RI3lftZTYrtRflAZjRNW9aZ2ub+C0jm9w0ifQtxPQ6v0lxONKkFOBkY
         JqJf2mBygLYQtrNwoW/BleXRxbjICn3Gpne7Ff+3bnOtd5VaAP5NcSZqaWMUSdFkIJKB
         ucusAQBk6/A7S/kschR9eMuzHGRYWe7M/o9IBfNY4K0kzcmKw03OVFkpOQXLqUZcEOC2
         P0xM+TSmQmpY0mb9Gz4s1WNzmSLU+hNepcvSDY6jcx2fhEjXBK6Erm59NBu32Yvz2gEp
         6HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838995; x=1795443795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+LDIf7xcOUg0Ytv5NF1ZKANWMIYF3HNRlqe1V/Gd84=;
        b=I6mwxlePK8Ma4Nk8SfkJJesaMHC8Az3onlPIQHFgwRrvgev6zaTCBWVcxW0naBGXSe
         7l+mKzJY0NHS8hYwFbOMCq9bj+GH33Uh+toApxc3Gm7bU/qeDeeEqbGhc29PidYSke2w
         f7PBxwWmru2dgTp9z19do/C3fSnRl0wKZN+XRfbH/KQ7GHK3KGIlIetCcY88BpC9ZKuf
         mnT/B6ffS5wHzNgitg4eufEAGwZxmOT4D6lg9mtyDgOs99oMqou2o5Bsz32GJCTzEbmF
         zmZudiS+L1/rkugURmeWhrOvo2VPdXbasFIRtzeMkM5xyjq6SZBWU+iCDNq3NawtlD42
         lj/Q==
X-Forwarded-Encrypted: i=1; AL+hErFZOLSdSXpqjih/MVMhBT1MHty1fi7X5zBXJf+Hyf3yRW+/HdzXCT8vZ+6xNdbFAiFnKp8b5WYxBt6HaGk7IgHn@lists.infradead.org
X-Gm-Message-State: APuU4Z++RnPenccNPzgOq+i2szuVNm400HYxdzepy7YMvKloJnBGoWbL
	a3qjYMEhnx2u90n9CQTruIgMg4Trv+3/GwA4c/BSm15fOoRiWX/JQPVC
X-Gm-Gg: AYBFou1kaU5m7dIBivnPrAfyq/BD3qoNukOMLGJyL0yADjKSAYYglQw1z5HHGW0uhYw
	6UCYbXkcSQzqaIdmky6EnMT/0zWe1TVuW5Xtx7W5rvRETCKa2L5xsyqlWdseXFkDXnZ1O57q9A0
	2Y/S6mQvsjHuc5nQBu9vNaLQEAPymROcXhuykw5FBTxEkoS7IvehNg0z5Jp8caBURCvUeFmVxIN
	2RFaMY44TQmlARemehHdG7ATgW15HflRPPJvEsZ1gV6KDCPCpUb3OQ0ZFmjk4iq9Di7lL26joG/
	SEwfkO/4r9n8F+ZfbOb+o6othpDPzyoF8Ymwv2ENHRWIJdncvf6K7K9kfPfhApfcQFHuzi07qz2
	yGXto1vSybp4sLAS7IFP8PMkBj6iYkEeC76UbSkrjza1MWZYQh+x8o4uFEMtPfifz6ltrK6xW57
	0nmXcm38n16+ClWkHtNQtMrPZU5yI2d8tP9a/rdizmFC3vZE8casYATLVxxB3RiuQCRle7mvYRK
	BQevWy1yzlVl8b5fKR1T5GbTtxl6dC8Ohy3dWTAb2Hx7f2RKQF2k+tMoBA7iAiFXdIthL1ccqdg
	PWY2SZ0g6F1JrRgojkQ7nbf+2OdmQ06wxa5gyCw=
X-Received: by 2002:a05:7023:904:b0:1ac:2f6d:e1c6 with SMTP id a92af1059eb24-1b503068271mr10508055c88.6.1794838995363;
        Mon, 16 Nov 2026 06:23:15 -0800 (PST)
Received: from arch.localdomain ([152.175.35.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm32526875c88.12.2026.11.16.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:23:14 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jernej.skrabec@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	james.hilliard1@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
Date: Mon, 16 Nov 2026 22:23:07 +0800
Message-ID: <20261116142307.671340-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115171148.37784-2-jernej.skrabec@gmail.com>
References: <20261115171148.37784-2-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062316_398231_4E66A8EF 
X-CRM114-Status: GOOD (  20.14  )
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

Hi Jernej,

> Every H6 package contains an X-Powers AC200 die next to the SoC. It is
> controlled over I2C3 (PB17/PB18), takes its 24 MHz reference clock from
> PWM1 (PB19), and its Fast Ethernet PHY connects to the EMAC through the
> RMII pins on port A.
> 
> Describe these parts in the SoC dtsi:
> - the I2C3 controller with the AC200 at address 0x10 as its child,
> - a pwm-clock that runs PWM1 in bypass mode at 24 MHz as the AC200
>   input clock,
> - the I2C3, PWM1 and RMII pin groups,
> - the EPHY calibration value in the SID.
> 
> Everything stays disabled. Boards that use the AC200 enable the
> pwm-clock, the PWM and I2C3 controllers and describe the PHY package on
> their MDIO bus.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 53 ++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index 48c771223af4..5e48b35d13de 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -17,6 +17,16 @@ / {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  
> +	ac200_clk: ac200-clk {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwm1_pin>;
> +		pwms = <&pwm 1 42 0>;
> +		status = "disabled";
> +	};
> +
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -314,6 +324,10 @@ ths_calibration: thermal-sensor-calibration@14 {
>  			cpu_speed_grade: cpu-speed-grade@1c {
>  				reg = <0x1c 0x4>;
>  			};
> +
> +			ephy_calibration: ephy-calibration@2c {
> +				reg = <0x2c 0x1>;
> +			};
>  		};
>  
>  		timer@3009000 {
> @@ -388,6 +402,11 @@ i2c2_pins: i2c2-pins {
>  				function = "i2c2";
>  			};
>  
> +			i2c3_pins: i2c3-pins {
> +				pins = "PB17", "PB18";
> +				function = "i2c3";
> +			};
> +
>  			mmc0_pins: mmc0-pins {
>  				pins = "PF0", "PF1", "PF2", "PF3",
>  				       "PF4", "PF5";
> @@ -414,6 +433,19 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
>  
> +			pwm1_pin: pwm1-pin {
> +				pins = "PB19";
> +				function = "pwm1";
> +			};
> +
> +			/omit-if-no-ref/
> +			rmii_pins: rmii-pins {
> +				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
> +				       "PA5", "PA6", "PA7", "PA8", "PA9";
> +				function = "emac";
> +				drive-strength = <40>;
> +			};
> +
>  			/omit-if-no-ref/
>  			spi0_pins: spi0-pins {
>  				pins = "PC0", "PC2", "PC3";
> @@ -626,6 +658,27 @@ i2c2: i2c@5002800 {
>  			#size-cells = <0>;
>  		};
>  
> +		i2c3: i2c@5002c00 {
> +			compatible = "allwinner,sun50i-h6-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x05002c00 0x400>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_I2C3>;
> +			resets = <&ccu RST_BUS_I2C3>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c3_pins>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* AC200 is co-packaged with the H6 die. */
> +			ac200: mixed-signal@10 {
> +				compatible = "x-powers,ac200";
> +				reg = <0x10>;
> +				clocks = <&ac200_clk>;
> +			};
> +		};
> +
>  		spi0: spi@5010000 {
>  			compatible = "allwinner,sun50i-h6-spi",
>  				     "allwinner,sun8i-h3-spi";
> -- 
> 2.43.0
> 

Tested-by: Jun Yan <jerrysteve1101@gmail.com>

Tested on a TaiqiCat (TQC) A01 with similar board changes on top: the new
I2C3, PWM1 clock, RMII pins and SID calibration cell all work there as
well.

Thanks,
Jun

