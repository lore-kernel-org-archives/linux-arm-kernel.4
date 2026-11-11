Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA24606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oq15oIFC;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hu6+dpU2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I4u90Vtu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+X3ktU4+fA/Z3wgtO0+WcGE1/Xq2+nGdw+oL+ADG90k=; b=Oq15oIFC+7XcSogD+KiP6QlbC3
	b98YG/ohhDpZe6UP7t0NEd4oZtD/gjktZB6ecHct/YqPi1M6Nv/7IsP/Gi2RGKyIIMUUnUfytMa/6
	OHMn6vbTrlsJZ5I/NqAGjAHeFqnGPK+EzQNv1nAiZbCEv4CfSlAJVFnwswPTjrHYUlcq6bO8EI1Gm
	MKBOst6FrP8HD1k7lqT9IoApRxi0bWHDsL7g3Q06r/l/T9J+/kBCSdaB2PhLogWHQ47RLGoqty3gS
	UGMhdjKrwlVr+sDCbdwr4Q0htgCRHG/LzZKzCAwuWfoExLTZLhk/sxPbOWzQQJiUNHItzLQmqYctg
	FGOROQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3xm-000000064fh-2CI5;
	Wed, 11 Nov 2026 08:45:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3xj-000000064f4-49K4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:45:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6ZADh581072
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+X3ktU4+fA/Z3wgtO0+WcGE1
	/Xq2+nGdw+oL+ADG90k=; b=Hu6+dpU2pV9HACagcr/adWmF+uHdC+3tPrRE7qKP
	h2AkBKZraIZ0yLeZHiTSqDadvgclY9GJYR4as0Fm1epguzi9XZbZ+chy5HdXfXEm
	Jsd5rRJ+UByFfk9oA/icNRhCd2OTAggzp00VyLZ9EKNK0kLHyNRN/0gSyAvLh30t
	9+fuXf/abJX/4hbEommxgwc5WOrjweiWg7oytXW7nWtsyafLI3M9X60+LG8agxLC
	v+K15qwbk9GTKzCJ/m60e/2LuwE2dFYYnY/L5sKvvGJpD8fCNC9bDhRNYa9++jEp
	BZuJWKk8F7oIO0A+qumU/K9COIWOJ9mOe2fkS091hieb3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7prf8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:45:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945b0154705so449136885a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386745; x=1794991545; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+X3ktU4+fA/Z3wgtO0+WcGE1/Xq2+nGdw+oL+ADG90k=;
        b=I4u90VtuMckXlH2epLob9mdnh319FxYM2KTPABi9DPM1km/hS8n4buajQZaIZVCjCp
         zqOBeeZL7bpC/tiTK3YiHcvoz+cow3frmpza5jpy6HolFKoTaA1AznVaLibzNwILvpZ2
         2LJb/v+aOIGqI1UdkpbHvQUv9uP+Xf5SNL6cbEF+b8OfKgycxkwXZS5QS2y81zym+HKd
         s+apVEPvlTwvAklV+zR5XsREDNS89p6AkltUiab617HhHhpitQYpQNfKgcKxcY7TgVST
         QEdgjD5iRje5d1S3/BsJTKCAQABzbYNicZIrOpDCu+IQF6tECeGBDeY2IQD10HcXW+0B
         ijDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386745; x=1794991545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X3ktU4+fA/Z3wgtO0+WcGE1/Xq2+nGdw+oL+ADG90k=;
        b=soGGKuidg/M3oNTUcS8iHwWAyia5nkk90DlVXS/ZY6hlsEES2lI7HtpR12ljPPmgjc
         SNoqGO3hxzucwVO3s+fFuI3aAMHiYV/K32MEbgl5Xc489Fbx6vXepcCsbV8zRN7dSHSf
         ghhXlwlOabzBgnVyiWwo6O2+FbcdGA5kps31k0ZiD+KA8X7sQIC8K4sc4T0S9XXcWeQN
         98BzPxkPk+OFUvXvexxg14prn+nAHOpydNEuEaL8kt8Ewc5vR5oLsUP9PK/HNg2vQjBl
         aZPrcp0/L29geh+wpY2FChEx8buOmlKdx13yCrJwhCXgmVwLwyC4lYj4AZzHxzDetu4M
         vihw==
