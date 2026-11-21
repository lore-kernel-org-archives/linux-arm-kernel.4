Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BE0606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 17:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qv54OrHK;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zv+8ZyQw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bXSVtXkw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7DZBRLWlHkGi1KtcDmZ8eA1GEo6FxePP36SW0/HcqeM=; b=qv54OrHKny0pQ4Y/0ayt8C5Au+
	WNZkqE50bT0NtpT2DJbhGMDL+E8G0Nk+JIIFTvLxzSSo0OrtaBkVwyXBZLACS+8/nwWMhEsMHmplU
	uf4yag02hDJFMFtD1jrG7vQetsehgHUyRfbKr3oR+vKx+g5dYzOw2zycK6qHelyhRCi7naD7ZzAk2
	tqEjja7JCyeTjRhVXf5340csFd4JZVpxUb1x1DphVXk8m98GyNkaXVxhmlJWIa6dvztVYnW/ZFg4m
	2xBkLHA0P4r4qXSCmyTFB5N0M+jM4cCD7Lo52JAPY32c6/z8ZrKwQpr46H4SdYZWu7GQugXlCtwPr
	lJzm8FZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUon0-0000000HZcm-20Gk;
	Sat, 21 Nov 2026 17:22:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUomy-0000000HZc7-1RHi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 17:22:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFbkX8004269
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7DZBRLWlHkGi1KtcDmZ8eA1G
	Eo6FxePP36SW0/HcqeM=; b=Zv+8ZyQwXnyBNHKk9ZkZ+jvL2VUqrl2r9QqAEyQ1
	EtyCrOluPVy+iEAE88b6aE2HgL7qcAtisNlkQz0mWPjGrFI4bb2rb9ZGfMUfWPFK
	3lRvX9GvxtoDUrl2CLom0RkOX98k9MwLUDobUC1aqtiv1bs0367TQf9wZh6M5CJq
	0fA2n/GHyQWtstPayvi7QIfHRe26F0fnapuExyZqea72JVALg1KUVC7SVpbmmdAU
	G5W+PNvbzwDY6gCLLHMbCBX4fMMsTqMqcgOUQhbee/b+QfJcgdMV2lg/D1EGyiYp
	Of2QxtIrIeGm4I1G80VBj7vZdRLJXHc5LNJaay3rZlMItQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka1fjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:22:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210bbc04abso39990756d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 09:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795281731; x=1795886531; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7DZBRLWlHkGi1KtcDmZ8eA1GEo6FxePP36SW0/HcqeM=;
        b=bXSVtXkwQMpvkgxwMSUppHISGgM+LAsA1km/prt/Wl6QZVgjeqG+GbmUmYUJKisSQ5
         Zc+UoAaIa2W0+jB74BG0dBaYnSztdDAOXMhXoWRNwR318RZmoQUMkOKYFUzzB6huu/Dg
         s9zfq1iND4fxPWiFHbAr/5v7uxTn2wuzrUxM/8SvOZdgXiLvnQptVoBgWKSakO2oGbiO
         PM0jYFW8TsgKmGS+b2HKPhZrzPgDsTM6SDmctDjZhSsdwYVH33icLggH2npISX8GRUgk
         Rn6OLAtVSTdu4Dm5PjD48BmQMX8fa4BvRiQkEmQNr9rzP0AEKDIVST1wNtsL5tf2nbBB
         3VzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281731; x=1795886531;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DZBRLWlHkGi1KtcDmZ8eA1GEo6FxePP36SW0/HcqeM=;
        b=dmzNLzYj5GjrHrHQwqWk/UG6xXjMYD7VZNIsf8c28RMZMw08t7ZgoWJW08xctQ4NSp
         Gb9AA6bO8XBL9GYy7MCujavKu6C+jC+ikFYBylnp7VpYKK//ToEyhgHYZSsMNkaUHDWo
         E0ySX7K+HNTWSL1sq5tF+msjH3nYtWnhnYiElQv25UJEhEHC3uvIPH3mGEbTBdjmzg7C
         qEpCvko94CJ7DvihmIdUpqGZUChPA+TgB8v0xVARz5hSDc1MuEIC6lbJFw2JBRPrcJ+b
         TpVJLveX/h+nUU3hEzxZLA8eCAshkC1CEWH++o7OFl06s+24/qchEx9Ca1opz3Wb/Tg9
         nTag==
X-Forwarded-Encrypted: i=1; AL+hErFWRQdKOG/uKcsFPOPmEM4VGVUln56tI+hb9XYcWLqRHx8XyniypvHKy7E+jCa8Fe2R3gbhHoVnIjfVah1g7v4D@lists.infradead.org
X-Gm-Message-State: APuU4Z/nGc3GWKI+nV4ct6k/b1jAn3AcipNA39CaTGZBLLUkWtOK/Nmc
	eqwyZw6aar/RvrBhmdScE33WnOKxbbDVZBDYPu0xyCmAgQNaiIjxpA4/Y1bnw0U8GpgVvT3SSWq
	8pmWaEZIqa+7nMJjk/9nYP8xhO0un6uAxRQde+K1cKjUfmtdn/3Hzv09NMSn9Ol/Vcrz/a7379/
	vztg==
