Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACB3606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4gXGcfsH;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=EHxxqxVH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IbXzqyxSm5OYs/s5DOQyoAHjzCFXjGWNDVZqwAmgRdM=; b=4gXGcfsHze+HA0E8+r6caMSZDe
	06YrBXL3adZ75QKvzDHalPj0HC6LBDVeVHDC3ZWecs8c7jTUO5SOn0BxN+WEX97cMmbLTcOSg/qX7
	3lSYblbmlLnREGVyKDlbts9B2uOStxEm0tu7c/u6etgJRSfexU7IPt6hOmAZLBHwgRWUpuC8823Q5
	1fwuUP0VtQr9cOZMQz7L0kHGfUd47oJsdWP3kX9zASi8Ep4kTxJ5GrRIX7J72om7qm4y6HT9ddDPi
	tT1arytSgFnLS4YSWPPmpgW3mG4f1co+htIWBTt7vsw+V2a0X95SyVmNuUNdPv0DXkB8dv9nl13Qi
	Z7+BQdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOxt-0000000DRFJ-3qYU;
	Fri, 06 Nov 2026 18:47:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOxr-0000000DRE1-0Fam;
	Fri, 06 Nov 2026 18:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793990817;
	bh=AXNSwoBw2GbAU/e+ejl9vrSOwtrW/+8L9JrQpY7FGwM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EHxxqxVHQ0EtHX+a2YfN1caR5z8H7FhejrVf/QyFlS7buHIK/BD7AM66/1lg43cCi
	 9g3RJHOWMKMdMiHE1MRQbH9S3h7SkdxW3TxhDkyZ+4lHG+1xKth7H622qZCIV6A3Y9
	 TWWTq2STKY27tjJe2pYmulSaV1E8deG9a3NLHFcD3XoHBmnHi5R0JpJtVhb+D7haPE
	 KyC93i+76kZWBuIsqUBZlNvOAo7HAOwu9/XjVGa7OjfCoec976ntb/fDiIocNXA/hC
	 8jWbL20j3b7yK7fUPvTBT/rs85CActjByxc3l4aPO+4lU6ujH2i81HCgvrLY7mUAMp
	 2trNI0oQMpwmw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34B8E17E02E6;
	Fri, 06 Nov 2026 19:46:56 +0100 (CET)
Message-ID: <0597b71f39fd945d531d3e996d982d5d3a3b9a28.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: suspend the device before
 unregistering it on remove
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: shomenkow@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil+cisco@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Frank Li
	 <Frank.Li@nxp.com>, Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Fri, 06 Nov 2026 13:46:54 -0500
In-Reply-To: <20261106-hantro-remove-v1-1-d0a4678886d7@gmail.com>
References: <20261106-hantro-remove-v1-1-d0a4678886d7@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-D7LaB+tVG7NkjSos0gfW"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_104703_402567_3B0CB9FE 
X-CRM114-Status: GOOD (  30.10  )
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

--=-D7LaB+tVG7NkjSos0gfW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 06 novembre 2026 =C3=A0 12:04 +0300, Sergei Khomenkov via B4 Re=
lay a =C3=A9crit=C2=A0:
> From: Sergei Khomenkov <shomenkow@gmail.com>
>=20
> The clocks are enabled and disabled by the runtime PM callbacks.
> hantro_remove() calls v4l2_device_unregister() and clk_bulk_unprepare()
> first and only then pm_runtime_dont_use_autosuspend(), which suspends
> an active device right away. By then v4l2_device_unregister() has
> cleared the driver data (it points to the v4l2_device, the first member
> of struct hantro_dev), so hantro_runtime_suspend() dereferences NULL.
>=20
> The device is always active at that point: the driver core resumes it
> before calling remove(), and its put only starts the 100 ms autosuspend
> timer. So every unbind and every module unload, with or without a
> decode before it, gives an "Unpreparing enabled" warning for each clock
> and then that oops.
>=20
> Stop runtime PM before the unregister and the unprepare. If runtime PM
> is forbidden through sysfs (power/control set to "on"), the device is
> still active after that, so disable its clocks and mark it suspended by
> hand.
>=20
> The probe error path unwinds in the same order. It can only hit this if
> a job runs between the encoder node registration and a later probe
> failure, so it is left for a follow-up.
>=20
> Found with an LLM coding assistant while porting mainline Linux to a
> Rockchip RK3026 board (G1, ID 0x6731); the assistant also drafted this
> change. Tested on that board. Without this change, unloading the idle
> module (runtime status "suspended") gives the warnings and the oops.
> With it, the idle module unloads with no warning or oops, and so it does
> right after an H.264 or VP8 decode with the autosuspend delay raised to
> 10 s through sysfs; the clock enable and prepare counts are back to
> their values before the load. The same holds with power/control set to
> "on", over three load, decode and unload cycles on one boot. kmemleak
> reports nothing after five load, decode and unload cycles. Built with
> W=3D1 with and without CONFIG_PM. Not tested on other SoCs or with a
> power domain.
>=20
> Fixes: 556ab0b2741d ("media: hantro: release runtime resources when devic=
e_run fails")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 26e5d5547466..8af47375d471 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1286,10 +1286,16 @@ static void hantro_remove(struct platform_device =
*pdev)
>  =09hantro_remove_enc_func(vpu);
>  =09media_device_cleanup(&vpu->mdev);
>  =09v4l2_m2m_put(vpu->m2m_dev);
> -=09v4l2_device_unregister(&vpu->v4l2_dev);
> -=09clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
> +=09/* Suspend first: v4l2_device_unregister() clears the driver data. */
>  =09pm_runtime_dont_use_autosuspend(vpu->dev);
>  =09pm_runtime_disable(vpu->dev);
> +=09/* Runtime PM forbidden through sysfs: the device is still active. */
> +=09if (IS_ENABLED(CONFIG_PM) && !pm_runtime_status_suspended(vpu->dev)) =
{
> +=09=09clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> +=09=09pm_runtime_set_suspended(vpu->dev);
> +=09}
> +=09v4l2_device_unregister(&vpu->v4l2_dev);

To be verified, but its not entirely logical here. My impression was that y=
ou
want to unregister the dev entry sooner, so that it prevent newly open, and=
 turn
existing fh into a mode where all ioctl will fail.

Can you do some extra code inspection and report why you strictly need to m=
odify
the clock states before you unregister the device?

p.s. are you sure outside of test build, that PM can be disabled on any of =
the
platform hantro driver runs ?

> +=09clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
>  =09reset_control_assert(vpu->resets);
>  }
> =20
>=20
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261106-hantro-remove-9afbc9b601f9
>=20
> Best regards,

--=-D7LaB+tVG7NkjSos0gfW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCau4gngAKCRDZQZRRKWBy
9A1zAP9MpJ+F0o5A79QzOhzIbsdNn7TU7y95lV+5Pb9oH23ggwD8D2oEfq81udRJ
AuUaySnqy+2aQaaqKRwnykGec2GDBwg=
=zRXU
-----END PGP SIGNATURE-----

--=-D7LaB+tVG7NkjSos0gfW--

