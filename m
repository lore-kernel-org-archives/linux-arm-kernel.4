Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9A7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mZRmV1kk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oL7MWMs0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+2Jiq0w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mZIjSl/6dyPO7xcK3i9ocK4466rMnfHhcIzCnMUr9CM=; b=mZRmV1kkjy4Pu+npKOaQF1Z+gY
	qjZHYdkCYdBxAoGHHc5Ad9KTLmN44MQMjaOa/uv8vZT+0pwp4i3pW1wN4ar9y0XOJF8PRRowIakT+
	uuADHmoh0DLWu3TDEB4Y4YF0zpZtHVoDPeMcdJMkCg9i0591OdBg4xX/g3jlJPsLgD1JBhb+4iGzI
	ztqhJKH+w4OS2oPQoibCXOnTIpYQlMZo/OHG0VbDmYmWZuKmiQkhOjB3Z0tIVk4iX87n97+sQrde+
	T3lm5Hoko9jVE80pZl3YL49zCkdezWv5jiS7SLRBRB/POvcvLfWUNIzvRJQhqLybAbTUgLVu6kVDW
	4T9mX/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPt5-000000071Xe-3aOv;
	Tue, 17 Nov 2026 20:34:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPt3-000000071X8-1ZmP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:34:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJY2gs1700809
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 20:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mZIjSl/6dyPO7xcK3i9ocK44
	66rMnfHhcIzCnMUr9CM=; b=oL7MWMs0eeXbE5b7oLTpoNhUZCCSK8bHHhruSaU7
	BPBdBF8mWzMLEWzguZLAINIvYbWBRFITWRI5fh+QCUk0o4bqyCF5IgKDP0zYI9ms
	VJLQ699LUUFVzhsDJs7aa3dNktELq3rpnqFm7DyFHPJo11cpVUffLJUorZBHdtmN
	YrsWHuYzpit6omz3zDpmwgz+KdR7GwS7t34Vq2FJy4XV/BXkYENC0qg1LC7lIJqZ
	rgxjNQEHunt10tg6IPmq/fTMVwbAU79+kxoA8WHmwxa7PO6dCHZ6+g0fBWUgb2a7
	OLvRSt6xxjcjtxCgmPLG4VhLmSCwalnH3bz27Pupd3ASFA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t1dpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 20:34:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-998a2b06e4eso57058241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794947680; x=1795552480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mZIjSl/6dyPO7xcK3i9ocK4466rMnfHhcIzCnMUr9CM=;
        b=W+2Jiq0wZuqKReXcM7nxJcK9xK4+Nz37+ZwYLbLUndIEZrTxGlOw4hQLZCR5X4ghDR
         tSZfsnVJ81vlZAYR8S1bQ3m/uSRucUghYwSjq+wiic7/ZJdPeRtN9DEsFphVfbSXGNyS
         OaqwXgtmWi0B3TmO/iH2fci74D+HQs6q/7558sUYQlr3HtwpT+I251WoqKink5wLdnva
         7Ip32nU1Z3CRkjLN0zJ3nfmsjBqMY8gM3LOU6SVTkt0vks8l+A3aNe6fB6cEcKn30g+j
         rpf/mngxpLRw7JHa7rtfcNAEzXD0OyAJ/PojxW4NLZMwApgKB5mIhZfraZinKlkNP23n
         wiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947680; x=1795552480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZIjSl/6dyPO7xcK3i9ocK4466rMnfHhcIzCnMUr9CM=;
        b=m07DSfcGngxndZcFtLuk/J5vMVdZPPaEFCKZA5L/ENAVDJqHmwkCAz7osYm/RbPSza
         3X4hlBPxHzumozDm5O2K2zq3AOZb9EPikDlmRXhT3+jnUPwZjFGf4H92w+H0LdrcJH8w
         HvDtL/l3O0w6TzX4DpLWU+qh2boM26UXfbNI29O51SCmdPND4b0lW5PnineYG93HhBtJ
         14Nj+m8WjqHybRlvFDBX8kYBzWpZOSjz4hYX9OlDd/F6rEBP6LwyeKMFOpSiIoTw1p2e
         HONtEXdWTtGtf/k39ipF0CB+DpUkEg0MFGnXtV5rYT5R54eB3LwFqXT3/fitFLpKD4B8
         40rQ==
