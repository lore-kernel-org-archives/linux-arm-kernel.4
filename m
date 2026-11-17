Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEE8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/Ohb5/2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Ivsh9CwR;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SxIYDHOk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WHqfKSkp6wNUtO6H4jmQz6WHiqtvVsP+iPjkHYTZ39s=; b=m/Ohb5/22zR/6p6+mnwsNfzLlV
	mBu36N5FHsydiBVvjh1K/PVrAU0bl9SHGP0+QFhQutDb7k4yqUFRau49GpYSAq5oewgpZyg/mjEFt
	JID7i+o9laMGmz05VvgA62farjq3ze6fe85nnJtQ6tugLOaX/t2ABQpUK8FJO3DnTwBp1LDDdWlNU
	4lXi4/4yuD1J+vnRWNkU9q53tWOm5kbIPeqKxlWtN7lFKU/cYuU3ERdvmLIGSK97+cusKV009kNRs
	Nu0uJsDQfTJ2T3pmdg1A/1RLRPrRhIctnmo+1aljZB+PDEZmbqI1Zl6m/VbSDtMuVqIHzFg9ucI5x
	uuVGjqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQos-000000078fh-2kTA;
	Tue, 17 Nov 2026 21:34:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQop-000000078f5-45BY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Nov 2026 21:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WHqfKSkp6wNUtO6H4jmQz6WHiqtvVsP+iPjkHYTZ39s=; b=Ivsh9CwR8afApiuVIMnZjy8owu
	qDrKrKB1duH7+Lqakb06bWzMrRsQMh0t6GmkSaOT2NS20J5A2JQNdTW6IgH8bugqMyBACcjowN9yt
	lp97Q2PDIy3JgOxbFsJ85fYtNB5I6wlSvLQTFYrAs4xwCV5Wl103yFDhROu5VOpRnQT240YVHPBaX
	m38acmzZu/k4KfDFwEBPnvME3vi0+D3spzy76u+SuNiUXYy9rDGvuaqARObIVNywPhb1JHp6nmNeP
	0WM6wgTZiLlgbjFbfAD2dCS0VIUzjSDf7gacsMNO1ATgUr288AGnsJpQAJoc8osHXtwXg0+SqTMMK
	NB6SuWPw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQok-0000000FQgB-2q3L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794951254;
	bh=WHqfKSkp6wNUtO6H4jmQz6WHiqtvVsP+iPjkHYTZ39s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SxIYDHOkHhWEVdkJQno0c032wgCnau7T7WoU/qyfshGkKb3qpPwe0uOSEkxRqA2ey
	 tLmnSEKb9AJPZzAJ1CCFuezmUX9Ezus8bsvQagE8FWrIQ5zuKkrws94sgyylMxLMgh
	 V3O+kAtHc/lfYg8y3TisaGPNQq9CaJ5NsjWouhJqBeLv4oWDfS6hN0Km7GM65VucL8
	 hlQMvy0oIX4pJQ4Kl5CFGVcFS1pG2xxerH+isMmIEK8+ek3QJan5qdVoTg7iLfFcYh
	 Kt5pm4LRuDLcsYboYpIig0eYlDg4ERv7SvQXzMKzafz0fe694YWO+XdRhmNTl+gg4K
	 K0ayRxgYPEL8Q==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 376B417E0060;
	Tue, 17 Nov 2026 22:34:12 +0100 (CET)
Message-ID: <f2c679df52985a79ae065942f52020aec5951ea3.camel@collabora.com>
Subject: Re: [PATCH 03/14] media: h264: Add SPS video definitions
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, Michael
 Tretter	 <m.tretter@pengutronix.de>
Date: Tue, 17 Nov 2026 16:34:11 -0500
In-Reply-To: <20260522101653.2565125-4-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-4-paulk@sys-base.io>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-OS69ecpzncDB5QYJzY0O"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_213419_023833_2E161E12 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

--=-OS69ecpzncDB5QYJzY0O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> +=09u32 frame_crop_left_offset;
> +=09u32 frame_crop_right_offset;
> +=09u32 frame_crop_top_offset;
> +=09u32 frame_crop_bottom_offset;

We may or may not prefer using SELECTION API? Similar generalization is use=
d in
Vulkan when I compare.

Nicolas

--=-OS69ecpzncDB5QYJzY0O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzIUwAKCRDZQZRRKWBy
9KRXAQCIwaVBW4yRzTOVa3oNy11vsVlDoNqA6Gn9Rm2TK2NJFAEAiof90F0QCybi
Kqv+NMU5yF4/x55xlKMMSmi3SsNIDAc=
=YJWK
-----END PGP SIGNATURE-----

--=-OS69ecpzncDB5QYJzY0O--

