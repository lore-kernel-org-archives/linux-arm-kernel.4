Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B4B606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rtm5y1JB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WOK5naCi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWpvkvvi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vBPOLGbjQHm2dEs2LFQcVrcZ3yp94sR2RDaK/4V+R0U=; b=rtm5y1JBMizj0/gmNZgbcDZx6d
	Z2s1NzmEJoFnal/l6omiKVuTxsuayoyr5+qc9MPkaAEYq44sOjnbCex2XSk8CztrikE/uioHC3AYT
	71SXTLDg3ihn43FzlF+wPH7mSX2r6DUALF/LwCkZ/0Yvz4IcobNsB7GwMHKZV4M9JRSD2O9/7IMT/
	0NCsCPLQSYr24ZumyzLkNMzwlkanf3CeKsqCjFHQu2p0hphqCuvf9s4AT+oi1hAin/CD2RRtXAKlw
	KO3nE97SYteZ87SPncqoAAGKxO+69HuNyedmGYUyFqTiQ2MVIVefnf1xmu+tzvRX2OoGnnOhYiDtn
	T2taV5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTL4c-00000006ILu-1Y0Y;
	Tue, 17 Nov 2026 15:26:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTL4Z-00000006IL3-3mIG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:26:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0khU1457248
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 15:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vBPOLGbjQHm2dEs2LFQcVrcZ
	3yp94sR2RDaK/4V+R0U=; b=WOK5naCiqB7oN+BcYiBV1TTMRGwYxJjX6kguGQBp
	UVLtobmT0q49Xys5cMtJvKuWcFwTI2zEOw5DLGgBkJNN7ot4WJDTh7V2Ce5qlKSe
	sFI5cBonrDt0QwwMZnAd+tsTvElLZ6+iJYVNN8liQ+Q+04r+Z9jj2HOv9WFunqYr
	pPqKoNUhb8A69wNsj64wfP7G3UKgT87rr+dxzG8gs5XlG/P9+M5EWJli1b6q2bX8
	9D1L+56I4dkkMX8kTXP6WDAi6D8YIbl+t++WOgdHLzARJwMsnxxW4iQ/BvvzjiI8
	L9dEmvGaukugxvux0TfPw4SOgRv1AGtruP/PYzwHo6ffoQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc8179d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 15:26:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2c415bb8fso541211137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794929174; x=1795533974; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBPOLGbjQHm2dEs2LFQcVrcZ3yp94sR2RDaK/4V+R0U=;
        b=IWpvkvviVFvVO1M27dEZFQeC7tA/BPks2Ne5ydWOl4WBHOBgFL+xtfoD6yl5/kPHXj
         5WH9MovlfJyx4bfkeCPufT9AR6zwtOrmvyNEvRD7iin+lSvstbWdM+GMsy6yDhyVesmw
         7hSuAZDGkF7DYuuumTjfAuDE8Gv1R9XMh/aNzQRj3ZZXl15YWkAIvP/DwOMS8JWKaaPe
         yHTLpmQ/vSdmawnQKoyf4jX6R16TSemaaMuqBF6yGYKed4abisUgZewjR4Owv2AA5CKe
         hPj+VSjvaGkDpUPDb34TVhWBh79HAthB83rGd2QuOnRn2pG6MAa+2g4V1rS/J5PEzRMd
         7khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929174; x=1795533974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBPOLGbjQHm2dEs2LFQcVrcZ3yp94sR2RDaK/4V+R0U=;
        b=HfT1J4r30STfNGlHog4JD64WS5cfYPNiYK7SjF9vqkUXZnPlBUx+IJOKvlEU4ShjS2
         S5S1j3jYZrb5pTm5WphB26yAmYVZl0e4aHaQcZfeiCjs5Gh0HCOl5h+TNT/Je+IRvygl
         /eKPmzguaJwFIxBpsDtlOz7k07ZTO3JDUQ5oxdqAmVVxqn7ISQo52qWFMS2JzH3bC9Yr
         rUqx2Ps0fx814m9neXeTMRe1qUf+gp+A5HJHOZXAKLUq3YgLB5PPT33YSP+LJvF7972v
         qv4dXFVlxA8fKj1MvRj4lze8Nq780QupjRvS5rC9HBnPZJ69qnBv11PTKOFDFyqxXZNC
         sOrQ==
X-Forwarded-Encrypted: i=1; AL+hErGUhyJDM2BysvkepnHcVyvTmg0HKd1HHWcfBM4mGN9fAeLbZ2iifZydkRxnpNLc26tusbw+bMnrV8iL+390A9zK@lists.infradead.org
X-Gm-Message-State: APuU4Z/1wQwfEXhTZepVJOreluo9AvxB1UNFkNaztMkObFBkhJ/YT0sS
	NrLiyssE+jFxbQzmRxPHoL5LGITLLQ1Oxz8XY0LnqPhdDprPj1Open4BPUqcoufC6Hhwnm65N4s
	Euqzxv0jzwbSidotoZeFmswvy7lCzTo3bUTglfCK3ZENkI6IBryJROAM67Musg5S99yzVqzPRig
	aF4A==
