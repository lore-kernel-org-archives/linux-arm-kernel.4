Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0174606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kPMgHXeA;
	dkim=pass (2048-bit key) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=O9a8UIa7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tt+WmpAkUFOgrfzi7btk/x8M0AYBTyuSqOIMJxNpD+0=; b=kPMgHXeAH8BziI4oQYF7E1J0sF
	bYAmixy2s4ybb0pvF+RgqUj+wQqwH7FG+YJ7R2Oy8X6J8ppLiGrqw+cSF9ZdbiSxZewGWKo9dm7VR
	wYcGIMAFMo8mueTXChXQ1YneVktPG3AkK/Syt/lbxYrjexQfrPIM6cFEdIfZcsCqSqKXCZGwQNIu9
	SmLc1XpMt8ku8z7cMCnHP1UVuYgFxDbpGAgOXmlvLCDh5suR2bj/He8xeCYtyJa9Dq4p9NjLLuIOV
	262Q5In7EXkzCVV6QWNzb8kMVz7x5xpb+mBcnlNKBBuLQk4gpSXftwwjxj+nZemyq1NHiJ8KHY5yv
	UuHaru9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr2P-00000004rJg-3kHP;
	Tue, 10 Nov 2026 18:57:45 +0000
Received: from mail1.rojer.cloud ([88.99.92.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr2N-00000004rHu-0R8D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1794337057; bh=Q4YkH5NtpBumyhhscsY/D/wVL7UIGd+c47iMMzSXQ9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O9a8UIa7eUHrbyVB8oBUf3riQiJbYL+R4gLsXysG3Rcr2SCIyUxXIkHTJLPCrpBXj
	 xcSnngxqF1WX410ViBiY/MB4LO3rm1+8WygkwkrlB4h5Hmzo+hYcY0quvOM+JTvlny
	 iin5qWdBHifecs15G0dyUJ6l4YhMUxfO2ybSGv5ZHtc6vd9IZJq4ashpgdM/X/6L/t
	 Ox+VTLONNOT7X1YmdeyObK9+C1yG0pn72fgi9vvBwhIZ9lzY0Antc1OGqSwmDgqVaM
	 mYt3iawuT76SvbVOZHpVkrgVjITFhwS4bQdXTiOSDzf6l6yY4VzqV0w+HTuEtrbc64
	 8obRQENWHS4+Q==
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id BE16F20021
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:57:37 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8241a56cd70so1524827a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:57:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHvastI/hkSuM/Z6Lfzu/Gc1ato7bkI/lHBbZHpNkV2nA1AIkd66MYFKArBdvDbTf2pMPMnWQ/hEEHj3nu19rGj@lists.infradead.org
X-Gm-Message-State: APuU4Z8HOcx3NnVpsasIOoTCrhlmAzsmWUMvxNWMo7RQyxQMg3HeTaUS
	O500sWFtPDlbk3u7jwjKazcRKaWd1udY2IuigttUPXNpHMzmgiN/0w+MBolKVX+wxbBerH0QsEC
	4Apo6iX1gNthlDFgG7JhIPnEZO13CdQ==
X-Received: by 2002:a05:6820:1c8b:b0:6f7:7a4a:9d7b with SMTP id
 006d021491bc7-718a576d5b8mr1715751eaf.41.1794337056322; Tue, 10 Nov 2026
 10:57:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031104714.3271017-1-rojer@rojer.me> <20261031104714.3271017-3-rojer@rojer.me>
In-Reply-To: <20261031104714.3271017-3-rojer@rojer.me>
From: "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Date: Tue, 10 Nov 2026 20:57:24 +0200
X-Gmail-Original-Message-ID: <CABFmFwoAMs8upS4wtjJo3oS3r7fFfnffm2Fn5nWOCZ+Z879d+g@mail.gmail.com>
X-Gm-Features: AclHuK9MmlZCXre31qUD1WX8nPu4qqnNXxwDWOVxcYi7QO4VkRvqA9uFGpDjBG0
Message-ID: <CABFmFwoAMs8upS4wtjJo3oS3r7fFfnffm2Fn5nWOCZ+Z879d+g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi
 R2S Plus
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jin@mediatomb.cc, shawn.lin@rock-chips.com, jensenhuang@friendlyarm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_105743_413419_689000FA 
X-CRM114-Status: GOOD (  24.96  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Heiko,

gentle ping on this one. the mmc changes have been applied for 7.5[1],
it would be nice to get the DT bits in time for 7.5 as well.

[1] https://lore.kernel.org/linux-mmc/CAPx+jO8n6Y9PWDkxurwjjfGXSiGS0KWrYK0C7=5Uqic1Gn+M7w@mail.gmail.com/

On Sat, 31 Oct 2026 at 12:47, Deomid rojer Ryabkov <rojer@rojer.me> wrote:
>
> The NanoPi R2S Plus has an M.2 E-key slot wired to the sdmmc_ext
> controller in 4-bit SDIO mode, where FriendlyElec fit an optional
> Fn-Link 6222B-SRC (Realtek RTL8822CS) module:
>
>   - SDIO signalling at a fixed 1.8V (VCC_18)
>   - WIFI_REG_ON on GPIO3_B0, 32kHz sleep clock from the RK805 CLKOUT2
>
> Enable the controller and add the power sequence. The SDIO pins need
> 8mA drive strength for SDR104 tuning to succeed, as in the vendor
> device tree [1]; with the SoC default of 4mA no sample phase works.
>
> On boards without the module the controller gives up after about 0.2s
> ("mmc2: Failed to initialize a non-removable card"); nothing else is
> affected.
>
> With the mmc core change for the module's CMD11 handling at a fixed
> 1.8V [2], the module is tuned to SDR104 at 150 MHz and works with the
> rtw88_8822cs driver; without it, it runs in high-speed mode at 50 MHz.
>
> [1] https://github.com/friendlyarm/kernel-rockchip/blob/9238df9d21e835bba35c8ba5248784387936cb2e/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2-rev24.dts#L144-L172
> [2] https://lore.kernel.org/linux-mmc/20261030142224.3183407-1-rojer@rojer.me/
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
> ---
>  .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> index 6ba4a74cb1f..a25421f5851 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> @@ -17,6 +17,15 @@ / {
>         aliases {
>                 mmc1 = &emmc;
>         };
> +
> +       sdio_pwrseq: sdio-pwrseq {
> +               compatible = "mmc-pwrseq-simple";
> +               clocks = <&rk805 1>;
> +               clock-names = "ext_clock";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&wifi_reg_on_h>;
> +               reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> +       };
>  };
>
>  &emmc {
> @@ -34,3 +43,49 @@ &io_domains {
>         vccio4-supply = <&vcc_io_33>;
>         vccio6-supply = <&vcc_18>;
>  };
> +
> +&pinctrl {
> +       wifi {
> +               wifi_reg_on_h: wifi-reg-on-h {
> +                       rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +               };
> +       };
> +};
> +
> +/*
> + * SDR104 tuning fails with the default 4mA drive strength, use 8mA like the
> + * vendor device tree.
> + */
> +&sdmmc0ext_bus4 {
> +       rockchip,pins =
> +               <3 RK_PA4 3 &pcfg_pull_up_8ma>,
> +               <3 RK_PA5 3 &pcfg_pull_up_8ma>,
> +               <3 RK_PA6 3 &pcfg_pull_up_8ma>,
> +               <3 RK_PA7 3 &pcfg_pull_up_8ma>;
> +};
> +
> +&sdmmc0ext_clk {
> +       rockchip,pins = <3 RK_PA2 3 &pcfg_pull_none_8ma>;
> +};
> +
> +&sdmmc0ext_cmd {
> +       rockchip,pins = <3 RK_PA0 3 &pcfg_pull_up_8ma>;
> +};
> +
> +/* Optional M.2 E-key SDIO Wi-Fi module (Fn-Link 6222B-SRC, RTL8822CS) */
> +&sdmmc_ext {
> +       bus-width = <4>;
> +       cap-sd-highspeed;
> +       cap-sdio-irq;
> +       keep-power-in-suspend;
> +       mmc-pwrseq = <&sdio_pwrseq>;
> +       no-mmc;
> +       no-sd;
> +       non-removable;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&sdmmc0ext_clk &sdmmc0ext_cmd &sdmmc0ext_bus4>;
> +       sd-uhs-sdr104;
> +       vmmc-supply = <&vcc_io_33>;
> +       vqmmc-supply = <&vcc_18>;
> +       status = "okay";
> +};
> --
> 2.53.0
>


-- 
Deomid "rojer" Ryabkov
rojer@rojer.me

