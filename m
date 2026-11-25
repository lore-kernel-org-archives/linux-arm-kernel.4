Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86176606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uFVbNijw;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J92Oq1gS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0OLOuXS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HnuTfte+mdhWwh+sJdUBLmYpGpD9aM7Wx4iTVLXkRUM=; b=uFVbNijw0Bw0MyGzyhgVmCBzEm
	9MJRxtUZJylgQDe087j4NuUErX8V546GC63V8WXsLS1LH4m+ZPN2upqYNgQyQBpjqYX9dAcuBS6Qa
	606zS+Rp0REWCL4glKrMIfhE5+Xp2FBTwavQxmLQB564geEdz9EH5TxecWy6uaDjVmSXSnebTQvTC
	eWvA8cU/73Gn6OtJe8+nwJpqTT4tqSvzKPlcq6AXbGNZeMR7iNg1tc/YRxNqZvaS8XdpqfcFsLkxf
	ltmpH6v7zPoxxQ35HJS/arfggBdSZk4OniyXcE14fe8mE/n3Wv1bJuxOuCX9UAyvUzo9HfnIWKYLU
	oaE+zsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEPI-0000000AGB4-1fhj;
	Wed, 25 Nov 2026 14:55:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEPD-0000000AG9I-0Vt2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:55:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM4jj047611
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HnuTfte+mdhWwh+sJdUBLmYp
	GpD9aM7Wx4iTVLXkRUM=; b=J92Oq1gSARuaPSfcpRQMOvNtC8Hf2dCX4rSVcym5
	41JJcj3FNDY402mqYyzHECPWfinRkCIGDehEDT2TOa+GBYHO78vllqyGUFDT+UBp
	2BxLghhX3Ic2AsBehAJE/IBYkiAKtBxyu+GKRXZLIsSzJxaqc3elWDU4/gYaCGii
	r1ZAgZkjUWeWf4ia/EKuUFpLJvzkaZ2prDZksNxMy8QBO6uia1IZavyBofxq8jgO
	P24TC+IUL4L74OlfMl0QjH77xTSIYKZUTLGnEjWe0KbYMSc6mnT2JmJFeCLEzK0F
	Hpgm10g+/DaID5uDy3huplYb0QsIPrrVMBbjXnENn6nOQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2bcte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:55:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so1021055885a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795618529; x=1796223329; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnuTfte+mdhWwh+sJdUBLmYpGpD9aM7Wx4iTVLXkRUM=;
        b=H0OLOuXSD+Z0mBxgwttMlGjjV7WS77g7c2bHjf6/QhvyveFrIR/4Myr9QvbgZBpqju
         Md8feXjT+wM2MQoQbmN5xE+X0tSWgpjK+TO1XJd6PdiTJhcG6geywNRPVC94tToX3XBE
         LhMnJXRYESCAXRyspK7lVY9UGf4NC46ztSn+3uUFVo8vNL79tdtfJLD/9fFFmxOPb7Cf
         AbEecgzC5kg6zDslKX9TVbL4C/vsxSreO807Ht/0/uHL0zdne3glzU5m+ncXIBjEI4Bb
         ODgAy0j5iO3X8hdJ85Wh+BCFemB/4nrDD6lWK6wIwLathNMKMFtAU7jLuYtLmZXEuWp7
         ymkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618529; x=1796223329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnuTfte+mdhWwh+sJdUBLmYpGpD9aM7Wx4iTVLXkRUM=;
        b=CkqSyA8kgmLTRFQrwkm4UFWxbexNyLoIV5z1k26uVVH7ShXFy2P8E971Zxnr+t3+Wj
         y+ApJTHHTf8acRrvIzYlIchdwNGIapnCxJ2IoHmoEj/n/9m0aUulyumH8MsBFaNJa9k3
         ZXuTEah0stVuC9VqDZvmnUmABDIMw+zK+UE0BKqV6ZsfEzk6Yh3lZtH3i8wd4luwauo+
         /jJIK0LikvAjpBSC1qimzsSP4Zkr0/ExYAGX6G+SR5VyVPQ0ArwasMkVQZLlH9ZelW71
         /9ecKYUXUowXKjme1Ku6fc5rKE9jv3JXAZ7fy2IfHNvrUQkrvhHwuFES4LcgxVmH/kxW
         Z6IQ==
