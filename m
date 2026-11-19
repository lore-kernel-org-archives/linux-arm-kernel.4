Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D16F606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AVgdTf/j;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aog1mzOk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wEZkBab7UqRfMrX7O5m1ZmNVlSf+C6CU+1tcpFcU1rY=; b=AVgdTf/jZGKaDugoyZ/O/kSI3+
	BYbceCbGvq3RJe6Yaf9SdxfxFZY4yaisQMG5X9F6TObulvXm+B36oCLF/AZpRxlhDwEGcZv4jTWfo
	F6+sxxVATd1WqmcbR0UuvudtVL4BSlJhYuQQkpxbp4HQ2LElfqy16b6wdxbgfi6c9uUPzjEnQeuH8
	lfmXh4Xf2C0r37ckSCKa65mL7mvRgbna1X9hBLLagshD44srLXADUk2MKC4808v1Aov/KS92OtV6M
	ryTqTytaVEX/AFGqwA7kneq4lqY6DnFzstitinkaGBSB2h1NxUpQGiCc4WEQqLu7auvbd4vQdjTmG
	7HLvEb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBFN-0000000DdXt-1u5A;
	Thu, 19 Nov 2026 23:08:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBFM-0000000DdXn-3Eys
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:08:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DD0346A54;
	Thu, 19 Nov 2026 23:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B1C1F000C4;
	Thu, 19 Nov 2026 23:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795129731;
	bh=wEZkBab7UqRfMrX7O5m1ZmNVlSf+C6CU+1tcpFcU1rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aog1mzOkqQ7jjJze7fklA8q3RYQyFc/V/VGL2lGoDxtnIEvuRiN1jtsoDOe3JR1TF
	 rVMlxWqL7l+83figGswkTV59u9kYatrwfuKm1GshDpR5KWrRUfVg2EEV3Wz60NTYwl
	 jcOHCbXM3YXCXQF/8HW0iZqbmVSHlYdW95XbbDwyzpGJPZpusVjHJ4Fw5EoPN3aJNb
	 Rny2BGnqhQtv3sTwoXa3whMioqYCykBKgAYtakYLsf3tJPDsCOnPhVx3pCjlz6jsr1
	 N8faTCTvcs++TO2e0wEnJRgfmftOoIsqgybQ/iL+p7ig+h9GHz3qDJbE4VEUY+zPYo
	 PsDcQYtr5IwIA==
Date: Thu, 19 Nov 2026 23:08:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: sound: qcom,q6apm-dai: allow Shikra
 compatible
Message-ID: <edf0e84b-9512-4fcb-8ca9-ada287d2a00d@sirena.org.uk>
References: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
 <20261119164705.1594066-2-mohit.sharma@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IUg61mMA2sBAk5Yq"
Content-Disposition: inline
In-Reply-To: <20261119164705.1594066-2-mohit.sharma@oss.qualcomm.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--IUg61mMA2sBAk5Yq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2026 at 10:17:02PM +0530, Mohit Sharma wrote:
> Shikra's q6apm DAI needs a SoC-specific compatible so that the Qualcomm
> SMMU implementation can select the identity domain required by its
> firmware ABI.  The ASoC driver continues to bind using the generic
> fallback compatible.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--IUg61mMA2sBAk5Yq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/gXsACgkQJNaLcl1U
h9DLegf8Dmpq6RqPrhHE1XLwNIHftQu0DFDGB1QevWyLOXMc+yCPYPFwtNjtCP41
/iRlczHbACudNwezzaxEiZ/NFXHV4PUWctEzx5LROtVcpDAgOJMIRtYgWTNixBKP
6ZwVa76xyyDTmVRKgzGxTn4tJdwSHi2KFVTHT/FRktaQHUUpbbVDcqHZ84eMKskG
HamZ5V8UEypMC2xZXpGh82IobL2yhOjkTG3gQQlJT5xodnWg075N+II3lGIv1a1a
QZGP1LbjEy75eyXuXqkxphAqZyagRGXCvS26O9++t3D2gK6nqaJ0QRtaUb+MvYZB
B99IzWATW9svq8SLEUNiiMpbOKZPsA==
=0Oos
-----END PGP SIGNATURE-----

--IUg61mMA2sBAk5Yq--

