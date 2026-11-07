Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F310606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QQB6on2n;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pd+jSCEq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uU7D09cq1ks/B8NMKh/1GkJKltkQ8t+g0nFELK0yHN0=; b=QQB6on2n6GWRQgI6wqtArIEes6
	NhXSJmqqpiEdejqe2i8ZrH7H0gQACtXNP3hWAAF4yRPUfK7ThUh+bJE2gNXDedHdXkc2TrK8Aiz6f
	LZSawvk769IqJ7OURhNecUKq2Uwf7BN3d4k4ePRbMCrGBgJquVTnzS48pt1ZLqrVm4lc+geNLSM38
	36f3JwPpMGcPi1TRljZGHhdAgIK/FEVueAG5OeZ93X2eFbYFVOYHvWQRbqgUqSNA+dg0QLXLSeEel
	XU6sYYRu+v+lIn6Mdrakxgm7cRjf7crz2UgalfkSlFGl6HO6Ihn7ywMnLmfCoB5kobtrIAFuZnDLL
	6W7yqL0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPidk-0000000Ex7C-19OK;
	Sat, 07 Nov 2026 15:47:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPidj-0000000Ex76-2Cuq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:47:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E51D143500;
	Sat,  7 Nov 2026 15:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACAA1F0089F;
	Sat,  7 Nov 2026 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794066454;
	bh=uU7D09cq1ks/B8NMKh/1GkJKltkQ8t+g0nFELK0yHN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pd+jSCEqzt+s65ZxJxE3uVJgK/iRybEl4fjTcswy42q9ilr8BxsqAZ4OlFuPvFS6Q
	 vRBHpdppI8PwtgUmH3yK3ugJrRyRiQZNFSSIlMVy65XxYKYYQ9O9lkZdDJmSkwzAxX
	 ylx8/Uj9kKz0Y1zzZrQfLTkqcO9a1sxu13YHT58UxHmYWRAWrpuHf/USRfyHz89Ysg
	 0A24AdEQe0kOHKJLVHsAE20/4d5FMjWNf3b9ea695wzg5x/mlL4Fvc2GeO4sG0hhbj
	 ugP2tfmk4WX70fpdsZ6I9kjNHQS3REWGLB9FMgapWyfqrz2AnQ2JE0IkxnnkHCAr+9
	 g1ovDnVeHeeIw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id F3BEA2AB38BF; Sat, 07 Nov 2026 15:47:31 +0000 (GMT)
Date: Sat, 7 Nov 2026 15:47:31 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Iv=E1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] selftests/arm64: GCS must survive io_uring SQPOLL
 worker exit
Message-ID: <c85236ec-26ff-48a4-b520-dd4d6761c6c0@sirena.org.uk>
References: <179330742036.2531571.12603232226357262067.b4-ty@b4>
 <20261030170046.439736-1-ivanrwcm25@gmail.com>
 <20261030170046.439736-2-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SZxYcYud1/U/NOA6"
Content-Disposition: inline
In-Reply-To: <20261030170046.439736-2-ivanrwcm25@gmail.com>
X-Cookie: Whoever dies with the most toys wins.
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


--SZxYcYud1/U/NOA6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 02:00:46PM -0300, Iv=E1n Ezequiel Rodriguez wrote:
> SQPOLL threads are create_io_thread() workers (args->fn + CLONE_VM).
> They inherit GCS tracking via arch_dup_task_struct(); without
> gcs_reset_thread() their exit runs gcs_free() on the parent's stack.
>=20
> Create a SQPOLL ring, wait for iou-sqp-* to appear and leave
> /proc/self/task (close only queues async teardown), then check the
> parent ss VMA count is unchanged. QEMU: pass with the reset, SIGSEGV
> without it.

Reviewed-by: Mark Brown <broonie@kernel.org>

--SZxYcYud1/U/NOA6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau9IEwAKCRAv73Ows9A4
iVUeAP4+wDIv2GPKt+l2yTn1w5szvM1AJDSSxh8FCFL4sNAOAAD8DsKaoTX8S+f+
D2qSg3AzHbrDA/3xom8hGlenJvgi5QQ=
=rHeZ
-----END PGP SIGNATURE-----

--SZxYcYud1/U/NOA6--

