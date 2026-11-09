Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFBE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=boy8jlDy;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AE9EP2U3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wlTGvH0QUOsr+i6QSOF/pBnjZSuTmqvqtfQVED5Nrp4=; b=boy8jlDy9/K1GKVjdhYjpTbrPN
	t5NsqSzHrGQ+Pp5Ph+4oSBeSuFsp5TyvAOJkk5VgM7ZiB7cmOObNmg088M5XoufF7+3X3Mg/8BjsV
	f25y0qBOhVnxdfu5+a63gIR+4iVpP3HnKzEHF0zroC0WZHA20zLRXB1yojOnEuR7aows5i6jOLsrm
	1KHCcQtktxrcZA/1ntoFHR4Efqyu2T7djkWhVTWTXupwCDu5VCwuaRrdiu40lUT/jAVL3ggr4DWN4
	fvPC1ctmITlrij30kZXrC4vL7MRmXSWJ6EUQ/AE1T5wtFmChPW0nfztsJALT8TcP+w2apV/E4MvpR
	DOtBLv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVjF-00000001ch0-2sNL;
	Mon, 09 Nov 2026 20:12:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVjD-00000001cgT-0sDp;
	Mon, 09 Nov 2026 20:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794255147;
	bh=NUdD8rmrEWF0Gtvg3tI1P9FxbEJolb3CZKqT5DxBjJU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AE9EP2U3ZdwEKiCK6ShpVS/2z04RaqxFkbEk4mRkQjQqB8IoFXvNQcvnehXBS+YDi
	 9DxXzBHGM2Gxpxu5tm5uR0VTZeHz15vyqXiYyRr/TWC8sEgDIloTrdCVwRK/W1KNCJ
	 /A+dWhrF9SR6JHOPiAqmwhM/QCyZ2jjJ3cyVsO6jaZS2rgC9YoD8HIEv38XMa0Lr+/
	 e+WHydNGnr96Qr6AwPcGYOsmZbshtBKArLAFY6sgxfaFKVt0ifmzdpmyP9OlmHEocS
	 kSJ3yBlu9bWKCcMonqZqSCgoW04vpX3diPdQthJ8k1lHrDjfwug9wMbUj5xM9vIYRL
	 wZM8ZPGkb9E8A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DDDDB17E0269;
	Mon, 09 Nov 2026 21:12:25 +0100 (CET)
Message-ID: <a605ddd72e629ac677c7b45d940fa7e7f7412ebd.camel@collabora.com>
Subject: Re: [PATCH 1/3] media: verisilicon: stop the VEPU1 JPEG encoder
 after an unfinished frame
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: shomenkow@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Ezequiel Garcia
	 <ezequiel@vanguardiasur.com.ar>, Chen-Yu Tsai <wenst@chromium.org>, Hugues
 Fruchet <hugues.fruchet@foss.st.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Mon, 09 Nov 2026 15:12:23 -0500
In-Reply-To: <20261109-hantro-buflimit-v1-1-f0b86ce61e66@gmail.com>
References: <20261109-hantro-buflimit-v1-0-f0b86ce61e66@gmail.com>
	 <20261109-hantro-buflimit-v1-1-f0b86ce61e66@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-qVlDHU493oj7uu3cN6Fe"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_121231_434256_70462EB4 
X-CRM114-Status: GOOD (  29.07  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-qVlDHU493oj7uu3cN6Fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 09 novembre 2026 =C3=A0 16:43 +0300, Sergei Khomenkov via B4 Relay=
 a =C3=A9crit=C2=A0:
> From: Sergei Khomenkov <shomenkow@gmail.com>
>=20
> When a JPEG stream does not fit the CAPTURE buffer, the H1 raises an
> interrupt with BUFFER_FULL set and FRAME_RDY clear, and pauses with the
> enable bit of H1_REG_ENC_CTRL still set, waiting for more output space.
> rockchip_vpu1_vepu_irq() returns the buffer with the ERROR flag but
> clears only the interrupt and AXI registers, so the next job is
> programmed into the paused encoder: its ENC_CTRL write aborts the paused
> frame, which raises a reset interrupt while the new job is being set up,
> and that job times out. The watchdog then calls
> rockchip_vpu1_enc_reset(), which sets H1_REG_INTERRUPT_DIS_BIT, and the
> JPEG encoder path never clears that bit again, so every later job times
> out as well. That second problem is not addressed here.
>=20
> Write 0 to the enable register when an interrupt does not report a
> finished frame. The write comes before the interrupt and AXI registers
> are cleared, and before the next job is scheduled. On the RK3026 it
> raises no interrupt of its own: in the test below the encoder raised one
> interrupt per frame and no job timed out.
>=20
> The encoder rarely gets there today, because the stream limit it is
> given is eight times too large; the next patch fixes that, and then
> every frame that does not fit ends this way.
>=20
> rockchip_vpu2_vepu_irq() and stm32mp25_venc_irq() do not stop the
> encoder either. I cannot test the VEPU2 or the STM32MP25, so this patch
> leaves them alone.
>=20
> Found with an LLM coding assistant while porting mainline Linux to a
> Rockchip RK3026 board (VEPU1); the assistant also drafted the code and
> this message. Tested on that board with the stream limit fixed: without
> this change the job after a buffer-full interrupt gets a reset interrupt
> and every later job times out; with it the frame that does not fit comes
> back with the ERROR flag and the following jobs, overflowing or not,
> complete as before (10 alternating jobs, and four overflowing frames
> queued back to back followed by fitting ones). Counted in
> /proc/interrupts over 24 runs of the series (48 frames, 16 of them
> ending in a buffer full), every frame raised exactly one interrupt, so
> the stop write raises none. Only buffer full was exercised, not bus
> errors or the hardware timeout. Not tested on other SoCs.

Please trim this down to what is really needed.

>=20
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>
> ---
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drive=
rs/media/platform/verisilicon/rockchip_vpu_hw.c
> index 02673be9878e..144d320302a1 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -376,6 +376,15 @@ static irqreturn_t rockchip_vpu1_vepu_irq(int irq, v=
oid *dev_id)
>  =09state =3D (status & H1_REG_INTERRUPT_FRAME_RDY) ?
>  =09=09VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> =20
> +=09/*
> +=09 * An interrupt without FRAME_RDY does not end the frame: after a
> +=09 * buffer full the encoder pauses with its enable bit still set,
> +=09 * waiting for more output space. Stop it, so that the next job is
> +=09 * not programmed into a paused encoder.
> +=09 */
> +=09if (!(status & H1_REG_INTERRUPT_FRAME_RDY))
> +=09=09vepu_write(vpu, 0, H1_REG_ENC_CTRL);

Can you follow other similar patches (G2), and add some rate limited debug =
so we
are ware when a fault occured, and what fault it is. Its also best practice=
 to
only reset the bit you care about, Hantro IPs have all sort of side effect =
per
bits.

Nicolas

> +
>  =09vepu_write(vpu, 0, H1_REG_INTERRUPT);
>  =09vepu_write(vpu, 0, H1_REG_AXI_CTRL);
> =20

--=-qVlDHU493oj7uu3cN6Fe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavIpJwAKCRDZQZRRKWBy
9Hk8AQDqkecJtNqrHJyWzsY47xf1Moj1ivtzo5zq3R0hSA87BwEA+RZEhGQ70w8c
tLls+tZpnQtJ+rZDYw40pV7vcBIn/Qs=
=nT8W
-----END PGP SIGNATURE-----

--=-qVlDHU493oj7uu3cN6Fe--

