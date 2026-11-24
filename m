Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9571B606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0UrgixHZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d2OPOlRv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HIRva3yZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xhoLzvSdgCRdRzB82i9PymJ0nI+RzUMdCmK32Pdr6Ho=; b=0UrgixHZCF5pJIFEY+oqdp44tA
	Qrx4wuYhR52tImXzoHpyf9bz0/yqA2JslpVZGV8IUbZhSrTeTafFhvYQw2UnGzd3sdJBgGCUqrtLc
	ZQynDTuNVFLFTX/WZs/BLRbzQ5mA2XRp3KmqvU35REbLVxaAZ+RexbnNJbO/MPTsZ6chyPw6EKApj
	zKdJoxqzpd25ACvoBjVEI4CuKeRYw+UnpUPdRYPcHJi5F9rYJ00xrh/iWSM/ooopbRzPWtUeZbTvX
	7b+OZNNAcAeqpuAm4/dlLSSLXvf0r607s8G7q0B6oiWZcYdhA5GeeChhU0IlV7P98Vy8Ny9V9JLKu
	yBBPxJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmSU-000000060iV-0Xot;
	Tue, 24 Nov 2026 09:05:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmSQ-000000060hj-3aI6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:05:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO83efm197008
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xhoLzvSdgCRdRzB82i9PymJ0
	nI+RzUMdCmK32Pdr6Ho=; b=d2OPOlRvfISVk7J6Wumi6zrZaA3PIkLQKXZwGaUG
	MbxzPORarotTEVHKI9q/7zAQVuy5UMOPIvtI+osYwYXhzTrVn9Qj90ZXvDahgTk5
	UVdXwPMaIIq3kn+rdE+38PUCNI0WevjLptazGn7FaT0YaKhVQ0WdJxeQngjAumu0
	N4Kd2PRVleyW8wZ6EoGhdR+A3tyY/PJpXB37FXia0ReP+c0cqoHjIaOM0sVL1y6U
	osuJce3d/MvXnISyo7klEX6dU1CIF1KATAgyaoQrn+c4yi4AMh6xnHppnx2ZPh/J
	f/Ini72giDWQDVsJC79jVr9GeusNXELzoUPG6GONTbzUNA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrasxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:04:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so802692485a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 01:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795511097; x=1796115897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xhoLzvSdgCRdRzB82i9PymJ0nI+RzUMdCmK32Pdr6Ho=;
        b=HIRva3yZcFlUM3V14bSSI5I1SoPfViZBt4kfcR67nMs9e4qQrjNrSSrF4MFmPUedzH
         Dv/Jv9TpxzNj4/UYVtZcUDi4aVTKlggAhDIoSLWXVzJGTg3JBcJs1ZmiSS174wZEeWui
         EdRkEj4gma6npx8YzkJLspbtCw4oHABJn2EMXGKmZkA1Nb6+jZa6/wdjYt++mRObdFgJ
         XufnLaZde9mbNL+Fr7EA15Axs29tdW9cA+Ofn7d6eVLUz53pmiJBdcWeRBROBrHnUGX2
         k/K0r5e4ZtXavy8pSF7etpKV/pvxx3ajf6lL8+t3Xs+rlSe+3C6dqu0QshdtunvGgEsY
         hRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511097; x=1796115897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhoLzvSdgCRdRzB82i9PymJ0nI+RzUMdCmK32Pdr6Ho=;
        b=r2cu0LRPGAvGUicMa986Rgl514K2tXbt7ORZRIl6eBFMNGo22OMkd2DGDopjX/9KHy
         JqR8rMuUUHMKOzBakAQ8B0Xqt8J+VlvRhv1OtdbY3/d6fF+ayrbCz63uF5AwymW7iZFT
         z6VPZAHLogUiDBIQdCIfKP1ahlU7GMjacX0cb92qwSs41W30fgyS4bEaArnoQjaU1g19
         DByYmrPR7PpRjCYLYGkq39qCHfwmsa97p9JPzYDF+a0EUkU+p8czpNtP8dszPIBCu3uf
         3boIkdefn9bJFfDHNgph0rs6z7a1SK4LjlCKkRY7RIfws2200VPZ+ugOrEvq1QfUQ2Wq
         CCVQ==
