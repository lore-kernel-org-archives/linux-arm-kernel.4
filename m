Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25337606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NvR1ZIwr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STZ1BP2S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=434YueVY8gg24p2kd1Beb96u7O5ZLWZcLLMbyTb5lWc=; b=NvR1ZIwr3UlfbGsAnyvFgX0kLg
	OEiLr0A2aWdns5CovFy+EEIiz9AngR9pPNCCVm2PVymMoj2oV19KgEyQfuMd0WArBNt9HogZy230Y
	h3oa8yCdE3IymALfnBDg2AW4IesOfoYZagTSbGlm6rVKWHM7Twcbi04hAo8Zi0UBwCA/VfRTRQ8Ms
	PVHuoeGLeQCpGFQxFJtQVmN2QlUwCNWiAOA16ofOyd2za63VGi9FoyWOvGuKseTCD/w9/wf2IWnDc
	dadCT1aPD6MqcjCalUkcUEaUtnqhe2ihcQdwXwDZFlFZCHu2aefIczLbUWQIc6i5AyqXMsAv+0XmG
	IWQnnoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQcV-0000000FRSf-47sg;
	Fri, 20 Nov 2026 15:33:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQcU-0000000FRSU-2eib
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:33:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB88F61F52
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A553A1F000ED
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188825;
	bh=434YueVY8gg24p2kd1Beb96u7O5ZLWZcLLMbyTb5lWc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=STZ1BP2SMyzosDnAvJxbX421t6QgmQZK0ovWVw9Ny4Yv0xDne9opCaQ7AjAtgnS2T
	 zhegklESSUMbcsR82D9jCuJD4L8++V48jORsohQdjQIaUZ5pFdA+LKRvj0HRFl+gxt
	 Cr5Ci2IKXtcc2ocQ2CPXMtMNqu5gdw1S+TI7Wrx/AFvinQMPqpjbPlo07Q/QXN+YpA
	 zHJE9ysHGtrERPpANbbhm4VIy8aYxFrORlJnBwUNcG5I+06OSIsS8s0b0ilbGfO326
	 NlarOWpdCwvI4ZBRgHhc8SmWLdoWZDmScGpdMLmtw/UudCvq3F9A/SnOaO4Su+35xl
	 LFUqBGJhz50mA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c151178f0cso1129060e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:33:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHz2eAWo1TnPSMe+0LZPKOcHAzHoOutQd4JC9zNfvg3EBMG/eEUd6P7lRmuEV4VLRtUfEl457lM7BKO+fS14W/1@lists.infradead.org
X-Gm-Message-State: APuU4Z9spTVHlvk6EAwFK7n4mcTOsGOsFBj6LbJtaw9tb9OEM95m9RT8
	dlYb5p04WntgbtIMT8ahr+uCS3ZEeNLP0tXt666J7rDDoc06VxMIUkMQueBZc5EyOjvJJCJhCWb
	0i2aGKnVAWh5qCbj5NxwZRCo/Tihe2vQ=
X-Received: by 2002:a05:6512:6313:b0:5bf:f1fe:6c0e with SMTP id
 2adb3069b0e04-5c1bc802cdemr1038969e87.30.1795188824071; Fri, 20 Nov 2026
 07:33:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-3-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-3-ecd792189f27@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:33:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v64mACLej-LfpDXtO-7iftbWfYw8iviJSa0iLWXh-0S=tQ@mail.gmail.com>
X-Gm-Features: Aa3M54reDbvXEBB_vngwgS0l0u5v3buHZX551eY-WuBDjnylGFM1CXtInuYoQAc
Message-ID: <CAGb2v64mACLej-LfpDXtO-7iftbWfYw8iviJSa0iLWXh-0S=tQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Fix
 USB peripheral mode
To: ipfarher@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
<devnull+ipfarher.gmail.com@kernel.org> wrote:
>
> From: Ivan Pfarher <ipfarher@gmail.com>
>
> The micro USB port is set to dr_mode =3D "peripheral" because it cannot
> supply VBUS, but EHCI0/OHCI0, which share USB PHY 0 with the MUSB
> controller, are enabled too.
>
> When they register, usb_add_hcd() asks the shared PHY for host mode
> (since commit e671765e521c ("usb: core: Try generic PHY_MODE_USB_HOST
> if usb_phy_roothub_set_mode fails")), and phy-sun4i-usb switches PHY 0
> to host ("Changing dr_mode to 1"). MUSB then stays in a_wait_vrise, the
> UDC stays "not attached", and a gadget never shows up on the host.
>
> The port cannot work as a host on this board anyway, so drop EHCI0 and
> OHCI0.
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: g_cdc enumerates on the PC (CDC ECM + ACM), the UDC
> state is "configured" and MUSB is in b_peripheral. Build-tested only
> against current mainline.
>
> The H3 version of the board (sun8i-h3-orangepi-zero-plus2.dts) has the
> same setup from the same commit but is not changed here, as it could
> not be tested.

Just want to point out that the board is actually the same. H3 and H5 are
pin compatible so they just swap out the SoC. This board should have a
shared .dtsi file.

> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Fixes: 43aad09c7928 ("ARM: dts: orange-pi-zero-plus2: enable USB OTG port=
")
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 8 ----=
----
>  1 file changed, 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index 5697251b9..892723b46 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -66,10 +66,6 @@
>         status =3D "okay";
>  };
>
> -&ehci0 {
> -       status =3D "okay";
> -};
> -
>  &hdmi {
>         status =3D "okay";
>  };
> @@ -115,10 +111,6 @@
>         status =3D "okay";
>  };
>
> -&ohci0 {
> -       status =3D "okay";
> -};
> -
>  &uart0 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&uart0_pa_pins>;
>
> --
> 2.43.0
>
>