X-Gm-Gg: AZFdTZcy9Ig8FzdXjNkb18XpUi+6KBZOWxV4Ol3UsP2bEgatTnql1UyfFYBNj4NAh+w
	oMm/kAe0KvhILvlwMalROqccTT88Og33zruLWh9y0W7CdGsIQR7BbPQTVOC68AjJKaSx5wjlMqF
	5EkYlzk6zjV7fIwxy+aYyudQeu/bgG/dhBm3cx42d3x5+2KBOpIxQ1cUhPnNMnqG0kLEQGooyq5
	ibMyOcnmE0cWZsjpuRUP1u23LsINJX7wFJoZupq6rSub2sObHHj7IdInML5q2rE31f177MPkSUW
	C5fF2DSwlUFy5rdfJIz0bK6x7ajm3QYnj5KuY/QP24eW3eIqv3cfL8RZKjGF/8PrraYG+wtOxoP
	eqme446VvfzX4bgAEBly0YDiHwEleC5h6DlXDDUyqUnUFNF553SDBmv6RzaEX58VOtA==
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr1120069885a.14.1795281730575;
        Sat, 21 Nov 2026 09:22:10 -0800 (PST)
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr1120063385a.14.1795281729968;
        Sat, 21 Nov 2026 09:22:09 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm62652025e9.4.2026.11.21.09.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:22:08 -0800 (PST)
Date: Sat, 21 Nov 2026 18:22:08 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, olteanv@gmail.com,
        0x1207@gmail.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: fix num tx queues in
 stmmac_xdp_get_tx_queue()
Message-ID: <awHTP0Guug63sEdg@lore-qca>
References: <20261117-stmmac-fix-xdp_get_tx_queue-v1-1-4cd74ee7a76c@oss.qualcomm.com>
 <179515767503.3136.16869341951535795256@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CU6NLkee2yyowqkr"
Content-Disposition: inline
In-Reply-To: <179515767503.3136.16869341951535795256@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX+OHzWEZe6xRM
 kUlEpfx0hhhy/MeWjyK9nrwpXwADy49aVaV1+i7Jwf4uYePLqn8bl2f3FO9BflLqzxLGGvttRVK
 dsDLcQyc7yOO4uLel060iXE4rzKsa7ReLFnSbKjjoWGlzWqy5vtkQU+V7VC+SHcduHcbZDRejhO
 7Fl5bTSSzaKWPuwo7Muddcme7XfaX2gDqduY9oxJ9qVB0O7ecRJudX1Cyhk3h7MH5u7h0uL1Btn
 fNUoIRq7fmFGCqVt8jSWdFNRy9+tB7MV7TgOnnVD2BTQYqe6rd6rbtb3tPb+G0PSW9yzp423nmQ
 kyJ3WM4o+7DTm6BVTGvtnYMuOCma25aRzUUFfEJ7gVeNQBroWSNYWC8HqIyTwFP1A6Yfob0O2RX
 02YuRqWscabHI8mHaeVSK2bloxrSuQrcthcae4eOUfNae35OHP4rl5I1nEGb+lSK6s1TOFcvOIH
 1FFmbbtme+2C6HPDTuA==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b01d343 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=gltBSb88Ej8EbuF-gDgA:9 a=QEXdDO2ut3YA:10
 a=JK20aHAAM9sfSQbfRP8A:9 a=pJ04lnu7RYOZP9TFuWaZ:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-GUID: yGbgtYw2CP9ZkWOurQRHmmOXB6HJGi3B
X-Proofpoint-ORIG-GUID: yGbgtYw2CP9ZkWOurQRHmmOXB6HJGi3B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX70AhV/Dy5Bxb
 aOBPurPElsHDEGihsFDPVyU7DcLCMu5P6/66bfmrG9yLDDqTIWjqi+CkRH1TtEa8eqwmr+7XtBz
 bjvxfMFU2xeBEmKSYs9IJJGPCIs65Mg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_092212_394890_6D7466E9 
X-CRM114-Status: GOOD (  51.81  )
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

