Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B0F606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4l4BdiTW;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ew8USA/R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e+PO6AY+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kk7U2oDO3BkhHOVJXZPhVT8PfOsDLR12HVSj48QIZYY=; b=4l4BdiTWJjYJ4KX6NMCW4TnjxO
	TgkcFfRobBqvE7EHQx5NyAH/78+Plmo4K2jATo9T+SuKk6gpFY3lfrImqOgsNqVvdSHSGXXR1PrR4
	qVxHZ9iNr3O4ZtUaFsk6GXq78rKzz9AnxTj0mGgUIxIPqEiRLH+fCpHy39Ego1sE8JmVpWQUPZFq8
	EPSZmNquCJllwWmM3/+W5iZCEqkKKW+Sonbz/DEM6rCP+c43nKj1wcBubYyP7mHwCCSmUpS8VAHFb
	Wo9XBk9OimSlfntl2dPIjuSeQAAfqalZzPutBQl188frd5tCwoTP29TIPPn6ifnJvDpgT3EOoujzM
	05cK+d4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsfU-0000000FUDt-0ZcY;
	Fri, 27 Nov 2026 09:55:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsfR-0000000FUDD-41aV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:54:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GaZO3759027
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 09:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kk7U2oDO3BkhHOVJXZPhVT8P
	fOsDLR12HVSj48QIZYY=; b=ew8USA/RPEBojo2SReGtP0RtUQB7fM+ugenv5twX
	WLb7x7LuuYa0oMmHg+AyJdvxRY+MHWhlCpd3Rq7WsYsakoG11PCc0Q1CO1IMHqIt
	z7kGyAYs8Zz3dGdgY89ZXGqxpyehEkdooAfxmgKQQLYm/XyFEUR7rEXTD4UcPUwF
	vs8XxZR507Le7ltaPG547WBYUOnGcOOVLn/JmwvgIwHC5jUpdN5UuJu3vKnQgy92
	jkfztrS46Lu/XbJz6L8iOjqia9EE1c2ABGNuGAp25H4qZlRAXX0OY0wPU3Bnl/EM
	bUA7VvRKP3FMwbW00wO+bSfq5JIZF6VIQi5Vr2uBRzhwlQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6rts7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 09:54:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so1707392885a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773296; x=1796378096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kk7U2oDO3BkhHOVJXZPhVT8PfOsDLR12HVSj48QIZYY=;
        b=e+PO6AY+EBovNeUSZut5qykuy+I/2Q8caAV6y9tT7ZrFD0jlfUOgAhmfdU7ackdij2
         CFBnSPnCb/Dka0MVCe72pPAq29gtcd8g261H0judOYW4ndcunblH0H4ztDh4ZTze1tm/
         CQFQDPQPOgdaNfSSARvsTibunbGypvh+5rEwDwcSJj2zZfgsAYDIAAzzAGLMbBS+9IPJ
         YP5XhpBYBPycyzWpeQ50xeUO5LXoQcgUWcCv+gjH9Mk4bv93yGQ5VN9YnL/o4o/0XTSe
         q3kEJhmlGP4DC3gfpkx+xWcSWd0uS8r+IC26iVlOLUIUA3PeeFziG/DoTnlmeTxPWjv1
         W8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773296; x=1796378096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kk7U2oDO3BkhHOVJXZPhVT8PfOsDLR12HVSj48QIZYY=;
        b=PQO6rBj+IoR3UMxKEwZouDbXOs3lbo7PeU3OqlPeFKOEavOYLyWcEETtfweZ21lbvD
         Z3XDtREmLHfATWgMBrpzrJWSIEhWjYNvMrdS7vVeWp2Our2aszxw/JM8PTdvWy+79svs
         kUILd/A9q/Su67vfW++/R0hPQUsjAAVMwl7Msa4jx4VamCkDLWMjMW/+p9OKopB0CuWt
         +zEHX/I02tiZ2dcnT31nHQ4dZOB1WGeaoqBTvhkFWP0G6MbiGbAyg6xwX6IJgFJ9o+qQ
         L65iAObjU5j5sXvpy/YHrMRP3FyZYF4bezyVVquVmDjDm8oyv6MDS/GEMfEzUS3AkmA1
         tqIA==
