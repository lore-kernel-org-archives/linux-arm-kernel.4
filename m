Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C1606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=quKtOcPk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMfSuEKg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fAyq4tkzqmxRwZTSgtjt+iN8WPHEULKdWMlOmAY//3w=; b=quKtOcPkgvTjgUw6/10PAdBFsa
	pw8xBhdBhrG0DTVc0pJQh1GerSiQEyxudR23JEpO8awNWXISWPA2pSV+pBa/ZldL6QrEb/uPJHPVE
	LCuExoa9m1W4inRje/nHL4LDpjsI4kQeN6ZiOU+4g+HUGruH6nxKRq3B2T/wa8sPqPpzTorgLleWU
	O08bWjDq3dKbbTAAoZxdwUieDfE6G4F/Jiu6vhu2XrqfIo7Kt2jAsE195KFGDlz1jo7Sq+YcMYhFh
	1azWr9YfFkEprrKTtBJHAqU2xqv+1V2ISawDxNLCFaIBZaVGHeGkjxtCY5833tN7jg73Pe92Ju5bh
	dzBqSyqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8nx-00000006tJs-3NYM;
	Wed, 11 Nov 2026 13:56:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8nv-00000006tJM-3jnN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:55:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C83F43B71;
	Wed, 11 Nov 2026 13:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B831F00A05;
	Wed, 11 Nov 2026 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794405359;
	bh=fAyq4tkzqmxRwZTSgtjt+iN8WPHEULKdWMlOmAY//3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oMfSuEKgxIUPOzfWqeTt/CUx1/tHmQbH8r9r0L1BxtBkFcSIorNgi4CbtCsDr0Vi0
	 djuAQLqJkuT/l9CZgm9lU8xm3FIG4nTj270/G6C6bytyYc/iZ17bzEj+ASHBon5cjw
	 tWrKnmn56rT9yyjTtwTm6CBKokvYuhQHshPU3wjbFeE6NuPDOKxjEdxZIahaXtNQ3J
	 s2woT4Hz3cUokbDkwyV/dVWkiWMiQjYwlbsamLChrsu7/ndrb5dLYfmPOcmaGjppwF
	 DTZG7kCU+YhmiPEAlgP7AhYg31m/pQjavu+WH8wn2TbVjsgSy9ZuGvaVzQV5WBYP5Y
	 Csh9HwAq9wfUA==
Date: Wed, 11 Nov 2026 13:55:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: suspend: Save GCS state over suspend
Message-ID: <82a7e8ad-b238-4842-a2d0-6a070d0b77be@sirena.org.uk>
References: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
 <20261105-arm64-fix-sysreg-suspend-v1-2-f4d9a99fec46@kernel.org>
 <282608f5-a13b-4695-aa17-f834bf5d8272@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zfD1Qgq8y+MjOF4J"
Content-Disposition: inline
In-Reply-To: <282608f5-a13b-4695-aa17-f834bf5d8272@arm.com>
X-Cookie: Do not pick the flowers.
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


--zfD1Qgq8y+MjOF4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 11, 2026 at 01:44:40PM +0000, Vladimir Murzin wrote:
> On 11/5/26 16:05, Mark Brown wrote:
> > GCSCRE0_EL1 and GCSPR_EL0 are live registers for EL0 on systems with GCS
> > but are not saved and restored by cpu_do_suspend()/cpu_do_resume(). This

> > +alternative_else_nop_endif
> > +alternative_if ARM64_HAS_GCS
> > +	mrs	x2, REG_GCSPR_EL0
> > +	str	x2, [x0, #128]
> > +	mrs	x2, REG_GCSCRE0_EL1
> > +	str	x2, [x0, #136]

> Have you considered using stp?

It seemed better to keep the code repetitively simliar to the
surrounding code and also avoid using an additional registers.

--zfD1Qgq8y+MjOF4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr0c+kACgkQJNaLcl1U
h9DPVQf/SYdpkyIvpWSWZ2vESrRwMyl4IrX9Ci8J0n7wAVYb3/YCF5D9VBccNvvz
wbdopNZDPgMdxN3dLUWgMtMFJGEc4a0iI3VkFP1y++NdTk9B730khzj8WANDmY3G
oOrrLeRvtiyi+E7OJtFcn1zWmnCGgXDjc5/UPdR/genlHAF5ofCkO2ev1yxQkLAp
l+ql+eXYI5YplhNRgZdo9wmXYzci/TVvYeBQ0+eiaje0kuvuFbOhpL384rMsEoK/
MSBFIYQ0buIySdxSUX6YXWgljBSAVAs1Fw1+6q36k9zpMPR9rt2CFH+Z+q5iGWhx
FhpS3ICdvMMjFJg66QaC+RBAB9FERQ==
=qKrT
-----END PGP SIGNATURE-----

--zfD1Qgq8y+MjOF4J--

