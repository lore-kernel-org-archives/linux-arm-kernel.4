Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4D0606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 17:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CltajPhw;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7QsBHkt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UeOmqczk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jSHfkzBiNByvDfDTLqOlddtpy57ZmGp+HuTqJSiKH9c=; b=CltajPhwaltcZeM6AkVMm2EykR
	r4Ib3YtsIO+4F0LtBbGqWN2OWknGJTEeoGPpzvqLAVLEXfPwo6fWlbRbhxUm/13zSqMUFy1TX0IKR
	1XQjGDZXFUfTukzgEUnj7obRH02Uf1C6qjMRhhH1yT7Hyi0ITDGagjqoOw8JWbdLcJ3/FvglIAtcU
	3MOJegUgxTb9OSU3iZbfGJx5h8KIJg055VP4GZDw/0ngIvrUpZKMpoidCRq6BoDRnqQyfJmoMrfii
	BA/Xm8hPoGhCeWWXZbPuVPiEBG4vJCArWT/buOvO+AaESt1qu+QURnYlxAawny2NMipSrGBLWh9DT
	93gSjIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUomI-0000000HZRo-1L0Y;
	Sat, 21 Nov 2026 17:21:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUomG-0000000HZQt-1u1A
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 17:21:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFaOf31592719
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jSHfkzBiNByvDfDTLqOlddtp
	y57ZmGp+HuTqJSiKH9c=; b=R7QsBHkt5xgA0Bs5j6WT3Em5PY+MKTNHpjePdnLw
	iYoyYWkmtrH9znByMBLdC/Q2/+wjNiOZdDnzuCNoS9uQ8O69TX0BYRTdseIFdqae
	lkrH158vRG43lB6VUYR4mxU9i7hJECnrN0c6S30xJC2j8l5b4HfqvQlFLQ8T6R46
	E+TJ+qx3+3rZ0si605OlitC9HeaMrnMFXrOus/5S8oLm9LJQRkD4It6V0Ugo4Nsu
	bxFN/g+1/lWtylGjEbQfcbDbS2FfgU4rLuBRo/Fq9PzE6+7JO8+kfLDpYuUDYV+Q
	Cv70wR3pjVsycAROUqPX885ssaugdoRAd6eaka9pwC0jpg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6hrb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:21:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so521307485a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 09:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795281687; x=1795886487; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jSHfkzBiNByvDfDTLqOlddtpy57ZmGp+HuTqJSiKH9c=;
        b=UeOmqczk+6Yukxgls2iPduTic4ypdYkiiOfPUaYJaiIo3aDPTiNlpuB5bbrFD4cZP6
         Ij4UT0F3ViI+uBbebrIAtvidtzB2tocFIXtNao35N9y9lakkor3We4vm8YTrsapiKVBR
         40XkNTFRqpO/rA10tZX+PTPKXFW/aeR8bvem4oWpoDvELBaOH7e51UOueC52cuDMWjGs
         0t4KwVpaQxgAUm8N4zt5D1NhXPezwUzCntyvKoruMqfK3n9XCSGR53i9h0v+aMxbwvsB
         kHrLVnhBfy6QYA5Z3byPSBogBqohUDZGIDv/iywBdj2MwQIfdgF48rDYpIm6XtBYeIGa
         RfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281687; x=1795886487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSHfkzBiNByvDfDTLqOlddtpy57ZmGp+HuTqJSiKH9c=;
        b=zeDVPLvVnrHSDetbHExV1gS0aTkPmlJKGU3D3tkWi5nqDRlNKTvNnQEh+XTMFchJQV
         3vwcZuEP+oAuitq6YZh1KwjYPt4mOnRyqhMjqI8BKUZC4Sr5Ax5qseFI+Q/qA4Dj3nd1
         HbhevWDzTaoQN3JSSXhDjNWsp+IQ2LV6Jlq2clkl6R80bSh+Y3kpLupSorvNwIM8zwdP
         anOf61r+vLLkcKvS5PQzF14Bxlfy7jn9bHRHpMKTFHNnfm8mIknDQ9tknkALU2cygp8P
         1Sf/Zs0+z60R07CUvBZC/AVfuUVSymUtCuvsyrMrYyY/yH8M2YIk2hdIRMBR5hkgxLSG
         XruA==
X-Forwarded-Encrypted: i=1; AL+hErF7A8JiX/3yIUV3SrvZzhr9zCtnFcBD29atYWgIwP/LsbKZcw6kb2FvLBDwyupgi9tkSV9jW0de5M61AEzbfNTN@lists.infradead.org
X-Gm-Message-State: APuU4Z/qAcHVTrzSllpXpeXEJm3t2+C8Xz6Zr8EjnVUcmdPExuoafc1N
	PvE+tN81dK3czU5LtUrux9AXu1L2cVnT4BSsYqOGgMHuIlAmGiLlL7WBSL1GKCp5oYwuGuPbkZz
	x79X0vv/7M/coSrgGC2QZAtUG7oLRxH/To0eY5QJNIomylDoGeKCEOxXC9xerdSpJGAXFu6RR7l
	nD3g==
