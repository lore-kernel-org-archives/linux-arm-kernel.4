Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F03606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2wp/Hu/i;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Z1uGPCbV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mh4ScxtQECCT949jebGxf3rSb7AyqZ70JiHFshhq54c=; b=2wp/Hu/iNVc+q6Qr9rhe0cSa8R
	EwaLwKrA1em5jyCk/WdvBSnIVwgUmQZnj1qEm0Jz5jEeb/5+qSTH/5uN+zHnmcVQKsty6a2gpGDy4
	YZXha0TO73js53NhYFXYIV6w9KZGINwPOIaIu9DDMujgK38s1gCL6M0gaUBQ6NefP5pduExifjEd2
	OsFFClUSZi1gob62SQKCQEv3YqqmRj8gahBCAmzI+/V5tL+xBHX91SI4erZDKjNGBpGKwq/KX4ENv
	lFyd73WxZxK+9ko7qO9k1enqg0+oblowhFsfSbBLLS5I7VTdJyhvT+FdNdP/GHnM4LIhYIO3ZgryE
	5jH5ABww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVb9m-00000004ujQ-1YiB;
	Mon, 23 Nov 2026 21:01:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVb9g-00000004uiI-19TN;
	Mon, 23 Nov 2026 21:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795467650;
	bh=rxwZ8xnQVcV8fFd+YcHOcqVoBr8GDgKmqzGHhvx3CZo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Z1uGPCbVLLv8Z1Af1t/4L+/E2FKSLCn3QqtfI/yfMHTyKfGrWfjORetd/7DZ+tLUC
	 3rw1UOxw+ADuA4SUuY3UoNy8ywW/k9iLJ4Ur/qiQK4snRwHRrUm31pfzuHJVsw45qe
	 or9x/bU6nohvkxjKpTLLtjgV6zESC2CPRLSPlu8w7WXMWEnwivM9ldoZvot3nxYoJe
	 SYPNeD+rKjRUFkUcXWVDzzHyBTgOMVywN8X8NkgOvu/Y/FF6vPBRHJlnR1/PX0ZIT/
	 DQ6NgcqzJ93qfWNgGrt84P4QUcauPKIGs0eFcdD1+ycob/2QLI6ES1+UwBUFyVzcWv
	 KBqx2TUEwQvdA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F05617E00C4;
	Mon, 23 Nov 2026 22:00:48 +0100 (CET)
Message-ID: <855103db6f4103f30c57af2f8d3fb03818c3d8b3.camel@collabora.com>
Subject: Re: [PATCH v2 1/3] media: verisilicon: stop the VEPU1 JPEG encoder
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
Date: Mon, 23 Nov 2026 16:00:47 -0500
In-Reply-To: <20261110-hantro-buflimit-v2-1-ff7790def9fc@gmail.com>
References: <20261110-hantro-buflimit-v2-0-ff7790def9fc@gmail.com>
	 <20261110-hantro-buflimit-v2-1-ff7790def9fc@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-vtIt28Q+Zkk3sX+hpprP"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_130053_054812_705E9DFE 
X-CRM114-Status: GOOD (  20.55  )
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

--=-vtIt28Q+Zkk3sX+hpprP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 10 novembre 2026 =C3=A0 15:41 +0300, Sergei Khomenkov via B4 Relay=
 a =C3=A9crit=C2=A0:
> From: Sergei Khomenkov <shomenkow@gmail.com>
>=20
> When the JPEG stream reaches the stream buffer limit, the H1 raises a
> buffer-full interrupt and pauses with the enable bit of H1_REG_ENC_CTRL
> still set. rockchip_vpu1_vepu_irq() does not stop it, so the next job is
> programmed into the paused encoder and times out.
>=20
> Clear only the enable bit when an interrupt does not report a finished
> frame, and warn (rate limited) about each fault bit that is set, as
> hantro_g2_irq() does.
>=20
> Found with an LLM coding assistant while porting mainline Linux to a
> Rockchip RK3026 board; the assistant also drafted this change. Tested
> on that board, with the next patch applied: a frame that does not fit
> now ends with the ERROR flag and one interrupt, and the following jobs
> complete. Not tested on other SoCs.
>=20
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_h1_regs.h  |  4 ++++
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 18 ++++++++++++++=
++++
>  2 files changed, 22 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_h1_regs.h b/driver=
s/media/platform/verisilicon/hantro_h1_regs.h
> index 8650cc489392..a7f18683dac1 100644
> --- a/drivers/media/platform/verisilicon/hantro_h1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_h1_regs.h
> @@ -11,6 +11,10 @@
> =20
>  /* Encoder registers. */
>  #define H1_REG_INTERRUPT=09=09=09=090x004
> +#define     H1_REG_INTERRUPT_TIMEOUT=09=09=09BIT(6)
> +#define     H1_REG_INTERRUPT_BUFFER_FULL=09=09BIT(5)
> +#define     H1_REG_INTERRUPT_RESET=09=09=09BIT(4)
> +#define     H1_REG_INTERRUPT_BUS_ERROR=09=09=09BIT(3)
>  #define     H1_REG_INTERRUPT_FRAME_RDY=09=09=09BIT(2)
>  #define     H1_REG_INTERRUPT_DIS_BIT=09=09=09BIT(1)
>  #define     H1_REG_INTERRUPT_BIT=09=09=09BIT(0)
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drive=
rs/media/platform/verisilicon/rockchip_vpu_hw.c
> index 02673be9878e..d201b058e5e8 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -376,6 +376,24 @@ static irqreturn_t rockchip_vpu1_vepu_irq(int irq, v=
oid *dev_id)
>  =09state =3D (status & H1_REG_INTERRUPT_FRAME_RDY) ?
>  =09=09VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> =20
> +=09if (status & H1_REG_INTERRUPT_BUFFER_FULL)
> +=09=09dev_warn_ratelimited(vpu->dev, "stream buffer full\n");
> +=09if (status & H1_REG_INTERRUPT_BUS_ERROR)
> +=09=09dev_warn_ratelimited(vpu->dev, "bus error detected\n");
> +=09if (status & H1_REG_INTERRUPT_TIMEOUT)
> +=09=09dev_warn_ratelimited(vpu->dev, "frame encode timed out\n");
> +=09if (status & H1_REG_INTERRUPT_RESET)
> +=09=09dev_warn_ratelimited(vpu->dev, "encoder reset\n");
> +
> +=09/* After a buffer full the encoder pauses, still enabled: stop it. */
> +=09if (!(status & H1_REG_INTERRUPT_FRAME_RDY)) {
> +=09=09u32 ctrl =3D vepu_read(vpu, H1_REG_ENC_CTRL);
> +
> +=09=09if (ctrl & H1_REG_ENC_CTRL_EN_BIT)
> +=09=09=09vepu_write(vpu, ctrl & ~H1_REG_ENC_CTRL_EN_BIT,
> +=09=09=09=09   H1_REG_ENC_CTRL);
> +=09}
> +

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>  =09vepu_write(vpu, 0, H1_REG_INTERRUPT);
>  =09vepu_write(vpu, 0, H1_REG_AXI_CTRL);
> =20

--=-vtIt28Q+Zkk3sX+hpprP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawSpfwAKCRDZQZRRKWBy
9A8UAP0UvBlBF4AVvJxBf8F0/qG7WhetKMXmVNr9eOsYgUV6JgEA8Q+Du3Q723Nr
gd9jJjAz9JO7HsTVsj1SE4sAmvIilwA=
=c0o/
-----END PGP SIGNATURE-----

--=-vtIt28Q+Zkk3sX+hpprP--

