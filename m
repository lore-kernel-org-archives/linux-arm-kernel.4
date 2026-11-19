Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69397606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m+SHi2eR;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nTyJfWrW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SXp9CsGNZ9198vKxlERJhM6rRFDt3TB+h3sLDmsTvqY=; b=m+SHi2eRQir7q133W4lJr3Kp/B
	O/iE4X5bktgJuvhomF3mjtfFqAv+vu2hnKFIEocn2N2BaVslEzPk/Shhbogd165P5Rji/Z+MfHnt1
	ewMpHUi4czOZtUHudzUcarFbxznyLPIcvcsQ2tcAFi34cjI13cp6DHcMYiBZYO/zWCEsiCiidAyWK
	4Pa9ZcSlyUMfa7YeDkhl5V0W28QZhODRo+pkNb7j5C8PPiU9LP/ey2qIiwHyiwvcCXECzEOVaxAFh
	00RimLXn9RPqWb4VGo7Y/MXdBiq+fC+0TpbT9fN/g2k5zHuAp2hN53UwbxycKl50uBkqJDAzLhrdW
	nRky3jgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1AA-0000000Bpaq-4A7Y;
	Thu, 19 Nov 2026 12:22:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1A8-0000000BpZw-0LTM;
	Thu, 19 Nov 2026 12:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SXp9CsGNZ9198vKxlERJhM6rRFDt3TB+h3sLDmsTvqY=; b=nTyJfWrWs9J3Bu0dcnPPw1Xcqx
	ZO2GJv25OsuW9y9A57I18j8nIIfCDI7VHEQv86ieSX7TES3LM+hYTzU7SymfMmFvB9BdEeM2gqV6r
	HTu2YbhRKfMz6brmeSa/unjcrRJAO8UCQyFKRExx3QqpOLnpwcNSJh8UKqO1eKB4HF6JgbwH5FLi+
	1+ORZqXIYASY4NsdhOC8TfulyD9jNrTj8Qf6J7mKNhjp/n/mkfSC4HUK5YOykRaLQPupkehsn67LI
	osXstr2pmhNujJ5cis957d8XLpXXkoBMvjBCxBp+NSqHha4HCFUFTXaSeV9OZH3XtUCrjFersvJEL
	zfMJGMVQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-rk: split gmac_clk_enable into
 enable/disable
Date: Thu, 19 Nov 2026 13:22:38 +0100
Message-ID: <Jocs6e4zRiOpvEViMS_OjA@sntech.de>
In-Reply-To: <20261117182502.3045841-2-coiaprant@gmail.com>
References: <20261117182502.3045841-2-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_042248_218261_A6BA293C 
X-CRM114-Status: GOOD (  12.19  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 17. November 2026, 19:25:03 Mitteleurop=C3=A4ische Normalzeit =
schrieb Coia Prant:
> As the great Linus Torvalds once said in
> Documentation/process/coding-style.rst:
>=20
>   "If you need more than 3 levels of indentation, you're screwed anyway,
>    and should fix your program."
>=20
> The gmac_clk_enable() function previously used a 'bool enable' parameter
> to handle both clock enabling and disabling. This resulted in deeply
> nested if/else blocks, which made the error handling and rollback paths
> cumbersome and prone to bugs.
>=20
> This complexity has led to bugs, such as the bulk clock leak fixed by
> commit 8db67bb6a1ff ("net: ethernet: stmmac: dwmac-rk: fix bulk clock lea=
k when the PHY clock fails").
>=20
> Split the function into two distinct helpers: gmac_clk_enable() and
> gmac_clk_disable(). This flattens the code, removes the boolean flag,
> makes the caller's intent much clearer, and simplifies the error
> unwinding logic.
>=20
> Additionally, this refactoring aids compiler inlining and CPU branch
> prediction (trust me). The reason is simple: no branch, no prediction.
> While the compiler might optimize it, there's no guarantee it will :P
>=20
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



