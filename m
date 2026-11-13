Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E400606C156
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fiElsRr2;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=cdJSjMcA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wM1IQoyS/kff0hQA3Z9PrPD6GnekMw+h/sWii7GLcYc=; b=fiElsRr2qv2OFCE5LAnBlUgWRS
	+g9oBa32uO24yyWr5kdhFLzD/cbQrpv7or62wJdElnYMzMsIy3Dj0VwSW+VqakKgpwMDWfeuzaC8K
	sctpVHsbmIK/3vbpTarK5EJUztELkn8Jb4YdJSTwkoLUU6AvpmxFIgCRt8CCQOTbpbhCSyzS1C0B2
	LqAkXPWM3k9K27rQWBj0wAPXyKB93eTkXFtDxyjs6eSIhASg68nyvQKzpNYw31vtkmE4sWB4cVG2/
	SYn8/dfDvvp7KGLXfSUMUVyQQal2NWZKKZorrny7n3TAhDtCXPl3NHIm2TTvg5WqRHxeFsHBWLR+t
	CxvOeQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRw2r-0000000Dx7o-1GHr;
	Fri, 13 Nov 2026 18:30:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRw2n-0000000Dx6F-02iK;
	Fri, 13 Nov 2026 18:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=wM1IQoyS/kff0hQA3Z9PrPD6GnekMw+h/sWii7GLcYc=; b=cdJSjMcA7tYehsdP/mIhTaa/V+
	+xCLtgQUJ2lX7T5NPZZM1uyX6sFUu6pT9LUQ3ePCv9OTxuAX/NOwx5FD0CRsAAm7N/EE3nZVlyzRq
	dZb796O3CQT5YuD+vv/h/CXo70cyvubmjkdWzMI86a9VDzCYExMSB0hxCUU3I+csq00wKYzDkhixA
	gOIBNWELLZx5Ahp8iNkNtGJpqjSjx6HJW7GKENmC9VrTGjJhgpynJPxs3jQt+vVKwS1RhqF4kDgdf
	+TzkqzS07OJ+9k7kf1gDt2NXOL/FmJALu70PXY2hhCCwioH9P160aExjmFZjTdn5gt0LXV1tXvFA2
	K4IPxDzw==;
From: Heiko Stuebner <heiko@sntech.de>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de,
 Lee Jones <lee@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 2/6] spi: Export spi_set_cs() function
Date: Fri, 13 Nov 2026 19:30:33 +0100
Message-ID: <m57rhfeHSi6wilRDC92EGA@sntech.de>
In-Reply-To: <9kep3BO9ROGEepQWTWqwnA@sntech.de>
References: <20261113135017.1047959-1-heiko@sntech.de>
 <20261113135017.1047959-3-heiko@sntech.de> <9kep3BO9ROGEepQWTWqwnA@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_103037_124469_A5F4C67B 
X-CRM114-Status: GOOD (  15.68  )
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

Am Freitag, 13. November 2026, 14:56:33 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Heiko St=C3=BCbner:
> Am Freitag, 13. November 2026, 14:50:13 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Heiko Stuebner:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > While spi_set_cs is currently only used when the SPI framework manages
> > the core transfer function, it contains a lot of functionality that
> > can be used for the upcoming atomic transfers, where a driver implement=
ing
> > that atomic transfer could profit from not having to duplicate the
> > chip-select functionality.
> >=20
> > The only sleeping part was the spi_delay_exec function doing the
> > chip-select delays, which can now also run in atomic contexts.
> >=20
> > So export the function.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
>=20
> Dang, overlooked spi_toggle_csgpiod() called in spi_set_cs(), which does
> gpiod_set_value_cansleep().

spi_toggle_csgpiod() can of course also differentiate between using
_can_sleep normally and switching to the no-sleep variant in the atomic
mode.

So before this whole series a splat is already created if a gpio-cs at
the late stage, so after this, the splat would only occur, if someone
uses a sleeping gpio(-expander) for something wanting to poweroff a
system.


Anyway, I've created a patch for spi_toggle_csgpiod() but will wait
till monday to maybe get some more comments beforehand.


Heiko



