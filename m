Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2820D606A891
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JKglu+7m;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g++cQzTq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uxrn3bk7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lES+zmaepjgeGxhsMXKaDsakwX55QlsqoDr1psCb+v4=; b=JKglu+7ms0rl36Y4bb584T85xi
	2NmycVNy7KKVfQY59xv21XYrw0ht07jpSXPdni970Hun0ba+VBAmvHvnsUDE2iXixUh+N2bKzZMrN
	Z5vit2NMB8UncKsaUoPWV7/EyT/qpOKJq0kwylCHdXXfnH54jqIJfWn6NI4j+Fgaqc2wZ+bRX9CSL
	khPzs4IJdPga8Z8nxZag/QELiUWzTablrH5UFsf1tyEtutBbKPZDOClxqZkUxeLHpgy1dX6ATgITq
	lC/N5BhPnD2OgfE+5ui+rzwojaIcE47Dow8r493ZApqjV3KCu6O93FJk5/heoBC7dU3innJ4Gu62p
	7C5HnsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXlN-0000000AbgI-16xU;
	Thu, 12 Nov 2026 16:35:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXl7-0000000AbZK-2Kmd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:34:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZj483841546
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lES+zmaepjgeGxhsMXKaDs
	akwX55QlsqoDr1psCb+v4=; b=g++cQzTqcxOUjKgCV4yRKDYq6EDHYmuk6Dc6qQ
	jLmTYWWo1l8sWKW6chz8rKoCItTL/vFTfd70B6f1cM09as1Tqz/E130bI0T3Gw2J
	8L5OD4fG64Xt4TL55d8GUrgd91YLtF7VTF54zBVx2VY2AEcV+ZZoryxUhw3gTLnr
	mO1BnsMmhPxWnkssGSIgfKDOX4SQjfayIvDdx7TyaJn1XF5WIkWNlkkuY9ULnjaD
	GoNjqut4O30HUUbrouz9eof1nDP8aGQu3VkKTyoa1mBxsirH78Gj9dKym3CPyhJ9
	4nUFAszs3sN8bQydv91HEhq459NOvQeV1W5H0t8mRZverN+A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e19wwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:34:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2eba206f4so3248407137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794501283; x=1795106083; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lES+zmaepjgeGxhsMXKaDsakwX55QlsqoDr1psCb+v4=;
        b=Uxrn3bk7ZOHmFm5Uus7Dym+5McJGf7Q6W/ZK4ovUiII5BuIgMVfTBvEaUF3IukxkSX
         BciEnflBV5dUyw5xAv3JfhTN/wivAc2w8ZRNsllxIx2iYFjqiP6eknDE7cV6AkcDmEf2
         uFZrsACnMdpV00IUeOd3QwRxE7KWBjqZmpH8wiSkV7RrsmeCarzsDQ8U8SXijVAMjhjn
         5DLj8XJW1cNWzpCP/lR9KSUGZQZdENRt9473jRf0nA4lc+snIrT5ekajxQ3L3eicrEvw
         RQlYjzAzkIGNOvCvFbfXX2PTF63jaWgT7WnTixd/G9E0Q97KVqLSiViwFLSxzCPRaA3k
         TRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501283; x=1795106083;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lES+zmaepjgeGxhsMXKaDsakwX55QlsqoDr1psCb+v4=;
        b=hlp0M+svc1g+saZMy6tYcTwQkAw3YsJsjFefETKKtac6a9T2sDlkICzD9RIk3SSs3b
         st6JiOELioQK8OBMq9cQFLn8rn3riyh8ozQusMruu1Sc7YZKGzL8ZNpW7US90pfbFj3X
         dba/WdlHa9CtajQsg5cK2yY/k61JHWqxEiNGI9iCeii7pqgfTcoeckuyulyDoYBPw06o
         4CRR7xJjR3LP99rlDvWkyW9bEEYaEm7qdrY26cjh6cnAHTlggGhzxBhgsB1I81Tj8sLt
         v6RBjltvBHvqxzyYHd+yavgrMUYmgVBsBuCFRL9g7BHwJDcIdVJXUWjoSSED7x3BSuXM
         UdlA==
X-Forwarded-Encrypted: i=1; AL+hErGPRzdPcAXwGCYhXA+KgHRepzTv8eHNWo5LaTyOVQM+MCBMGxa4ybVXrhn1Jb1JP9isoN8hf9UdtBqDMbF4Npv3@lists.infradead.org
X-Gm-Message-State: APuU4Z/s7LkjmwyJw0h9zOubs1Kh4GWnItPC3TfN2KzNuwDdNY5xoQla
	XA4L6PglpVJStGkV2J79BJvLYI+R9dJJoTAPbFlxtNwvtkG/1CSl8RliSUfe9eV0MjW0VUE8K+3
	z/ICaXAj1kkHYQALj60GHc1llpqQlzakzyUc4Gx+WI99Uldyh+ryjleSKoPhAjrX8kz1s2u0+lN
	shlg==
