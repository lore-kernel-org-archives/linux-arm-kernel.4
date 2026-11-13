Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816D606A8B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sddY94vg;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=QoBpCjFS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HWRK07tgReotE1rio8vCvygSDsW8NPJiLK9qpH0uLVI=; b=sddY94vgelki3s1pStVEGn/c/q
	VrDLQF4pfEGKxvLOEy2BeTEmjGRxpv5rrl7synBFGbkfayz0dyKLLy0uJGxVRjXDnvrfe5+Yt+WXu
	4sJR6xYdV0REjo9JU1zNU6uK8dH7ChVZM2+fE6eLrAOaAuK/xlBzT17MtisoZy0G8gbfgcMUsbqXO
	tAlA9NLyiLhwVNHOEYzEdnsEboBJo8P4pU3uCjwT9irP7eo0RUGzt3ZhR2vrwTAMSLnix/3EIxucN
	RolMp8L+LilA9HwWHw2+1cxfLblGsV/VtyCvENV9vWbrYFjk6+oU0TPf3vvOmG5wvvpml6TUelSEw
	njn/FtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrll-0000000D3OB-2Kmw;
	Fri, 13 Nov 2026 13:56:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrld-0000000D3Mt-2E5B;
	Fri, 13 Nov 2026 13:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HWRK07tgReotE1rio8vCvygSDsW8NPJiLK9qpH0uLVI=; b=QoBpCjFSa2OWprOAFfkHYM7cjM
	Cb0dffrp4VgwLL2L7XeIQaLiSjV/PceuZeACZgIMxSVC0jahSBalv7xV9yBSD7iUJDG5HpsxQH3+s
	NXbu5jadPcowe/g5C3NKVq8yXxkJhfk0AAyEuwSo6fQUF8bu3G5J34ivcwqj9VXdMdgF62qzT3mC2
	uNLCsdX9plzpRiNDZx7TEOTxIntaMdtLQxPaMzzmuKYaKj80sehFQ16vMUQ4FM/810xjBrzJV+Lfk
	Cy3NCu+FoaIzvaKe0CHrnK4p2NdBViJFrCrwBOCky3Sk/dB6blp07fso9AEtr3y+SkUUvqm6fGb4z
	vpD9Q0gA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de,
 Lee Jones <lee@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 2/6] spi: Export spi_set_cs() function
Date: Fri, 13 Nov 2026 14:56:33 +0100
Message-ID: <9kep3BO9ROGEepQWTWqwnA@sntech.de>
In-Reply-To: <20261113135017.1047959-3-heiko@sntech.de>
References: <20261113135017.1047959-1-heiko@sntech.de>
 <20261113135017.1047959-3-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_055637_588199_3318BE7B 
X-CRM114-Status: GOOD (  11.00  )
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

Am Freitag, 13. November 2026, 14:50:13 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Heiko Stuebner:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> While spi_set_cs is currently only used when the SPI framework manages
> the core transfer function, it contains a lot of functionality that
> can be used for the upcoming atomic transfers, where a driver implementing
> that atomic transfer could profit from not having to duplicate the
> chip-select functionality.
>=20
> The only sleeping part was the spi_delay_exec function doing the
> chip-select delays, which can now also run in atomic contexts.
>=20
> So export the function.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---

Dang, overlooked spi_toggle_csgpiod() called in spi_set_cs(), which does
gpiod_set_value_cansleep().




