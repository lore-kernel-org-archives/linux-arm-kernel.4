Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k6Zkqpsn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cANDfa3J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Cq6yUQzukHtwhYuWtD3CdG/vzfG7TEB1pVADzBcWgFs=; b=k6Zkqpsnyu4DAz4aVJF1YQ9Sdr
	4rl0AQzyCH4QLGlTphJq0eX6FkCSSxNCpOctFG87o7cNXipB36PpDyHbvSJA3svP6QMatJygUDms+
	IIpitos9VTH/Bkjml0gH0kdGYCQHs/fPycTiGr1CZhCUndaszO2sNrnU5HFPM6LY/7tXADMF+YGyI
	N09CzeyhatMIi2lUty8GXjBWT0eB/bf7acWYoQHVqL592J/qwLVd1nHu95I1sU3Kuni82XLGLytc7
	6FwpbYrIcIpLrNw5Z6wJC0t2BlAuIdMopxe6j2GedUed4fR/NmI8dB65t5FXGDHTVh10OO8FmxO9d
	68EvgBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbrR-000000006sa-18cX;
	Sun, 15 Nov 2026 15:09:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbrQ-000000006sR-0u2K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 15:09:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA95643B48
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 15:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6C71F000CB
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755379;
	bh=Cq6yUQzukHtwhYuWtD3CdG/vzfG7TEB1pVADzBcWgFs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cANDfa3JG/1VLOyWOyMbLnYziGnzSsHDw0+p48eFEhwqjIqqzBMypnlKn2KIJbBGy
	 Hq4EETBr2jUy034admevuoevndcXik9C6uGtap6cIMzgHvPoML9laee3OpAmf4sBiB
	 V6Hi3F0/36Jj6przMu8+XPjSpjPzA85GybC1zU02FANO/I/3EaUryQjljgHh/wI44D
	 5RYySKRVJXo2SRloVa8du07x2AxdwjTDUjUTJXlLIsql7MWUyVb1o93lvq6ZjrRX/R
	 dB0ZlpwIe039A6elGxys/Fb3U05iYiO1bsBl4w+OQaWaOFfVK9uQspK5cbriu9IOZv
	 IE74MzMSJVX0w==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso30318241fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 07:09:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFMMPFaX/cxJ4Yb09c3OejloLMm3m2P6901S6u0FqnJy4lRZRzWQjPVFv7kaIrHwY1yYty1NZCpXZwwPUOFIpbR@lists.infradead.org
X-Gm-Message-State: APuU4Z+f8YkM9yjvYzcahv6l6pX3pH0PcYNq2N1QQ9HXnkXteRUIIjhw
	DmC3r7WYdf7ywOoBvVx+HlCe2Gd2SggqrtJBls72OircjUJsGiEHC9/mrbc4Oo36v+vF5YUEO6l
	H48ahgY562tOsQ/kd8mKLpPgY45Bh4SU=
X-Received: by 2002:a05:651c:1986:b0:3ae:25c8:dc78 with SMTP id
 38308e7fff4ca-3ae2b69178cmr25726671fa.22.1794755378199; Sun, 15 Nov 2026
 07:09:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115132215.289236-1-jernej.skrabec@gmail.com> <20261115132215.289236-4-jernej.skrabec@gmail.com>
In-Reply-To: <20261115132215.289236-4-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 23:09:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
X-Gm-Features: AclHuK8SfNxnDatVmiI32N0fkX-YaXg08NGH8ia-Bx19MDfSYUZXv-OL_jNzao8
Message-ID: <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU
 frequency scaling
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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

On Sun, Nov 15, 2026 at 9:22=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
> so the CPU never scales its frequency. Add both, like on Orange Pi 3.
> OPPs above the regulator constraints stay unused.

My review agent noted that some of the other boards raised the constraints
when CPU DVFS was enabled. Do you think it's reasonable to do the same
for the OrangePi? Or do you want to be more conservative?

Note that I already applied this series.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch=
/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index 40c5c42b347e..a2a2e4cb0256 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>
>  #include "sun50i-h6.dtsi"
> +#include "sun50i-h6-cpu-opp.dtsi"
>  #include "sun50i-h6-gpu-opp.dtsi"
>
>  #include <dt-bindings/gpio/gpio.h>
> @@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
>         };
>  };
>
> +&cpu0 {
> +       cpu-supply =3D <&reg_dcdca>;
> +};
> +
>  &de {
>         status =3D "okay";
>  };
> --
> 2.43.0
>