X-Gm-Gg: AYBFou0wHlKfcdyMcXBlmwZFpkE53JkdVk8TWYrTY2rsZMfxrhfl1CF1asw9ZLos/ba
	fh25skqa8Sy7Yj8mkKWpKaJ961HNtQemfH1OlKvKIEUnSWtG3lgYvhDk7ZKbrte8Lp2gBnzvkY9
	+arGH3Bpx/hu8WDL0GGy5caY79Qv/GLovXq8a6FBHzzijf0o424/g2hZ8V0rjjd1qhCFTx/wtX2
	F1WFhkndmpnC2J8Rpo+wX6RdJ5xZvwLwCF6C039Jrf4aUVpnaCGSZEpklcE5J4BBDIwgFS0X6Vx
	sZugX9nbeMybY/AK+TKQJwBcppJFnnSsz93zUh8yTm7vXbjNHvbzE77ZAhEmiY6aKGRBFXsR9Fp
	IeF00krVfo3NcQTO/TvhT+7SyRCBKq64j/6pdM5CZ/pIQp9CLAFy1NJx3H6+s98E=
X-Received: by 2002:a05:6102:cca:b0:7cc:3246:3095 with SMTP id ada2fe7eead31-7d506243039mr2843135137.34.1794501283094;
        Thu, 12 Nov 2026 08:34:43 -0800 (PST)
X-Received: by 2002:a05:6102:cca:b0:7cc:3246:3095 with SMTP id ada2fe7eead31-7d506243039mr2843103137.34.1794501282385;
        Thu, 12 Nov 2026 08:34:42 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm90771425e9.5.2026.11.12.08.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:34:41 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v10 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Date: Thu, 12 Nov 2026 17:34:09 +0100
Message-Id: <20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XRzW7DIAwH8FepOI/KNh+BnfYe0w6EwBppSbqQR
 Z2qvvtoDlvEygXJWPws/r6yFOY+JPZ8uLI5rH3qpzEXCE8H5k9ufA+87/IFIyANFg1PyzA4z+c
 LH1qOWmrrqEEZHMtPznOI/WXzXtkYFj6Gy8LecufUp2Wav7dBK279x+SKHDm0UmHTSZAuvkwpH
 T+/3IefhuGYj81baWcQFgZlQwdDOmCMAnTFEL8GAsjCEBy4guiwQRdt8BVD7g1dGDIbITrpnW1
 kEF3FUHvDFobKhhcmK8E5FKZi6J2BVBg6G0SkQOXAlceK0eyNMo/mnkdHXQMRFPnaX8zeKHdr7
 kZUxkNLykhbMeyfgf8ytXm3Hqz1loTWsn1g3G63Hw2Ams/aAgAA
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
        Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX0pDo1Ke9eigy
 sqJKriOiYoaKLB6fbemNh1uOykkbAmhfYvXc8pClV/gbJa119Xx33q5t+2B83mFOlWtMAnLLH0d
 dCbYhxK9CUDtU5TQQgzxkUJG8/SyEiO1YVTgV7BqakTH5kpBJC5m7TtEsQPq/H1EAXlviypADMO
 TRDiXICLcsEaqqR7euB+nZYkfRu1xrQ3Fat3ToXgicXoFCFV9kwQCd7FPa7VtgTWU0NGJhyJUJV
 kRzZKX/rXG9OJQh9MugC4sE73DVjzEbcRVeemhtZ5Qb58kBFTuIdXYD5rFNmkDoTmfThphwJr5u
 DUWL6W8gjrcnkZIduNKPbYvj3FpC97EANUVDe/IyCkuaiH1+fs3Ir1U+CUAejdONa7ALuhP5H7O
 owmQwwaZyzAjnuOaEjzoH2nRk/JODUU1fTipCiR4mV7qz9eW4J4PXBk01sZMWebM7MRLBQA8/AD
 W7QsB6ziMGS7KM1F4Kw==
X-Proofpoint-GUID: ZjRcAj7delfAiXBCNabECHUWfV1ulJDj
X-Proofpoint-ORIG-GUID: ZjRcAj7delfAiXBCNabECHUWfV1ulJDj
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5eaa3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u4BqklbH0r9NqUsF4ZAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX5LDVrgc2lvem
 r+8nkmgbi657fPhUienl6NFzv+4J5gqOaOhwIUc+mhpqvLZPvb2xEUQh+d3T3UzEEcJSLq1Gyt2
 vC0tCOJcxfwgWmh1TlAGdQAoWEh9gU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083445_720411_215A068A 
X-CRM114-Status: GOOD (  17.56  )
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
      net: xdp: add __xdp_build_skb_from_buff() helper
      net: xdp: add xdp_buff_shrink_tail() helper
      net: xdp: add __xdp_return_buff() helper
      net: stmmac: rework stmmac_rx to support XDP rx multi-buff

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 231 ++++++++++------------
 include/net/xdp.h                                 |  27 ++-
 net/core/filter.c                                 |  83 +-------
 net/core/xdp.c                                    | 111 ++++++++++-
 5 files changed, 240 insertions(+), 215 deletions(-)
---
base-commit: a640dd0ffdbcfd23223ae2e84249d23776d41d5c
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


