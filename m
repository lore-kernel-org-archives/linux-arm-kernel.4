Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AAA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 06:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=48NvWOZs;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=Rodce3Gt;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=8Cukuoul
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k7J6TLLCIarsWD8/5ux9wv2wr1oM4S9+UrlbnYXYYKU=; b=48NvWOZs0hZpZMoaOpUvzzLOfQ
	j3CwH4rYiVOP/+sf5hWLiWJHw/zNMt7ESTaV1MK9zzTMqa06y2FVbxQ/7wPMLHe0W7tFeO/IQlbVF
	s4Whc9SjeEDgfs9i0WyIQghRtWdWULaxIKLWwiEKDOVrKhQFdKmsLa+VigVS1kYluFv50LwlAm3BO
	mIBv9qVvrGi042rSPJrQ5cUahnRpYGUNA/ADETPkVI3QE7gCbLYZx2q2aUQDldi4MMDSxrKF4LBqC
	PwxLxIQJfeNA4y3ONVDFV2VRQz48FvWhRFEMKtaFE21dgAVV4FbHyBcVWTgbudZHnMZyojrogzxqE
	ICuAMbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXBlY-00000000Pdi-0XQj;
	Sat, 28 Nov 2026 06:18:34 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXBlS-00000000PdK-2XRa;
	Sat, 28 Nov 2026 06:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1795846699; bh=k7J6TLLCIarsWD8/5ux9wv2
	wr1oM4S9+UrlbnYXYYKU=; b=Rodce3Gta8SDLrjSPXWt6cEgDCtwC1bW2cG/8/B/EEXW3UYnjH
	1FO/eUvRMQq+4pu5kS79Z6+XnZvV3MpGmsqrARQ1QzsWFYsQPY20KY5kaSOYe+WMIyQBccnFbj+
	xyMsiMiXl/Z5vuA8prXQF2JP7catU2D73g5yqZ4HR/IXnOKrcmy8TaWoj+Wb1+vWgj7aDKUtyjl
	mQOgfEiajFou4nJ0epnMdieVL+T5F9uMlMsx7gzHe9F+ZUKekW0dEiTeBYJg0KhU8hq+gYI8ZNV
	xWo0sbUgGPCTan5vODNeMR5/LW8sLhg6ABpZsGlV0SlCysTr0MwbYdlv7mu5DJZ6OAA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1795846699; bh=k7J6TLLCIarsWD8/5ux9wv2
	wr1oM4S9+UrlbnYXYYKU=; b=8CukuoulCXMMpGEKLE537432nLlqh8SMeUbgHIgTSdYagE9Fm6
	oPHQ2G41QrpG/zUjxQoxFKI6hfBB7p10oXDg==;
Date: Sat, 28 Nov 2026 13:18:14 +0700
From: Dang Huynh <dang.huynh@mainlining.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add CD GPIO to Orange Pi 5/5B/5Pro
Message-ID: <awpxYCW9N_tqAhiX@melt-pi5>
References: <20261121-orange-pi-5-sdcard-v1-1-e431e7c46ba0@mainlining.org>
 <c6930807-24de-49c2-adcb-5dbbc3da0c45@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6930807-24de-49c2-adcb-5dbbc3da0c45@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_221826_814882_0B0B9D8B 
X-CRM114-Status: GOOD (  21.57  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Quentin,

On Thu, Nov 26, 2026 at 10:56:12AM +0100, Quentin Schulz wrote:
> Hi Dang,
> 
> On 11/21/26 8:03 AM, Dang Huynh wrote:
> > CD GPIO is currently not defined in Orange Pi 5, this breaks
> > SD card hotplugging.
> 
> That's not the issue. The issue is that the card detect signal is muxed in
> the SDMMC_DET function (c.f. sdmmc_det in rk3588-base.dtsi) and that relies
> on the SDMMC controller being powered on to detect such an event. This
> cannot work when the controller is in runtime suspend, so we have a chicken
> and the egg problem. The card detect should resume the controller, but it
> can only work when the controller is running. Hence why we now go for the
> gpio function (via cd-gpios) instead. See
> c7a9549ce46e ("arm64: dts: rockchip: Switch microSD card detect to gpio on
> Radxa ROCK 5 ITX/5C") for an example.
Interesting, I didn't know that the controller could do that. You learn
something new every day I guess.

> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> > index 2db6ee95e504..8fbb0ba19b74 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> > @@ -282,6 +282,7 @@ &sdhci {
> >   &sdmmc {
> >   	bus-width = <4>;
> >   	cap-sd-highspeed;
> > +	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
> 
> issue: missing pinmuxing
> 
> You need to configure the pinmux and pinconf for this pin (via pinctrl-0 and
> we require repeating pinctrl-names wherever pinctrl-0 is modified).
pinmux/pinconf is already defined in rk3588-base-pinctrl.dtsi for this
exact GPIO. I guess this is in case when controller's card detect works?

> 
> Cheers,
> Quentin

Best regards,
Dang

