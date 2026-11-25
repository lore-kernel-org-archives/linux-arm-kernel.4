Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7717606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Zw+9sCC;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQuSyuks;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UdkfyCax
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xjRidLxpYYpshyibMcUCN31eOmWh93d61nSZCZHtL/Q=; b=2Zw+9sCCV/5vkjeEzkEDxk7u1d
	C1p06+ce1bUeVfJWSZK23O/zHw92QPTX01lNsdD8+qSV13m/BAHjyeL7NJJqyZRMzGnjDFucUlx6C
	3ERmOURZCuNBt86wM+84nF2bvfrrx+FtjFg53qDT4IgM3zl+/XjxT6OKXoatr3IxX083fcSxqk4PB
	DXgDAsxNG9qrkWRneCK3iym//oG+zrUJgrTaoC6YfCnhPgBscrGOMgtFxa2qvs2X1iQBkQ5csdMWO
	snCSwF42Zh1m3srtwn5gQJ6kKl6e0WItNlC9yZYPfieWFR/jzGCKsiOoqyKeT21Q6Yf6Qx76VXNpu
	oJdCG+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEJC-0000000AEeu-0UZH;
	Wed, 25 Nov 2026 14:49:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEJ9-0000000AEdv-3JtO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:49:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMArt1158247
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xjRidLxpYYpshyibMcUCN3
	1eOmWh93d61nSZCZHtL/Q=; b=kQuSyuks+pNZvNPalZANYPCjN5rIqwyZSHFyC5
	tY45ajeRTTH2EyUfhU537IU7jD0nKpsXWpQ1zghwDEPBknkWWhVy/fLkTqwmXLXl
	EccPO8wX7vhDQpIVu7lZi5d45gI24yPsW7KP5hx/oCy1T54gYzvq/UUdxvJil5Rb
	9OrcvJ0t3LsRgYzzLmftKlCz59pnso50p++mTevejpIUIkTm6Da5WnqJV5sTw/lS
	jIXTSlGK18ILeEEHfaUVVidvg5lAPT7f2V909fVtsdksSPv3tbrTgGBI4ufkiZxZ
	3Mxe7vpRZQnLV8ajrYTRFMFlif/cfZOA5wQnM+nqR2JzGOkg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnsay2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:49:14 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0e878f574so89880907b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795618154; x=1796222954; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xjRidLxpYYpshyibMcUCN31eOmWh93d61nSZCZHtL/Q=;
        b=UdkfyCax42sk+q7G4QigB19eGnTgDarKvQtmQpLx1ANVX7o1/aoYtwUrpx9d6Mh8oy
         oL4/n1PLAwQdHtcKnuCiDiHcNEQL+uIR44d9ySImwcdPDXApNEOtWoP8+QKMqet7fO+d
         KKj1UkEtkeF5URoY/gVK4soGipivTkeljyuHgLnr8lxuneG2aCrbO0GXngiI3Az8zmaV
         yrRjOhlw+5XZwjzP7Z/vBuTBL+rbLJGu++LClhkKK7QW8d2wd7aXsb11vpHkclfFJm7e
         Zu/uPm5cBhjYhW0GK2m6yZwucESl2c9CSnC4pKbLZpdYT7/9QWXZSxlzj5NSZ2rgYOEn
         MfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618154; x=1796222954;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xjRidLxpYYpshyibMcUCN31eOmWh93d61nSZCZHtL/Q=;
        b=BRQjhyMLgaBYVzWQ8o7uo6ft9MRUHH01f+1rEf2zFpeZlFmBbtZmsYLC0A4jKB/wWS
         hg/vqFCYqV8UWZrfGtWv3sfeQD//YwGxUSVj2NLp4Xx6PbeB9V/8UEXPKhzOrv3TqKoq
         pjBn7VrbNeKRZum6WHgHXcIk2zZ23aGv+KC6lYkHpDDa4KQUfCTlQfSpntuoeEtJMia0
         k4mBBYbrOHBSUJvqrQvSix8F2PnukpKOxLwzY8oYeT2hejPhuyi/xiLFFdxRLj5eDVfo
         1ijTgi5uugcbek/0Uvzq+mHCIgE0aslj3fNWrpR4isdGrAepZJw004ujr/gs65kuuJAY
         721Q==
X-Forwarded-Encrypted: i=1; AL+hErECctiEX710UYvyM6LudvChWeo/hGqovLKMc/Q52HTL5RKmNkgXp73UsxjO8kzNS2WWxJblmjusWVcQf2s9/ptB@lists.infradead.org
X-Gm-Message-State: APuU4Z9Wu0R6Or63IXochstwrjeRx4L00WjrvDMAMOz+SJOnqifZ+50v
	PobriyXGgSzgWRI/1h9h9USbWOdU1f+Auk2qFPNarAJO4SqElouw2g7/cLHbFqKbC6R763pFYwn
	RZ5dF3LHYCRsraE0BOLOWFWXf2b8LsawfMG6OeN/Vz0QrA9lEmBONo3CLHBArS3ZU917CtNCJtg
	HcIA==