X-Forwarded-Encrypted: i=1; AL+hErFWNgEoJqrqIDBnUmZ0UW0GopxSvTrjEAWaR/1DxXc7kQy53G8kHYO/9rLyfh1Yj1VZvNQ3mEvwq7u6wfwohxtZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/EkdWkk9d7q+djE3V44RK5z/mrXjZtAI9wQqnBiPJtCJHQJPT9
	5rgWmm5C8c1WFuBS9NRggDaVJgo1mtUYkjbNE3sSmyRNBkiU4GKrvf7NDyG0O8bXZYHTIbCl+hr
	0FTLrDm1CASvky4WKJZnhafk/uMbMJa7SbW1sdcpflUn3qF6MpFDoFxFaHLyD9if+YAlB2RDrHs
	el4w==
X-Gm-Gg: AYBFou3/NiKSvWc4/uF8boydu8c5cpZblgZq4qmjp2Vd6ftZwPGz6vhtLC8QhgXHX/u
	YroyaTZKU8+m+TLOLsZSnkeVv67SQ32NkmJP+HkpQ9v9dGSbsBlfJ8TSG4auarztDTk0Mztdxs/
	3pJHA95b6DXN8nAsSQ/98Ydmw+ETnqLJOLCrgydtLcw+hYVeI7DTyWpdlp0PzkMNopS3MxPcpIK
	DCXN7yZ+ul7ByrIhaLTVUC3Tsfci6YfgpboCCf7oY81xJ6M0oouTRzZGD2/asIzjWvKuN6ILNDa
	xsmJfN7GvrsxVn5n10RyQE+sUKPOuaMlXL7v73eFb+ouzcepUTOWk8S4gK7quseg8vwYVvnGC2P
	/KU/G5ez0m0DwqLxwQoe6hALsgeNYgwcclKOi18oBYakyVp2txZbtAJOtlaRgsEI=
X-Received: by 2002:a05:620a:1a14:b0:944:9cb:d41c with SMTP id af79cd13be357-947afff4777mr273501285a.19.1794386745332;
        Wed, 11 Nov 2026 00:45:45 -0800 (PST)
X-Received: by 2002:a05:620a:1a14:b0:944:9cb:d41c with SMTP id af79cd13be357-947afff4777mr273498785a.19.1794386744704;
        Wed, 11 Nov 2026 00:45:44 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm144103945e9.6.2026.11.11.00.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:45:41 -0800 (PST)
Date: Wed, 11 Nov 2026 09:45:41 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, Jose.Abreu@synopsys.com,
        boon.leong.ong@intel.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        nb@tipi-net.de
Subject: Re: [PATCH net-next v9] net: stmmac: rework stmmac_rx to support XDP
 rx multi-buff
Message-ID: <avQrNbqkkREH4-mu@lore-desk>
References: <20261106-stmmac-rx-mb-v9-1-c099c923664b@oss.qualcomm.com>
 <179431886808.994134.6784700644892681429@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gJMFUCSiM5fJQdUO"
Content-Disposition: inline
In-Reply-To: <179431886808.994134.6784700644892681429@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX/rsYGahBS4eu
 D+jKVjbNhp5f0aB9ytmVtkZhmj/K9n0LSbjHCVDuwa1at9VMsZ9va8JYxcSH7HXuTXu0Yy4QTTd
 eC9zDwF9qjF48MZEq/tRx5M7/mzz+Vk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfXxdgEoQXE4OSq
 rRgBeIvEscPvD06ykBxSveppgNO749L4hcLA+CpHAkhlXWaU97mAKxlD/7MzSzBppzFArTzJ31y
 S0gUtDL/ZKSCtCkPJmWW2of3bGu8sxEpPEKe5/zy8kD8DgR0kZ6SGrr+CAOgglKc5Zg2wba4c4Z
 qErfctccUbeh1PXXu0X2F/3kmOeLD+m/sbuXCoGbhzMhfw6JCZF9v6tv1wPZhxX+ux9ABwtP+08
 hF839Kpw7Rb4wJosNTZrdDEfM13HVn2XyJVTh0etK0v3RV46cSmqePu0Kc0X8nv5KlYCx7lkYJz
 ReFKPKFTUAGbrpwsHrere4TlXOGXBCiIqIl+94zO/kWd57+ppd5Q0lSfClvL25IPYFX84wi725i
 HJMLRT+BTtDe2XzMYPwBW6ej8t3TZy86dojaKPiE7Z+O046TDJNro7sJZVSOh9UhwyDCCzYSUH3
 DHEy7oPNySt1qZeUquA==
