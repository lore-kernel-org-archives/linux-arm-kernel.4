Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165BF606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3y9HW+hk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHIYRZkA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=19EDW+MpENZ0HYbXIgRTdbQjQZnrHe7ev5VJ61uMM4E=; b=3y9HW+hkPGKrSlnwlHsaD3hmkl
	uDXHCtBJYnpC7p6pyv7vLz/AFv9/wU//B+HTCRkkjLQS+b2hJcXmkNhlapGtOCdQguZeEOSzxf48a
	W0Rmy4foM4JSaZo/njyW2lmD3+OhfNHE+tXV/2GpJ9sFCgoVB6Ws6WcZX/43R+Nsfn8kQ+aFXdTNb
	VQw4oAvSp17Nt9JIXFgpFA1PQs1rCMCUsF94lZJyKvcCHRFWk+kvZEybsm9vIFHMBGEALNZwAunlV
	9gZpZSR/9qsgwNZuCeFeI4Nc2lLE1EgZJ4eZPiJf3fshtmBrlTKZKsFCDKrRn8B7dUyJpxJJ2nqd2
	x75bxilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQYp-0000000FQvP-0wSb;
	Fri, 20 Nov 2026 15:29:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQYn-0000000FQvA-1g1X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:29:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D57F062EFF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3958D1F000EB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188596;
	bh=19EDW+MpENZ0HYbXIgRTdbQjQZnrHe7ev5VJ61uMM4E=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=hHIYRZkAx67ipCAxDBs8tFyWlLxuGnsB+D5K/RyKea213tkhzZvXtzZqbk+xQ06K0
	 gXCOa9/4xn7KZeRCCXEamjZCBvAh50Es1VROC55uhJA0OG0tj1PqzzvHYGEcXoqycX
	 /newShzTiJPFL8QnqNbtD0G86Jdgf0tUBtIwq6RDfsm3F9VvtVnfU7l9XfWhcMGqet
	 5vsXUim8xiYHC5crSVmTuUtmLmpbgyPI80mKLLVUZ12ikhnlxQSEU5RIS5Mqaji5rm
	 kHfEx4b3c1IsXBWNojmmvwBL6n6uO5pMdaMIm+HtN2WCDyg/paX31u0aBHV2z+4kt8
	 nF5x2qWD3c95g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1a3374400so771998e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:29:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFja8Hnfo0EIeQBoEHO29YvQ5i8Z3HZTOTx+LH6ZE5UwJAgMp+XN5UyHqrZOq4A9ssRvcGvu3BGLYUG9BdartEu@lists.infradead.org
X-Gm-Message-State: APuU4Z+UKmaSvGSp8as5oSwEL7eHXF14zrZdGyKS1mPYx3bXeNWLGMyD
	0U3IEgKZLhe15YMnHJUFwOJ5n0PtVO+TVVvFpkdxDjXrJ068PCfgCTc5qSbxJDYfqVRYT7ywogW
	p1jrf72zKIzQd5+8Ae4XJ0zBzoqKTkfc=
X-Received: by 2002:a05:6512:23a0:b0:5bc:ca83:1fc0 with SMTP id
 2adb3069b0e04-5c1bc84e614mr1015619e87.60.1795188594639; Fri, 20 Nov 2026
 07:29:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-2-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-2-ecd792189f27@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:29:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64xJxTD=f4dTdYda8GCgDCfBw3qVbRY_RtB6qiDH5GD2g@mail.gmail.com>
X-Gm-Features: Aa3M54pAMnUI623oR2XiNXWmuPAcYcjbHEq980eIU7p81C8epq7iuQ2A1Hg-J1s
Message-ID: <CAGb2v64xJxTD=f4dTdYda8GCgDCfBw3qVbRY_RtB6qiDH5GD2g@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 AP6212 Bluetooth
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
> UART1 is connected to the Bluetooth part of the AP6212 module, but the
> controller itself is not described, so nothing powers it up and the
> kernel never registers it.
>
> Add it as a serdev child of UART1. BT_REG_ON is connected to PA10:
> on the board, driving PA10 low makes the controller drop CTS and stop
> answering, driving it high brings it back. It uses the same RTC LPO
> clock as the WiFi part. The wake-up lines are not described because
> they could not be identified.

The pins are called BT_WAKE and BT_HOST_WAKE. The lines are labeled
BT-WAKE-AP and AP-WAKE-BT, which go to PL2 and PA20, respectively.

Please add them.

> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: hci_bcm powers the controller, loads
> brcm/BCM43430A1.hcd, switches the UART to 1.5 Mbaud and the adapter
> works with BlueZ (scan finds nearby devices):
>
>   Bluetooth: hci0: BCM43430A1 'brcm/BCM43430A1.hcd' Patch
>   Bluetooth: hci0: BCM43438A1 26MHz AP6212A1_CL1 BT4.0 OTP-BD-0034
>
> Build-tested only against current mainline.
>
> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts      | 11 +++++=
++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index 34d6c1468..5697251b9 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -128,7 +128,18 @@
>  &uart1 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +       uart-has-rtscts;
>         status =3D "okay";
> +
> +       bluetooth {
> +               compatible =3D "brcm,bcm43438-bt";
> +               max-speed =3D <1500000>;
> +               clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> +               clock-names =3D "lpo";
> +               vbat-supply =3D <&reg_vcc3v3>;
> +               vddio-supply =3D <&reg_vcc3v3>;
> +               shutdown-gpios =3D <&pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 =
*/
> +       };
>  };
>
>  &usb_otg {
>
> --
> 2.43.0
>
>

