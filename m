Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E6606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 23:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ovJE+Un;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JwyIewsN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=10FbvBDq/04YgyEUghoAbXIiLNNEnt9De+mGX9CvheQ=; b=1ovJE+UnrFrNf0kSdHDBP8eAAH
	M7xSlcQomWKW0duhko2VuRePhUxdaIcJ+QtjzlPrP8XrqFM5+IY9B1kXYW4YJVbHd8+DmERA8qSjz
	/ckVvoDWAUysJ0BDBXnOUFPCj8R+UI1PdedFHJIqwFLDBvnkxDhjaygpL/u4ulIupGZTpYtrP5Mi3
	EjEUJlXavcwYFpx1xaXcWqMuvSnYnwt6DP42xtLTJLDm6XhAtcePCIYtB/KxRGEzPwhavm1HAt1oJ
	+9NfTGtU+A6+mSWEFHfPL/bKFvKCYDUcD4XFBc+WOUXKWhtb+03NDZwSCvDRSYYj3c04btEYmf1QW
	mJf339pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZ3D-00000001xWb-1blN;
	Mon, 09 Nov 2026 23:45:23 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZ3B-00000001xWD-2Yop
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 23:45:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794267902; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jl31lSMvAzs/XqniX+ACHNNgLcxh0n7S+lz+DZr6SyBm3hDpGepwqcOki1h+cJrOeujxCTdmrLR7T0OCQs2HI1Ewjxsa99Slfot431Z6b6fhmzAZTzLVSUUYAdmtY0AfMAqeKTFlSTk8GtLsG7itieQyCU/ebpNF85GyW7uEsWs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794267902; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=10FbvBDq/04YgyEUghoAbXIiLNNEnt9De+mGX9CvheQ=; 
	b=fZ9ON26zuxGZhARbjFNbVx7i1uAOwOCPl8ewW7Pt2ECgx5HxpZrkoo7eEcXsSlctqO3NMum+6uULgxg/dofrsNkrAUezLlMuke1Vy2gPILXqDy3w0Fb29IJMUbTYSAps1zzrGcKBMock/OR+F28nI5rH+ZfdFY8fsOmNcfx5rM8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=JwyIewsNStZ/Wt2NIM9abY1PQIynbu0eW2uT+bZ2g1vmq1HDPiJTpuRYWNzOr45UWTu18xgfkPJcLBzYOUmfRchjeMwZN5bbkXC9T1tW9paT6zSOP3f1HETZ3NmSaPQmG6F1vCPD6/e5xSakmeNvaMTvIGl/nXAvEcnBfwyHQP0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=10FbvBDq/04YgyEUghoAbXIiLNNEnt9De+mGX9CvheQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794267900917859.4909486908807;
	Mon, 9 Nov 2026 15:45:00 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 33B26180313; Tue, 10 Nov 2026 00:44:57 +0100 (CET)
Date: Tue, 10 Nov 2026 00:44:57 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Russell King <linux@armlinux.org.uk>, Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: apm-power - remove driver
Message-ID: <avJZ291EhnpqMsbv@venus>
References: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
 <8560bc0d-5687-4b77-ab07-3d6dda465537@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="afsg2feyk35ak5d3"
Content-Disposition: inline
In-Reply-To: <8560bc0d-5687-4b77-ab07-3d6dda465537@app.fastmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.259.76
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_154521_736501_BC4C7517 
X-CRM114-Status: GOOD (  14.00  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--afsg2feyk35ak5d3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] Input: apm-power - remove driver
MIME-Version: 1.0

Hi,

On Mon, Nov 09, 2026 at 11:00:31AM +0100, Arnd Bergmann wrote:
> I think we can follow the same logic for drivers/power/supply/apm_power.c
> and remove that once my board removal lands: the only actual battery
> that is ever registered with battery_desc.use_for_apm=1 is for the
> OLPC XO1.5, and that one does not have CONFIG_APM_EMULATION, so that
> can probably all go away.

Sound good to me.

Greetings,

-- Sebastian

--afsg2feyk35ak5d3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmryWvUACgkQ2O7X88g7
+pqI/xAAqeRkQA+UJwRYt5dT8H6Yz6GBLiuHjjMxpo6wHfEaysnnRr0DTXs8O1hw
XTPbkvWk4iJPLcPe6lV77roXb+mVOYzK3oQLia5iMBo3JsF9SupHHfP/TCdV2fdG
ag2xTw+nWEawqiRtuSYdetqvv7KZG/LFwswuacMcm0Ab2pYbfAnjL0ppU2hRueaI
VuUQZGw/hRRIng17OAXcXV3hqW2TMP2xqRjlE/x6G0WNd1qVqg1FyrpVF1ch+cVx
KtLbtjThTIn+EktcPMS4f8S5VjcBqmItPK+D916Wj3TpX4by10KZerWuM2lwaQTC
4+SfdiwsrgAwZSKdBO5OxcYd6Oavuk6xCcbK2XyEDu7eCAYJo4kEGR8hj/KnuFMP
O/WGj9ojFN4W6xR/7f9A+JnxkH1DrWUX7ogH1Q9NKrdGi/niquj1SqMR9LYPFLnE
euisogiejfT3UfUZekMOH44svDGLHkDOwBXhQV3jYoIgizORSdv+yGNjoptUwhfO
ziczuPIQh3Q3AOFSvnvv3axZXPGB+qH7P9PAFkFIZL3fpipl3HjzqAkglDP0u4b1
/5xgy55ItIHIRI0SiXNAWgkwWAtq/cTck0wg5M+eR8PUqih8hYMX7//3gyIQSRZ3
Nh/khhBn6DIeZoSxMVOBOGShlJeruGksa5EZYV8oFx7vwOM87WE=
=BZQT
-----END PGP SIGNATURE-----

--afsg2feyk35ak5d3--

