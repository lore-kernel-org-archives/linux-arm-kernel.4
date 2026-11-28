Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4FD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zc/cbKGP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R1lZZ1+5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p6RETe2n9nSFkgmwbwxPDMILbC3h00DQnWP3gt1J/Cc=; b=Zc/cbKGPpcELD2K77YRC3IhbvV
	hYVOzhZtrJ8VVNGGacftBNELR/4gsSfvOCfLMEzc+aNyhPjxKplV0NNpMEd8LPh+7uIonw8TRKq5L
	umy+1vSWah9SiYY9e2KDn1guMqPv+fkOpqdOJEhoBI/aF7wyVd5uSiFToMeHodQ37N1fm2SDIZBMy
	AbmcmOB2SeQqdDO0SBug167mcX+5lX3uAN6yjr4q4gp2DQBtQBeiO4Hq0TxM1wuyeTBHIgmU4AqL+
	ZC9GlgnoqIR0DUgWG/57XWrA8m0d5JlFSPTsU7YlBRx6K07Zb2FmWOKoyt9UD7M8qfawMSQzsG3ua
	18n7wh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJHc-00000000qMa-0DrJ;
	Sat, 28 Nov 2026 14:20:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJHa-00000000qMN-1hQS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 14:20:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8C6843FA1;
	Sat, 28 Nov 2026 14:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3311F000C1;
	Sat, 28 Nov 2026 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795875605;
	bh=p6RETe2n9nSFkgmwbwxPDMILbC3h00DQnWP3gt1J/Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R1lZZ1+5qbv/4e6EYQ1EuQ88gqj55hacUhJhSUdHikUvDIGnQ9reUDAB5COBBreMV
	 HiUbgm01XKP8cTP37qjSoCQBYfezxXwFuIJ4cQ3jGSOVShcjKtAvcpoWLNZCh7eS9y
	 DYfD49PJt7XKe70Kc8znYEt9exh4qHmXBnaafS4OxAjlqFiYLKe0NzPBP0TX151imb
	 wtGXGprxf088A7aAclFYzvwqXs0ujaZM8mYe6XFgWN9wwFk+Jm/RsKe5lX4v9cdDQd
	 s4j/dHWbNG3Rash9P8vauADDjt7C7L8CtsLrAwq8mpbqKhhrHyygNrW5VBzheNGPz8
	 w/2PMvr1tPSsw==
Date: Sat, 28 Nov 2026 14:19:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org, stable@vger.kernel.org,
	Marcus Cooper <codekipper@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/1] clk/ASoC: sunxi: fix H616 audio PLL and codec clock
 rates
Message-ID: <7350b432-a04c-451f-8a1a-045d3f3a597b@sirena.org.uk>
References: <cover.1795815223.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="layEJsjDVDBOgV60"
Content-Disposition: inline
In-Reply-To: <cover.1795815223.git.daniel@makrotopia.org>
X-Cookie: I'm a Lisp variable -- bind me!
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


--layEJsjDVDBOgV60
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 09:42:18PM +0000, Daniel Golle wrote:
> The H616 CCU reports the audio PLL at half its real frequency since its
> sigma-delta table was added, and the H616 codec support was tuned on
> top of that, so the two errors cancel for the analogue codec. Other
> users of the audio PLL run at the wrong rate: sun4i-spdif plays at
> twice the requested rate once the codec has moved the PLL to its
> sigma-delta setting, and an I2S driver for the Audio Hub that asks for
> 24.576 MHz gets 49.152 MHz.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--layEJsjDVDBOgV60
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsK4w4ACgkQJNaLcl1U
h9AeuAf9G0qsxK6Y/sQ0f+9QCEUTP96FGYku7DdOZg2H7llUzXOXE2TqwowcOvsO
LKpNWIHw9Z+rdh1kuqlVsyaJaUJcvK2zDol+/cKYXWnFixHCpMO5yyly45V9wXhX
5woquNvg3DCV6XvGw5D0iAte6fD4/HuNh9yRTfzyMGA6UUoxFRRNUxN1N+FxY0mf
/l81igCXEqTgZonnGRnQm/1WV31x7oNt1AiADDJj/aCtL/YOf5vcB9/JkwFhIZUb
XmUSp/vfJ4lNdXnONWyVY9kz6AxHdAuQTOJNIseWnGOur9LqBopMLs8TD5soeslT
4KLUrtT76f+UUGbzGExMdDpzaG96Sg==
=O75m
-----END PGP SIGNATURE-----

--layEJsjDVDBOgV60--

