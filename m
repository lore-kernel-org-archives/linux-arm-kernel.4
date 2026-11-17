Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEA5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xRpCyh0c;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TvNKEpNq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=; b=xRpCyh0cYh7b5J+qTXUFPk4p5f
	FoMbDzbvaqSuIJz9jnIpt2hLz3W2WYSvOkyMIWlGl8j7paFroMyLSEhhyKuwPH7l8QWp4xKa9c7mM
	ifBbUI36ZQJ6P6w++c5x6OQr2tBW2DooQZLVqO/sLo6m17tafttzZqAeHgWbHmZk9NTrBpaagsB88
	p2fmMQeTkJmGlxNYZdYSe56/MF1QtqdHL1x1LUpGj8GKVK+MJ3jywFsfo2hKGD5fWmTBNLx+bRVex
	2xcw4FZSyoumqZyw9QDmDYiAJp5oVu3vwIw2sJYSCyl09vTck9carg13W8Wem+zBzwQWCmmcGNSQZ
	0dt+wbew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMC1-00000006RPm-2gPY;
	Tue, 17 Nov 2026 16:38:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMBz-00000006ROz-1MRl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:38:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so376595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933477; x=1795538277; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
        b=TvNKEpNqPaKw4nYnPFBPT+mWD2QF+nTBmoLUrMypW3mE1u76F4a/47iDas6BM2hIo4
         bqNEfuRbgRWweWpD6pkbEtYeSPdyGht2XMrr/5Fl2ED9RO/HELTdFhcVlgH2yCnrtve+
         jBxwRtt6WxepmB/kpNOpPLuv5xEdjYr+wGYGhZtmfCh8VxkEkxMMHCuPcgX5CaG5qVKM
         S/0kk9O9AiuC5K4phocMD6CM6zQpRuZ7ilFzu0QcsEbr0whZnNLHVl4z5ZK80rg7i0Yd
         Y+29RWEkSVSMhqixtU7BZ3V+i0L+a5n2LpjNhqvIZg3KzAjpBt2L7DdAzfeXcwmvrC1r
         hxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933477; x=1795538277;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
        b=S3Mz0dTSbJlAdDw5SS1eP3OBT6xLX7iWBJuA78C6AolmHEHGbVQwxS7CeIfjx1pYlZ
         vJf3x6nvDABOh8XdoIkpf4I2+thHLgG2aE3xojD1ISa5cJmDmU3IeFEGpzBAkcv6scoA
         VQsDgMXbVJRLc8II2ynMWnReAixdHPG6l5ETiTWd49TDdUSN9i3tKxlnn0zCiGpL6YjO
         fI+A98VDC+nt9fhUld5+4hxS5T3W2a5B4MpSfxeVJDNwD9eXubJS09AjQfQHkJB2o1RQ
         ICqGFSOIgoc3uxTDfx2dYYiC2VajsR2w36QVEl08U4CRVmxr7qTL7CQV75/XeWLG8c0j
         KdiA==
X-Forwarded-Encrypted: i=1; AL+hErG/8t1tZpcGo7L2w72Bjq+PC3BkBd9cy4BU5AAaDBlDXD1Deqqz8iYjTO3uhaNxHvSmjslEb6mRxpsRfhr0SAyZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+leKh3g9OpIUpws6lM6FEMop8cqhYK8sozWpSe6goP75Ee1DHs
	isjcdcrW7dlrCaM8JhrDFAyLnzFryANou6h8BSExMlI2risNZXzTyNet
X-Gm-Gg: AYBFou1H3DI4QfYc3ek93sTSm7RdHq0Ci4xiU+BX8XaG84Ggm6LpBxfB/r40nB6VTyV
	YCkmU739LDB9ytNISsA1uRKmbtoJMpSyeLg2u/BElUOnm88ZTjfoN9Fy1OHyCr/TgrnfD/nzxvk
	ZSTVsjg21Z+NlTW0L585mp511UYL/opNvuo07OhmUILpGBq5PPIDCLp43Cnr+atzb5onSwHa7oe
	LX0qLXXlKpYyYRW4Alf3kYFrI4mkvJjXJea/qaG6lLZfoHu8/N+O6k7rK4PtwMKtaP8vS7zMtQZ
	LO+YwJjhdYXhHHY+xgBsm3mb3B5MxWwnYor+FPCqN0LyamTXlNZQy/c6qUP5svVKQqeK96bDgCp
	rkPbWGANFpglVJAwSEPElFVGOiKyfF2hzkF6AA5rrnXChbe3bhedkGGDwbMxfVjqBywZWbHbG3Q
	6ChyFJcqCYc3dPx2NceUrg0kJnATu+wTRxCvKTG/JFP38sF7UbIek62zetiaea5zDzpVv6cmWSg
	jKDtyeoYVodHuWPgQLbk2iPKGeiwJAJbIUcjXUfC/LjuAR1CH8RNBsDl1dv6uDx2C0222IR8FKL
	ryMW6Asn9Wa5NLWv1S2Kpi5OrhB8/+boQXMhMjOUAYZYPotuDmNOBohYmXzywa4JTVzI9IdR3MF
	Pwb3eH60Yy2OJikgsZEJmXb1RldYXaHcqB9QHib7wMss5rtEstNBvznNO2Vpraowdz5+3N+7Oq6
	7+hYdlgLZmsAe2J26XefuWnCULKuYEhkxVTHEfUPAQDPiW+LZVnok/C+FXCpaFABtHOGgzeIWmg
	wZXaZyxPeXnNsv8z9dSPvuVxMwtbPwSPFZ6HwhRweZmBf8uWqSTsGJDFgiC4BqVRtdX
