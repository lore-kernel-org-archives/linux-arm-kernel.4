Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63337606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 07:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qKS4+t6k;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eudRbkNK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a0wnVTzo2SMTqUhE+Yi1XoqVrkmPjT5CK9ef37B0JVo=; b=qKS4+t6kHlXT8/fuRvmGznO2y5
	Mf1idMAM+1ipVLwUQk9zgQBRY563is8d2Hh9+ZBout+N0aSOrgkYS6BTw/jxopUBZzYU2EUHV7n6Y
	DYiAiSd1GB++P1Vzw2+v2JiQyBGWwmoULTNXnrOVY8AkMPCn1ivqkN1RGL5SWmtZwGY15Rzdey8s+
	x6ZR7Rhw7B2gq9XqtkK5USz2T9ZXT9TwwpSWmg+PBDsKmw10FNcezogqhC/BwSgxIqB8AbfJhyTtf
	3AsjZqZZqkHKo+JUzxVSG8jHd6vVY+Ar9YKJPpnTU+zpZafsRaJsjI+nWGzYtu1uajjvGRhcwrfnx
	zHSv14/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUGv-0000000H9SU-3Ysh;
	Sun, 15 Nov 2026 07:03:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUGt-0000000H9S5-42ZF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 07:03:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so6529445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 23:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794726206; x=1795331006; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a0wnVTzo2SMTqUhE+Yi1XoqVrkmPjT5CK9ef37B0JVo=;
        b=eudRbkNK/HCuF+GVHevGIM4HDQzn5jPkGI/fwfBHCGqWO45b3Yrb3pcx9y4m1xCP3+
         6FBY0oW+uPAvIIdWeykW2np5O8oqqpimKOukf+YGUnk/Txurqg0qxdPdQbqalNH1dKe6
         6j5YozQQ27egnIvnJiM1dclwS7bcKVaqBCM0XkQ2L8kdx8AbGn4Yo5MeN6bTlKr9hytB
         XdZz/0fUAH1uH17LkGiD1Vv1c0oIUaPns82uMGDz70sgw+hFXRy2cyu9Tq/KE+rgsiIm
         vrB/dCbGXlG3H+77nnxMOchkrZQMpFyOiMO73VmX/Ztws76325tZd7StSYCyO2MfnIRu
         ipDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794726206; x=1795331006;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0wnVTzo2SMTqUhE+Yi1XoqVrkmPjT5CK9ef37B0JVo=;
        b=MKUxpw5c7S59HNG6FkfB7PYrcsftsCaPl95pAZEStfqhZWKgpm3YyfFZiAhPmb7MHm
         KTd97nK7I8vA80QkvLv/tQDeNrPaTGBmcwP30tO1GjeGP02QJusIxBvMVX+VbgbfG+51
         22c8Dc5G80t3OsJ7U5s6cvcWCwYhEkgn3M+BRPEyqrIaKxRTPP5B7a5+KJZjYnhH5Jry
         tAv+oicejs7XlZMtznl0etuzcFK+Sb1+QU26SCEALvqPpdT5ASSs2pvoddownsL9Z7xw
         ohzyQPMqSRrn1XdGGZ4/rGJd4lrKf99aVrGc4TgKmJOTMeutpfBKP2rz3QdZ9E8sAnUh
         iMqA==
X-Forwarded-Encrypted: i=1; AL+hErEnMJEsPmkVFHAkFI9lpmeoQD4McMFSJBZnUeo9BQim2NZgGHzOxJF6pwdMRSiPHQS2h9PNkWSutH5Vdx5Rk3aa@lists.infradead.org
X-Gm-Message-State: APuU4Z/jLRnJHojBWq9LxtTRymbkM3LuqdiBfX57D7jjN3NjtSohQx8M
	nhOlnfyizKw8jzbSbfkXFZxiiAYXfdQyaVLWsiOtKC3YjPJjmUOdLnwq
