Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FBD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m7NXgmy/;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=UZGam3YW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rnfj8P/89hZGG8JA8cSc7uOTWfh3tYe6K/ikKfWJdVU=; b=m7NXgmy/5XjzfcS9s04iysBpPI
	gF+5FyBSlwYuVCJLZ19S48Yzzb4QaOFFnQvMwwAhibYcQpHUoKOwSPKSqbjpinDZq1a7O4vF2oGfG
	VkJVhaStBG/JFIDLib0QMYjDpkq5GKVc6fs/CZbqr002UYJOtBqzVNyCrmwcvKfk4nD83f0dCMvlo
	Zi+lo0W/GGdWNk8w0dyXY0qaodEYFCAQf6i9eDOd8VDx9A7XHH/CbmZHZUv+MZVTL7rYuACQCivnx
	bQXO5yVdq0E0gY92TguDo+RguDTTxUVRRq5QcBNQxxuu4zsj5xOI3HWl9rYyzxdV4xIdW62N950KG
	OBYycfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVb0l-00000004tBx-2NN4;
	Mon, 23 Nov 2026 20:51:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVb0a-00000004tAO-18n4;
	Mon, 23 Nov 2026 20:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795467084;
	bh=kDrM4gC4cGaNAY7YOiqyl+SIl6oSmR9kum2gtMOqZkQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UZGam3YWzmE4GapanOJIUzrWE+a3lCYuGo0Jj10Or/26aEUImXB6k3PgCfGCfHzG2
	 z2zNVyvXi3pEdtBgz0sR9pk2l8gUGzAwFAUMeafnb1cPNUaCrtqtaGWVhSTVMRR7zc
	 3SijO7sSWPRdP61viGRb3Gegc6R/UzRq41aFl95UA6FtV8Q0wbotWy8q0cub0AFeXO
	 1Wrg4CTN7Ddy5DkFYW1dKiHyJEhP8BWdH0uXWr5c/PLLlSg+eHxCg0EaMu4VMRZvjI
	 Tqh+sf/2H6IouZHLgdx9j4OnE5rhWWFgV2pfTfjzWNlys7tFxaiGexTYhClrBKnncL
	 xUltB+CSto1nQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 071AD17E00C4;
	Mon, 23 Nov 2026 21:51:22 +0100 (CET)
Message-ID: <59d1ae17abc709ddfdc9608d1e744aa95ba7f2a1.camel@collabora.com>
Subject: Re: [PATCH v2 2/2] media: verisilicon: Handle VDPU2 decoder
 interrupts like the G2
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>, Boris Brezillon	
 <boris.brezillon@collabora.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 15:51:21 -0500
In-Reply-To: <20261120-vdpu2-errreset-v2-2-8f4ef55e6dee@gmail.com>
References: <20261120-vdpu2-errreset-v2-0-8f4ef55e6dee@gmail.com>
	 <20261120-vdpu2-errreset-v2-2-8f4ef55e6dee@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-NaJf9URqSAIJAeYjH5aT"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_125132_988920_ED388251 
X-CRM114-Status: GOOD (  18.21  )
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

--=-NaJf9URqSAIJAeYjH5aT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 02:49 +0000, Arun Iyengar via B4 Relay =
a =C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> Do as the G2 interrupt handler: ignore interrupts the decoder did not
> raise, report the error type and don't finish the job while the decoder
> is still enabled. The decoder disables itself on errors, except when
> its input buffer runs empty; a later interrupt or the driver's
> watchdog then ends the job.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 18 ++++++++++++++=
+++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drive=
rs/media/platform/verisilicon/rockchip_vpu_hw.c
> index 4bc1bdb41c70..d20f295b43de 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -391,10 +391,26 @@ static irqreturn_t rockchip_vpu2_vdpu_irq(int irq, =
void *dev_id)
>  =09u32 status;
> =20
>  =09status =3D vdpu_read(vpu, VDPU_REG_INTERRUPT);
> +=09if (!(status & VDPU_REG_INTERRUPT_DEC_IRQ))
> +=09=09return IRQ_NONE;
> +
> +=09vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
> +
>  =09state =3D (status & VDPU_REG_INTERRUPT_DEC_RDY_INT) ?
>  =09=09VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +=09if (state =3D=3D VB2_BUF_STATE_ERROR) {
> +=09=09if (status & VDPU_REG_INTERRUPT_DEC_BUS_INT)
> +=09=09=09dev_warn_ratelimited(vpu->dev, "bus error detected.\n");
> +=09=09if (status & VDPU_REG_INTERRUPT_DEC_ERROR_INT)
> +=09=09=09dev_warn_ratelimited(vpu->dev, "decode error detected.\n");
> +=09=09if (status & VDPU_REG_INTERRUPT_DEC_TIMEOUT)
> +=09=09=09dev_warn_ratelimited(vpu->dev, "frame decode timed out.\n");

My take is that you really want to know if these error are raised without t=
he
DEC_RDY_INT. BUS_INT is one that can occur (seen on imx8mq). I think you ca=
n
easily endup in hantro_irq_done() on a hot IP with this construct. I ack th=
e
different with G2 here though.

Nicolas

> +
> +=09=09/* Still enabled: a later interrupt or the watchdog ends the job. =
*/
> +=09=09if (vdpu_read(vpu, VDPU_REG_EN_FLAGS) & VDPU_REG_INTERRUPT_DEC_E)
> +=09=09=09return IRQ_HANDLED;
> +=09}
> =20
> -=09vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
>  =09vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
> =20
>  =09hantro_irq_done(vpu, state);

--=-NaJf9URqSAIJAeYjH5aT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawSnSQAKCRDZQZRRKWBy
9Hz7AP4ve/5j20b9ak39jzktZWr6s64fYNfO4dmviULkHJM9+AD8DUz3Gq+dlS3Q
MKt3BCggHMsrVbvbGZq58hR9D0aaEwk=
=+YNp
-----END PGP SIGNATURE-----

--=-NaJf9URqSAIJAeYjH5aT--

