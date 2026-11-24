Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3695F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M0J+lyAz;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t3B1lgc6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M+Df03Fx4+itYz4J38HagOcF0QG4sU4+kJ8QrdfzfKM=; b=M0J+lyAzKhOyhJnBmWasTgyVpz
	Sm70V7DMGS6fpSdoANq3N6dxs9B6lHS2ge2PXsfjI6iE/iKVo4l35Fcih6NPDclECH7biPTX9SW6d
	4zC7bD2fqaLjIJRlv1GUGfcE4qtHOKIjoK5KchQZXDPZPSy6NzZ6O5g+CtkC6J3YzxZRXOI9AmkBg
	NbREirPOw5YG9yDAOpGnpL94jbNHVWD07PWjGA/jYEIIQ1kNTuqLjBMcMOs0nDn6zQmfGj9y+JL+u
	OcsGn0zt38dev4Ev4Hsf7/IrQ/+fFxk6wj8Iker4We+NlcL1QOAiWyQmYeZqb1AfUGyGhAL3xDmf/
	xglRfthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqll-00000006fEH-3YzK;
	Tue, 24 Nov 2026 13:41:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqlX-00000006f73-3Hbd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:41:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4b467581b98so43698295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 05:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795527657; x=1796132457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+Df03Fx4+itYz4J38HagOcF0QG4sU4+kJ8QrdfzfKM=;
        b=t3B1lgc6ni5a4jRsIZIw581UMwoCXpw/edMcTR/j1M2MJodBich2o3phmsY6b5Jm9a
         9KUXH6vNOIAWh9I21vmwKhCJlzQhdH+3pUipzixtPlrfO0r43QoFEfj6yOeVVKNUYqbT
         8JOwfJ8iYitasJZZdIOBZQG61PpkrrNOkEb2LVfVBlve3uH0x2KSR7tm7i4I79EyukAV
         6C76gEJKTn9dc6gMwCZ+oiIP0mo2UBf7KmFdmd/g0inczjD0xH1zN58wQwog+Q00vq53
         Zo0zsCzDWzHl3xA3q1zUeYkHlkivhxRGaS0SNkTWX3YjGdDA0xLulsKInugZK8475WCh
         IeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527657; x=1796132457;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+Df03Fx4+itYz4J38HagOcF0QG4sU4+kJ8QrdfzfKM=;
        b=L01xBoEECSrz3o34gORgP42tGSN1ODT4bMdqXuts3Y8vv/1hJpYYnIiw6llNuMFemG
         cTFJhVx0KUpe4FJJXpDqZ5IOYCtzWCdqWfRjo+i20E3CzW1hdtbzGSmZDsWUezOyAQ58
         K4QeKL/Rs7aYfGC0WC6pnI9EDC/filYg5TA/t7GYziZPY6cvgEZhywi/H4B3O26KljpV
         nfUX2nBI8u+FbdyTpUtzE1HIH1U0NLkwolH0Z1cEFMoD64Cfn7LrK/5zS8aoif4j0T1/
         0pKwYK0y1YC/KO51HeIOCy1mpjilRR7OEGnmBeroTCbz1sU1yPKcHy6n2uN0UyPzJ6SL
         mHyA==
X-Forwarded-Encrypted: i=1; AL+hErGAsLEOT1NCN43EuNaHxtO1HewgHrYTL02DmnvsnZ2CwQTGwesdizvQ8t4cwsyXLuUPruzBH6z0n3t0BwyvSbqC@lists.infradead.org
X-Gm-Message-State: APuU4Z9vIrUmmfquipxicAwHb/E86fcr4KRbPi+vhG3vnQ1VYhPR6aeV
	FKEEMPON0Z9Zm1wEmnNO9VoprHZSIHF7PbTh4pcR7gtoYsDL07//yVxxmsg9H6qwfDw=
X-Gm-Gg: AZFdTZebH1+z9hioGqt2sNc4fOVtMS/iUdlNsnPC7xhr0sZb95C1C4QWWMmzFZ1BQQq
	OVrdKNMqvXTlsyNlCXPis9teJF2fZy9M7+U6+6iPcNMhFvJlAIgfTumSEDb1oHiXw6NRdNlEIHC
	wiiQ8YYbZ86htx2P1OgiYiDuXhJ/m2SDEXCW6E6maKi5pbZs7aLJ6TaTwRuqFfDb/xoU+OFTYLg
	tGzlXbNpqnlB0ZE6aEtwwK5yYA7RseRDP85pR7g0aG7/dQtfHvck6Wwem1/hGLPZdBkJ4TkNMLw
	d8cbTNYNWubIlGNq0lPMO3hUpI96BbO7990m7x7vNHJQxfPoii9SoMW3u3MvMNKuB4w0uwKrORP
	J8TyGg3hh7qxBu7AHzWbx1zksv+7tT+nJW8/EeQ8MrNsQU4prK4Yn757RYZf/Xs9KHeeib7j2T6
	kbEoDJVoqSyMDR2dCnlI7waI2/6pb5VXW5p0UkjShrVQbw8zSruwRZl8coxFcOs3aJFT2C+WpHc
	l9thH+zv/j9CWjHb50sowkWlFUo0bhePM2pFvzeSNPwAusdrZ3Imy+l1TtEmkEKg/w5Y/8EPw4h
	Ax3P3VvX+TfbVd+JDf27s5PpbiZRWltkWShWUP1N4c6yZTW5yGkMk0qjWXDNqoKHogCn+bE7bBS
	QRBlfQYhe
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr277520385e9.4.1795527656673;
        Tue, 24 Nov 2026 05:40:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94? ([2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm229886835e9.2.2026.11.24.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:40:56 -0800 (PST)
Message-ID: <9bc15d77-2a56-4e64-8b73-163c44bcf5ea@linaro.org>
Date: Tue, 24 Nov 2026 14:40:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash
 overlay
To: Jose Nieto <jnieto.alaber@gmail.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261103164730.160593-1-jnieto.alaber@gmail.com>
 <20261124111333.33734-1-jnieto.alaber@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261124111333.33734-1-jnieto.alaber@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_054103_389859_34DE61EE 
X-CRM114-Status: GOOD (  19.15  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/24/26 12:13, Jose Nieto wrote:
> The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
> shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
> 4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
> device.
> 
> The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
> nor_hold_wp_pins pinctrl group is intentionally not used.
> 
> Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
> ---
> Changes in v2:
> - Keep the original BayLibre copyright and mention the U-Boot
>    meson-khadas-vim3-u-boot.dtsi origin (Neil Armstrong).
> 
>   arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
>   .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 28 +++++++++++++++++++
>   2 files changed, 30 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa55c..3714cbaaa03e 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
> @@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>   # Overlays
>   meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
>   meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
> +meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
>   meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
>   meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> new file mode 100644
> index 000000000000..9f57d9433ee8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>
> + *
> + * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
> + * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
> + * enable the SPI NOR controller, exposing the flash as an MTD device.
> + *
> + * Derived from the U-Boot arch/arm/dts/meson-khadas-vim3-u-boot.dtsi file.
> + *
> + * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
> + * nor_hold_wp_pins pinctrl group is intentionally not used.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&sd_emmc_c {
> +	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
> +	bus-width = <4>;
> +};
> +
> +&spifc {
> +	status = "okay";
> +};
> +

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