X-Forwarded-Encrypted: i=1; AL+hErFK205B6GJNGO5rL8IuyJblmlvs/eelidAqpffRDuLnV78L72Um3P2Hp17kx/NV9zZEe3QrwO7bdAsPBmfsbVSM@lists.infradead.org
X-Gm-Message-State: APuU4Z/5Th+siWzb4ZKz921alh9/boJnAERYV0bbmK+wFORM7SmYsstP
	l3MWxRGkfJ67JqxlVzPsgQN7w18MamQnWOJofxJ4muwkHG+t4Jto7tJyAdT2LNGILz2epZSWhO4
	wUalQ01EnmnM7WFqf6PQvbhtBu6M7BgjGsCjiWK0qeCKb08x6PgMpuz1yYBUfaYP7teyS8lVeyg
	o/xQ==
X-Gm-Gg: AZFdTZcuZregzzOSNSPNUedPBsFhU4iSC8iN1NuoZ3lE3DzKWuB+vy5zRIvhSeIXUpf
	RxhGn3wDMYqQ4fy0XO1HVoAglmC5tklPTFp8JOpZAIw17flu8eOKvsMqOO3liZJV+on+i5Ejqgw
	PZx9cNMSdY84Skl42Jslh5nHTUXRjoJhXrPn5IFO+UMei1XgI+YSdvmWsC1u9prIhLpHyLApBG+
	PWiBeurddUODNX6YZ/CYV2DwS1mJ4i2ix0bdqjIyRSS3KfTfQUQKRob+Q0JvcI7SEyl86vmOqCt
	bklnrA2hoC1Z2bK8+KXf1hENSLOlfGK+zxDLc3Pl2B5tlh/Nt09gLeJoGLhp93NwFSQlTu9zVS2
	Y0ADjuVehdv2jvc3T1mQ9yf/LR903lR8W4H3OPpM92G2iyO1IP2no13FU57yuOU0=
X-Received: by 2002:a05:620a:1725:b0:93e:f931:a886 with SMTP id af79cd13be357-949bab0ee9bmr4398240885a.57.1795773295545;
        Fri, 27 Nov 2026 01:54:55 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:93e:f931:a886 with SMTP id af79cd13be357-949bab0ee9bmr4398236185a.57.1795773294940;
        Fri, 27 Nov 2026 01:54:54 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm52877946f8f.24.2026.11.27.01.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:54:54 -0800 (PST)
Date: Fri, 27 Nov 2026 10:54:53 +0100
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
        emil@etsalapatis.com, ihor.solodrai@linux.dev,
        matthew.gerlach@altera.com, boon.khai.ng@altera.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, nb@tipi-net.de
Subject: Re: [PATCH net-next v13 2/5] net: stmmac: remove software VLAN tag
 stripping
Message-ID: <awlTbaxfzMZyCdzU@lore-desk>
References: <20261125-stmmac-rx-mb-v13-2-0f6bac53e8d5@oss.qualcomm.com>
 <179570462642.3135.18427694806922403936@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aiSzvVqs8OuRzqhp"
Content-Disposition: inline
In-Reply-To: <179570462642.3135.18427694806922403936@kernel.org>
X-Proofpoint-ORIG-GUID: 99UeeSVpLk1RDSWi0C3no7Jrs8GR3cAo
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b095370 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=MCknuC-Xbgb6_HTytioA:9 a=QEXdDO2ut3YA:10
 a=VSUL9KZZh9SVKvXMN8sA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX+Rl50lxWHGgK
 +b396tBVzcpL1EVv5F0l+rTZg0EubiwQMAVDTOPGVLNOQaeiuUgwdb9Y6DEFOpx9LLxrl/pGMQe
 +RQpYDZ1fIhV39NUrkYEes+Wa6LiY0Q=
X-Proofpoint-GUID: 99UeeSVpLk1RDSWi0C3no7Jrs8GR3cAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX3JS2MBrg7kvB
 K5iZC8sHRBTjWGEYskiWWCPw0Ebf/opJFu82+pznZn23qnjNrDHSGUHCTkdkdJWOgpxJRvk23gk
 9p29LbBw27nvHbHu7SkkeSyP0L2pTmvVPKWDKZFpamIUN3n79Tg1Asmx8HEjpc38H62K3RZaXgh
 1YLd1tw246TfeTTIyR5W3GW355Iq1zn6kgaCMMyurklMv7J04sOz4qrykqoQLN7VC2XAcrRYGw6
 OCy9fcFTOJBBpt7rn+Y83R1m06Bwoq3UI85/wGWlRFgy7x7jdAq8xHaP1gqu+rVcC96mI/QAtL+
 lYj7Y0sjIzqd0EsWEc0UyC48f1LVl1adkoUN0m4444gdy/LsfKHfBeSt5BeNO15XHlB2mv+IJ7D
 D+xiXP7IDTMFhyvNxq+REbiAjehFP1I7fgYbxtI/M6Blk00u/wJreE5wMkYHztXuvp6kMQnugvF
 GuGtlvtdkgOBH5ggz+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_015458_121391_6E95ABA9 