X-Forwarded-Encrypted: i=1; AL+hErFW7rhiuCtEn9ZE5AhK4wN14mZmsuDwh6jhRXgM1Cl0nsEkX5k+HfBWyEyP/Q00jZCJogsBx2q5EKutK5UFn+1c@lists.infradead.org
X-Gm-Message-State: APuU4Z+XltnmRHN3CuFAihCcag8jo5Y4ddbialUDxK2RUoY4y1+9B4pq
	qUkWUaBT3wUK/g9faQjQYOkhMS8igNbKUyuHb5Mh23V1pLAGDRysfICMgesI09ZoSrMuZyI+is8
	/Vl93RqnOM3ZbfJ/GwcNRzQU0Tg5N1U+fGbuMXl/r62KZkDLFTp6/KbpHJd5eLZIZf5GsdRaNjV
	J5bQ==
X-Gm-Gg: AZFdTZdmhExeSFjewIME96+FRrXCaKNwjoRd6aYaosTFD7ltuepb5XA3fZ6bzEcNulJ
	zjK2CqYzSTHxN3kM9HMjZqDBFTR0xzpYk7rIFW8/eHdfgg9Y1RLPJwBf8VD+n3VKh8BdoevcPW+
	ME36BejR55545qIwiIltD+uNcoFh55JAxzENNwccnexPvpG5u3mkqWrhSJJEEqn0+4H5CMUTQbZ
	xPf9dAbgDLbTic0MzgV/25u/3ysfJJvb/s1LIB5v1GbwlYFLl0vo1e+N9TWZqeMHVgyMWcbuvOO
	xh4JLJm2/Acy/uTYzdR06IZSdVpfnoqGV4ZqqPPPCHhTzUZx+A7NXPBDD1nwezsGub4bCe4SRE/
	UzRPVIUjCc3zThG3qyyQplDWgJSi55PoehumcVUPd3ybqyceHTMXMZZFPKaFd6iI=
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr3228581285a.3.1795618529260;
        Wed, 25 Nov 2026 06:55:29 -0800 (PST)
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr3228572285a.3.1795618528540;
        Wed, 25 Nov 2026 06:55:28 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm41168546f8f.21.2026.11.25.06.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:55:27 -0800 (PST)
Date: Wed, 25 Nov 2026 15:55:26 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, Jose.Abreu@synopsys.com,
        boon.leong.ong@intel.com, horms@kernel.org, andrii@kernel.org,
        eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
        song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
        emil@etsalapatis.com, ihor.solodrai@linux.dev, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        nb@tipi-net.de
Subject: Re: [PATCH net-next v12 4/4] net: stmmac: rework stmmac_rx to
 support XDP rx multi-buff
Message-ID: <awb23jFbMuiQLhzO@lore-desk>
References: <20261121-stmmac-rx-mb-v12-4-3ae2f3bce174@oss.qualcomm.com>
 <179560987080.3135.9418981958235641169@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LYnRZCeMiM17E6jE"