X-Gm-Gg: AZFdTZdyz0UWG4k2ewaAoU5lbj84EPhotO0BPUxgzDjtCd56r9z7QaweQKa/k6zBvLB
	jzOHM3ZWcOsXKwydPckpo27tTHDGL8maM7aRilLwVDHf/Xtl7uZ6sV/EvOikUrZM7t4intjOqq8
	Br3ztJTJQxzcSw4Krh/mQe30RUwHyEY4Q5RBUBi7JWSFyfGdmZtRJKipoEUZgiVJtgLbhnLqInH
	JkVyv409FOPEcIczShPNLhbl+FPCx+knUCEPc8qcIPVyWDqWH6EOicuVujwFm6Z/J5M5k7xhptI
	3IzyedGvCM7C1AnmYKL4HL/S7PPyMEN3R2Ok1Q76XlTuaQSW37icdlLfChYvt35+JOvzNcAmDFH
	G6zMcTvEWlXznHFn1q5gXwNuCL40F6RuY0RlQXEteb7UHOvnYG96b7w5A+vQCyDiaMw==
X-Received: by 2002:a05:620a:130d:b0:949:61a9:5a6e with SMTP id af79cd13be357-949ba9c732emr1108781785a.31.1795281686592;
        Sat, 21 Nov 2026 09:21:26 -0800 (PST)
X-Received: by 2002:a05:620a:130d:b0:949:61a9:5a6e with SMTP id af79cd13be357-949ba9c732emr1108777185a.31.1795281685977;
        Sat, 21 Nov 2026 09:21:25 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm58576735e9.5.2026.11.21.09.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:21:24 -0800 (PST)
Date: Sat, 21 Nov 2026 18:21:23 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
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
        Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, Nicolai Buchwitz <nb@tipi-net.de>
Subject: Re: [PATCH net-next v11 0/4] net: stmmac: introduce XDP rx
 multi-buff support
Message-ID: <awHTE2FEu5SpyROj@lore-qca>
References: <20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o+3BUnz54sJmnQtN"
Content-Disposition: inline
In-Reply-To: <20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com>
X-Proofpoint-GUID: ZZ_OHkufwx8RVci5Gjyv1bX0UFUBGiBM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX1kAKEgYWy/5e
 MlBCiqdJS9J9c6cx7uQyB/mnTWqYs0d6LymVSReAQUAjpQTJhYZ4I06wi8IbI1T3HSQFK4zdKsV
 M3M9WrqYXrelbTXfNlVVE8WnpgOjxKg=
X-Proofpoint-ORIG-GUID: ZZ_OHkufwx8RVci5Gjyv1bX0UFUBGiBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX8zLTn1SRXutc
 elmhhuOaVaTIZtRPAmN6rHcEjZ+hwd9dwbvXMC0hfe90B+h7PcZcsaZ9EbDjzXlEYHLpcKFkGI5
 X7WGkQG6eoDvcvktTCIcGHsLForvXqn6AK6XxKO7mXNfNNLmxFSmWLHHuHGm89bKGnjxLf5rSoG
 X+GTBiv3Cd7MuwrxbxVYAZPWpl7xcNTgOq9OBSSdpZMZthKCGBrPe1dd0NkJ3MVwev7Q8VwfmQ/
 eYlE7SCrw/P4Lbs0FinE4zM/dhDXEbMTkyRFt5EZ+ZV6MXMA/u6BtSCuEVDkh+E/AgTgdXp8wox
 t7mKFQEDeJPG9nRcGJjXXwxh1Pnf0bjyR8nC9WEu8CT39WsE6viKtnCqy2TzmbMM16EbcaG2ijL
 4v0T/baRGzgh9WP1ublaiYYmXoAZIt3Xjwwzv00nNDuGLSqnqfKcg+SABEWNYfpjoftbXCpWvmx
 /gs3yyfY9NVOcivfMbw==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b01d317 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iIgN2aIHOFbAZzYJiOYA:9 a=CjuIK1q_8ugA:10
 a=BKpwHOXHW2ddnCNaEzcA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_092128_611263_32CA6C82 
X-CRM114-Status: GOOD (  26.39  )
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

--o+3BUnz54sJmnQtN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Rework stmmac_rx() to build the xdp_buff from all the descriptors that ma=
ke
> up a frame, so the XDP program runs on the whole (possibly fragmented)
> packet instead of the first buffer only. Fix possible rx_q state leaks
> when closing/opening the interface.

I will repost v12 since this no longer apply to net-next.

Regards,
Lorenzo