X-Received: by 2002:a05:600c:a0b:b0:4bb:6847:7927 with SMTP id 5b1f17b1804b1-4bb68477b90mr206657185e9.7.1794933477039;
        Tue, 17 Nov 2026 08:37:57 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm29882037f8f.6.2026.11.17.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:37:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Jun Yan <jerrysteve1101@gmail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet
Date: Tue, 17 Nov 2026 17:37:55 +0100
Message-ID: <n0Gb_HzYRTi_JMXR8vuZwg@gmail.com>
In-Reply-To: <20261117142122.246986-1-jerrysteve1101@gmail.com>
References: <20261117142122.246986-1-jerrysteve1101@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_083759_379670_96066A12 
X-CRM114-Status: GOOD (  16.56  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne torek, 17. november 2026 ob 15:21:21 Srednjeevropski standardni =C4=8Da=
s je Jun Yan napisal(a):
> The TaiqiCat A01 has a 100 Mbit/s Ethernet port, which uses the EPHY
> integrated into the co-packaged AC200 of the Allwinner H6 SoC.
>=20
> The AC200 derives its 24 MHz reference clock from PWM1, so enable the
> PWM controller and the pwm-clock node that supplies it. Also enable
> I2C3, over which the AC200 is accessed, and describe the AC200 EPHY
> package on the EMAC MDIO bus, with the EMAC operating in RMII mode.
>=20
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ---
> The AC200 MFD and EPHY drivers/bindings and the sun50i-h6.dtsi AC200
> description this depends on are already merged in sunxi/dt-for-7.5.
> ---
>  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> index 225f42bd3b9e..9b192caeecb2 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> @@ -14,6 +14,7 @@ / {
>  	compatible =3D "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
> =20
>  	aliases {
> +		ethernet0 =3D &emac;
>  		ethernet1 =3D &sdio_wifi;
>  		serial0 =3D &uart0;
>  	};
> @@ -87,6 +88,10 @@ wifi_pwrseq: wifi-pwrseq {
>  	};
>  };
> =20
> +&ac200_clk {
> +	status =3D "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply =3D <&reg_dcdca>;
>  };
> @@ -107,6 +112,14 @@ &ehci3 {
>  	status =3D "okay";
>  };
> =20
> +&emac {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rmii_pins>;
> +	phy-mode =3D "rmii";
> +	phy-handle =3D <&ac200_ephy>;
> +	status =3D "okay";
> +};
> +
>  &gpu {
>  	mali-supply =3D <&reg_dcdcc>;
>  	status =3D "okay";
> @@ -123,6 +136,29 @@ hdmi_out_con: endpoint {
>  	};
>  };
> =20
> +&i2c3 {
> +	status =3D "okay";
> +};
> +
> +&mdio {
> +	ethernet-phy-package@1 {
> +		compatible =3D "x-powers,ac200-ephy-package";
> +		reg =3D <1>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		vcc-supply =3D <&reg_aldo2>;
> +		nvmem-cells =3D <&ephy_calibration>;
> +		nvmem-cell-names =3D "configuration";
> +		x-powers,ac200 =3D <&ac200>;
> +		x-powers,xmii-rx-clock-inverted;
> +
> +		ac200_ephy: ethernet-phy@1 {
> +			compatible =3D "ethernet-phy-id0044.1400";
> +			reg =3D <1>;
> +		};
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply =3D <&reg_cldo1>;
>  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> @@ -173,6 +209,10 @@ &pio {
>  	vcc-pg-supply =3D <&reg_bldo3>;
>  };
> =20
> +&pwm {
> +	status =3D "okay";
> +};
> +
>  &r_i2c {
>  	status =3D "okay";
> =20
>=20