X-Proofpoint-GUID: KhQKNkPGtvoq73qmJunKDCZAtZ0RGzfi
X-Proofpoint-ORIG-GUID: KhQKNkPGtvoq73qmJunKDCZAtZ0RGzfi
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af42b3a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=Lv1XPQFk8ofifZRQ4s0A:9 a=wPNLvfGTeEIA:10
 a=5_ymsXbCtldPo5z8VK4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_004548_035807_96608852 
X-CRM114-Status: GOOD (  46.60  )
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

--gJMFUCSiM5fJQdUO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>=20
> Critical: 0 =B7 High: 0 (1) =B7 Medium: 1 =B7 Low: 1
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The skb head truesize grows on every received frame, including
>   with no XDP program loaded, and the commit message does not say so.
> - [Low] The commit message overstates one change.
>=20
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the patch
>   makes it wider.
>=20
> --
>=20
> net: stmmac: rework stmmac_rx to support XDP rx multi-buff
>=20
> This reworks stmmac_rx() to collect all the descriptors of a frame into an
> xdp_buff, so programs with frags support see the whole packet. On XDP_PASS
> the skb is built from the xdp_buff head and its fragments. The patch also
> saves the in-progress xdp_buff in rx_q->state across NAPI polls, advertis=
es
> NETDEV_XDP_ACT_RX_SG, and strips the FCS with a driver-local tail shrink.
>=20
> > - carry the XDP metadata written with bpf_xdp_adjust_meta() into the skb
> >   via skb_metadata_set(), so it is no longer dropped and TC/BPF programs
> >   can read it through data_meta;
>=20
> [Severity: Low]
> Is this item accurate? The XDP_PASS path in stmmac_rx() already did this
> before the patch. The patch removes these lines from stmmac_rx():
>=20
> -			metasize =3D ctx.xdp.data - ctx.xdp.data_meta;
> -			if (metasize)
> -				skb_metadata_set(skb, metasize);
>=20
> The same logic now lives in stmmac_build_skb().
>=20
> Metadata on linear frames was not being dropped before. The only frames
> that never got metadata were multi-descriptor or buf2 frames, and XDP mode
> dropped those outright. The commit message already covers that elsewhere.
>=20
> Could this item be reworded so it does not read as a fix for a metadata
> loss bug?

I guess this is minor point, I can update the commit message if I need to
repost.

