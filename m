Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79497606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C9QuTAT6;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AiRJAlWd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bWeiQN/L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YZMI7TbxPYwx5wkCIKznTql42P6hnvj8TVPxqWc7QgY=; b=C9QuTAT6EGrHOQ0so1MhlzmPwK
	g59eRGw0tfDqtmBZ0RNnalPtFaZ6Fy2MtZb2kXjS0kBw+iOHUxBg/vrRMOitaXMqLrzzMcfPIJxdH
	omM9ItLRK+3hTnTcyfOQBqnq75/YYOQivn4Bjz31LeAH8BuMvFM4TFY022QHVkELKRkPTfZJnmpTY
	WGL65rzjmURkyMTUU0JkhsI/i1kP64JSXo7rLHzjF0Vtqz3OlonnnoFomwe1L61ZNDLITk591kgSR
	CHPxX7k2tRBRdRblCLRM42NfnnUy1ME/iYvtMUEEhZNv5ArhRfur1l8wgpW40h3IzuZ3VKMOJPC5/
	HyXZXMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5g7-00000006Mb4-0Qnw;
	Wed, 11 Nov 2026 10:35:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5g4-00000006Maj-31XR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:35:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5Kggs300689
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YZMI7TbxPYwx5wkCIKznTql4
	2P6hnvj8TVPxqWc7QgY=; b=AiRJAlWdbyPYQpa8CHxTUCrWpxmJPWJzxncKdeZU
	NTbslnrfR57T1fdhAMeIJt4wTpAdWpadyvyHda2aVN5UloGlxN9udQwGwnl7NnC+
	3wa6WpF51OaWHpRoVoHZlwnCuWPcNRddEqMewobpkQGJznxsNeFyHhf3i1UsWeEw
	uKLJoyRVjOVPRfoVzRr+CpfP+QkRPicsnDqxso9bfxmVFCcQSCBlp/na9M0PKa9x
	mYwHrQeg0viEPccCwenplzomBtB0d7CP3SG0/IkrpAJc6F5tkRAazabJ9gJh51Ld
	lZHpmOJ3bFTQFBIChNIpYqnRjz/sETWdUJBRzi8K0YTHKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5ku5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:35:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso535779985a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794393338; x=1794998138; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YZMI7TbxPYwx5wkCIKznTql42P6hnvj8TVPxqWc7QgY=;
        b=bWeiQN/LnY0GctyY6VoBS2ATa56ykoigZpcqeNXZ3xPCixanbAC3UPYQQNU1Fr6/Dv
         2zxGyVrIzzdAedqYxb56EDHGrcAE4raCrN21G64OXbPjWWIIOjDkAExlChuXzOqkQ6tk
         qR7SGKVL+0ZPoMIYApPx4ZZwCd3BcSD1K+x8qZZ4hticCEqsfhu1L21KHU16Nf95ebdI
         wnd1zdzNVNi6VNPXfhkhQkVy3geeAPjnXhRooozRlaLzyfBKhDx8zv0Vf3UaUDn2s+Ux
         EJmi8ZyRZehywKzHL9QM59CpeiNBCHgnccjNVV4p5CHhh4sbwsajvmM6NMAC9sh6GylP
         DXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393338; x=1794998138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZMI7TbxPYwx5wkCIKznTql42P6hnvj8TVPxqWc7QgY=;
        b=tpTHSX7WIvvUvKPOQ9KdlHoiEqAwx4eG377p1zR/VHjjVrEuOb1Xv0sYzJeqYxTM4x
         ZBK3hlW1h2FfVFqwJJFj+4L+3+g1G+YTkpUfaUz/l6lcnva0izbcazP+Xjfr+Erv97ND
         YBwO9+297sgBYlv//eG9JXfjXufTOI7uxrUAXFHbwzuPItSXH2W/rjcx0PI4F7Wp4QWO
         1qnErYd5wTbSMt9qI7xxoPCR8CwXZLX8br0LlZU/L+HG+oYG66byGtdxeNzEgIrzS0Xm
         4niNZDKb8GqniV/Gj3o+Eq//7DlCaVf/LWI/nrZH7e2TEbJT3Dolqj4BHVF1+I4qwIYL
         QxWQ==
X-Forwarded-Encrypted: i=1; AL+hErH5mBcEMAORkb58cbTGgcy/hlur/k1F1QT4Lk8DUVFqllBd5cwW7P1/WY2TwgaUeiEWhwXrZbl+cWebZcMGPj3h@lists.infradead.org
X-Gm-Message-State: APuU4Z+PIYOHaol0TsUnGcicUI5Q2+sCVRb9jSwKWmz8Iq/ZNc6jGJ+O
	U+ty71CRHsD6GOQ7HGMz5GZzdMVtD93GjFqXT1n5PXs/1PYD3mBVtViDydcmuFlmeB1NrgOaCKB
	2QhwIpe3fY8dvvfST9yeR/xIKb9f3hieYs+kDOnYUZt6JUAKeek+UyYBboVhGmfRotw8n7vtKXk
	TUyw==