X-Gm-Gg: AYBFou1/pp2A2DxHjcD7qA4qbBv3VX1OtK9FT6FLxfiuo/vJLOuhJ0R3od6sLBhj7bt
	WhdkeFI0p41mtClYBeVrrOgEE06E6CpS+lKR3oqVwPBQB+sPS2/FMwMfR7rwmSBh5RZPgBzNRyv
	CyKIUOKMAoGsbk41AROMH8bvDItZ+CwGl0geIhpR6xhrGCD+LIPxGjoSelzDREb/luWKieAuFj9
	j6qIA16DJWzyP3RzF/E3f5pMpjxC8kfMG9xXe2nyd9E401XFgWmCrB4YZAyjDhMfZ+jSgZAv8B5
	pZNyQkBHy0T72KSciSENzYE6clQqgeqLv6eRUQ3x8bJmnDgtNDiy7NUdXG7sx0xu/cNNl0hDNGY
	D393xRjTddeg6d6JQPD+p26KwQ/2MsgBkKyVWY7XV82a3nMtRX19k0wFs8O6VpBVWSTk3etWLiQ
	+m3E+Z6Wdm/aaYmJok3V0f+Wuqeu5iIkU9T1JzIib0Z0gXbtV08RfXCJ6cHG9hWIaA/+2tPuxne
	+J8mQZ8+Sn6ZxeaavUDVl0UBlHuGZMXo0FZEMu6f6bpK2tAJ8FfnjLvC57ZQosRyT8sPTIPDw7G
	F9xhQYG8qJNRO+fYE4zaj6qB7khn3+ZCZF5K0apxXWlkK8/oJOLS4GMD/Zsb7EWIeqxT2gpZwTn
	kal65Y8F1+mWTXUl6AAo65tyC0mvIDQ4yKLQ1M7PGeABSoyyeFhU8nb9QFEG1SuklDpXTOfHpef
	cDhQHhm+ffWurFEC6lsHIxxV9Mi5FBKVY45Exsp8024aJxwHiH0j3KyeS2gshQ69DEZC6UEUjcY
	Wp9HBZdBZWeQwimj1e0NWEBygRSn5IGKgHoV2BwXyxDIg4=
X-Received: by 2002:a05:600c:840c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb5599bda8mr154094045e9.0.1794726205780;
        Sat, 14 Nov 2026 23:03:25 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm25768458f8f.44.2026.11.14.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:03:25 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Ripard <mripard@kernel.org>,
 Frank Oltmanns <frank@oltmanns.dev>, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun, 15 Nov 2026 08:03:21 +0100
