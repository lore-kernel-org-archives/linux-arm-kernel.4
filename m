Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE3B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xFrsXDlD;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Ocx7SLDW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sJfEnrqje2dVxymNjQcwU7Gc+3OnffsH5DyqeXyDRnw=; b=xFrsXDlDDyYeVlgktwZ27YYT9M
	+3QTVNNjSAggyxKoJoa3gIKZawIfVM/yeME03JfPCD576R9S3ZwIQ3ElJ8PP0GJ3rz28lu6wX2Yrw
	nF1gRo1MSXkFGMmwbZNGh6afq48fnwm1thTPJpuQQxUxJXD/uhyeCbuxapDXXW1QB7gBYUjB2GZ0X
	Npplo/dN1FJznhIWbOZfmmAj8z65x57wtrxEOO0if/0MwOaXpLjaxr77KRQrCegoAqFoLyrx/1QLu
	TLSxjJwrOjWFqcNn845VKa6iFAbyW6rDjGF60nYuOlSlWCtEIv5AlijLA1hpeawrxhkWAAIN2Fkrt
	gL8YQ51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGeG-00000007vsq-2JEM;
	Wed, 11 Nov 2026 22:18:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGeD-00000007vrU-2NU5;
	Wed, 11 Nov 2026 22:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sJfEnrqje2dVxymNjQcwU7Gc+3OnffsH5DyqeXyDRnw=; b=Ocx7SLDWBioD5V+13ndERCvgBc
	XYHPOYRDy+yiYBgCC8zsh4zisoDyEWjq5nTX13SAZiAeSqyTllUzVtgDj7ijNPGqmeySrNEJvL6Tb
	OKDTCvTEW8CXLE6T+6JURg8KlF11qqbTmUe+gBe+IelA+vLGMU5InCs6z+uneuykj1ZA5pKQQw81V
	ka1eAqjf7af5MRHOXr791ms1ndGmo2g+4liuVYplsOf58ETT+rTU93steN8uOGvWJc8xEpAVzxzxJ
	JvX+NiF9xYIWWbv6GE7Le3HKzRVv9dJFUgKJlfOitpGfaHJ/orqZ1AWpYFUN7D3muEs4P9cDllmM8
	Tv6GvjVg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>, Tim Surber <me@timsurber.de>
Cc: Tim Surber <me@timsurber.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: rk3588: Allow I2S5 TX and I2S6 RX frac to set
 parent rate
Date: Wed, 11 Nov 2026 23:18:11 +0100
Message-ID: <MgdhBsb8T_eDWUTKP6B0VQ@sntech.de>
In-Reply-To: <20261111220656.3603628-1-me@timsurber.de>
References: <20261111220656.3603628-1-me@timsurber.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_141829_624295_B3FC14F0 
X-CRM114-Status: GOOD (  25.06  )
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

