Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9FE606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A3AiG981;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZqO0/gD8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NyTNgU3MDKNHP7luxta/A/OzHHMqJA4oTLAdOlcpPMo=; b=A3AiG981ydDz4+E63klN3O8s03
	TrR1JHP5xZP8dBdE2j9bcUeWkDD8VF0hjeYZrUs7FqHUGR2j9sA7+j8wk6OH7nqvdRy2PymjXvv7s
	2neh3wlTkOZ3dhjPi3j0pPCRNHi4imWMh07A1l7laBKyVGQIaCynlyT71moZ2k6ZASnWm3ujDnGae
	AgoVPAT6Z2gd4a3spkDb9mk55jf42TIODbao6k7CuXWBX9oag4Mx3tB8VEDzFUp1b9G0IFsr3VD/B
	ZUD+zHIl0V+jt2ePu9GCJB1jdWBsRF3jvVOZBMShXxGHmtgL3/AHJtZqp1E64kk95F60IYSxA3S0Y
	uGKy2zsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSX24-0000000HMDW-2m3T;
	Sun, 15 Nov 2026 10:00:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSX23-0000000HMDP-09EC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:00:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D48F45996
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7341F000CC
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794736817;
	bh=NyTNgU3MDKNHP7luxta/A/OzHHMqJA4oTLAdOlcpPMo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ZqO0/gD8wARgSKe9l6FyvNO/C2sNi3avgTVknlRvd3LwKSQ5oivSMmvQrhi9cezBp
	 YJ6KtEta/xSe0E4J7Z+gcdgJ/KicvPF0i74mWou4Lwf6DG3iXx/TICcvB87r6tOhjM
	 jtHEo+wI0mi2xj1CTJsEwYlLfryOyjqmb+cQ6g0k/5FQOZpk/0V0y/ERJUMd7GSwh2
	 MSadl/zDq2xVYQkmguXsC3Ed8hwF2D7MbK+FxkMG+lq7U9vvVMgzUA9q2HWLWrvUlr
	 p+5GW+ujFuYIPF1EXAIBvf290XMq7AWd+1ymd+VsiN/RW3ihfNfUpmF5aQGuXJNa3B
	 TQ1Rzuq79fGcg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so26077791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 02:00:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHf9i/FaN40FARawwQQ/EPcXg40JJKKtHgJyVH9R/0fQ6xLDxYDp8i0iH+YLXx/anPAjblzx7h82wj59mjXRCvt@lists.infradead.org
X-Gm-Message-State: APuU4Z/dUFVWCP2w3kKjlyMP8C7+ROOyH3/lQzr8usrrJJZoouVjBK3i
	iip2zbI1W4iFdWIvQtD47be33plQFZl2X1ULmnURYZPuf+uiGiKrFQXiWYjZcFHilB3tZtnpwaT
	ZdAfvZ/NhxqkCWJdsRiatYF8Q3E5gPmM=
X-Received: by 2002:a05:651c:a207:20b0:3ae:396d:18b with SMTP id
 38308e7fff4ca-3ae396d0372mr10442331fa.7.1794736814738; Sun, 15 Nov 2026
 02:00:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
In-Reply-To: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:00:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
X-Gm-Features: AclHuK9eevfH2EBPHhmpLnWPjLF3ubeY3uOjfZRW9DwFb4Y-flxnXpQ0T_-B6OU
Message-ID: <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
To: filipescu.cristian@gmail.com
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Relay
<devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
>
> Continue Jernej Skrabec's April 2025 series, adding the board compatible
> and device tree for the Allwinner H6-based Orange Pi 3 LTS.
>
> Board testing passed SD/eMMC reads, both LEDs at drive strength 10,
> and five Ethernet interface cycles plus three MAC driver rebinds.
> Each network cycle reached 1 Gbps/full duplex, obtained DHCP and passed
> ping; PHY ID and 125 MHz clock-output configuration were read back.
> eMMC DDR52 at 50 MHz and HS200 at 150 MHz each passed 768 MiB of direct
> reads and 256 MiB of patterned writes with verified readbacks and data
> restoration. All reported MMC error counters were zero. Both board DTBs
> compile and pass schema checks.
>
> Codex assisted with DTS updates, review analysis and build checks;
> Cristian performed the board tests.
>
> ---
> Changes in v3:
> - Keep green as power and red as status, matching Armbian LTS roles;
>   default green on and red off without a boot-stage sequence.

The roles should match the schematics, as the hardware vendor specified.

> - Select drive strength 10 on PL4 and PL7 with per-LED pinctrl states.
> - Move PHY reset to the MDIO bus, before discovery and outside detach.
> - Specify the YT8531C PHY ID; MAC rebind fails with early autodetection.

Why do you need the PHY ID if you moved the PHY reset up to the bus level?

ChenYu

> - Enable 1.8 V eMMC DDR52 and HS200 after board testing; retain the
>   existing H6 maximum frequency of 150 MHz.
> - Shorten the descriptions and update validation status.
> - Link to v2: https://lore.kernel.org/all/20261022-sunxi-orangepi-3-lts-v=
2-0-70b899252c6a@gmail.com/
>
> ---
> Jernej Skrabec (2):
>       dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
>       arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
>
>  Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++++++=
++++++
>  3 files changed, 385 insertions(+)
> ---
> base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
> change-id: 20261022-sunxi-orangepi-3-lts-43b92246a8ed
>
> Best regards,
> --
> Cristian Filipescu <filipescu.cristian@gmail.com>
>
>

