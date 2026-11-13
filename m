Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5DC606E21A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lBczeS3B;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BlAWRyt9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+cycbEhwswLeXCs3zWykLJjiooQDa12N5+D+GVlohvs=; b=lBczeS3BwscNm5rbHUo54SLSCD
	6W6NnGDaAZ2MTfL822lj36DfpjCKcZopqc3nMeXmzZYIKmJOAhY+fzZns1Z985n6T7VBEjtdL/D+O
	jE0XUNENCp+NttOdcgEc5oM22rHyD1zoA+8kmThvY2KGfOsbT/7+k/Xr/PmoBkdIpHisVSE4Rwh+3
	P/brlwQ7UpxZiuJsAHI+n/CQAsV330RbFZsMN8e1YU3ek+hACr/g5CLGOw1xtTJPwEUpYwB3ezyMd
	eJPUtN4GvuFT0zENcRsOPOXPnkJt4+MfotM8mk8j3FGcBPLEJpR9PPWlmjZjioKTfVYtcZr3sv835
	s3RbkJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuvW-0000000DiwG-1Ahz;
	Fri, 13 Nov 2026 17:19:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuvU-0000000DiwA-2mJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:19:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2243C42E83;
	Fri, 13 Nov 2026 17:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23CC1F000CA;
	Fri, 13 Nov 2026 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590340;
	bh=+cycbEhwswLeXCs3zWykLJjiooQDa12N5+D+GVlohvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BlAWRyt9y4N6pMImSO+7YGb6aFuWf1N5xw+Saz3m/m/ecfT61/jDu8UrNaiDmZEjs
	 Sr6GpgqHYTPaa3UOE3QIE5rnK/3PrPFDoljOSdFXluj8nY3BcK/FvAfqfypHjNfFDB
	 krEJK6jW84RQ+oJ0iG6o3FsHIDA6i4Bud/jQWBmge/nH0z7skUjYyNtOkQfP5avw89
	 UqYBMsqEFed7mrwkdtXVVZiYyMxjQuFOrgUSnX6tTAip9M58CwjrjoIoUAAqQbZ3TR
	 VBqyFhtLTQLEYcqvXbLWOA+QrXf0JUR+bFRvQnMETCyKiYRAPT5MXmyD+m1PX0JhXg
	 Zpy33ag/ZIWxg==
Date: Fri, 13 Nov 2026 17:18:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	ychuang3@nuvoton.com, schung@nuvoton.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
 controller
Message-ID: <20261113-stadium-prowler-0bb8a177a2ec@spud>
References: <20261113084852.32727-1-fyhsueh4linux@gmail.com>
 <20261113085959.32798-1-fyhsueh4linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eKOVTR4HhWToRLNa"
Content-Disposition: inline
In-Reply-To: <20261113085959.32798-1-fyhsueh4linux@gmail.com>
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

--eKOVTR4HhWToRLNa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eKOVTR4HhWToRLNa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavdGfwAKCRB4tDGHoIJi
0gZVAP9nvT2zzc/A55G8N7PyXKYNDaweWMOhgMmpZ/K2Z3kH0wD/ZSR8UzoZ/Fx4
viG8gqdUBHOhXvvEBQXaRDWCciupiQg=
=Cy+e
-----END PGP SIGNATURE-----

--eKOVTR4HhWToRLNa--