X-Forwarded-Encrypted: i=1; AL+hErEqMuDbyn64Jvj3qmYX/UWehZ9DTyHNtQrHiG0mcsCeQFQ+3IjDUi0J0ANW1ODqV7tKREl9TsdWWdQiAPwMPfBw@lists.infradead.org
X-Gm-Message-State: APuU4Z87JiG+2tdfsxIO9rXJE0sdo/j/91AMHgoTbpqXWnFy0xabT0hG
	+h/ZYstC9k0WKA+bihVek8UohwswDzt7n/uoKkb1UAeqTckBnFmLOUDK46WqBsf55IMUy85//MI
	/xUxe0e6P49uQrrFl0PofUl7y9/k1Sb4nXp2NBIkwLqJvG+kBaV0qEHdM2oF9q9olgTLR5+hkwX
	nFNA==
X-Gm-Gg: AZFdTZeuAhCCIwY8bcDZKjbOme2Mwm56SFJxNT3Bn6Bnv8K+b7OxgNWaEgeL4ftgqu/
	0Z8RouaZmYrcswk5nu6MoSCy2EOGZCXZLphFe5kDX4TTY/H33/C7ewdmUasw/O4CmC9R/msWnmc
	XE3dl6euVj07GT0KVtXms+8mBHsHA4+su92PuiJ/S7e0dK3J5riBuVIT5cs222mKrgh7Mo2MzGl
	ZbPxSfkKAXtf2+Y+BsRWNsmsjz9+KLX+cCp+zrSRTyJWVG9dNp/0YFezf/L8ijUi/FQnb+Oru4+
	Fva9GeNMy7GCKoDTW0QaiN79AAePO7IMsm91bqiO8tRjSykXTpe4Im3v9JSwQfPOsAEHIUV0cOM
	1p+lPwfRjgNOl+I68u7suDlS/iUqo257mK3el127xwwjRuRSDOF1Ed/jmUG4ndNc=
X-Received: by 2002:a05:620a:6c18:b0:949:6841:2ba2 with SMTP id af79cd13be357-949ba96e544mr2446121285a.22.1795511096532;
        Tue, 24 Nov 2026 01:04:56 -0800 (PST)
X-Received: by 2002:a05:620a:6c18:b0:949:6841:2ba2 with SMTP id af79cd13be357-949ba96e544mr2446115485a.22.1795511095866;
        Tue, 24 Nov 2026 01:04:55 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm180427535e9.4.2026.11.24.01.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:04:54 -0800 (PST)
Date: Tue, 24 Nov 2026 10:04:53 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Simon Horman <horms@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        Emil Tsalapatis <emil@etsalapatis.com>,
        Ihor Solodrai <ihor.solodrai@linux.dev>, peilinhe2020@163.com,
        Peilin He <he.peilin@zte.com.cn>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v12 1/4] net: xdp: add
 __xdp_build_skb_from_buff() helper
Message-ID: <awVTNSYCD-_5gE4D@lore-desk>
References: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
 <20261121-stmmac-rx-mb-v12-1-3ae2f3bce174@oss.qualcomm.com>
 <9997f4e9-9453-4511-af3e-4be664a09281@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4rmTEbZeDTuovlI+"
Content-Disposition: inline
In-Reply-To: <9997f4e9-9453-4511-af3e-4be664a09281@bootlin.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX5OzENG8f5DHl
 Jxy5jci1Afk9ehyj21WMfjTFWsDw73rEPVRIN3JedVrY+wjR+ZGJ0OoyqLnplHDv1ko15jAfwUO
 Q1XcJkB6cxxhENPbaY32qkIakGsB0H0=
