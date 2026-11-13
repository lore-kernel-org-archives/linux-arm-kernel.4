Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7CD606CAA6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SfLKs9sQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ND6ELRUp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4p3THpEBcIp0UArBHPAhIubR8JuhX2GJ/IniqwGEyS8=; b=SfLKs9sQiF3KW3L2Dz7dy08tqo
	p/HKdAHJzu1C0rqtyGJg3CiemtocF4bWICzSlIbVPh6Ix8ykz2tMG1fEaUdHCUIIuxvMGvs8Oxsq2
	Ak7GxXg46urnTrLEDTuOiwApv3rqTbGxfYtCKFpDCmLfMWuM2L8RUq9KeDLIxpCHOnMnm6ZTBW03i
	DEPyXS4tE3Nvuq6gQdl84KT6CRAZB6npLs1yMGuqJDQbTlUGzGDz7j49KBA67qZ25+ivyP4SDY5Cz
	wMtrDzG9kfOMzavEh/mEBY1qjZQw3hHmux/YdDLnsajhAPzDlRMCVt2XbDfm2UDg5Mb0QtkQvReXb
	jvpAV35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrFD-0000000Cu3A-1EWL;
	Fri, 13 Nov 2026 13:23:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrF5-0000000CtwX-3k8a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:22:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B709463B8;
	Fri, 13 Nov 2026 13:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665581F000C9;
	Fri, 13 Nov 2026 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576179;
	bh=4p3THpEBcIp0UArBHPAhIubR8JuhX2GJ/IniqwGEyS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ND6ELRUpDvvZIxxWANIRE5XN0wUEvqeUqR/UbkMq9PMjTLTMYychSKhAoIWvXJB5F
	 g5Vnmn4ctSRI3r4ov0u2jQMldosb0W8MGSEJ2/v793wfImIl8zz6KZBC4KzrEjaoja
	 NlqVoD485ET3PmfaBitJSryWIVM7YdHzKwib4lDLsWXDTmNnEfr8ooHv0878zcdzpY
	 8IEVJ8NGOK2Tl050FxGzRXIP228PNVunb2YlPQwixag22N3ue+dLzchZbUM1nAs9Wk
	 7QybcmtCssnh9+26zHLnLPGfLgklysNrSzv31hQSFRPQAKhP53D1pL2BDwUPPbHHER
	 qQ4L/IzmvCrzg==
Date: Fri, 13 Nov 2026 13:22:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, lpieralisi@kernel.org,
	ruanjinjie@huawei.com, liaochang1@huawei.com,
	ashok.raj@oss.qualcomm.com, maz@kernel.org
Subject: Re: [PATCH v2 17/39] arm64/efi: Implement override for IRQ flags
 checks
Message-ID: <0ba986f0-0309-441a-af6c-279125924693@sirena.org.uk>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <20261112132042.129062-18-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FS8ayOOBcPciFcWn"
Content-Disposition: inline
In-Reply-To: <20261112132042.129062-18-vladimir.murzin@arm.com>
X-Cookie: No solicitors.
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


--FS8ayOOBcPciFcWn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2026 at 01:20:20PM +0000, Vladimir Murzin wrote:

> +#define arch_efi_check_flags(state_flags, caller)									\
> +do {															\
> +	arm64_exc_hwstate_t __actual = {.flags =  arch_local_save_flags() };						\
> +	arm64_exc_hwstate_t __expected = {.flags=state_flags};								\

The generic version has an:

        if (!WARN_ON_ONCE(mismatch & ARCH_EFI_IRQ_FLAGS_MASK))
                break;

which will generate a backtrace the first time things go wrong, this
doesn't.

--FS8ayOOBcPciFcWn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3Dy0ACgkQJNaLcl1U
h9DWdAgAhQMDbUKY3d10iaQ1+7aMXXXpqSDWoyiZDbLwNpNX+sSAtjjBncPu3Kmf
euKSJ/NsBIqRvzHMFH6nOgUd7lT0WPgl1maPT59YTlG0rdl6FtvA/stjt1lUmsQ+
roswmE4iBMzZyhXOh+c7oTs73EFwoZwU1L1wH7+Znq6i1O3fHw9Qdu+plO6/VUIA
Rdeli/qqksobW9mFLy+Mvs7dt1Eh+BDQvN4EtmrS1SJt2OBIUleo07LMHxPDUnpl
ySOjEEEsgvijF0DUA1/NeATTjI7BbG6spd7cR+brb+kYxwEWAyTNci+Uu+jNDDdA
kjXlcAmvmzvL6kZ4Uslk2OyXMIHNXw==
=o8/I
-----END PGP SIGNATURE-----

--FS8ayOOBcPciFcWn--