X-Gm-Gg: AZFdTZdW96LbjdWK5IA7HZxCH3oV8ygjzE49JdlqqWonAS2dV9bUzvzFYyoO/DQZd7C
	dc0pdTHhk3VaThVcfOp3MmipB9rl0SgD2sIOF74uIdyPpcl2RoaPuzsg44AleAJewMuwqoKEgT+
	7LhO2AG1rpPTf+Pfr6bWb7qE37KP++40kNQANClg98LZn6FN1O4OozZjUQDdEhogtCTGO/jMs8S
	xRwg17dDj2zCA1GnGLfx0XUoclfuKQ9g9A84tR9ORiLZ7u7tOcaAJjIbMMyU0+l8lPpQ1KrQo6J
	5L3xNGwzdJLduejmT66KyNJXnMsOl8QrrYhjdTkHrxpgUhyWc6c07PSKUqkUruagVLJuoa1qaTb
	/O2l1qe1ElU9g2OJR77PFN/Q2CCiqwKpKNBtivN4GpIHIjdh5lS1WW7u1ddlvRaU=
X-Received: by 2002:a05:690c:a0ae:20b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b518ecd3eemr56670737b3.17.1795618153465;
        Wed, 25 Nov 2026 06:49:13 -0800 (PST)
X-Received: by 2002:a05:690c:a0ae:20b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b518ecd3eemr56670237b3.17.1795618152820;
        Wed, 25 Nov 2026 06:49:12 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm29175415f8f.46.2026.11.25.06.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:49:11 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v13 0/5] net: stmmac: introduce XDP rx multi-buff
 support
Date: Wed, 25 Nov 2026 15:48:45 +0100
Message-Id: <20261125-stmmac-rx-mb-v13-0-0f6bac53e8d5@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XSS27DIBAG4KtEXpdoZniZrnqPqguMh8ZSbbe2a
 6WKcvcSL1rkhA0SID6Gf7hUM08dz9Xz4VJNvHZzNw5pgvLpUIWTH95ZdG1aqAjIgMNazEvf+yC
 ms+gbgUYZ58miYl+lI58Tx+68ea/VwIsY+LxUb2nn1M3LOP1sF6247T8mVxQooFEabatA+fgyz
 vPx69t/hLHvj2nYvJUyg3BnUDIM12QYY5RgCob8MxBA7QwpQGiIHi366DgUDJUbZmeoZHD0Knh
 nFcu2YOjccDtDJyPIOinsPcq6YJjMQNoZJhlEpEGnwHXAgmFzY5+HveXRUmshgqZQekudG/ve1
 jcj6jpAQ7pWrmC4fwPvMnWptwGcC46kMaopGAgZchcIQqqklS2oxuhgmlJ3EXPF7pX0U4WLXge
 pOJLSJYUy5e6zpuJASM8UZRMYrXqgXK/XX2/bdy2sAwAA
X-Change-ID: 20260918-stmmac-rx-mb-16469a2714ea
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
        Ihor Solodrai <ihor.solodrai@linux.dev>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, Peilin He <he.peilin@zte.com.cn>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX7247Bcq+cls1
 YD9/qCPclTsGPl+La6eRmPBU4hvTjOd2uHR7yMbaxx7xeV4lEtLdj63wfXbcs38JOAgWLtEMCvf
 eogkCxt0g4KeTgcOakVBel7oh5pr9w/iujnjyKka5Ljc/gqzYy39/7lpIdUe+Xd1m6+XIMdbUi5
 tBlm0zwsoiHRkHDLQjFQ+JKmjltcmpjJkHlN4NDxa6gWLhInU+Nrv5ECtd+E0z4xoL8vkl8PqM/
 M1R/nbqcZPYL87M+iXkNOkjjT2Octpxup29UY39e/JmFePMbI+spxZIuhDr+56oBmsikJUZx/oC
 copMlN5Css1El9Va2psboMdVghHu4Lbl1bWKpZEKIxiE3xVttG/gU+ceuGMVo/jlSv43omteJHm
 kQL5mXXslKdsca9N9RUcM2dupJbTqfLFw3Upjl9p9nhqJL9jx+lYc9KKavQ/ZWEw1y/tquzb7ya
 fzVRg4dKcc46IkzgPmQ==