X-Forwarded-Encrypted: i=1; AL+hErG1SmSGqS/2KTGlfNdPTj/OxXL0afx/UTDbw24JMxT0buCus9Yuj6sWQlCsUof4eROZQ7jvkTZ7auovROYSU19U@lists.infradead.org
X-Gm-Message-State: APuU4Z9uN4zAfcmLtDHShm4x0dMTQS9rIBTOsn1zkycqNFPinLf3TzpI
	QMmCAqOZwbOHAxrg4secwvpSmJxnZ7SYFoNEkFoPl7/b3asxnZmbQh5Hrt0Y+RkLcrE+rUK+iu4
	KqqF9goMKLgzAvK0vVoBAIMcgGVeUJBsneBAebLiWn/xtEZIrGTt6YRfhS59Sy8XniWewafpC2j
	++LQ==
X-Gm-Gg: AYBFou1CX6DNNeFArRe3AdBElz4xsUyoB6Z3Fbmm12X4H6zbFX7Fr4B6ybI41FHx0Lf
	nsn67X41fctuMkmLaV9DJSL72KZQ6QXWUoEBUO1SjN3ZFQdShvEAjlK1ZPzmrswLwWsDxVz3jWl
	zi50ief5XR3Vx3DiLT92wPIcdFR3Ejcc4v9Y0e13MmxHL0/KV7SGZJRXyCy1N07HzuRcVHgOX5T
	8fGtX5CfJtiO2wQ4kIeRccQgDVKJDGB8H8F4Y+um8V0iofRYDTzdFJGrEiWfFUOz75OfDlKncdo
	1lKvvbEvssZFY8+FSsWiWeGyQlQtt2chcVI6Yr8Z0FLjXR+3XqNSlA3uiu7Peuz+TZ/8KzfRDza
	tGMjXpQNtE8kcF8wcJfYqI2bAJ8/5osNNkxRAQ3/xRcphGUSbc8JS5Bm83QbSws8=
X-Received: by 2002:a05:6102:1608:b0:7c3:72b7:7fc0 with SMTP id ada2fe7eead31-7d6ba3b91edmr61859137.13.1794947679647;
        Tue, 17 Nov 2026 12:34:39 -0800 (PST)
X-Received: by 2002:a05:6102:1608:b0:7c3:72b7:7fc0 with SMTP id ada2fe7eead31-7d6ba3b91edmr61837137.13.1794947679066;
        Tue, 17 Nov 2026 12:34:39 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4e670dsm10938425e9.1.2026.11.17.12.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:34:38 -0800 (PST)
Date: Tue, 17 Nov 2026 21:34:35 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
Message-ID: <avy6WxJft6Aex-oX@lore-qca>
References: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
 <630b9651-3963-4686-a51b-b670beaa45bb@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uhqeACAWVMDeZ6jG"