X-CRM114-Status: GOOD (  49.99  )
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

--aiSzvVqs8OuRzqhp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] In __stmmac_dvr_probe()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c),=E2=80=A6
> - [Low] The patch carries 'Fixes: 534df0c1724b', which marks it for
>   stable backporting.
> - [Low] On DWXGMAC (stmmac_rx_8021ad_offload() true),
>   __stmmac_dvr_probe() now adds NETIF_F_HW_VLAN_STAG_RX to=E2=80=A6
>=20
> --
>=20
> net: stmmac: remove software VLAN tag stripping
>=20
> This removes the software VLAN stripping in stmmac_rx_vlan() and changes
> stmmac_has_ip_ethertype() so that it still recognises IPv4/IPv6 behind a
> single in-payload C-tag on RX. NETIF_F_HW_VLAN_CTAG_RX and
> NETIF_F_HW_VLAN_STAG_RX are now advertised only when the VLAN ops and the
> descriptor ops provide real RX VLAN offload.
>=20
> > The DWXLGMAC mis-advertisement was introduced when the RX VLAN offload
> > gate was widened to all xmac cores, so tag the fix accordingly.
> >
> > With NETIF_F_VLAN_FEATURES possibly empty, EEE RX clock stop may be
> > enabled on some platforms; the preceding selftests patch blocks RX
> > clock stop while the ethtool selftests run.
> >
> > This depends on the preceding selftests fix.
> >
> > Fixes: 534df0c1724b ("net: stmmac: dwxgmac2: Add support for HW-acceler=
ated VLAN stripping")
>=20
> [Severity: Low]
> Is the Fixes: tag in proportion to the change? On DWXLGMAC,
> dwxlgmac2_vlan_ops has no .rx_hw_vlan:
>=20
> const struct stmmac_vlan_ops dwxlgmac2_vlan_ops =3D {
> 	.update_vlan_hash =3D dwxgmac2_update_vlan_hash,
> 	.enable_vlan =3D vlan_enable,
> 	.set_hw_vlan_mode =3D dwxlgmac2_set_hw_vlan_mode,
> };
>=20
> With the old hw_vlan_en =3D true, stmmac_rx_hw_vlan() did nothing, and
> dwxlgmac2_set_hw_vlan_mode() only sets EDVLP. The tag stayed in the
> payload and the VLAN core removed it in software. The only visible effect
> seems to have been the wrong CTAG_RX/STAG_RX advertisement.
>=20
> The same Fixes-tagged patch also does the following:
>=20
> - removes the software stripping path;
> - drops CTAG_RX on every dwmac100/dwmac1000;
> - changes the RX checksum trust rules in stmmac_has_ip_ethertype();
> - makes STAG_RX user-visible in hw_features;
> - depends on the preceding selftests patch.
>=20
> Through the NETIF_F_VLAN_FEATURES check in stmmac_phylink_setup(), it also
> enables EEE RX clock stop on every such platform that does not set
> STMMAC_FLAG_RX_CLK_RUNS_IN_LPI, not only on "some platforms".
>=20
> Could the minimal DWXLGMAC advertisement fix be split out for net, with
> the cleanup and its EEE side effects going to net-next?
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index ca4c7fb11b73f..7896364c43e95 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -8275,15 +8248,17 @@ static int __stmmac_dvr_probe(struct device *de=
vice,
> >  	ndev->features |=3D ndev->hw_features | NETIF_F_HIGHDMA;
> >  	ndev->watchdog_timeo =3D msecs_to_jiffies(watchdog);
> >  #ifdef STMMAC_VLAN_TAG_USED
> > -	/* Both mac100 and gmac support receive VLAN tag detection */
> > -	ndev->features |=3D NETIF_F_HW_VLAN_CTAG_RX;
> > -	if (priv->plat->core_type =3D=3D DWMAC_CORE_XGMAC)
> > -		ndev->features |=3D NETIF_F_HW_VLAN_STAG_RX;
> > -
> > -	if (dwmac_is_xmac(priv->plat->core_type)) {
> > +	if (stmmac_rx_8021q_offload(priv)) {
> > +		ndev->features |=3D NETIF_F_HW_VLAN_CTAG_RX;
> >  		ndev->hw_features |=3D NETIF_F_HW_VLAN_CTAG_RX;
> >  		priv->hw->hw_vlan_en =3D true;
> >  	}
>=20
> [Severity: Medium]
> Does this make RX clock stop reachable from set_rx_mode again?
>=20
> dwmac1000 has no .vlan ops, and neither does DWXLGMAC without
> vlhash/vlins. With CONFIG_VLAN_8021Q enabled, these cores now end up with
> no NETIF_F_VLAN_FEATURES. stmmac_phylink_setup() then does:
>=20
> 	if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI) &&
> 	    !(priv->dev->features & NETIF_F_VLAN_FEATURES))
> 		config->eee_rx_clk_stop_enable =3D true;
>=20
> As a result the PHY may stop RXC while the link is in LPI.
>=20
> stmmac_set_rx_mode() runs with BH disabled under netif_addr_lock_bh(). It
> cannot use phylink_rx_clk_stop_block(), which needs RTNL and a sleeping
> MDIO access:
>=20
>  *  FIXME: This may need RXC to be running, but it may be called with BH
>  *  disabled, which means we can't call phylink_rx_clk_stop*().
>  */
> static void stmmac_set_rx_mode(struct net_device *dev)
> {
> 	struct stmmac_priv *priv =3D netdev_priv(dev);
>=20
> 	stmmac_set_filter(priv, priv->hw, dev);
>=20
> Commit c171e679ee66 notes that the hardware needs RXC when MAC address
> configuration registers are written. On these platforms, could a
> multicast join/leave, a promisc/allmulti change or a secondary unicast
> address update reach stmmac_set_filter() while RXC is stopped? That would
> leave the address or hash filter unprogrammed.
>=20
> The selftests patch covers the ethtool selftests, but the commit message
> does not mention this path. dwmac100 should not be affected because it
> has no EEE.
>=20
> These platforms did run with RX clock stop before c171e679ee66, and they
> still do with CONFIG_VLAN_8021Q=3Dn. Whether dwmac1000 filter writes
> actually fail without RXC is therefore a hardware question.

I think this is a real problem, but the fix we have in place is quite frigi=
le
and error prone (we already have the same problem with CONFIG_VLAN_8021Q=3D=
n).
I think this problem should be properly addressed with a specific patch not
included in this series.

>=20
> > +
> > +	if (stmmac_rx_8021ad_offload(priv)) {
> > +		ndev->features |=3D NETIF_F_HW_VLAN_STAG_RX;
> > +		ndev->hw_features |=3D NETIF_F_HW_VLAN_STAG_RX;
> > +	}
>=20
> [Severity: Low]
> Should STAG_RX be added to hw_features here? On DWXGMAC this tells
> userspace the bit can be toggled on its own, but stmmac_fix_features()
> ties it to CTAG_RX:
>=20
> 	if (stmmac_rx_8021ad_offload(priv)) {
> 		if (features & NETIF_F_HW_VLAN_CTAG_RX)
> 			features |=3D NETIF_F_HW_VLAN_STAG_RX;
> 		else
> 			features &=3D ~NETIF_F_HW_VLAN_STAG_RX;
> 	}
>=20
> stmmac_set_features() also has only one combined hw_vlan_en state.
>=20
> So "ethtool -K <dev> rx-vlan-stag-hw-parse off" with rxvlan on, or "on"
> with rxvlan off, is always undone. ethtool then reports [requested off]
> or [requested on].
>=20
> Before this patch STAG_RX was only in features and showed as [fixed],
> which matched the coupling. The coupling in stmmac_fix_features() already
> adds STAG_RX back when CTAG_RX is re-enabled.

I guess this is managed by stmmac_fix_features() disabling
NETIF_F_HW_VLAN_STAG_RX if NETIF_F_HW_VLAN_CTAG_RX is not enabled.

Regards,
Lorenzo

>=20
> > +
> >  	if (priv->dma_cap.vlhash) {
> >  		ndev->features |=3D NETIF_F_HW_VLAN_CTAG_FILTER;
> >  		if (priv->plat->core_type =3D=3D DWMAC_CORE_XGMAC)
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261125-stmmac-rx-mb-v13-0-0f6bac53e8d5%40oss.qualcomm.com

--aiSzvVqs8OuRzqhp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawlTbQAKCRA6cBh0uS2t
rMjhAQD7OT4u2F91OBhSwrDdaIBx+W8JJmXwQ8kX1B39SfO7TgD+MvXCtW4fMFkJ
2oXKGDtwuLSvJwEftL9xfcwbHAZ8KA8=
=giXr
-----END PGP SIGNATURE-----

--aiSzvVqs8OuRzqhp--