X-Proofpoint-ORIG-GUID: -l7wu7AADER_dnI5J8HaBplApSSLwjj5
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b055339 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=Byx-y9mGAAAA:8 a=wBYCl_nSamdfdyxXmbgA:9 a=CjuIK1q_8ugA:10
 a=NyyH46NNO2n4llnjC44A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX2U6hEjGeF60L
 VUPG73YOpTVmoeJE3QqRrHER6p2z2b0Qf5EKRk8CZnom+B0eSqUJAQ0P7I/iPubqZgEK6XGVlnR
 wKYm6nFKc90Djh54RQkP1D1+nTYQCVQoizFyj34MR9DC9f0XEqO6YbvQi4CtZgyG41b8kUFIWis
 GMSa999X0BKAj2SNnEBwnfVX/7xXnJUy5exB6WKNOIFIC3Cw9Pm4zxzUf3BEnd/Cz4HzvyLOFAs
 NVRXhdZLGWSN1lwzaPCLmqt5MHw6BLphhv2Po6KlK1fz3MUwsuYxQnUqTVrQs/ZVnFMTZkD0fD1
 W0WkZWyIf4ykaRbDwMymNdBnaFBK92Tzn/GGelPVu4/UYBRoViwzbsvLYjTNiE1SQCcBYsD0u7c
 USuToWKwixY0nam9HlPmumtFDgsxh3noqu1N2UpQozpCUylACkUae9arUa0ZwajJIoljRKh767X
 najLAGK8dLS/AJsPIyA==
X-Proofpoint-GUID: -l7wu7AADER_dnI5J8HaBplApSSLwjj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_010458_895557_F2C507FB 
X-CRM114-Status: GOOD (  27.97  )
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

--4rmTEbZeDTuovlI+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> On 11/21/26 18:28, Lorenzo Bianconi wrote:
> > xdp_build_skb_from_buff() always calls eth_type_trans() on the skb it
> > builds, which pulls the Ethernet header and advances skb->data. Drivers
> > that still need to process the L2 header before protocol parsing
> > therefore cannot use the helper.
> >=20
> > stmmac is such a driver: its software VLAN path (stmmac_rx_vlan()) reads
> > the VLAN tag at skb->data and shifts the MAC addresses over it, so it h=
as
> > to run before eth_type_trans().
> >=20
> > Split the implementation into __xdp_build_skb_from_buff(), which builds
> > the skb (including the recycle mark, the Rx queue index and the frags
> > info) but leaves skb->dev, skb->protocol, skb->pkt_type and the mac
> > header unset, so the caller must initialize them, usually by calling
> > eth_type_trans(). Make xdp_build_skb_from_buff() a static inline wrapper
> > that still calls eth_type_trans() as before, preserving the behavior of
> > existing in-tree users. A follow-up patch will let stmmac use it.
>=20
> I've been questionning why we even do that in stmmac in the first place
> actually. This pretends to offload, but it's just to deal with the tag
> in the driver instead of later down the road.
>=20
> The original idea was for GRO back when it didn't handle vlan tags, but
> this isn't necessary anymore.
>=20
> There was a series in-flight to remove stmmac_rx_vlan altogether, but it
> seems to have stalled [1]:
>=20
> [1]: https://lore.kernel.org/all/20260914150612.9798-3-peilinhe2020@163.c=
om/
>=20
> Peilin He, do you have any plans to continue this ? If not, it may be good
> to pick this up instead of working around this.

I am fine to rebase my series on top of that one or pick the required patch.

Regards,
Lorenzo

>=20
> Maxime
>=20

--4rmTEbZeDTuovlI+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawVTNQAKCRA6cBh0uS2t
rHPZAQCKAGP+HxkZclzwJBS529Ya17YdjUFEqrcVdO8FnqTQYAD/WTWY/zFW4UQM
meWv9CThxP6DrZ3uuHCcz2TqrxwnlwE=
=40vj
-----END PGP SIGNATURE-----

--4rmTEbZeDTuovlI+--