--CU6NLkee2yyowqkr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 4
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The commit message says a TX queue passed to
>   netdev_get_tx_queue() must be below dev->real_num_tx_queues while=E2=80=
=A6
> - [Low] The commit message's reason for the change is technically wrong.
> - [Low] stmmac_xdp_get_tx_queue() now bounds the queue index by
>   priv->xmit_qdisc.num_tx_queues and assumes it equals=E2=80=A6
> - [Low] stmmac_xdp_get_tx_queue() (stmmac_main.c:5411) reads
>   priv->xmit_qdisc.num_tx_queues with a plain load from NAPI softirq and=
=E2=80=A6
> - [Low] For XDP_TX, the TX queue is computed twice per RX NAPI poll: -
>   stmmac_xdp_xmit_back() (stmmac_main.c:5436) calls=E2=80=A6

I will take care of them in v2.

Regards,
Lorenzo

>=20
> --
>=20
> net: stmmac: fix num tx queues in stmmac_xdp_get_tx_queue()
>=20
> This commit makes stmmac_xdp_get_tx_queue() wrap the CPU index by
> priv->xmit_qdisc.num_tx_queues instead of plat->tx_queues_to_use. The goal
> is to keep XDP TX inside the real TX queue set when mqprio offload has
> reduced real_num_tx_queues.
>=20
> > The TX queue returned by stmmac_xdp_get_tx_queue() is passed to
> > netdev_get_tx_queue(), so it must be lower than dev->real_num_tx_queues.
>=20
> [Severity: Low]
> Is this reasoning accurate? netdev_get_tx_queue() only requires the index
> to be below num_tx_queues, not real_num_tx_queues:
>=20
> include/linux/netdevice.h:netdev_get_tx_queue() {
> 	DEBUG_NET_WARN_ON_ONCE(index >=3D dev->num_tx_queues);
> 	return &dev->_tx[index];
> }
>=20
> The old index always had a DMA ring behind it as well, because
> tc_setup_dwmac510_mqprio() caps the mqprio queue range at
> tx_queues_to_use:
>=20
> 	if (qopt->offset[i] + qopt->count[i] >
> 	    priv->plat->tx_queues_to_use) {
>=20
> As far as I can tell, what users see with the old code is XDP frames
> bypassing the mqprio/FPE TC-to-queue mapping. In channel mode they can la=
nd
> on unmapped queues, which tc_mqprio_config_queue_prio() sets to prio 0
> under strict priority.
>=20
> Could the commit message describe that impact instead, so stable
> backporters can judge it?
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 25894771e9e9f..cf87afd273439 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5408,13 +5408,14 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_p=
riv *priv, int queue,
> >  static int stmmac_xdp_get_tx_queue(struct stmmac_priv *priv,
> >  				   int cpu)
> >  {
> > +	unsigned int num_tx_queues =3D priv->xmit_qdisc.num_tx_queues;
>=20
> [Severity: Low]
> Can this value get out of sync with dev->real_num_tx_queues while the tc
> mqprio configuration is being changed?
>=20
> In tc_setup_dwmac510_mqprio(), real_num_tx_queues is lowered (with
> synchronize_net()) before the shadow copy is updated:
>=20
> 	err =3D netif_set_real_num_tx_queues(ndev, num_tx_queues);
> 	...
> 		tc_mqprio_config_queue_prio(priv, qopt);
>=20
> 	priv->xmit_qdisc.num_tx_queues =3D num_tx_queues;
>=20
> No grace period follows the store. XDP_TX in NAPI and stmmac_xdp_xmit()
> can therefore still pick a queue that was just removed from the real set,
> and call netdev_get_tx_queue()/__netif_tx_lock() on it.
>=20
> stmmac_reset_tc_mqprio() does the updates in the opposite order, and it
> ignores the return value of the grow:
>=20
> 	priv->xmit_qdisc.num_tx_queues =3D priv->plat->tx_queues_to_use;
> 	priv->xmit_qdisc.enabled =3D false;
>=20
> 	netdev_reset_tc(ndev);
> 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
>=20
> If netif_set_real_num_tx_queues() fails here, the shadow stays above
> real_num_tx_queues until the next stmmac_hw_setup(). That is the mismatch
> this patch is trying to avoid.
>=20
> Would it be simpler to read READ_ONCE(priv->dev->real_num_tx_queues)
> directly, since that follows the core's publish-then-synchronize_net()
> ordering?
>=20
> [Severity: Low]
> This is a plain load from NAPI softirq and ndo_xdp_xmit context.
> tc_setup_dwmac510_mqprio() and stmmac_reset_tc_mqprio() write the field
> with plain stores under RTNL while the device is up. Will KCSAN report
> this as a data race?
>=20
> This path already uses READ_ONCE() for other values that can be tuned at
> runtime, for example in stmmac_xdp_xmit_xdpf():
>=20
> 	tx_coal =3D READ_ONCE(priv->tx_coal_frames[queue]);
>=20
> Without an annotation, the compiler may re-load the field inside the loop
> below. Suppose a re-load during stmmac_reset_tc_mqprio() returns a larger
> value than the one used in the loop test. Then index goes negative, and
> the mixed int/unsigned comparison treats it as a very large value.
>=20
> I have no evidence that any compiler actually does this here. Would it
> still be worth adding READ_ONCE() here and WRITE_ONCE() at both writers?
>=20
> Before this patch the divisor was plat->tx_queues_to_use. That value only
> changes in stmmac_reinit_queues(), while the device is released and NAPI
> is deleted.
>=20
> >  	int index =3D cpu;
> > =20
> >  	if (unlikely(index < 0))
> >  		index =3D 0;
> > =20
> > -	while (index >=3D priv->plat->tx_queues_to_use)
> > -		index -=3D priv->plat->tx_queues_to_use;
> > +	while (index >=3D num_tx_queues)
> > +		index -=3D num_tx_queues;
> > =20
> >  	return index;
> >  }
>=20
> [Severity: Low]
> The divisor can now change at runtime. Can the two calls to this helper
> in one RX NAPI poll then return different queues for XDP_TX?
>=20
> stmmac_xdp_xmit_back() picks the queue for each frame, posts descriptors
> and flushes the tail pointer. It does not arm the coalescing timer:
>=20
> 	queue =3D stmmac_xdp_get_tx_queue(priv, cpu);
> 	nq =3D netdev_get_tx_queue(priv->dev, queue);
> 	...
> 		stmmac_flush_tx_descriptors(priv, queue);
>=20
> stmmac_finalize_xdp_rx() then computes the queue again at the end of
> stmmac_rx()/stmmac_rx_zc(), and arms the timer on that result:
>=20
> 	queue =3D stmmac_xdp_get_tx_queue(priv, cpu);
>=20
> 	if (xdp_status & STMMAC_XDP_TX)
> 		stmmac_tx_timer_arm(priv, queue);
>=20
> If tc_setup_dwmac510_mqprio() changes xmit_qdisc.num_tx_queues between the
> two calls, the frames sit on ring A while the timer is armed on ring B.
>=20
> stmmac_xdp_xmit_xdpf() only sets IC periodically:
>=20
> 	if (tx_coal && (tx_q->tx_count_frames % tx_coal) < num_frames) {
>=20
> So up to tx_coal - 1 descriptors on ring A may get neither a completion
> interrupt nor a timer to schedule stmmac_tx_clean().
>=20
> After a shrink, ring A can be outside the new real set and may not be used
> again. In that case the page_pool pages and DMA buffers stay held until
> ifdown, or until the queue is used again.
>=20
> stmmac_xdp_xmit() arms the timer on the same queue it flushes, so only
> the split XDP_TX path appears to be affected.
>=20
> [Severity: Medium]
> The commit message says the TX queue must be lower than
> real_num_tx_queues. Does the AF_XDP zero-copy TX path still violate that?
>=20
> stmmac_tx_clean() calls stmmac_xdp_xmit_zc() for any queue whose
> tx_q->xsk_pool is set, and stmmac_xdp_xmit_zc() uses the queue id
> directly:
>=20
> 	struct netdev_queue *nq =3D netdev_get_tx_queue(priv->dev, queue);
> 	struct stmmac_tx_queue *tx_q =3D &priv->dma_conf.tx_queue[queue];
>=20
> The queue id is only checked against plat->tx_queues_to_use, in both
> stmmac_xdp_enable_pool() and stmmac_xsk_wakeup():
>=20
> 	if (queue >=3D priv->plat->rx_queues_to_use ||
> 	    queue >=3D priv->plat->tx_queues_to_use)
> 		return -EINVAL;
>=20
> The core's xsk_reg_pool_at_qid() accepts any queue_id below
> max(real_num_rx_queues, real_num_tx_queues). stmmac_hw_setup() keeps
> real_num_rx_queues at rx_queues_to_use.
>=20
> For example, take tx =3D rx =3D 4 and mqprio with 2 TCs on queues 0 and 1.
> real_num_tx_queues is then 2. An AF_XDP zero-copy socket bound to queue 3
> still transmits on TX queue 3, outside the mqprio TC set.
>=20
> tc_setup_dwmac510_mqprio() does not check af_xdp_zc_qps either, so
> shrinking the queue set after the bind gives the same result.
>=20
> Should stmmac_xdp_enable_pool(), stmmac_xsk_wakeup() and the mqprio setup
> also check against xmit_qdisc.num_tx_queues?
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261117-stmmac-fix-xdp_get_tx_queue-v1-1-4cd74ee7a76c%40oss.qualcomm.c=
om

--CU6NLkee2yyowqkr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawHTQAAKCRA6cBh0uS2t
rBNaAQCPlYqlb94GFsQf69dhz86QUg4S4DutkXf0pQWz191uzwEAt7ZM2NzgGmyh
tgeB7XSXca41MPJFRsaDOIr/0+yuagA=
=e3PY
-----END PGP SIGNATURE-----

--CU6NLkee2yyowqkr--