X-Gm-Gg: AYBFou1EdTCb8nwTfsHrvOGeK1Nasoay//8VwD20A955F9NChcaSiGkr42y9lyxnqdT
	S7psbrA8A6SPIX99I9Am1E+4y5t6IMi9+pn6EdXsJRPv3NTzVPMI9UCtz8CtN/gZeyVEn2eoO/d
	1bxcfjrs3T5F0D2Myro7CyMx8DL8c8KpRa6Bq0SntTFO8KtAdJvaGCJK9geUqSgt6HmgvLRLvJP
	IO25xqfWIIFFTGPFdgb8hCZkI8f2tMa7d6IKqbbo7FCdzZwiSfjT1hZY1orcitBKCqi9laLMsA2
	LFUOOmupU4VmSaTBYltpRyywXR+SRBUufYzhmVwZfwMQcW878dwxP8QpqIFy2r9Gtxs/x6pO2VF
	n3fsBOR302hw504w6K+8lonm3TPZUeCRD7DXqFceL9z1lqkkE7EpuM1T7WgenKpM=
X-Received: by 2002:a05:620a:470b:b0:943:faab:a15b with SMTP id af79cd13be357-947affd3892mr316322385a.32.1794393338382;
        Wed, 11 Nov 2026 02:35:38 -0800 (PST)
X-Received: by 2002:a05:620a:470b:b0:943:faab:a15b with SMTP id af79cd13be357-947affd3892mr316317985a.32.1794393337817;
        Wed, 11 Nov 2026 02:35:37 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204ee67sm136315315e9.13.2026.11.11.02.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:35:36 -0800 (PST)
Date: Wed, 11 Nov 2026 11:35:35 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: re-base EST after PTP settime64
Message-ID: <avRE9yrHMxPEog_W@lore-desk>
References: <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
 <179439101012.2168702.7084889683086505686@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+n+Iz2b53gv4eKLW"
Content-Disposition: inline
In-Reply-To: <179439101012.2168702.7084889683086505686@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MiBTYWx0ZWRfX5AwNHkt8udsU
 q2qQckDcadU51jbpH+PjX2V8DRAXPWJQ6KTjMtU5eHW2QASLEk3jJVfb6Gf7xGWSLwTVpZVqgrl
 X/U9VNOEQSyYSKPjS2ryoqQdUGAAtslBGn+Vp/i6+2iJVpVNIUDu6hXXbSM5c42a9gW/3X/0OWZ
 6N3V14OpQsJBWi6p3Ql9at6TISluZwltUNywlsP37R8aaG/8zMLSqOOmm0aAtIEuhJrpY4LJUtF
 0LiKcTEIrmYuwzP9gxtJsAAXpNKWSA96Eanib3smhWtBk2Y3n3seuQHyteA/n+4E8Foi6C5ptiZ
 dosHPjBqZbGDNS84bAkBwrTC7LGlitJBOXU7V1xFOQVdki8fG4TPU5jjQiznGvP73gYnrOX2kAF
 DPQx7eg7dsJLwr1CTGc4GfWFSF9DrCLZVXZvUvyEcrp6qFb9gAW+rM9RBEjINA/jpqLsbAdlnLM
 sfkFdQW7w7bVaHecuoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MiBTYWx0ZWRfX2qrKCiiwziEb
 2R9tr3/G3Ura5GvyeSqcQl35FfHtsXiSyBzT41ufT9aGxhvDtzNXsx79GErYUAL6Sxnx62MA5Sj
 kqomvktXdlBtTrFjCU43nRapJs/sM70=
X-Proofpoint-ORIG-GUID: tChd2mUP_fcsjyhYY_BuWNuyGhY9NQzE
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af444fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=5lZe6pp742s8uXtkiyYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: tChd2mUP_fcsjyhYY_BuWNuyGhY9NQzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_023540_896958_00DC1995 
X-CRM114-Status: GOOD (  25.35  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--+n+Iz2b53gv4eKLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

the issue has been reported by sashiko.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

this is a real issue reported by sashiko.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested it on a Qualcomm rb3-gen2 board.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--+n+Iz2b53gv4eKLW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavRE9wAKCRA6cBh0uS2t
rApvAPoDEjc7/atOkTERa9B/HAzRWUTuokltRPzm1FYP/pVThQD8Dsl0tVeu0Jxk
Q7I7NEpsTyNEnLnicCpxapTKlK6sDA4=
=VbwN
-----END PGP SIGNATURE-----

--+n+Iz2b53gv4eKLW--

