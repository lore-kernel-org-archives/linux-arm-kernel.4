Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D98B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 19:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3pYW/emw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=bwv66n/7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2vAuMlSfZ3La77VPM2CEp66r7POvKHZi3ESVttoiAPc=; b=3pYW/emw8BfA+Jss1aMjfCcLHb
	dGwnz1aH7ALoZosXoPgl7zMDsw5dHZZQEiEzSAAVWefEDtEXmZnAKoc4BdpgZvDI42RokjkJJtatI
	aqANtYmAmXZSK254L5CpuJfG5eNzS8m9Mz+Z6XCl5wu5nnAnPydB+8KY5e2F2Sh7nSwzTMhHtAFVy
	PgGq0Uw+w4GqERzpEkzC4GWUv7h1tkli0vCVJUsq/Uszy6dS2iWVciHItUdLplcC2C0uYeqlRq2qo
	4j++hcrgiW4RU5cVb3UqQJ+rgGlJOqDjKQ5sYAeT4ZLbJmFYACgYli0C7fUOKLwgLA9pmr9YjPnCe
	omzjDseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8mz-0000000GXoq-1wQ0;
	Sun, 08 Nov 2026 19:42:53 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8mw-0000000GXoL-10yP;
	Sun, 08 Nov 2026 19:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794166957; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fx5EKhiNGZaS7H2N8S2+3VKx92L6x5drUiI97HpS6yXAeBgCN27tQPTKXs+dFvlhezU0wIJoJYx2edd++Ttf2og9syoviXBhsua2tMzmrXxIflRK5xTIuH4HY5QriPimnaQ2v7K9PC1pGkeKgUZmp5oBUCGzA0avGeHsr7solwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794166957; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2vAuMlSfZ3La77VPM2CEp66r7POvKHZi3ESVttoiAPc=; 
	b=km0YDTE7uN5XojBHeBmnIL2YCPCQolMgy0VVNjqz95yAxAdha0HfXOPj0rDtoz8FiuhbkLoxANdKsBLllsVblMVEJae0KPw67h/E8XsjK7fZzZHrRJYB/UijnFswQvyEQXSOveHucwAfapiEK56YPUZJVU3VTCOzqX3/5siEszg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=bwv66n/7pRGXrruhl4okDCFOj/507ds029t/lqWrcIstUiYj0w9F/M0K1k/WmOfuZ2fLTe3rFmlV1oYksPyfuoYS8Y3J2DktbGqYx7Bvanv2vanz5qykTydNTtBqxoVFkUu0NCpQilIzpV1POaU1Zzi43AaIA9H4oA/2nYEHfTE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=2vAuMlSfZ3La77VPM2CEp66r7POvKHZi3ESVttoiAPc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794166957139744.1075829700292;
	Sun, 8 Nov 2026 11:42:37 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 646E1180269; Sun, 08 Nov 2026 20:42:32 +0100 (CET)
Date: Sun, 8 Nov 2026 20:42:32 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
Message-ID: <avDN3pPY5Qwt9B1p@venus>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
 <f066ac3f-1720-479b-a2e9-198a96d03dd6@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rqyodbh2oilyf22x"
Content-Disposition: inline
In-Reply-To: <f066ac3f-1720-479b-a2e9-198a96d03dd6@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.158.93
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_114250_372519_1DE103C5 
X-CRM114-Status: GOOD (  22.03  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--rqyodbh2oilyf22x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
MIME-Version: 1.0

Hello Chaoyi,

On Sun, Nov 08, 2026 at 11:15:09AM +0800, Chaoyi Chen wrote:
> Hi Sebastian,
>=20
> On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
> > The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
> > combination. It contains a Wanchanglong W552793BAA panel and a
> > Goodix GT1158 touchscreen. This adds the DT description of it.
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++++=
++++++++
> >  1 file changed, 90 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/ar=
m64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > index 6a95a8bb6fb8..327ca13b60f0 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > @@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
> >  		regulator-max-microvolt =3D <12000000>;
> >  	};
> > =20
>=20
> I seem unable to apply the patch to the latest linux-next tree.
>=20
> So I tried to resolve the conflict manually, but the actual
> test screen did not display. I will look into this further.

Strange. The base of this series was Heiko's for-next tree from
Friday. No RK3588 EVB1 patches landed since then:

https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/co=
mmit/?h=3Dfor-next&id=3Dcabb6811c38a46337d5f4252b4dc390f9296856c

If your board uses the original Rockchip bootloader, which shows a
Rockchip logo on the panel, you also need Cristian's latest YUV420
patches that reset VOP2 at probe time avoiding some issues with the
pre-initialized panel as a side effect. Those were recently applied
by Heiko to the DRM tree, so testing on linux-next is indeed
sensible.

Greetings,

-- Sebastian

--rqyodbh2oilyf22x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrw0JwACgkQ2O7X88g7
+pq8ixAAjKLCZw6Zhl2DngJdt6ctyhcz0S7zsA5EDQfjmBK5L6dudrpvkubLCVNN
cRR9rNITo97cByiq8PYW0zOtEjcNIflt2C2WbxW5NZKML4FZx5TeA9sgDdW7yOIv
F+bxwRSh3Genjcnp5rGB+bfj2Iqud83MdVOnbNgytkTcX62QxMzRko4hr35Wu1xb
K6Xi5HDztSj6O4cLR8wOoIy0XDsTtQ1Cd33ekzjgbJ0fIebq0KVPQ/7fUB6Gozzx
ga9AQlmt20NxA0DlUrzKK8iArbhFZ4vJUtrXyXufVd07xSI/e+7TBNRW46xnRuHy
vlr8zJZ/JMpvsim5h0Vp9OrWpb7kcH5vZuslqGZp7zrkdZ0hK8gZTgYSTY/SC2VQ
ka7mjChnNFqXw6meZl/bcE32ejAlhtiFRtKg+W12VhjsqahlGg+R6ywIxYEPTuki
1Ux5z8XG2uWak8Z36OkjHnWfAKhlP2pfV6p8OkJeYabXW4pYEMgehIBy1JzlTmGG
Qrvj4+0AFN1iDUm31zMY5z8B62DsZlI8sRkFgQLPnR91BpxCU/zs2xxPvF8m6MkW
xIK2NkjwqVqEC5qi+eQwU+2A7yMxgz9zfrFAtJ7HA564P1z1GNUt8OSgbRHVNfwZ
zPa+Onj5dUwtFqtv7L6Rap/CK4EuVIzfPUThV12ry1qfe4dgVVQ=
=5c4C
-----END PGP SIGNATURE-----

--rqyodbh2oilyf22x--