Content-Disposition: inline
In-Reply-To: <179560987080.3135.9418981958235641169@kernel.org>
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06f6e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qj33YrL6L9DSmQYm-pYA:9 a=wPNLvfGTeEIA:10
 a=cKRSO90NwK-mRX7MwXcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-GUID: p0R844uJaxoTnizfgHvFURx2_RqmgMgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OSBTYWx0ZWRfX2pwVTkshIlH6
 E1QdIMUFl43zoyg2ndzV/ixf4xYMM4NmV1fXRPRGyT0N5RzDq9lGgYgxIiQ01Sj3RYqKqQ+BeG5
 glNb2+t4v1uhy9pTXOxaC0bB0/8m31UApvHyUZ5Yu5EJ4nNXUuPvNjgWpLd7RV0KJ0ipPEzij4b
 p1WExjXvEXghkhcBH19Ph0pzC+wf3MNYCDxLSwQXkEl//o5LNfPNmCFnSnRi/XWLcl2l5U/bf1R
 NJ5YqqNJKetRZ8WDYKbiz8VJHLrMgOEMRC5ncG769eh2wMR3JT/pym4iTKFvTz66YsxtWlLwO4i
 c3XAt8VZQ3feSLGiwb/imKBPqEBWp2elpp7urA16yLSUy9Djv8W84R4IQqlitY/OObgTV7GJcwl
 56ajs06wBWKk2tvDtYc3f5Q9jYamAQVtT4+5uYWCizCtD1Uhu8K1m0KNWTQFxIW93eYqNuAWgqZ
 hnci+7O/JlAvaOYt9Zw==
X-Proofpoint-ORIG-GUID: p0R844uJaxoTnizfgHvFURx2_RqmgMgY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OSBTYWx0ZWRfX1KTaKfHo1aWJ
 d5j4eEkFNYhKP3+WgvRyyUcwemFh9r0dGBBVMM3JKewU+j4rIW0LQKZjsYDazb7pqZeW3K4dPpe
 4KT7+sr6NTaIs3kEesi4pMBzCvkIMh8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065531_291476_832967E3 
