Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0795606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=utOuP++T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mo2xO+ZY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6nAdsUOd3sfLiZ5il0Rjkey++jxOa1KVm/OVFeybvpI=; b=utOuP++Ts/XTOmbEvIEC+mMTRa
	9CN+nW3vOzHM20LO7MfxjCk+HqXNCEjHrd2wEpMbJ/+/w41SOd9s9LFtlVEWm+llj9CvgNBoRMg+7
	w2iNSealxkGZ5RN3X0/nnNo+i/wG92LNeRGsYilWmQ1bciWPzaZ6xp/kMzZ4qAtd5V78hnden82Pp
	uVbaR6irFyD+jY2ifUXUUY09btlJWPAtd/GAzfH50ubfSFJLL2rKESJ3NX+ve+9lv5dGmxpu34/sV
	7wPlBtSXnnYmhz9YjoIIlXn3FuWG0mrMc58iK0QrMyPz1319fJ3q1zY2ZtTY3KUQRt46HmekKYLza
	nwuqm8qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZ6T-0000000HV3q-3shs;
	Sun, 15 Nov 2026 12:13:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZ6T-0000000HV3k-1ExA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 12:13:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A57094023F;
	Sun, 15 Nov 2026 12:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6322F1F000C4;
	Sun, 15 Nov 2026 12:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744780;
	bh=6nAdsUOd3sfLiZ5il0Rjkey++jxOa1KVm/OVFeybvpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mo2xO+ZYdxrOq1t6MQZL84cjQftKeJE/GIENXYn0PQU8insGkFBGT2ua4+7ydBMOn
	 YV6tZB4gCbby9XENAeB0SHLW7dkIk8EpeD0Zsk2RRjKdCPlMoGfyeNRXsKP9xNun5E
	 dAyU2h2+QNH5AxERDAr1eUTPneTOESDp9yh7NRlUJmWZqeGjIcrjdkYUZGHcnrYbjV
	 rYUhu2Z+fMschPXLeay3giGQLt+9+cobo0UxJ+xqqw8Pwr4qwn1SoT2EgS820P//Lh
	 dLhjVRmcmYe5w+j+sVPNY3zfHFZKW5G34HcXxCXrqY/4EQiJNipCMO92kkhV8fscRh
	 cpXugzJH7QIkg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id E5F0E336AA00; Sun, 15 Nov 2026 12:12:57 +0000 (GMT)
Date: Sun, 15 Nov 2026 12:12:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Long Wei <longwei27@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	mark.rutland@arm.com, kevin.brodsky@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, hewenliang4@huawei.com
Subject: Re: [PATCH] selftests/arm64: signal: fix inverted feature mask in
 diagnostics
Message-ID: <d7ad4591-ace3-4c56-80b5-7130b9954051@sirena.org.uk>
References: <20261114081013.964933-1-longwei27@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BTX7ICWH0mABSo9W"
Content-Disposition: inline
In-Reply-To: <20261114081013.964933-1-longwei27@huawei.com>
X-Cookie: A watched clock never boils.
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


--BTX7ICWH0mABSo9W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 04:10:13PM +0800, Long Wei wrote:
> When a testcase is skipped because an incompatible CPU feature is
> present, test_init() reports the feature set with:
>=20
>         feats_incompatible & ~feats_supported
>=20
> That is the set of incompatible features which are *not* supported,
> i.e. always empty, instead of the incompatible features which actually
> triggered the skip.  As a result the diagnostic prints an empty list and
> gives no hint about why the test was skipped.

Looks like a cut'n'paste error.

Reviewed-by: Mark Brown <broonie@kernel.org>

--BTX7ICWH0mABSo9W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavmhyQAKCRAv73Ows9A4
iUjQAP9HxqvWC55RPim1gX0a2Sr/cSbCgGYMKfepsoaZAyZlCAD/Z7ytZn0cKXRD
vHVjI3eoYdcb4IGW2zHgB0nH+HBA7Qw=
=Tm+H
-----END PGP SIGNATURE-----

--BTX7ICWH0mABSo9W--