>=20
> ---
> Changes in v11:
> - Fix kernel-doc for __xdp_build_skb_from_buff().
> - Add sanity checks for xdp_buff_shrink_tail().
> - Link to v10: https://lore.kernel.org/r/20261112-stmmac-rx-mb-v10-0-d3d0=
4b65c6bc@oss.qualcomm.com
>=20
> Changes in v10:
> - Introduce __xdp_return_buff(), xdp_buff_shrink_tail() and
>   __xdp_build_skb_from_buff() helpers.
> - Link to v9: https://lore.kernel.org/r/20261106-stmmac-rx-mb-v9-1-c099c9=
23664b@oss.qualcomm.com
>=20
> Changes in v9:
> - Rebase on top of net-next main branch.
> - Link to v8: https://lore.kernel.org/r/20261018-stmmac-rx-mb-v8-0-5f58c0=
b25849@oss.qualcomm.com
>=20
> Changes in v8:
> - Add patch 'net: stmmac: fix VLAN tag stripping on non-linear RX
>   frames' to fix sw rx vlan parsing.
> - Rebase on top of net-next main branch.
> - Link to v7: https://lore.kernel.org/r/20261014-stmmac-rx-mb-v7-0-5d2d70=
f052cd@oss.qualcomm.com
>=20
> Changes in v7:
> - Take into account the case where buf2_len is not 0 for the single
>   descriptor case if the interface is running in xdp mode.
> - Report rx_not_ls bit if the packet is splitted over multiple
>   descriptors for dwmac100 and dwmac1000 cores.
> - Link to v6: https://lore.kernel.org/r/20261012-stmmac-rx-mb-v6-0-222505=
0915c1@oss.qualcomm.com
>=20
> Changes in v6:
> - Drop patch 'net: stmmac: allow non-linear xdp_buff in XDP mode' since
>   it requires some XDP fixes.
> - Introduce patch 'net: stmmac: drop split frames on AF_XDP zero-copy
>   RX' to always drop XDP multi-buff frames for AF_XDP mode since it not
>   yet supported there.
> - Introduce patch 'net: stmmac: drop multi-buffer frames in XDP mode' to
>   fix pending bugs due to missing XDP multi-buffer support before patch
>   'net: stmmac: rework stmmac_rx to support XDP rx multi-buff'
> - Link to v5: https://lore.kernel.org/r/20261009-stmmac-rx-mb-v5-0-c38fa4=
eaa138@oss.qualcomm.com
>=20
> Changes in v5:
> - Fix possible read after bound issue in patch 1/3.
> - Do not allow parsing non-linear XDP buffers if the program loaded does
>   not support frags.
> - Add patch 3/3 to remove MTU constraint for XDP prog.
> - Link to v4: https://lore.kernel.org/r/20261006-stmmac-rx-mb-v4-0-efa4ca=
974e3d@oss.qualcomm.com
>=20
> Changes in v4:
> - Reset in_progress flag when the packet is fully consumed.
> - Advetise NETDEV_XDP_ACT_RX_SG capability.
> - Link to v3: https://lore.kernel.org/r/20261004-stmmac-rx-mb-v3-0-50fa17=
1af9ec@oss.qualcomm.com
>=20
> Changes in v3:
> - Return secondary page in case of error.
> - Introduce stmmac_xdp_shrink_tail() to remove the ethernet FCS.
> - Add patch 'net: stmmac: take ownership of saved RX state at poll
>   entry' from James.
> - Link to v2: https://lore.kernel.org/r/20260921-stmmac-rx-mb-v2-1-6e826e=
1ff306@oss.qualcomm.com
>=20
> Changes in v2:
> - Rely on xdp_buff_add_frag() to create xdp fragments
> - Fix bugs in rx_q state recording
> - Fix the corner case where we receive more than MAX_SKB_FRAGS fragments
> - Cosmetics
> - Link to v1: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517=
d404af@oss.qualcomm.com
>=20
> ---
> Lorenzo Bianconi (4):
>       net: xdp: add __xdp_build_skb_from_buff() helper
>       net: xdp: add xdp_buff_shrink_tail() helper
>       net: xdp: add __xdp_return_buff() helper
>       net: stmmac: rework stmmac_rx to support XDP rx multi-buff
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 231 ++++++++++------=
------
>  include/net/xdp.h                                 |  39 +++-
>  net/core/filter.c                                 |  80 +-------
>  net/core/xdp.c                                    | 113 ++++++++++-
>  5 files changed, 254 insertions(+), 212 deletions(-)
> ---
> base-commit: 500da33276f5d81da764775223de9e9a251a4dbf
> change-id: 20260918-stmmac-rx-mb-16469a2714ea
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--o+3BUnz54sJmnQtN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawHTEwAKCRA6cBh0uS2t
rHZUAP9xBnVCVSdCg2brXWGoEWn2rM2YtD6AdXf+gJE3UiWF0QD/QsC0Hdz3Rkst
ExpAixwopSyaEXDDuDtGOW5Rw0yP9wg=
=e5ZR
-----END PGP SIGNATURE-----

--o+3BUnz54sJmnQtN--