X-Gm-Gg: AYBFou35GYgkrC4XGSu+tqxn+UxMX4YeGzmsvTempZiirBf4Wab913hND/xexhuILNR
	HXgR1y3frc3bgHIFD2ZA/k/xd0exxzLDNuNijLJW4MDnd/GgAF0CJ/5IqHtEtJ4Pi4AwFIZ0aeJ
	a3jGgIOzS8Fbx8hZ7j5Ynvr5XeDNzoQ7qk1A7CHpRtYadryW6u0wIYRQTdiqRS/bdvNwkyHpEC1
	qqs/PfwBvifjqOIgaLv5wLyp8cKImKKZRh3JtVzcEE3lOGNmqzdFAwSPNwypVsSUqzUxmafY+Zr
	KUhqW9FrB4DDyeFFSGm9jf2NrW3qXb0jaOUc1HdnOAYd6yDo5stHVr1boy1dwqzDfKM5KTygemQ
	6ZdTOprfk0YiJ10giSj15sLSvshvYW96eiEdSQooU7/f4MibRVy9ckl0tFWddYnk=
X-Received: by 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr3870740137.25.1794929174027;
        Tue, 17 Nov 2026 07:26:14 -0800 (PST)
X-Received: by 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr3870721137.25.1794929173461;
        Tue, 17 Nov 2026 07:26:13 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm82176765e9.1.2026.11.17.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:26:11 -0800 (PST)
Date: Tue, 17 Nov 2026 16:26:11 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        LABBE Corentin <clabbe.montjoie@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
Message-ID: <avxyE59XdBkdK0Jc@lore-qca>
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <a1efeff8-2963-4859-bacb-55fdc1f5370c@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4RtWT8mPemudz8XJ"
Content-Disposition: inline
In-Reply-To: <a1efeff8-2963-4859-bacb-55fdc1f5370c@bootlin.com>
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc7217 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=fy4Z4mAkg3wtpZJeIqMA:9 a=CjuIK1q_8ugA:10
 a=AU2tUvvXhtKScF8-c3EA:9 a=ODZdjJIeia2B_SHc_B0f:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX4pCxbvCS0S+8
 4JN5kaNWeCt8BIL3wtyqoicOPCw7d/PstLQ3FAW4HRuxyClMqKJNdxn0x6vIDqObdoAOmpDoRbl
 5w6n1ODuuHENolFztUVd+ukkNzeKeQQ=
X-Proofpoint-GUID: CJyH2nW3HEuPE8rLBcqg5FpfeBSRU85d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX56mMlboynEUx
 s3yejiGNfPRFPLue7iYX90SROFy2zeCcnvOOauHj8X4VLsC+LHlRqkFElY0EnRhiT8i0o7EONmd
 2/Y3SxFpj9tdqT46DFulgSe1cKWLuz8FPChY7FxkdZ9h45PyAzx67XlObaqfrDX/SDgoXdPdEnQ
 jcfEZuMBlhjY5WygLtD917QjfejPC7zgIEdf2pd6vSOjhnVFFTnHuN5sejZFRYwVP9Px729vXvs
 SfFfx9Mts0yb4AcSCYA+rJf+wCA3Zf30sKyOX1wcy5ET6WY4a2N0IMlV7GcBtd1kez4rKGQ0G9V
 VBUkqJnn2KpvvJQ4hg0Ed17r+ZYwLrFPD7nGMU/UTpuZbVrxs7ymfoOrRCg1xkgpOtBY2JjTkLZ
 KfkaebyxxjqT56UgDCv9brJRP16Eo2fQCjx7SKKWFQw02j9IYbxIlPniN81HkuV9AK0sS+Etcrn
 6VEFgW62tbGlXXwZzsQ==
X-Proofpoint-ORIG-GUID: CJyH2nW3HEuPE8rLBcqg5FpfeBSRU85d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_072615_947493_16B5CC87 
X-CRM114-Status: GOOD (  18.30  )
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

--4RtWT8mPemudz8XJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,
>=20
> On 11/16/26 01:58, James Hilliard wrote:
> > stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> > disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> > hardware checksum engine. The MAC therefore keeps dropping packets with
> > invalid IP or transport checksums before they reach the host, even after
> > ethtool reports RX checksumming as disabled.
> >=20
> > Set or clear EMAC_RX_DO_CRC according to hw->rx_csum so that disabling
> > offload leaves checksum validation to the network stack. Preserve the
> > callback's existing success return value.
> >=20
> > Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>=20
> Nice and simple, I tested that on an orangepi zero, with an allwinner
> H2+, and I can indeed see the difference as bad chksum packets are
> dropped on that core.
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

>=20
> Maxime
>=20
>=20

--4RtWT8mPemudz8XJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavxyEwAKCRA6cBh0uS2t
rCitAQCwtjLO8o2NUJzAsuBjPyc3kLWkrELN5vyl2FxMXkSmiwD+NtH/Z63B68b9
5KXnXA59zeSZCmCwsKk9CxtQXtPZ5QY=
=oVi3
-----END PGP SIGNATURE-----

--4RtWT8mPemudz8XJ--

