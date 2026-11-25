Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A889F606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KAhCoHd9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g7UzI0Bv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7fI1oJyEyMEPT3m/RhXsKcyH/DScXen1rQTS+jBBulM=; b=KAhCoHd9+0+f+I
	QjTSIlpENotDj0j9IKM+ILYH+m5iWMmPOj+pDq4RI8FjWf9pTb+YIoONen/TsDoHkwbgidInPJ2h8
	8A9sP5dpY3FKMMtEugYyi2jwVP/i+WDiZYpV9irIHnF+iCi6XTClRlWwxpLqcse/BQzZxLqa8I58I
	fI+Rx/BKP4LAVA0W2zRU7c+kuwO7DjRxFdVd6MiNZCo+82kRCM6ZzeEHNR3jvJeilTvWmg/eXBiaH
	Xsy9oSr1kpB2P7Py81XN88lJBu406NxvLUw/j3a2zWVN+YBDJ05fjLQnfT+crtiowALYx7GQrVwu9
	1Dx0ivO7HSvo8oNW0WZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAxK-00000009YeU-1c5T;
	Wed, 25 Nov 2026 11:14:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAxJ-00000009Ye1-2bSk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:14:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CCD7D404D5;
	Wed, 25 Nov 2026 11:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE50D1F000C6;
	Wed, 25 Nov 2026 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605268;
	bh=7fI1oJyEyMEPT3m/RhXsKcyH/DScXen1rQTS+jBBulM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=g7UzI0Bv+XVOMgsXSCGzwstBwZWt1kz35H/2jUMHmO79mNmISW/9egzFTA1Z3NncL
	 XetDK27JjoiWxVkT4drHSWzjHXTo2PLFElJJf7EgT/jEwSRiUf7u1IgTarxYH+8OaS
	 ibw8oLJkWjG+sDFQ6Z5GC5vKlSrd5YxR1M4yOf0/HV0t6ixZOtM7UyLuslUn+sirN1
	 ghxWTu1tIdDMgOIhcrpcXJPvzdnlCT9ZS0K/f1e8vk5lRXGq+oWIaUel38Pfo4THir
	 qu0lhy/izO9xKeVMe3mZfWrakbMsQlWzR4QjnzLIr4bmWk53y32HdwKVscI3jzB1uW
	 xsix9iZDbDQVw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos: exynos7885-jackpotlte:
 Enable USB support
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Virag <virag.david003@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261123092244.1792040-6-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
 <20261123092244.1792040-6-virag.david003@gmail.com>
Date: Wed, 25 Nov 2026 12:14:23 +0100
Message-Id: <179560526392.84329.18350547013510228112.b4-review@b4>
X-Mailer: b4 0.17-dev
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

> The Samsung Galaxy A8 (2018) has an USB-C port capable of USB 2.0
> speeds, used both as host and device, and is used for charging the
> phone.
> 
> The physical port is directly connected to an S2MU004 IC, but until we
> have support for it, we can still use the USB device funtionality.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - None
> 
>  .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> index 4b1961ca365b..5550b21e4113 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> @@ -59,6 +59,12 @@ power-key {
>  			wakeup-source;
>  		};
>  	};
> +
> +	/* TODO: Remove this once PMIC is implemented  */
> +	reg_dummy: regulator-0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dummy_reg";
> +	};
>  };
>  
>  &mmc_0 {
> @@ -112,3 +118,17 @@ key_power: key-power-pins {
>  &serial_2 {
>  	status = "okay";
>  };
> +
> +&usbdrd {
> +	status = "okay";

dt-check-style, this goes to the end.

> +	vdd10-supply = <&reg_dummy>;
> +	vdd33-supply = <&reg_dummy>;
> +};

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

