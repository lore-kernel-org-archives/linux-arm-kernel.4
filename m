Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C10606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qfg+CRkH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrfKL6M4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r5MRcDBiVmaF56L+TKdfQuiQz5NKLJ9vn1bExQarGUM=; b=Qfg+CRkHRgYA/91DQtTPtsp5Wz
	XdmG42KpzYrXZX0qw+d+lM8wKByovSeND0ULLb/JF4RbtEdiNViZzXbzi0MvFeHjRP0HgvqDXyBxp
	8V91ZUdaaU9GQB3NI/p+vmoiZSnCxbdAjM++yuplE925yC97uFte32Kr26MpWIkHuRU+NnIhULM+0
	T/3I+yN573T7hJGYs0gG5Bq7pQDbcmX1KR4qRSk0QTFTkefJebwcny3MAHO3unLBhpapTyrjP0Tlf
	X+whhbaOG+p+bg/5MEcPSxKlkeJqFiGRn8/9C+IveXpaPDTvnFq4qV+kWdhKnboGNCc3qdiack1PS
	70R2RIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNZQ-0000000DCJh-3s8N;
	Fri, 06 Nov 2026 17:17:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNZQ-0000000DCJQ-04Yx;
	Fri, 06 Nov 2026 17:17:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E63D601E1;
	Fri,  6 Nov 2026 17:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF331F008A2;
	Fri,  6 Nov 2026 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793985462;
	bh=r5MRcDBiVmaF56L+TKdfQuiQz5NKLJ9vn1bExQarGUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TrfKL6M4oJRQqos68GXQIN7AcGk+DWkz8zWAS7/KZvuznWo1i9oGVyh66eComALbg
	 T1hIl6D9DwBcUg2sgUP7yi17lnVVFfsXkCvoI/pVvOOkss+Jynq5+fsO4u4vgHJyfZ
	 7YZS0r4iEHPhMlOPPXeb4dBlM5TbSxWhX04DOMPk9mjMVK87dtA9v8ne/E0bOP89bu
	 yE9tHTzVN6oabAL5xxw644IiIVA0lVTsc2XqhCtlhN5pCBifEw8NzxthOHTFzgW/Zq
	 LubknQw9I+yGzXbcuSl2QEP1860EpgvVSPXh6N/EJTXCAwGota63PqI+jyQ+YfF/We
	 nXh/wH9h8eXyg==
Date: Fri, 6 Nov 2026 17:17:38 +0000
From: Conor Dooley <conor@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 01/10] dt-bindings: arm: amlogic: add the Amediatech X98Q
Message-ID: <20261106-ozone-unmoving-a5257f140856@spud>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="43L1C2jAVesbohaI"
Content-Disposition: inline
In-Reply-To: <20261106104659.54656-2-christian.koever-draxl@student.uibk.ac.at>
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

--43L1C2jAVesbohaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--43L1C2jAVesbohaI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4LsgAKCRB4tDGHoIJi
0h5wAQD2Yv5p6EduM10yQbI+tmUxAN25JQQ2BJgn0EhNGxZZMwEAvFWm7X7O6pq8
Mkh7MwdDFZhBwElG6hSMS8g+UrLoHAE=
=7hXq
-----END PGP SIGNATURE-----

--43L1C2jAVesbohaI--

