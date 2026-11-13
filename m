Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D338D606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tPiTieqM;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=AKqtjcn9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=14DbhITib14ppVX3i7Picll2u9OpRT8wBV6cw1FaJPg=; b=tPiTieqMVNUShbj2W9bwH648HB
	aCu8FE+LAmgZi1FpsKyrOtWYlyDFmmSNmnK5DfSEanRpRBSBcF/oZLGKGmSKmLcK2Tppvhj3XUU6A
	iTcY61ygR6/xl6Yk1c/N07ESYfu42qXEmMXFkFZunk9SLFwxoCVlsPdDRrl+aeeuOHY03y6CxZsqY
	HW741VgVhLY/uKJ1VuK4wjLToe75eBAV1CfaYjuBeU3t1eCzFMgqzktHkN3ayws4zIoxEe3sV7za1
	gKkQKImMAR31XpJf6eEvJWGzAXOQhfKAgKKnbrjA5F7QIMyucPTTgawXBbZGaUDKn5iAWu4ieS7yx
	amMDVaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRymg-0000000Ea8Y-1gs1;
	Fri, 13 Nov 2026 21:26:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyme-0000000Ea7y-1b3d;
	Fri, 13 Nov 2026 21:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=14DbhITib14ppVX3i7Picll2u9OpRT8wBV6cw1FaJPg=; b=AKqtjcn9H5nJ/tb/KVjKAhGI/L
	6FHDvu1Aj51VzpM+SCyLiV+/0BrV/gxyS4fhEbHJMP3ms9/TUQ4ZGw/uNwga4LPjxV8/p3vEn2YkL
	TMkSrJEDq1rDTm4Z5oedrU7wQMQ+OLvF67lqIuaiiJkxAr4yNehWj191xEz0tdHRfad74DdfHm5u6
	aY2fvq0o5kloTw6OExdw6AmUFgG4fBTLwPMeBKvYg8u0mf5sKJctUAMHv5xTS0TV2nhYhdryNvVsq
	8/DEv4d4D+blQJR3R9kEA45UGOGXMWNXxYC4OXvcKNa8qAgQwUj1ZEj44d4nAk6zZFxMhVFD0QNOs
	ESQ1gGXw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Cochran <richardcochran@gmail.com>, 1579567540@qq.com
Cc: Cunhao Lu <1579567540@qq.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v5 2/4] clk: rockchip: Add internal support for 24-bit fractional
 dividers
Date: Fri, 13 Nov 2026 22:25:55 +0100
Message-ID: <Yf6NfRPFTxKjDagKAm6hpw@sntech.de>
In-Reply-To: <20261030-add-board-ok3572-c-clk-v5-2-9a43403cb149@qq.com>
References: <20261030-add-board-ok3572-c-clk-v5-0-9a43403cb149@qq.com>
 <20261030-add-board-ok3572-c-clk-v5-2-9a43403cb149@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_132608_524825_A5EB3D0F 
X-CRM114-Status: GOOD (  25.33  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,


sorry it took me a bit to get to clock driver patches :-)

Am Freitag, 30. Oktober 2026, 10:43:58 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Cunhao Lu via B4 Relay:
> From: Elaine Zhang <zhangqing@rock-chips.com>
>=20
> Some Rockchip clocks split each 24-bit numerator and denominator between
> a low register containing 16 bits of each value and a high register
> containing the remaining 8 bits.
>=20
> Add an internal Rockchip fractional-divider helper and clock branch type
> for this register layout. This provides the support needed by the RK3572
> audio fractional clocks.

Please add a paragraph about the "v2" naming.
I assume the v2 is a Rockchip naming, because v1 was the other one that
could still fit the regular franctional divider.



> +static inline u32 clk_fd_v2_readl(struct clk_fractional_divider_v2 *fd,
> +				  void __iomem *reg)
> +{
> +	return readl(reg);
> +}
> +
> +static inline void clk_fd_v2_writel(struct clk_fractional_divider_v2 *fd,
> +				    void __iomem *reg, u32 val)
> +{
> +	writel(val, reg);
> +}


why do we have those? They do not serve any purpose I can see.
So please just use readl and writel directly at the appropriate places.


> +static int clk_fd_v2_get_divider(struct clk_hw *hw, unsigned long rate,
> +				 unsigned long parent_rate,
> +				 unsigned long *m, unsigned long *n)
> +{
> +	struct clk_fractional_divider_v2 *fd =3D to_clk_fd_v2(hw);
> +	u32 factor;
> +
> +	if (!parent_rate)
> +		return -EINVAL;
> +	if (!rate || rate > parent_rate)
> +		rate =3D parent_rate;
> +
> +	rational_best_approximation(rate, parent_rate,
> +				    GENMASK(fd->mwidth - 1, 0),
> +				    GENMASK(fd->nwidth - 1, 0),
> +				    m, n);
> +
> +	if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED) {
> +		(*m)--;
> +		(*n)--;
> +	}

=2E.. blank line please ...

> +	if (!*m && !(fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED))
> +		return clk_fd_v2_get_low_rate_divider(fd, rate, parent_rate, m, n);

=2E.. blank line please ...

> +	/*
> +	 * When compensation the fractional divider,
> +	 * the [1:0] bits of the numerator register are omitted,
> +	 * which will lead to a large deviation in the result.
> +	 * Therefore, it is required that the numerator must
> +	 * be at least 4.
> +	 *
> +	 * Note that there are some exceptions here:
> +	 * If there is an even frac div, we need to keep the original
> +	 * numerator(<4) and denominator. Otherwise, it may cause the
> +	 * issue that the duty ratio is not 50%.
> +	 */
> +	if (*m < 4 && *m !=3D 0) {
> +		if (*n % 2 =3D=3D 0)
> +			factor =3D 1;
> +		else
> +			factor =3D DIV_ROUND_UP(4, *m);
> +
> +		if (*m > GENMASK(fd->mwidth - 1, 0) / factor ||
> +		    *n > GENMASK(fd->nwidth - 1, 0) / factor) {
> +			if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED)
> +				return -EINVAL;
> +			return clk_fd_v2_get_low_rate_divider(fd, rate, parent_rate, m, n);
> +		}
> +
> +		*n *=3D factor;
> +		*m *=3D factor;
> +	}
> +
> +	return 0;
> +}
> +

[...]

> +
> +static const struct clk_ops clk_fractional_divider_ops_v2 =3D {
> +	.recalc_rate =3D clk_fd_v2_recalc_rate,
> +	.determine_rate =3D clk_fd_v2_determine_rate,
> +	.set_rate =3D clk_fd_v2_set_rate,
> +};
> +
> +static struct clk_hw *clk_hw_register_fractional_divider_v2(struct devic=
e *dev,

maybe adapt the function name.
=46unction above abbreviated things to

clk_fd_v2_something, so naming this clk_hw_register_fd_v2()
might make that line less unwieldy?



Thanks
Heiko



