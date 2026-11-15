Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43FF606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lX1tok6H;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j21gX6zX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qIkegvM0vM7wyeDCr9yTjV+nCu5PD6X7FTu58o7P70U=; b=lX1tok6Hw6jlqEZ9RJ/y0fCIlJ
	DN0RBc3EX7xElMDHBJ/uJN3x6qGRJKf7JHRBbHvic2vvoYd3/77WsM1DM36eRKaudp3pPH5ACcnja
	jA9C0e64RakSXD7reopKEbzAoI09XKdSslTxRuESnH5hnY8TQOJE1JUOXRs8WfZR/mNZ3XCcj+l0n
	grEkCgErjVr+jh02opO2Ih3gpNlt+wYX3akbUNSeTiqn8F+/0ZS09hQdnuFd9Kf2fLuWDKm8mBIZ3
	JVaxYDhqYxpU4XJog4I1++0NFjg4YXajK/3XSYkV4NhDSoR81UTUzR3fkHGTQu0N73GQZhmdiUD6/
	hrfsMwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbz4-000000007DP-27iP;
	Sun, 15 Nov 2026 15:17:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbz3-000000007DJ-1C8o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 15:17:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59ED562435
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 15:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECA51F000CE
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755852;
	bh=qIkegvM0vM7wyeDCr9yTjV+nCu5PD6X7FTu58o7P70U=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=j21gX6zXDBAG6MY8+WrsN8mJnhvZS4pEbMFH0rtgAa1XpBrQm6P08/9TekLTD+bOZ
	 PIRV7sVtKt5MnbaTDLds8nZQQezw0XhqDoxV53rnoMKBc5AYEQn0JaiCJrUPFqPK0U
	 ue+K0988nl5towhzBXn5IbmCl62WlRdtXNyBKNm6GOEarDFZ222c29FIp5MKtwF8Ps
	 mt78rrH1qpiSccpfhI73dCPhARZmJAtGdyDt6z7aestGq9dqS7cjJIIkxP33QBY7SJ
	 ZNHC7iZgah3JsgA7ZSEk1ooZHARvLnjWxkEVoPIywnZk6sikOyQZf9LDZLHYWhgzGj
	 CyCwsPAjqCgUA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ad5529ae64so26539411fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 07:17:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHtsMCYb/W1zq+Lm0G6sdnSygu/WcsRNsoJ8tPeO5kR85LNngd48TZcSoZppsmJucEhINPxg4R06yzVx9eE0T4V@lists.infradead.org
X-Gm-Message-State: APuU4Z8otVRh/YJL2HOUDN88bqEQE3ZFygtJjXtMrKKV5EgN58mT0mJw
	mvmWHa908cp1LG/NdiyrvX6Kf8/DTlmaKvJVomuZ6HksW2/SI6XCV0NceLbyO8dOK+syuumhjsD
	wCB1fstv22o9AguEd2F2xJMEW9RkGEkA=
X-Received: by 2002:a05:651c:31d0:b0:3ab:344e:3740 with SMTP id
 38308e7fff4ca-3ae2b41f7efmr26811011fa.2.1794755850446; Sun, 15 Nov 2026
 07:17:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-sun8i-emac-mux-uaf-v3-1-c69d4189539d@gmail.com>
In-Reply-To: <20261115-sun8i-emac-mux-uaf-v3-1-c69d4189539d@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 23:17:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v64aOydKdTWJEhF+0GVc45aap4AsHfF5RrL1pzOHF54D0A@mail.gmail.com>
X-Gm-Features: AclHuK9BiEy8NKHYdASo3pcVR5VPMQUIfo9KOqeQ5VGeVR52SQ6tBFPl-jC43Jc
Message-ID: <CAGb2v64aOydKdTWJEhF+0GVc45aap4AsHfF5RrL1pzOHF54D0A@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: stmmac: dwmac-sun8i: Fix use-after-free
 in the MDIO mux error path
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
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

On Sun, Nov 15, 2026 at 5:05=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> If mdio_mux_init() fails after the internal PHY was powered, the error
> path releases rst_ephy and ephy_clk before sun8i_dwmac_exit() uses them
> to unpower it. Unpower the PHY first, as sun8i_dwmac_remove() does.

And sun8i_dwmac_remove() also indirectly calls sun8i_dwmac_exit() through
stmmac_pltfr_remove() after reset_control_put() and clk_put(), so it is
no better.

I think the correct fix is to move stmmac_pltfr_remove() before the
*_put() calls (but still after mdio_mux_uninit() in sun8i_dwmac_remove).

>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Found by Sashiko's review of another dwmac-sun8i series of mine.
> Build-tested only (arm64 and arm, W=3D1): I have no board with the
> internal PHY (H3, H5 or V3s), so the error path was not exercised.
>
> Developed with Claude (Anthropic); I reviewed it.

It feels like your agent needs to do a bit more deep diving through the
surrounding code.

> ---
> Changes in v3:
> - Drop the Fixes tag (Andrew Lunn)
> - Shorter commit message
> - Link to v2: https://patch.msgid.link/20261113-sun8i-emac-mux-uaf-v2-1-6=
203666b2687@gmail.com
>
> Changes in v2:
> - Target net-next instead of net, drop Cc: stable (Andrew Lunn)
> - Shorter commit message
> - Rebased onto net-next
> - Link to v1: https://patch.msgid.link/20261112-sun8i-emac-mux-uaf-v1-1-3=
08ae7e6fcf2@gmail.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..898560e8e95c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1245,6 +1245,7 @@ static int sun8i_dwmac_probe(struct platform_device=
 *pdev)
>         return 0;
>
>  dwmac_mux:
> +       sun8i_dwmac_unpower_internal_phy(gmac);
>         reset_control_put(gmac->rst_ephy);
>         clk_put(gmac->ephy_clk);
>  dwmac_remove:
>
> ---
> base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
> change-id: 20261112-sun8i-emac-mux-uaf-1ba885219fee
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>

