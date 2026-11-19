Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708F4606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4XR+VdFz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAh2ouit
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XKumCsCaH0lj1dxSbsxBeXzvCOozfBVKXT4C1iY5aH8=; b=4XR+VdFzyMDgsqTIZRCfI12ps1
	/d1wwRjqzi4k7yxHrmPY/ge8SOlBPwemEZ6sXPCY2vZbf/yUSXxEk3a23GINy4TWweNtIlztWz+Ei
	jW5Q260bJvsaG5brQRcebea7eOnyGYLkpRLLoJOBT8XEYZZNGFF2fyDb0wno8XKO23r9QMxovHyHr
	Q1sr+lohl13cnd8Ao3LzDDwHgVg+m/AJGFPCTn9Uf9EtAiDuKc51L3+2cXs7h702ExgJUPI/YWSrg
	DiLRjgbiXEncsE/UUpkW6eE3oQwDCXx1oq+FeuTD7/L2QE2r0fvJSHlf565bGhjC1wkVJcezYnRB1
	4iUvTJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8Ze-0000000DKga-2FJX;
	Thu, 19 Nov 2026 20:17:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8Zc-0000000DKgS-3BlX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:17:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E8B646219D;
	Thu, 19 Nov 2026 20:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAD61F000C0;
	Thu, 19 Nov 2026 20:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119455;
	bh=XKumCsCaH0lj1dxSbsxBeXzvCOozfBVKXT4C1iY5aH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HAh2ouitAFQ5kfBDvfqdyjrFEdUpe/89ciImmGG6bRtTXD28LE/6tX3z0CpBDECwR
	 fvwOEJ0v9jswcEXvtVPUySbrChR5BRJNGEInU0R6ysGxQJIj+3K1wqYWVZubGYVKfS
	 Qdu9je1lI2Nska9swcJGS8GER1FZkbzCK9z9ZxjLMEWA0AIa1nC0Ph1+R3cXLy45bw
	 ophWAN5UvLq59KrH2tIcI4ZPOLs5xLeaninEu59x9+3o34UYMsz4wlIqRxQIJMtBmS
	 wSDkVRbPR2uXZE05bNgXYjyFcOi/SXcId8Sukj7u7GRUju6WgVKR03XHcuOmVWz70a
	 F7hpN17wqmM8Q==
Date: Thu, 19 Nov 2026 20:17:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: arm64: Document booting requirements for POE
 at EL0
Message-ID: <4a860ab6-c43b-4ed5-b4b3-d831bd15b7f1@sirena.org.uk>
References: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
 <20261119-poe_booting_rst-v1-2-bbae0ab68498@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wlnQNiizsQKfjQKB"
Content-Disposition: inline
In-Reply-To: <20261119-poe_booting_rst-v1-2-bbae0ab68498@arm.com>
X-Cookie: I'm into SOFTWARE!
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


--wlnQNiizsQKfjQKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2026 at 06:02:43PM +0000, Kevin Brodsky wrote:
> Add missing boot requirements for the kernel to enable FEAT_S1POE at
> EL0 (POE is currently unused at EL1). SCR_EL3.PIEn controls trapping
> for both PIE and POE registers.

> +  For CPUs with the Stage 1 Permission Overlay Extension feature (FEAT_S1POE):
> +
> +  - If EL3 is present:
> +
> +    - SCR_EL3.PIEn (bit 45) must be initialised to 0b1.
> +
> +  - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - HFGRTR_EL2.nPOR_EL0 (bit 59) must be initialised to 0b1.
> +
> +    - HFGWTR_EL2.nPOR_EL0 (bit 59) must be initialised to 0b1.
> +

Looks like everything I'd expect is covered:

Reviewed-by: Mark Brown <broonie@kernel.org>

--wlnQNiizsQKfjQKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/WVoACgkQJNaLcl1U
h9ARDQf/cOmSUTuflIn3yOghuYacUiaUjwsZFmbPD/VKABjZujTKky8uaLd4EVWv
LppAEajdN6b55IEpLqB2VD63ct3lnse7qMLb+4vhjDB660t1OGM3cHbA/Qckgqdq
yyTKqqxhIxTKYJltSnN+StsU+94avJKp51zteYqFMV08O+jkHA7VJidBYHVahHSU
7IqEJQ9eXgcJR1xwl+PtJCzv6yUQ8Z1CLwD1eE0H/BHDqtFPFIuh72BGycdHSgDy
6+EOoytYdv8lbwRFqeKHQVY5Phe8SbEkp/cw3okfO2RpxjQN+ialT4PJmL4BYdfg
s+1hiKAxyGIGl6g8QtMLH+CKkwUDfA==
=+P7h
-----END PGP SIGNATURE-----

--wlnQNiizsQKfjQKB--

