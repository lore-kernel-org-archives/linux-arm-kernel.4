Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83A7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xy5FPui/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQk0ITmt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SbZNDieBY9hzEjO8/yCRQWNmGrtK1StoZinKCNvVSwY=; b=xy5FPui/ZEdjLJJgBZtGLxZpmY
	NB0DcLTM49gVLz9iSmYcK2jCCxcR/8KjuxMVtCO5P2vAxwYv82xDw6sEY30MEa2mkarfRIRrP8Ukt
	xEd7zsvjrFh95Hg2BWGbnSQZSetZbVnYfuMRQlSmdwaaxYjVlYf7qwXOmVKaTg7i/8/CWDrCimEF8
	ShEHy9EnNU4LkdlGdNzNZlU7e9ehObx/D34OWrrNX2dN5Mkeongk798E2dKRxzdf+LChZ+PauGnVr
	vMKKxv5SzT2uOMfDfvvlXJnapgCji+N33iAGyHDVUF+t4evdAEKqgJNA2EZ4u0OhvtQo/HrZlvqyd
	XMcawMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRByM-00000007Hu2-3Rfb;
	Wed, 11 Nov 2026 17:18:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRByL-00000007HtY-19Ar;
	Wed, 11 Nov 2026 17:18:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC60542A6B;
	Wed, 11 Nov 2026 17:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23E71F00A05;
	Wed, 11 Nov 2026 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417536;
	bh=SbZNDieBY9hzEjO8/yCRQWNmGrtK1StoZinKCNvVSwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cQk0ITmtBFI6MNWa6tcqdRP1Rrb1hw8KJqL3wDZjKkLS7qWsr8dkgtxobdWYng3pn
	 q5ZO2KEOq/2ybyWYi1AhNEADaRFen86B9Qfc9zEijmOyQVXqJ5iAAn19vBib/ebrrg
	 5Kf3k4DZdSx3HaFJzdPXXRcot0z8gkEkBVYvg5IY+dDOKPmybYmtL+kpMieQukIbXL
	 hliusqQdHIYaUXsUNUmacQNVuD3WYmhX/ofmNDcaVRlplYYojaJCWxS8lj8rnQQHRj
	 qbhT2IDffnC934hn2HpwgVmjLyCdlenDNhpkU3pmwTV7O5NULFrr+8rk8Jv1Lj8+Z0
	 nrzWsuEDXXAHg==
Date: Wed, 11 Nov 2026 17:18:50 +0000
From: Mark Brown <broonie@kernel.org>
To: jiebing.chen@amlogic.com
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v8 2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
Message-ID: <81581939-3079-4549-9bb8-2e935c173a7f@sirena.org.uk>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-2-1489241e4c83@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oOrGjpPCIIgGz7y5"
Content-Disposition: inline
In-Reply-To: <20261110-audio_drvier-v8-2-1489241e4c83@amlogic.com>
X-Cookie: Do not pick the flowers.
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


--oOrGjpPCIIgGz7y5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:28:25AM +0800, Jiebing Chen via B4 Relay wrote:
> From: Jiebing Chen <jiebing.chen@amlogic.com>
>=20
> Add S4 SoC tocodec compatibility support.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--oOrGjpPCIIgGz7y5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr0o3kACgkQJNaLcl1U
h9CsCwf9Elzjbf8nHCLS5M+WLOLUCXXBlKz4ioAbZpwXCXKM+LrRVNgnLw4IzNmX
POCp7OsztudK0+BWIZeo+K2/TRsSvkV5MnHLUBJ07sUq7LzHkotnhyviWmaxqwCM
vr96FBCba5vQ3KI8XWOH7UUNdUVXiKxuPBMpxut7ZTLvEUKNtajO8tEs+vfT9nuw
j+oMdNOLg+QdZhAqjzkbaarX44zJ7iSHHRdlZ1sWRuX7ygFc6mMWB0OrZV+3v6X+
dSkRdZUhBV9TTA3GavN4+DlqnCaXpzcmIbZu4nKWvLSlFM6TaM3NHoJ9aC6xdLyb
q6fQTd6FJ01z/qrQYUlUr3chvx+7MA==
=C328
-----END PGP SIGNATURE-----

--oOrGjpPCIIgGz7y5--

