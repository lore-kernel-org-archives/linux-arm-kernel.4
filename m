Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E973606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cTti9taN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxZ5pY6h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mm+qHNraHAaYmCtZVnhp9nAQRT/K0rmVdDUtGtzHsiA=; b=cTti9taN9supC+2YJL1yX1L4Ku
	ZJ9IBGg/2pfMNlT+LobmTKLJSe7eKmj0itYts4leibUpDdTGMBdqGDGQ9A/ogvUr825itZmnhC98z
	xdYUNR9B9ogL6Q99XiIC1krts/OocZBNg7wMzjW2E54fadVG8QZXfpV4WWmMeikSypzPvpd3CQbZw
	TuirtYu2k5ukVvHYHbh3CSsqZZGcnPgB8l3QnsP+WfRbItdh2wQ8+hmufnBqSijm6cdwSg/H2iRgF
	XYpaXMZ7Evjs2ekVNgASRxZ8UJTC/4APxcCP4RxQNguEqzEi4g0vB+mn817VZ0srImAdQGA3mcf1Z
	wYJM9QMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQTF-0000000FOvu-3fhS;
	Fri, 20 Nov 2026 15:24:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQTE-0000000FOvd-1wyC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:24:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E22E8459E5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58DC1F000D1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188251;
	bh=mm+qHNraHAaYmCtZVnhp9nAQRT/K0rmVdDUtGtzHsiA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=dxZ5pY6hpvvkugXfXEAfNhOGp8uNhqCP+hzd3pa6YdiWXx2uk/+rtfuTJLBdk6cs+
	 qS1tr490X6WIEnmwcsfRt733uAq29wTnKlsisPj0RY/GSLNWL6r8Fb6JAbNpFVSzdL
	 dedzCJpv9yEv6A52shcqzq97G0JWkgRZg231ydYXOenvX1Ap+S2Zo0CSpD0HKT+jSE
	 YXTSq0BKySABVNKPNZNb0Q41ZHY7yjygeGfwGQMaC6RkjcYgTwVbQGQq83+KojNaC0
	 Cqa6V70ZwsDW45g0oaJBA++Q7E1xzHWiu9VtUXzhLC397/JbS7rDDx1N1GZ+lYacQU
	 OsE4YJtLubXLQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3acd239776cso8143031fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:24:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE/BG6m8Bn+uyGkb4TTbk53woT1ftLi+yc+wKFMlqjRj8t2YdPT1BGr8k93PwbH0rqQ+P/55C8ikpPLx6eQSqsV@lists.infradead.org
X-Gm-Message-State: APuU4Z8E8wGMx5R9nBsZMHGolpewaifvpdItawF3dfA/qUweWdpRf/9v
	Z61vk+T80xMiEIIzSAU2RRicCyyhBPApJ4oQxLiVA1xvHeFQnsdDdGjt/UCVdMLQ1TBEMP033WH
	ddo0oeD4p6AYqiC5wmFYhw40pWptH8pI=
X-Received: by 2002:a2e:ac01:0:b0:3ac:f350:cd66 with SMTP id
 38308e7fff4ca-3ae7fa81427mr10056821fa.20.1795188250182; Fri, 20 Nov 2026
 07:24:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:23:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66=Wy1TEy5KrQt+TmYPowryx19tUN14QTREn9z0dOaJgw@mail.gmail.com>
X-Gm-Features: Aa3M54p7k_v0KG9p7QbnfhbCu32b9QTmLjHC5sxgzpf1CLcce99IzZXup6e1Tq0
Message-ID: <CAGb2v66=Wy1TEy5KrQt+TmYPowryx19tUN14QTREn9z0dOaJgw@mail.gmail.com>
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

On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
<devnull+ipfarher.gmail.com@kernel.org> wrote:
>
> From: Ivan Pfarher <ipfarher@gmail.com>
>
> The AP6212 WiFi/BT module needs a 32.768 kHz low power oscillator (LPO)
> clock, which on this board comes from the RTC clock output (osc32k-out).
> Nothing in the device tree references that clock, so it is disabled as
> unused during late boot.
>
> WiFi keeps working without it, but the Bluetooth core does not: with the
> LPO gated, the BCM43430A1 ROM answers HCI_Reset and nothing else (no
> Read Local Version, no firmware download), so the controller can never
> be brought up. Turning the clock output on by hand (RTC LOSC_OUT_GATING)
> makes the controller answer normally.
>
> Reference the clock from the WiFi power sequence, as other boards using
> the same module do (e.g. sun8i-h2-plus-bananapi-m2-zero.dts).
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: osc32k-out stays enabled and the Bluetooth controller
> answers HCI commands. Build-tested only against current mainline.

It stays enabled only if the mmc stuff is working. So besides the changes
in this patch (which technically only covers the WiFi side), you should
add a proper bluetooth node under uart1 with all the resource references.

> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Fixes: cf8e19e1ec15 ("arm64: dts: orange-pi-zero-plus2: enable AP6212a Wi=
Fi/BT combo")
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index 3eb986c35..34d6c1468 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -5,6 +5,7 @@
>
>  #include "sun50i-h5.dtsi"
>
> +#include <dt-bindings/clock/sun6i-rtc.h>
>  #include <dt-bindings/gpio/gpio.h>
>
>  / {
> @@ -54,6 +55,8 @@
>
>         wifi_pwrseq: pwrseq {
>                 compatible =3D "mmc-pwrseq-simple";
> +               clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> +               clock-names =3D "ext_clock";
>                 reset-gpios =3D <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
>                 post-power-on-delay-ms =3D <200>;
>         };
>
> --
> 2.43.0
>
>