X-Proofpoint-ORIG-GUID: n4VTyesoyFy2yu9MB-mo3Il6vmucfsxr
X-Proofpoint-GUID: n4VTyesoyFy2yu9MB-mo3Il6vmucfsxr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX0770B3Smelkk
 0fIz6zlttdto45HWrExo9UBptF7tazAV53oT5E45PsDPxo3jCWsIcnGkgRfXAAit9QQJjhFpfCZ
 O72aLs2aDNtqmMcjv7m4GE+ZKZBzD9g=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06f56a cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=93y8aKn5o8w3FQiO0KoA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064915_963889_08B1DA2B 
X-CRM114-Status: GOOD (  18.22  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rework stmmac_rx() to build the xdp_buff from all the descriptors that make
up a frame, so the XDP program runs on the whole (possibly fragmented)
packet instead of the first buffer only. Fix possible rx_q state leaks
when closing/opening the interface.

---
Changes in v13:
- Drop __xdp_build_skb_from_buff() utility routine.
- Cherry-pick patch 1/5 and 2/5 to remove sw vlan stripping.
- Drop NETDEV_XDP_ACT_RX_SG XDP feature.
- Link to v12: https://lore.kernel.org/r/20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com

Changes in v12:
- Rebase on top of net-next main branch.
- Link to v11: https://lore.kernel.org/r/20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com

Changes in v11:
- Fix kernel-doc for __xdp_build_skb_from_buff().
- Add sanity checks for xdp_buff_shrink_tail().
- Link to v10: https://lore.kernel.org/r/20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc@oss.qualcomm.com

Changes in v10:
- Introduce __xdp_return_buff(), xdp_buff_shrink_tail() and
  __xdp_build_skb_from_buff() helpers.
- Link to v9: https://lore.kernel.org/r/20261106-stmmac-rx-mb-v9-1-c099c923664b@oss.qualcomm.com

Changes in v9:
- Rebase on top of net-next main branch.
- Link to v8: https://lore.kernel.org/r/20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com

Changes in v8:
- Add patch 'net: stmmac: fix VLAN tag stripping on non-linear RX
  frames' to fix sw rx vlan parsing.
- Rebase on top of net-next main branch.
- Link to v7: https://lore.kernel.org/r/20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com

Changes in v7:
- Take into account the case where buf2_len is not 0 for the single
  descriptor case if the interface is running in xdp mode.
- Report rx_not_ls bit if the packet is splitted over multiple
  descriptors for dwmac100 and dwmac1000 cores.
- Link to v6: https://lore.kernel.org/r/20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com

Changes in v6:
- Drop patch 'net: stmmac: allow non-linear xdp_buff in XDP mode' since
  it requires some XDP fixes.
- Introduce patch 'net: stmmac: drop split frames on AF_XDP zero-copy
  RX' to always drop XDP multi-buff frames for AF_XDP mode since it not
  yet supported there.
- Introduce patch 'net: stmmac: drop multi-buffer frames in XDP mode' to
  fix pending bugs due to missing XDP multi-buffer support before patch
  'net: stmmac: rework stmmac_rx to support XDP rx multi-buff'
- Link to v5: https://lore.kernel.org/r/20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com

Changes in v5:
- Fix possible read after bound issue in patch 1/3.
- Do not allow parsing non-linear XDP buffers if the program loaded does
  not support frags.
- Add patch 3/3 to remove MTU constraint for XDP prog.
- Link to v4: https://lore.kernel.org/r/20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com

Changes in v4:
- Reset in_progress flag when the packet is fully consumed.
- Advetise NETDEV_XDP_ACT_RX_SG capability.
- Link to v3: https://lore.kernel.org/r/20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com

Changes in v3:
- Return secondary page in case of error.
- Introduce stmmac_xdp_shrink_tail() to remove the ethernet FCS.
- Add patch 'net: stmmac: take ownership of saved RX state at poll
  entry' from James.
- Link to v2: https://lore.kernel.org/r/20260921-stmmac-rx-mb-v2-1-6e826e1ff306@oss.qualcomm.com

Changes in v2:
- Rely on xdp_buff_add_frag() to create xdp fragments
- Fix bugs in rx_q state recording
- Fix the corner case where we receive more than MAX_SKB_FRAGS fragments
- Cosmetics
- Link to v1: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517d404af@oss.qualcomm.com

---
Lorenzo Bianconi (4):
      net: stmmac: remove software VLAN tag stripping
      net: xdp: add xdp_buff_shrink_tail() helper
      net: xdp: add __xdp_return_buff() helper
      net: stmmac: rework stmmac_rx to support XDP rx multi-buff

Maxime Chevallier (1):
      net: stmmac: selftests: Prevent RXC from being disabled in LPI

 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  15 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 319 +++++++++------------
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c |   2 +
 include/net/xdp.h                                  |  10 +-
 net/core/filter.c                                  |  80 +-----
 net/core/xdp.c                                     |  98 ++++++-
 6 files changed, 261 insertions(+), 263 deletions(-)
---
base-commit: 4cd558c2f1de7f1800f7d9065303ca5833cbad56
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