>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index a2177777727ef..c215cc70caa19 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -2290,10 +2294,6 @@ static int __alloc_dma_rx_desc_resources(struct =
stmmac_priv *priv,
> >  			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
> >  	num_pages =3D DIV_ROUND_UP(dma_buf_sz_pad, PAGE_SIZE);
> > =20
> > -	rx_q->queue_index =3D queue;
> > -	rx_q->priv_data =3D priv;
> > -	rx_q->napi_skb_frag_size =3D num_pages * PAGE_SIZE;
> > -
> >  	pp_params.flags =3D PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
> >  	pp_params.pool_size =3D dma_conf->dma_rx_size;
> >  	pp_params.order =3D order_base_2(num_pages);
> > @@ -2321,6 +2321,10 @@ static int __alloc_dma_rx_desc_resources(struct =
stmmac_priv *priv,
> >  	if (!addr)
> >  		return -ENOMEM;
> > =20
> > +	rx_q->queue_index =3D queue;
> > +	rx_q->priv_data =3D priv;
> > +	rx_q->napi_skb_frag_size =3D PAGE_SIZE << pp_params.order;
> > +
>=20
> [Severity: Medium]
> Does this change the skb head truesize for every received frame, even when
> no XDP program is attached?
>=20
> Before the patch the head size was num_pages * PAGE_SIZE. Now it is round=
ed
> up to the page_pool allocation order, and skb->truesize is derived from it
> here:
>=20
> stmmac_rx()
> 	bufsz =3D rx_q->napi_skb_frag_size;
> 	...
> 	xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
>=20
> stmmac_build_skb()
> 	skb =3D napi_build_skb(xdp->data_hard_start, xdp->frame_sz);
>=20
> On 4K pages, a dma_buf_sz of 8188 (BUF_SIZE_8KiB) gives num_pages =3D 3, =
so
> the head grows from 12K to 16K. A dma_buf_sz of 16368 (BUF_SIZE_16KiB)
> gives num_pages =3D 5, so the head grows from 20K to 32K.
>=20
> That shrinks the effective socket receive buffer for jumbo MTU users who
> never load XDP. The commit message calls out the fragment truesize change
> as a behavior change, but not this one. Should this be mentioned too?

Same here, I guess this is minor point, I can update the commit message if
I need to repost.

>=20
> [ ... ]
>=20
> > @@ -5962,120 +6073,79 @@ static int stmmac_rx(struct stmmac_priv *priv,=
 int limit, u32 queue)
>=20
> [ ... ]
>=20
> > +		skb =3D stmmac_xdp_run_prog(priv, &ctx.xdp);
> > +		/* For Not XDP_PASS verdict */
> > +		if (IS_ERR(skb)) {
> > +			unsigned int xdp_res =3D -PTR_ERR(skb);
> > +
> > +			if (xdp_res & STMMAC_XDP_CONSUMED) {
> > +				stmmac_xdp_put_buff(rx_q, &ctx.xdp, true);
> > +				rx_dropped++;
> > +			} else if (xdp_res & (STMMAC_XDP_TX |
> > +					      STMMAC_XDP_REDIRECT)) {
> > +				xdp_status |=3D xdp_res;
> > +			}
> > +			goto next;
> > +		}
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but multi-buffer frames can now
> reach XDP_TX, which makes it worse. Does XDP_TX completion recycle pages
> into this RX queue's page_pool direct cache from the wrong NAPI context?

As pointed out by sashiko, this issue has not been introduced by this patch=
 and
it should be fixed with a dedicated patch.

Regards,
Lorenzo

>=20
> stmmac_xdp_xmit_back() picks the TX queue by CPU, not by RX queue:
>=20
> stmmac_xdp_get_tx_queue()
> 	while (index >=3D priv->plat->tx_queues_to_use)
> 		index -=3D priv->plat->tx_queues_to_use;
>=20
> Completion then runs in that channel's tx_napi:
>=20
> stmmac_napi_poll_tx()
>   stmmac_tx_clean()
>     xdp_return_frame_rx_napi(xdpf)
>       __xdp_return(..., napi_direct=3Dtrue)    /* head and every frag */
>         page_pool_put_unrefed_netmem(..., allow_direct=3Dtrue)
>           page_pool_recycle_in_cache()
>=20
> stmmac_tx_clean() {
> 	...
> 		if (xdpf &&
> 		    tx_q->tx_skbuff_dma[entry].buf_type =3D=3D STMMAC_TXBUF_T_XDP_TX) {
> 			xdp_return_frame_rx_napi(xdpf);
> 	...
> }
>=20
> When allow_direct is already true, page_pool_put_unrefed_netmem() skips t=
he
> page_pool_napi_local() check. That means pool->alloc.cache and
> pool->alloc.count are updated without a lock.
>=20
> The tx_napi is a separate NAPI instance from the rx_napi that owns the
> pool. Meanwhile the owning rx_napi can be on another CPU running
> stmmac_rx_refill() or the allow_direct=3Dtrue puts in stmmac_xdp_put_buff=
(),
> stmmac_build_xdp_frags() and stmmac_xdp_shrink_tail().
>=20
> Can this corrupt the alloc cache? If so, the same page could be handed to
> two RX descriptors, or recycled while an skb still holds it.
>=20
> The race dates back to XDP_TX support. With this patch, though, each
> XDP_TX frame can push the head plus several fragment pages down this path.
> Would returning XDP_TX frames with xdp_return_frame() in stmmac_tx_clean()
> avoid this?
>=20
> --=20
> Sashiko AI review =B7 https://netdev-ai.bots.linux.dev/sashiko/#/patchset=
/20261106-stmmac-rx-mb-v9-1-c099c923664b%40oss.qualcomm.com

--gJMFUCSiM5fJQdUO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavQrNQAKCRA6cBh0uS2t
rEHxAP4yTs3XsBIlnOt4lrybgaZSoFNAmTd4XbIZuJ3aij9V+AEAqpQa28+iqzeF
oCunqOu8nRR8JPtar518G+PA9CcdfwQ=
=IEXt
-----END PGP SIGNATURE-----

--gJMFUCSiM5fJQdUO--

