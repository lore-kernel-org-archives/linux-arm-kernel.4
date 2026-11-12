Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8277E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=irKQJMhK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9lBr7SG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iEo2xki5lr0Ld9JYPAmWGvg1Pdjk4kdBgUxL5c/PWWA=; b=irKQJMhKyYTKcdX3o55GPLGbTC
	dCSD2lkuAYxFr6rBOj4OGZPAtAVglPqNgvKHHAAJoCPl4vKeFqzREhkVdPqAmDWjLX6V06XlW2yrl
	W32hggNtOBPy9rXr1SHH9S7Hao/lXn0QaSVta8FtQb39g955q9YaI3nImUPXnZN2rpvgIWDOtxmiF
	bGSCsKK0pHHAFGugYw9ZexswwJJJJzotQcW1Uyw6RbGN1vw60ESEM9/oxvEfLeUsj27zoACCIlFsl
	No4YEoxopCpo9r3wj+y5zcleMppkixpTaKlS5XJVfd7Umh8/Lh0FtCpuYWIVEO2R9e0auFUs51T7f
	or+eRQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUvG-0000000A4vL-1ufX;
	Thu, 12 Nov 2026 13:33:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUv3-0000000A4sX-1eET
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:32:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B10F44098
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 13:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6481F00A0D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490369;
	bh=iEo2xki5lr0Ld9JYPAmWGvg1Pdjk4kdBgUxL5c/PWWA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=i9lBr7SG/fDtD9bdmi6KD+XPnkRUcprImJzMti7MgTMiG3fCabTEmScJmy6bmre+s
	 TWwEf8neAUTGDJtN0k8m6X59GkHTQJf4TEQLiHRgueZjgJYfb0LcnmyWTfwb87aVJV
	 YUkRzi42wR3lsTyEYM8X+37yqRRgTaZ+quFhMrcyETttLQzAdbUnBhYvoKGAzz4unW
	 zDAjfUJWjFg0Y6n00Fd1f6iL9ntHsHW3NUgccfxUi4z+32EpyxJ03WL0IH5G/kZ8YE
	 e92roH1ccmLjKYcLOfy0zuUspWwBlHAOZVv3bhsRr/11qxAsBYyQVrdsBiPjDdnIWg
	 0z+nhdXPa72zQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso38596061fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 05:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGV5gq0yW/t6IrOdh+g1Qt3R0EOyOJpSxUuNSIjeyasGE5/I7SuSu7GCPEmxPcCIfKXeyLSM+mYrfnqS9olyU0r@lists.infradead.org
X-Gm-Message-State: APuU4Z+SblfDU4XERQc1RzOk5xi0Rd50yE4A/j9i3KeZaqiWRsDwswaI
	8d+Fevcg2sStV9mO7aRPvAGaU/4aEnf2QkaocnS8Fzhb0c5J3fJH/gxdCHUo4in2VnY95QAGASb
	5nPX4GHLWVcRDzu0neHEaDpvyi62Iouc=
X-Received: by 2002:a05:651c:1445:b0:3ac:429f:6da8 with SMTP id
 38308e7fff4ca-3ae12679b99mr12954551fa.10.1794490367466; Thu, 12 Nov 2026
 05:32:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com> <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Nov 2026 22:32:34 +0900
X-Gmail-Original-Message-ID: <CAGb2v67P+9zBpmst9qLBJ+PpPG4ghtiC0UiyTz1PK-wRm2jqVg@mail.gmail.com>
X-Gm-Features: AclHuK_HGkL2v-mrL96AWKEOzFXYn0NCtooN1Z9_WCMxITXSHxeYkq61j0wWgcE
Message-ID: <CAGb2v67P+9zBpmst9qLBJ+PpPG4ghtiC0UiyTz1PK-wRm2jqVg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-sun8i: Fix the RX_TH
 threshold encoding
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 5:41=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The EMAC RX_CTL1 RX_TH field (bits 5:4) encodes 00 =3D 64 bytes and
> 01 =3D 32 bytes (H616 user manual v1.0, 6.5.10; 10 =3D 96 and 11 =3D 128 =
bytes
> as in the driver). The driver has the first two swapped.
>
> The values are only used in RX threshold mode, which stmmac selects only
> when the snps,force_thresh_dma_mode property is set. No Allwinner device
> tree sets it, so no in-tree board is affected.
>
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Checked A64, H3, H6 user manuals as well.

The original chip this came in, the A83T, the manual for it doesn't have
the bits for this register.