X-CRM114-Status: GOOD (  40.90  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--LYnRZCeMiM17E6jE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 25, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =B7 High: 0 (1) =B7 Medium: 1 =B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The patch makes __stmmac_dvr_probe() always add
>   NETDEV_XDP_ACT_RX_SG to ndev->xdp_features.

ack, I will fix it in v13.

Regards,
Lorenzo

>=20
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the patch
>   extends it.
>=20
> --
>=20
> net: stmmac: rework stmmac_rx to support XDP rx multi-buff
>=20
> This reworks stmmac_rx() to collect every descriptor of a frame into an
> xdp_buff. The XDP program now runs on the whole frame, which may be
> fragmented, and the skb is built with __xdp_build_skb_from_buff(). It also
> saves the in-progress xdp_buff across NAPI polls and advertises
> NETDEV_XDP_ACT_RX_SG.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index ca4c7fb11b73f..b657701f51f90 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -6023,120 +6038,79 @@ static int stmmac_rx(struct stmmac_priv *priv,=
 int limit, u32 queue)
>=20
> [ ... ]
>=20
> > +		ctx.desc =3D p;
> > +		ctx.ndesc =3D np;
> > +
> > +		skb =3D stmmac_xdp_run_prog(priv, &ctx.xdp);
> > +		/* For Not XDP_PASS verdict */
> > +		if (IS_ERR(skb)) {
> > +			unsigned int xdp_res =3D -PTR_ERR(skb);
> > +
> > +			if (xdp_res & STMMAC_XDP_CONSUMED) {
> > +				__xdp_return_buff(&ctx.xdp, true);
> > +				rx_dropped++;
> > +			} else if (xdp_res & (STMMAC_XDP_TX |
> > +					      STMMAC_XDP_REDIRECT)) {
> > +				xdp_status |=3D xdp_res;
> > +			}
> > +			goto next;
> > +		}
>=20
> [Severity: High]
> This is a pre-existing issue, but now that multi-buffer frames can reach
> XDP_TX, does it widen a race on the RX page_pool's lockless alloc cache?
>=20
> XDP_TX frames go to a TX queue picked by CPU number, not by the RX queue
> that owns the page_pool:
>=20
> stmmac_xdp_xmit_back()
>   stmmac_xdp_get_tx_queue(priv, smp_processor_id())
>       while (index >=3D priv->plat->tx_queues_to_use)
>           index -=3D priv->plat->tx_queues_to_use;
>=20
> Completion then runs in that TX queue's tx_napi:
>=20
> stmmac_tx_clean()
>   xdp_return_frame_rx_napi(xdpf)
>     __xdp_return(..., napi_direct=3Dtrue)
>       page_pool_put_unrefed_netmem(allow_direct=3Dtrue)
>         page_pool_recycle_in_cache()
>=20
> allow_direct is already true, so page_pool_napi_local() is skipped. That
> means pool->alloc.cache and pool->alloc.count are written without a lock.
>=20
> Meanwhile the owning rx_napi on another CPU uses the same cache through
> stmmac_rx_refill(), __xdp_return_buff(&ctx.xdp, true), and
> page_pool_put_full_page(..., true) in stmmac_build_xdp_frags().
>=20
> Here is one example. With multi-MSI and ethtool -L rx 4 tx 2, rx_napi 2
> (hinted to CPU2) sends XDP_TX on TX queue 0. The tx_napi for TX queue 0
> runs on CPU0 and recycles pool 2 pages while rx_napi 2 refills from pool 2
> on CPU2. IRQ affinity changes can cause the same overlap.
>=20
> Can these unsynchronized updates give the same page to two RX descriptors,
> or lose pages? Before this patch only the linear head page went through
> this path. Now every buf1/buf2 frag page of a multi-buffer XDP_TX frame
> goes through it as well.
>=20
> [ ... ]
>=20
> > @@ -8218,6 +8199,7 @@ static int __stmmac_dvr_probe(struct device *devi=
ce,
> >  	ndev->hw_features =3D NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSU=
M |
> >  			    NETIF_F_RXCSUM;
> >  	ndev->xdp_features =3D NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT=
 |
> > +			     NETDEV_XDP_ACT_RX_SG |
> >  			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
>=20
> [Severity: Medium]
> Should NETDEV_XDP_ACT_RX_SG be advertised while the driver still refuses
> the setups where multi-buffer XDP is needed?
>=20
> stmmac_xdp_set_prog() in stmmac_xdp.c still rejects every program once the
> MTU is above ETH_DATA_LEN, including programs loaded with
> BPF_F_XDP_HAS_FRAGS. It also still turns SPH off:
>=20
> 	if (prog && dev->mtu > ETH_DATA_LEN) {
> 		...
> 		NL_SET_ERR_MSG_MOD(extack, "Jumbo frames not supported");
> 		return -EOPNOTSUPP;
> 	}
>=20
> stmmac_change_mtu() also refuses a jumbo MTU while XDP is attached:
>=20
> 	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
> 		netdev_dbg(priv->dev, "Jumbo frames not supported for XDP\n");
> 		return -EINVAL;
> 	}
>=20
> The commit message says as much:
>=20
>   "it does not enable XDP jumbo support by itself."
>=20
> The in-tree AF_XDP selftest in tools/testing/selftests/net/lib/xsk/test_x=
sk.c
> turns on its multi-buffer tests based on this flag:
>=20
> 	if (query_opts.feature_flags & NETDEV_XDP_ACT_RX_SG)
> 		ifobj->multi_buff_supp =3D true;
>=20
> Those tests include testapp_send_receive_mb(), testapp_xdp_metadata_mb(),
> testapp_adjust_tail_grow_mb() and similar ones. They set the MTU to
> MAX_ETH_JUMBO_SIZE (9000) and attach a program in DRV mode. On stmmac one
> of those two steps is refused, depending on which comes first. So these
> tests would go from SKIP to FAIL with this patch.
>=20
> Could NETDEV_XDP_ACT_RX_SG be left out until the MTU and program checks
> accept frags-capable programs at jumbo MTU?
>=20
> --=20
> Sashiko AI review =B7 https://netdev-ai.bots.linux.dev/sashiko/#/patchset=
/20261121-stmmac-rx-mb-v12-0-3ae2f3bce174%40oss.qualcomm.com

--LYnRZCeMiM17E6jE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawb23gAKCRA6cBh0uS2t
rCvPAPoC4m8jjdCyw5WZEYtK9dSI2EDVXvglOa/zOj3NzADSzgEAsFVmZA/rFSEp
Cio3T/KZyMuT/vFhPXffsWOsllsfSQY=
=QSMA
-----END PGP SIGNATURE-----

--LYnRZCeMiM17E6jE--

