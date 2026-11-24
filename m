Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79DF606A681
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ajBBdJFL;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IawfrXj0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v/zeC8eyq6ykMNoigJa4vX8GQ35hbqzC3pORcHQ88dU=; b=ajBBdJFLOonHituK/WQIMGyuNb
	9vsHcugQnpMAv1r4aAmQhYtsHfJQ9+rxjEKwP99CJ5OktKqInfJBJLUHFlRUYMW9Twz3dmJJ+NeaR
	iFq+DBtXcJAjUjxKdGhn8PuqnzkqcD9CNuBlCyhooCyUbnVtiZEsjhLnrm59Wc734kqMRzyPry6UK
	C8D8RjnvBwcRQrYUjmittVymom2a1I1gWqc90wj1UBF3lXlhAbyUkjMq/ZZMtxIZWIw3rXG99CQtx
	oGXoS46KyxU7XicogdrdgA2+8+cFfEbu3IbLyitXBPESiI8g6vVPImyQ+JZAAl/TrG+B9MhVblrXn
	egJ+6zFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvmA-00000007Yqe-3W9b;
	Tue, 24 Nov 2026 19:01:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvm7-00000007YqE-2GqK;
	Tue, 24 Nov 2026 19:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795546913;
	bh=v/zeC8eyq6ykMNoigJa4vX8GQ35hbqzC3pORcHQ88dU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IawfrXj0A9bhAGD9kBd/giIzBNMaVyYpOJsSgqQZOkDhZt/+ALg3V0YuJAKCz5ez8
	 KoX34MuneLaGb21dy6ynWSgyzzrwtIaPEiLTv9VkA/GBwBgRYWdTaedSMhreERe0JJ
	 yMG6WMQBavwohYuPPyAXRUpvQvmXx0nTS6e/XkfFMsHKdSM6Kh4YumbfIkxzZyxLyT
	 twpNCRDmAYCPr4ln3qqWmotmTJZ4wqjnRYfQPzkCJz9QKzT7YjxQ4DOPXO/KxJ7Hm/
	 W3AdfljItE+HXhFimb73eycuAOQwccmUtao9ZiKwK+ldI8cD4kHVwJ/vTSuQx05L71
	 dkkNbwnG0K1/w==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89F4B17E0183;
	Tue, 24 Nov 2026 20:01:51 +0100 (CET)
Message-ID: <a12fc9eef54ee31cda73bc1912d44e508fb8c7b9.camel@collabora.com>
Subject: Re: [PATCH 3/7] media: rkvdec: hevc: bound the RPS reads by the
 control size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Alex Bee
 <knaerzche@gmail.com>, Hans Verkuil	 <hverkuil+cisco@kernel.org>, Jonas
 Karlman <jonas@kwiboo.se>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 14:01:49 -0500
In-Reply-To: <awDWVpqEBcOGsCuu@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
	 <bb9c44d0f56221874b105394169e5c377ef21b42.1794645268.git.daniel@makrotopia.org>
	 <6ae6d1101d3f7095d11462579a5a3313153533e6.camel@collabora.com>
	 <awDWVpqEBcOGsCuu@makrotopia.org>
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
	protocol="application/pgp-signature"; boundary="=-Zq1j3KpLxB33TMTKA8Is"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_110155_758901_2C28283B 
X-CRM114-Status: GOOD (  10.55  )
X-Spam-Score: -2.1 (--)
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

--=-Zq1j3KpLxB33TMTKA8Is
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 23:23 +0000, Daniel Golle a =C3=A9crit=
=C2=A0:
> Rejecting when the control is set does not work, as the count and the
> array are separate controls which can be set in any order, also in
> different requests. The first point where both are known is when the
> request is applied in device_run.

Maybe we should have added validation in MEDIA_REQUEST_IOC_QUEUE ... Might =
not
be a totally missed opportunity, and would give an immediate result to user=
.
That being said, its does not invalidate your changes, so no action for thi=
s
specific comment.

Nicolas

--=-Zq1j3KpLxB33TMTKA8Is
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawXfHQAKCRDZQZRRKWBy
9PDaAP9JaEXDrgjNqXnAwmBBQaZfMuTkdkQqNBmHX1kOtDP4BwEAgt7hfvp8zlOm
PSX0WEH+LwnvYvPGc8YUY/1TlMsijAQ=
=6jr1
-----END PGP SIGNATURE-----

--=-Zq1j3KpLxB33TMTKA8Is--