Content-Disposition: inline
In-Reply-To: <630b9651-3963-4686-a51b-b670beaa45bb@bootlin.com>
X-Proofpoint-ORIG-GUID: MGNtfZVp0612DeuFdbsFWDEwPnw1ZAyk
X-Proofpoint-GUID: MGNtfZVp0612DeuFdbsFWDEwPnw1ZAyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX/VVILlzxq4wO
 JPObQGdIqXQZLc79l7bEreZk6aBboDHtVPc/HFyAOepE8yWjOKHNVgpZsI9NFLdxl+dPqw0HKhZ
 Pb1FJKyi2Ak8kjCZMcZNbgMsoJp8VsMEE++22eG4Uo1DomBoDrF91az4bIDgmuThZjvfUklS9Ai
 nnvJp8VjOF8n+hxlFTrayHjrMligySnqi3r6tJRPEF9q6Af7BulxbSZM8jFiJ0JdjzfF9NuSBSe
 xDefe9YZavClgb6/+znGZeehaAb5/8VQ+TyGbheYe9LYTeYzjLK5YKtzVLv5sAuv1+U8mPo8xF/
 /QpPyeJcawDA0kFLcjMfmnrihkb3Qi57HrBtc6qyoco53cfZOkZbT5Pl1upLEs5E/EXC1YdS4RN
 amos6l8YNOurnoVPrkvN2KKmBKApmDNf5gtddNA5dWYluWLIKzmfDtgGFwinG+PFYLQSNG+JV8h
 yxTH39wfrGSjwoAVRyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfXzg47J8kCdGK5
 VUV2NJcGg6dkEFYHhnOX6Eg3WBJKTU4N1sDvez+Mxnuih9LcjdEI42EK+ghh0dBKsy+FWDTfDvP
 GW7kiCsI+1bmne2qBa7OBKhmOuhiH/E=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afcba60 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=9R54UkLUAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=ui44w_YjaUHB-fKmfF0A:9 a=CjuIK1q_8ugA:10
 a=dSt14DRd3il9wOMU6T0A:9 a=TD8TdBvy0hsOASGTdmB-:22 a=YTcpBFlVQWkNscrzJ_Dz:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_123441_423027_AF0DD0BF 
X-CRM114-Status: GOOD (  23.57  )
X-Spam-Score: -2.8 (--)
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

--uhqeACAWVMDeZ6jG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi James,
>=20
> On 11/16/26 01:49, James Hilliard wrote:
> > The GMAC, GMAC4 and XGMAC rx_ipc callbacks return whether checksum offl=
oad
> > is enabled after programming the requested state. A zero return is
> > therefore expected when hw->rx_csum is zero.
> >=20
> > stmmac_hw_setup() treats every zero return as a lack of hardware support
> > and clears plat->rx_coe. Disabling RX checksum offload with ethtool and
> > then reopening the interface loses the saved capability. Subsequent
> > attempts to enable offload are rejected by stmmac_fix_features(), which
> > uses plat->rx_coe to filter NETIF_F_RXCSUM.
> >=20
> > Only clear the capability if offload was requested but could not be
> > enabled. Keep calling rx_ipc when offload is disabled so that the hardw=
are
> > is still programmed with the requested state.
> >=20
> > Fixes: 0f280e4d23c2 ("stmmac: fix the rx csum feature")
>=20
> This tag doesn't exist :
>=20
> https://netdev-ctrl.bots.linux.dev/logview.html?f=3D/logs/build/1212156/1=
4986330/verify_fixes/stdout
>=20
> Besides that, this is legit. Tested on AgileX5, CycloneV and stm32mp1:
>=20
> ip l s eth0 up
> ethtool -K eth0 rx off
> ip l s eth0 down;
> ip l s eth0 up
> ethtool -K eth0 rx on
>=20
> Without patch:
> ethtool -k eth0 =3D> rx-checksumming off
>=20
> With:
> ethtool -k eth0 =3D> rx-checksumming on
>=20
> Please respin with a correct Fixes, feel free to add :
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>=20
> Maxime
>=20
> pw-bot: cr
>=20
>=20

Reviewed-by:Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


--uhqeACAWVMDeZ6jG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavy6WwAKCRA6cBh0uS2t
rF/MAQC94F9flu7V6ymO/GXi8P606jehIfn/ClLwmubRWdBLwgD+NBZl2irSTcCd
Ctt9MnmK8y9WyqY20+Ps+VFO9H9BxwU=
=Jn6z
-----END PGP SIGNATURE-----

--uhqeACAWVMDeZ6jG--

