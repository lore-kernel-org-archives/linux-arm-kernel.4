Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w+2LHTnJ;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ETofVZ8x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1FfVUciJC7SBDz64qLVYNqjkCG1iMZUPuQ/yeamSqyk=; b=w+2LHTnJ3GfM4QBfRBrf7EN1cj
	SB+rf54spAU+GdFVbb35/iGI9wtYLFGeYfIoB1dXVA9AZgQr36wqnS0HM2eX7KA0BowqoFYrQMuzq
	IrChMLa+AKn0ZoRofIYSDktl3+KPl4ZP1Vi8nm4q5RFQnA3wb/EWY5HFPlcNGZb4CbIwyR68aq/zp
	pnoxrWter+cnmABOy0StK7ZOcCKzPTUWuhXLO2jBeHC//58X501a7JnltCKmTykpn4VFRgAmJIjnf
	pwQ53zZxUfvA3DW4co4JZ8r+qfM69QcZT76MCzMP9WHm2riKYVASO46BmRYG53fMpaXV6BiRPfHu5
	Lfatnfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsu2-000000071zc-3W1F;
	Tue, 24 Nov 2026 15:57:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVssK-000000070HW-1Qra;
	Tue, 24 Nov 2026 15:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795535765;
	bh=ruxnBoOV6xGZY/CSfA+iq4Vpv8wHSpb/bh4/86Bx53I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ETofVZ8xrguINm0cpUpPyTjkAv/N0HvLyR9jy7i/Cds+ypgawZ8PCHZ+xw1nqYejH
	 VVecFaUKipjF1VnW9ntnr86B73vMTdWvUnaWW4I8nrZttZNElnX0GMZAYow37r20Lf
	 fPz4lx0hhUqLnKc8DAbKooL4kMDIvjdqKX7gk8e2ZeIXSK7l+Rn10aCugEWOrlud2B
	 40VDiiLHhpHMg3E423NXFMY5acf8wQJWQFL0Vso5bLxbvPwTHeaSoD0/HHTcA0vAdl
	 PRXrseaQwPz8NgO44BgPuYYbIXKRDQe6cmjL+YsfmpRrebxYvZIIFcMnaWKpCOkEQF
	 n4KUwGbKDFmJQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DB1217E0309;
	Tue, 24 Nov 2026 16:56:03 +0100 (CET)
Message-ID: <f963eac22ff18ac8df07a4654e41d27639ead883.camel@collabora.com>
Subject: Re: [PATCH v3 0/3] media: verisilicon: fix JPEG encoder writes past
 the CAPTURE buffer
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: shomenkow@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Chen-Yu Tsai <wenst@chromium.org>, Hugues
 Fruchet <hugues.fruchet@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Tue, 24 Nov 2026 10:56:01 -0500