Message-ID: <TB0DvSOtTYKNXNEXzDrlwg@gmail.com>
In-Reply-To: <20261101203336.1360239-1-romain.tisserand@gmail.com>
References: <20261101203336.1360239-1-romain.tisserand@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_230328_095584_48500C52 
X-CRM114-Status: GOOD (  27.81  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne nedelja, 1. november 2026 ob 21:33:36 Srednjeevropski standardni =C4=8D=
as je Romain TISSERAND napisal(a):
> The N-K-M rate code computes parent * n * k / m in an unsigned long,
> which wraps on 32-bit ARM as soon as parent * n * k passes 4.29 GHz.
>=20
> On the A33, pll-mipi (parent pll-video at 297 MHz) with N =3D 14, K =3D 2,
> M =3D 14 runs at 594 MHz, but 297 MHz * 14 * 2 wraps around to
> 4021032704 and the code computes 287.2 MHz. ccu_nkm_find_best() then
> picks these factors for a 288 MHz request, and clk_get_rate() reports
> 287.2 MHz while the PLL runs at twice that. On a PocketGo S30 (A33,
> ILI9488 panel on one MIPI-DSI lane) the lane ended up at about
> 594 Mbit/s instead of 288 and the picture broke up.
>=20
> Do the multiplications in 64 bits, saturating at ULONG_MAX, in
> ccu_nkm_recalc_rate(), in both best-rate searches, and for the parent
> rate request of the parent-adjusting search, where rate * m overflows
> the same way.
>=20
> Without the saturation, a candidate above 4.29 GHz in the search would
> be truncated again on return and could look like a valid low rate.
>=20
> 64-bit kernels are not affected. On 32-bit ones, every N-K-M clock can
> hit it (A31, A23, A33, R40, H3, V3s and F1C100s use them), whenever the
> parent rate times N * K goes above 2^32.
>=20
> Fixes: df6561e60244 ("clk: sunxi-ng: Add N-K-M Factor clock")
> Fixes: 3492e4f6db5f ("clk: sunxi-ng: nkm: consider alternative parent rat=
es when determining rate")
> Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Notes:
> - Testing: built with W=3D1 for arm (multi_v7_defconfig with the A31, A23,
>   A33, R40 and H3 CCUs) and arm64 (defconfig), SUNXI_CCU=3Dy and =3Dm, no
>   warnings; on arm the 64-bit divisions go through __do_div64 (no libgcc
>   helper). Tested on a PocketGo S30 (A33) running 6.18.54 with this
>   change, without the ULONG_MAX saturation (same results for rates that
>   fit, which is the only case the hardware hits): before, pll-mipi was
>   programmed with N =3D 14, K =3D 2, M =3D 14 (594 MHz measured as a 2x l=
ane
>   rate) while clk_get_rate() returned 287216621; after, N =3D 15, K =3D 1,
>   M =3D 16, 278437500 Hz in both the register and clk_get_rate(), and the
>   panel picture is right. This version, with the saturation, then on
>   the same board on 7.3.1: pll-mipi again programmed with N =3D 15, K =3D=
 1,
>   M =3D 16 (278.4 MHz from the 297 MHz pll-video0) and the picture is
>   right. Not tested on the other SoCs.
> - Tool disclosure: this patch was prepared with Claude Opus 5.5
>   (Anthropic) as a coding assistant, in an interactive session where I
>   asked it to bring up the PocketGo S30 display. It found the mismatch
>   between the pll-mipi register and the rate the clock framework
>   reported, traced it to this overflow and drafted the fix and the
>   message. I reviewed and understand the change and tested it as
>   described above.
>=20
>  drivers/clk/sunxi-ng/ccu_nkm.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nk=
m.c
> index 401fbb7524..e5a8f22d50 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -6,6 +6,7 @@
> =20
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> +#include <linux/math64.h>
> =20
>  #include "ccu_gate.h"
>  #include "ccu_nkm.h"
> @@ -30,6 +31,26 @@ static bool ccu_nkm_is_valid_rate(struct ccu_common *c=
ommon, unsigned long paren
>  	return true;
>  }
> =20
> +static unsigned long ccu_nkm_calc_rate(unsigned long parent,
> +				       unsigned long n, unsigned long k,
> +				       unsigned long m)
> +{
> +	u64 rate =3D (u64)parent * n * k;
> +
> +	do_div(rate, m);
> +	return min_t(u64, rate, ULONG_MAX);
> +}
> +
> +static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
> +					      unsigned long n, unsigned long k,
> +					      unsigned long m)
> +{
> +	u64 parent =3D (u64)rate * m;
> +
> +	do_div(parent, n * k);
> +	return min_t(u64, parent, ULONG_MAX);
> +}
> +
>  static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common=
 *common,
>  						       struct clk_hw *parent_hw,
>  						       unsigned long *parent, unsigned long rate,
> @@ -44,12 +65,13 @@ static unsigned long ccu_nkm_find_best_with_parent_ad=
j(struct ccu_common *common
>  			for (_m =3D nkm->min_m; _m <=3D nkm->max_m; _m++) {
>  				unsigned long tmp_rate, tmp_parent;
> =20
> -				tmp_parent =3D clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
> +				tmp_parent =3D ccu_nkm_calc_parent_rate(rate, _n, _k, _m);
> +				tmp_parent =3D clk_hw_round_rate(parent_hw, tmp_parent);
> =20
>  				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
>  					continue;
> =20
> -				tmp_rate =3D tmp_parent * _n * _k / _m;
> +				tmp_rate =3D ccu_nkm_calc_rate(tmp_parent, _n, _k, _m);
> =20
>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
>  				    (tmp_parent =3D=3D *parent && tmp_rate =3D=3D best_rate)) {
> @@ -87,7 +109,7 @@ static unsigned long ccu_nkm_find_best(unsigned long p=
arent, unsigned long rate,
> =20
>  				unsigned long tmp_rate;
> =20
> -				tmp_rate =3D parent * _n * _k / _m;
> +				tmp_rate =3D ccu_nkm_calc_rate(parent, _n, _k, _m);
> =20
>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
>  					best_rate =3D tmp_rate;
> @@ -154,7 +176,7 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_h=
w *hw,
>  	if (!m)
>  		m++;
> =20
> -	rate =3D parent_rate * n  * k / m;
> +	rate =3D ccu_nkm_calc_rate(parent_rate, n, k, m);
> =20
>  	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
>  		rate /=3D nkm->fixed_post_div;
>=20
> base-commit: 5243bd55dfe63a5f806622878f6fbdd78172fac9
>=20