Am Mittwoch, 11. November 2026, 23:06:53 Mitteleurop=C3=A4ische Normalzeit =
schrieb Tim Surber:
> All RK3588 audio fractional dividers except clk_i2s5_8ch_tx_frac and
> clk_i2s6_8ch_rx_frac are registered with CLK_SET_RATE_PARENT. Without it
> the divider cannot raise the rate of its *_src parent again once the
> parent has been lowered.
>=20
> That happens on HDMI0 (i2s5_8ch) after a 192 kHz stream. Its MCLK of
> 24.576 MHz (128 * fs) is an integer divisor of AUPLL (786.432 MHz / 32),
> so the mux selects clk_i2s5_8ch_tx_src directly and sets its divider to
> 32. For a following 176.4 kHz stream the mux selects the fractional
> divider. rockchip_fractional_approximation() sees that the parent is
> less than 20 times the requested rate and computes m/n against the
> grandparent (AUPLL) rate, but the parent is never changed. The divider
> is then programmed with m/n =3D 147/160 from 24.576 MHz. The clock
> framework reports the requested 22.5792 MHz, but the fractional divider
> does not work at such a ratio and the I2S runs at about 54% of the
> nominal rate (96000 instead of 176400 frames/s).
>=20
> Add CLK_SET_RATE_PARENT to both dividers, as on all other I2S and SPDIF
> fractional dividers of the RK3588 and as in the vendor kernel:
>=20
>   https://github.com/rockchip-linux/kernel/blob/470f9dccbdc42e7b8a824d0a5=
c5640a10e9457d2/drivers/clk/rockchip/clk-rk3588.c#L2037
>   https://github.com/rockchip-linux/kernel/blob/470f9dccbdc42e7b8a824d0a5=
c5640a10e9457d2/drivers/clk/rockchip/clk-rk3588.c#L2055
>=20
> To reproduce, on any RK3588 board with HDMI0 audio enabled and a sink
> that accepts 192 and 176.4 kHz LPCM: play 192 kHz, then time two
> seconds of 176.4 kHz:
>=20
>   aplay -q -D hw:HDMI0 -t raw -f S16_LE -c 2 -r 192000 -d 1 /dev/zero
>   time aplay -q -D hw:HDMI0 -t raw -f S16_LE -c 2 -r 176400 -d 2 /dev/zero
>=20
> On linux-rockchip for-next the second command takes 3.7 s instead of
> 2.0 s, and clk_i2s5_8ch_tx_src stays at 24.576 MHz.
>=20
> Tested on a FriendlyElec CM3588 NAS with HDMI0 cabled into its HDMI
> receiver, the receiver's EDID advertising 192 and 176.4 kHz, and the
> HDMI sound cards enabled in the device tree. Two 176.4 kHz runs after
> boot, then three runs each preceded by a 192 kHz stream:
>=20
>                           176.4 kHz frames/s   clk_i2s5_8ch_tx_src
>                           after boot / after   after the 176.4 kHz
>                           192 kHz              stream (Hz)
>   for-next                175500 / 95600 (3x)  24576000
>   for-next + this patch   175500 / 174800 (3x) 786431991
>=20
> With this patch the 32 to 192 kHz rates still play at their nominal
> rate, and a frame counter played at 176.4 kHz after a 192 kHz stream
> was captured bit-exact by the HDMI receiver. I2S6 RX is not used on
> this board and was not tested.
>=20
> Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3588")
> Signed-off-by: Tim Surber <me@timsurber.de>

This is waaaay too long for a siomple two line change. Please shorten
this to a sane level.


Thanks
Heiko

> ---
>  drivers/clk/rockchip/clk-rk3588.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk=
=2Drk3588.c
> index 24baa0ef9..63aeeb501 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -2024,7 +2024,8 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>  	COMPOSITE(CLK_I2S5_8CH_TX_SRC, "clk_i2s5_8ch_tx_src", gpll_aupll_p, 0,
>  			RK3588_CLKSEL_CON(140), 10, 1, MFLAGS, 5, 5, DFLAGS,
>  			RK3588_CLKGATE_CON(62), 6, GFLAGS),
> -	COMPOSITE_FRACMUX(CLK_I2S5_8CH_TX_FRAC, "clk_i2s5_8ch_tx_frac", "clk_i2=
s5_8ch_tx_src", 0,
> +	COMPOSITE_FRACMUX(CLK_I2S5_8CH_TX_FRAC, "clk_i2s5_8ch_tx_frac", "clk_i2=
s5_8ch_tx_src",
> +			CLK_SET_RATE_PARENT,
>  			RK3588_CLKSEL_CON(141), 0,
>  			RK3588_CLKGATE_CON(62), 7, GFLAGS,
>  			&rk3588_i2s5_8ch_tx_fracmux),
> @@ -2043,7 +2044,8 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>  	COMPOSITE(CLK_I2S6_8CH_RX_SRC, "clk_i2s6_8ch_rx_src", gpll_aupll_p, 0,
>  			RK3588_CLKSEL_CON(146), 7, 1, MFLAGS, 2, 5, DFLAGS,
>  			RK3588_CLKGATE_CON(63), 0, GFLAGS),
> -	COMPOSITE_FRACMUX(CLK_I2S6_8CH_RX_FRAC, "clk_i2s6_8ch_rx_frac", "clk_i2=
s6_8ch_rx_src", 0,
> +	COMPOSITE_FRACMUX(CLK_I2S6_8CH_RX_FRAC, "clk_i2s6_8ch_rx_frac", "clk_i2=
s6_8ch_rx_src",
> +			CLK_SET_RATE_PARENT,
>  			RK3588_CLKSEL_CON(147), 0,
>  			RK3588_CLKGATE_CON(63), 1, GFLAGS,
>  			&rk3588_i2s6_8ch_rx_fracmux),
>=20
> base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
>=20





