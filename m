Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30ED606A689
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=srJempgz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFVW7YqN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZrosOMGIOcHHN3BqdFDa4C8cbxplNSyD3akiBcmH7gY=; b=srJempgzE5Luan7pkvizQsS7Sx
	dyc9g/pUb0IEMtVWmlcFuY7QntkS2JeqUXJOuZXZ/IoYd9FmcaKXUc075Gh3cEDPz+ysGOr/t3hXG
	QKMB9Gp/ioZhOXYQyjmUSN8+U1PY18dHMhAAcyRR4qU8prkfEuUuVljb++hxxGZqEMVISiEoSOJTa
	t2G7XIKyGq/xcNSvQedWiXG3lfltNDDIV0ZRpgtT31+F/mzDvUatxlYH7mmsEEloKQgQR+mRDBhrH
	cX0pqHqrVs7epcD4IE3W8/PV5iEejEQO/3dkCqkpolOHHe2BW4d8UvChS1YWPK5BMgkXDg71SexKW
	93WoH6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFsy-0000000AZHI-0RFH;
	Wed, 25 Nov 2026 16:30:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFs2-0000000AYYv-42Kq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:29:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 017D740750;
	Wed, 25 Nov 2026 16:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBCA1F000F2;
	Wed, 25 Nov 2026 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795624161;
	bh=ZrosOMGIOcHHN3BqdFDa4C8cbxplNSyD3akiBcmH7gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MFVW7YqNlbU9Exr6tC9CWOwHhJ/X1XuwjGHUaFTmtLBLQs/aLGIznC1lpbaJr51lB
	 OrVjW15pnRmqnVSe6gGEtv/D2wPnWLuyun9cgt9xpJiY4wf7Zja+/UfaxDWfHvQ1wx
	 xwCi5hhZAENQP9854cDHA8vvs+oGaQkpuLNRpRNRGCqSuVcN9HXPHRB8fz3U95xvV7
	 PAMGe+AIHWY+c8xZp6OFFyi1yt+I/bTOohayY+wQc5798C0amqAvHLH3KE7vepSTtY
	 S6dEgyD7uCLyAZqmKTfSbMJPY16EsH7pHf9Xo7Wfih70qH1f56gXM6L0X/hHQFC9da
	 nP8nvZqw2aIUw==
Date: Wed, 25 Nov 2026 16:29:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Bradley Morgan <bradley.morgan@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: signal: Require ZA context when
 restoring ZT context
Message-ID: <63d23d7a-da2f-431c-81cb-1509670fa8ab@sirena.org.uk>
References: <20261110221836.3265929-1-bradley.morgan@linux.dev>
 <20261110221836.3265929-2-bradley.morgan@linux.dev>
 <ee1998f2-69dc-419a-b388-dd4e08cc68d6@sirena.org.uk>
 <a5b278b7-9e9e-43d0-9fcb-a937d3e2a0b5@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rqQd8qHAhqzWc2jc"
Content-Disposition: inline
In-Reply-To: <a5b278b7-9e9e-43d0-9fcb-a937d3e2a0b5@linux.dev>
X-Cookie: -- Owen Meredith
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


--rqQd8qHAhqzWc2jc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2026 at 11:07:13PM +0000, Bradley Morgan wrote:
> On 11/16/26 10:48 PM, Mark Brown wrote:

> > though as the Sashiko report identifies we still leave ZA untouched if
> > both ZA and ZT are omitted from the signal frame.  I'm not sure if it's
> > safer to reject any attempt to return from a signal with PSTATE.ZA set
> > but no ZA signal frame or if we should restore PSTATE.ZA to 0, the
> > former is safer but the latter is more in line with the handling here.

> Thx, do you suggest any remedies, id say sashiko is correct, but id hate for
> code

Probably the safest thing is to add something that disables PSTATE.ZA
during signal return if we're missing a ZA record in the signal frame,
that's less likely to break a userspace that's doing something like
fully synthesizing a signal frame to return to.  We should be able to
implement that by just disabling PSTATE.ZA before restoring the state I
think, I'm struggling to see a use case for sigreturn with PSTATE.ZA set
anyway so in practical use it'd just be enforcing the already current
state.

--rqQd8qHAhqzWc2jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsHDN0ACgkQJNaLcl1U
h9C4fgf/Z07pvMy1eTwb7q1NrkNWarLQ7ksHbK4sfw59+1CXhNUbtkmmram95Cun
MPEWgl0j4Md/tbrZFEjCinWrE7UdyPVGogICUwV1+tbRHIvW98m5iIs8mGeo3yTq
1asbqdUq2qO2oYEXNLGZHoNJKihxSnsLQYPR3XyH7Zjom2YckpseTCsFhPjwCTEj
m1C45teGThtBJv4qlk36Y3yteHpBBZW/Eji8aHAiU/4JA5ddiat9VhkBvOJUBANy
jYklGetr4TYi2btZIXVkIK9ICj/sPwu894gMbNkzGsQuWVBaNsFqn2ojr8wlTyGr
3NxTIYtdgw6bwUg3HDAVIEAkUwNr4Q==
=5saD
-----END PGP SIGNATURE-----

--rqQd8qHAhqzWc2jc--