In-Reply-To: <20261124-hantro-buflimit-v3-0-780903970ca0@gmail.com>
References: <20261124-hantro-buflimit-v3-0-780903970ca0@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Yn3avyQi8rWR3+bBFHV/"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_075608_865421_78E87B14 
X-CRM114-Status: GOOD (  28.56  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-Yn3avyQi8rWR3+bBFHV/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 novembre 2026 =C3=A0 16:40 +0300, Sergei Khomenkov via B4 Relay=
 a =C3=A9crit=C2=A0:
> The H1 and VEPU2 JPEG encoders are given their stream buffer limit in
> bytes, but the register counts 64-bit words, so a stream that does not
> fit the CAPTURE buffer is written past its end, up to eight times the
> buffer size. A quality 100 frame of noise does not fit the default
> sizeimage, and userspace can also set a smaller one.
>=20
> Patch 1 stops the encoder in the VEPU1 interrupt handler after a
> buffer-full interrupt, which leaves it paused. Patch 2 programs the
> limit in 64-bit words, rounded down to whole 64-byte bursts, on the H1
> and on the VEPU2. Patch 3 makes the smallest CAPTURE sizeimage of the
> JPEG encoders the 624-byte header plus one burst, set in the variant
> format data.
>=20
> Testing, on an RK3026 (its H1 is Rockchip's VEPU1) only: without the
> series the encoder wrote 230 KB past a default-sized 640x480 buffer and
> 1.6 MB past a 1920x1088 one. With it, 17 overflowing frames, four of
> them queued back to back, stopped at the programmed limit without
> writing past the plane and came back with the ERROR flag, one interrupt
> each and no timeout; the jobs after them completed, and frames that fit
> are byte for byte the same as before. A sizeimage of 1 or 600 now reads
> back 688. v4l2-compliance 1.30.1 on the encoder node shows no new
> failures.
>=20
> I cannot test the VEPU2 or the STM32MP25 VENC. The VEPU2 gets patches 2
> and 3, but its interrupt handler is unchanged; Nicolas offered to test
> the VEPU2 part of patch 2. The STM32MP25 VENC runs the H1 code of patch
> 2 and gets patch 3, but not the stop of patch 1.
>=20
> The bugs were found and the patches drafted with an LLM coding
> assistant while porting mainline Linux to an RK3026 board.
>=20
> ---
> Changes in v3:
> - Move the LLM and test notes below the --- line and add an
>   Assisted-by: tag (Nicolas).

I've just learned today that we just don't do tagging anymore for this. So
**if** you have to make a new version later on, just remove them.

commit 1e035297ffdadf2184c3c773b8c098e372324aaf
Author: Sasha Levin <sashal@kernel.org>
Date:   Tue Oct 13 08:15:01 2026 -0400

    docs: remove Assisted-by references


> - 1/3: add Nicolas's Reviewed-by.
> - 2/3: program the VEPU2 JPEG encoder's limit in 64-bit words as well;
>   Nicolas offered to test it. Subject says "JPEG encoder", not "H1".

Yep, thanks, I'll do.

> - 3/3: move the header + 64 floor out of hantro_try_fmt() into a new
>   min_size field of struct hantro_fmt, set in the JPEG encoder formats
>   of the Rockchip and STM32MP25 variants (Nicolas).
> - Rebase on media next aa0f4c41d487.
> - Link to v2: https://lore.kernel.org/all/20261110-hantro-buflimit-v2-0-f=
f7790def9fc@gmail.com/
>=20
> Changes in v2:
> - Trim the commit messages and code comments (Nicolas).
> - 1/3: clear only the enable bit of H1_REG_ENC_CTRL instead of writing
>   0 to the register, and add a rate-limited warning per fault bit, as
>   hantro_g2_irq() does; add the H1_REG_INTERRUPT_* fault bits (Nicolas).
> - 3/3: keep max(): it is a floor of header + one burst, the 64-byte
>   rounding is on the stream limit in 2/3 (Nicolas).
> - Move the test numbers from the commit messages to this cover letter.
> - Link to v1: https://lore.kernel.org/r/20261109-hantro-buflimit-v1-0-f0b=
86ce61e66@gmail.com
>=20
> ---
> Sergei Khomenkov (3):
>       media: verisilicon: stop the VEPU1 JPEG encoder after an unfinished=
 frame
>       media: verisilicon: program the JPEG encoder stream limit in 64-bit=
 words
>       media: verisilicon: leave room for the JPEG header and one stream b=
urst
>=20
>  drivers/media/platform/verisilicon/hantro.h           |  2 ++
>  .../media/platform/verisilicon/hantro_h1_jpeg_enc.c   |  4 +++-
>  drivers/media/platform/verisilicon/hantro_h1_regs.h   |  4 ++++
>  drivers/media/platform/verisilicon/hantro_v4l2.c      |  3 +++
>  .../platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c  |  4 +++-
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c  | 19 +++++++++++++=
++++++
>  drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c |  1 +
>  7 files changed, 35 insertions(+), 2 deletions(-)
> ---
> base-commit: aa0f4c41d4870a18e65772a1817af16427200371
> change-id: 20261106-hantro-buflimit-055e8029be23
>=20
> Best regards,

--=-Yn3avyQi8rWR3+bBFHV/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawWzkQAKCRDZQZRRKWBy
9MdHAQDjvqhdhgvEC6yzU/xqI6jnBrGCFgk13OkznNveuqz5XwEA/akOGrITD/C6
zKXV88e4lNC3w3pTzGblavFC3Rc3Wg0=
=l58F
-----END PGP SIGNATURE-----

--=-Yn3avyQi8rWR3+bBFHV/--

