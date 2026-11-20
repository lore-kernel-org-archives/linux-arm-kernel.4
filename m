Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C237C606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S7y0rJ5u;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqVIs/i7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bYr+QUNJgI2MuvA03QXGQr4rvGgFxUgp/NNJvE4vbEU=; b=S7y0rJ5u23XeySP7eBvfm0HXFm
	vS7UGMueCGriZ6fWHJV2gQ4SKd3anRGQuxMTmtufX4CIwPD28uO/+ViBb70pUqHS5hig0+OYNKNmS
	qfZSSY4zgFXaLNF+vS/NR8oz2ijVOG7pgN4E/XzK2xyiAQSLLEjvzV6ezPYAxYQVNoH9MYt1XjcFg
	hLHnKtkBgZgfWpM9RbeNKmx6277mlwVfLO47Fe1AtJrxhZkjp802MoDKXp0nKKr0g5WU2mRbsSV4b
	Go+mvAwQzQK2Xe6rK1DP5NYn+n7EvBIS/ylTXfMlw/UJm1vZRhHuIgIHws57EwzJm6xAeIP44/VIs
	0xQ2AJbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQTs-0000000FP5P-0Xwz;
	Fri, 20 Nov 2026 15:24:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQTp-0000000FP4Z-3Hlp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:24:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED5FF62149
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEAF1F000EE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188288;
	bh=bYr+QUNJgI2MuvA03QXGQr4rvGgFxUgp/NNJvE4vbEU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UqVIs/i7TnKEi5Pn1UgmNFghzO3lvNU1K01wLHBT4Ls42aNMRJ/BMDWXFhTKXzKU3
	 64TCk0ihAu0+w4807jkxbltQl8o7EcMobp0AP3bLAPYy6fDU1lkeNxVuVKR6R15tlC
	 7jZlok2aFFGvuclmnaivHCP+80GGhGDy3Umwt3O81jIrxzKMTfpo39vSKmy6dBQVgM
	 rb+/4OIF2Rc1qHGD9nlkbYcfsHWvuSCQ2SGn0SvNMcr2tSx+PUDuvJlUHz2wgyfu//
	 9+Qc9j/I566PDhRqVVG1kxEeOMFNCRQjUBMc8DYJCSkUI9rcO5sXfC8FasSqTv+2/L
	 1tdeuLJpCxN9Q==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso8928751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:24:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErERdinzQvcmfCSn9AJN/HPiI4WgBrWEOE3t8xH/DLsrDXGWFLJEr/t3fzAHtB4nF/zXcnqXoRQewVhcTSr1vbfo@lists.infradead.org
X-Gm-Message-State: APuU4Z/T25QZ8EImRfYh3PE+60+ors+Z7zc9Guq60PssdbfdK5RvAoo+
	OEHrABqmxTZPSnoxlEUyKC9KAJwjT47J1Ez5EQmfSSiMejmXurCPoL9rUhhgcVXNG+U40xUlUHC
	vVw2kXfqrCpSoiWQnBf+gO4fIbhNVwAA=
X-Received: by 2002:a2e:bc93:0:b0:3ab:4014:884b with SMTP id
 38308e7fff4ca-3ae7f8daa51mr11747861fa.1.1795188286689; Fri, 20 Nov 2026
 07:24:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
 <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com> <CAGb2v66=Wy1TEy5KrQt+TmYPowryx19tUN14QTREn9z0dOaJgw@mail.gmail.com>
In-Reply-To: <CAGb2v66=Wy1TEy5KrQt+TmYPowryx19tUN14QTREn9z0dOaJgw@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:24:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v66CrTWmrFFtZbHgU4eQ6TxubunbR8sCAgStmL7iLYRK3Q@mail.gmail.com>
X-Gm-Features: Aa3M54o-5sW9SWZsS-y6GLqPkComGdru7jKRb2CUEXihGp57lc4ysEFr0p-QWPk
Message-ID: <CAGb2v66CrTWmrFFtZbHgU4eQ6TxubunbR8sCAgStmL7iLYRK3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 LPO clock for AP6212
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

On Fri, Nov 20, 2026 at 11:23=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
> <devnull+ipfarher.gmail.com@kernel.org> wrote:
> >
> > From: Ivan Pfarher <ipfarher@gmail.com>
> >
> > The AP6212 WiFi/BT module needs a 32.768 kHz low power oscillator (LPO)
> > clock, which on this board comes from the RTC clock output (osc32k-out)=
.
> > Nothing in the device tree references that clock, so it is disabled as
> > unused during late boot.
> >
> > WiFi keeps working without it, but the Bluetooth core does not: with th=
e
> > LPO gated, the BCM43430A1 ROM answers HCI_Reset and nothing else (no
> > Read Local Version, no firmware download), so the controller can never
> > be brought up. Turning the clock output on by hand (RTC LOSC_OUT_GATING=
)
> > makes the controller answer normally.
> >
> > Reference the clock from the WiFi power sequence, as other boards using
> > the same module do (e.g. sun8i-h2-plus-bananapi-m2-zero.dts).
> >
> > Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> > change applied: osc32k-out stays enabled and the Bluetooth controller
> > answers HCI commands. Build-tested only against current mainline.
>
> It stays enabled only if the mmc stuff is working. So besides the changes
> in this patch (which technically only covers the WiFi side), you should
> add a proper bluetooth node under uart1 with all the resource references.

And that's the next patch. Sorry for the noise.

> > This problem was investigated, and the patch drafted, in an interactive
> > session with an AI coding assistant (Claude by Anthropic). The submitte=
r
> > reviewed the change and ran the tests described above.
> >
> > Fixes: cf8e19e1ec15 ("arm64: dts: orange-pi-zero-plus2: enable AP6212a =
WiFi/BT combo")
> > Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 ++=
+
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus=
2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > index 3eb986c35..34d6c1468 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > @@ -5,6 +5,7 @@
> >
> >  #include "sun50i-h5.dtsi"
> >
> > +#include <dt-bindings/clock/sun6i-rtc.h>
> >  #include <dt-bindings/gpio/gpio.h>
> >
> >  / {
> > @@ -54,6 +55,8 @@
> >
> >         wifi_pwrseq: pwrseq {
> >                 compatible =3D "mmc-pwrseq-simple";
> > +               clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> > +               clock-names =3D "ext_clock";
> >                 reset-gpios =3D <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
> >                 post-power-on-delay-ms =3D <200>;
> >         };
> >
> > --
> > 2.43.0
> >
> >

