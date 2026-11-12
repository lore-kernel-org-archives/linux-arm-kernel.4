Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=btBCIgvW;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oV+8yc2l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MgbJYMzR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R3YTjxDP3eSAT7lqnpCK3wtx52mJHt1SDM95nbzIq8M=; b=btBCIgvWLCVhgS
	zg1rqbiPg9vs+z5210JyWO0F+tJxnWKw2ei0tYPGwRyWxoIYsZD0y+LIciM3cpiFQV7bnsSD4x0xg
	PYMzX6blwdw83ea7MJABJDq/E4dJybBJ5gUR59ta6An+DClcAxgY4sUr+B8OhVvB/atQyGlRg8Ku4
	NqkJoSuEamQUAGOdmMBsjnGVGTOWydqFPbfBvF69gL7d1IckkBDAaSy40cKxP40UFFyi0bxnssRt1
	6X8RzFgjCXhat1lMFyvP8ShHkqNcp9oU+0CbFIjCeWC9MUmx5QHYdf6zjLzhz9N7ZrkVDyMMshL8m
	SwOuW0xK6dnWaY1VsKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXmq-0000000Ac2j-1LPz;
	Thu, 12 Nov 2026 16:36:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXlE-0000000Abcs-479A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:35:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZU4Y3841248
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3YTjxDP3eSAT7lqnpCK3wtx52mJHt1SDM95nbzIq8M=; b=oV+8yc2lPua+ZIUr
	tEdrcZN3EalxJPwI7k4pdaZ5kUAv9FGKTQsE6foFv3DWvAf6APkVuDHBb89STdyv
	z0EKK3v1H/63Su56ajSyP1gtsuCmB/MP0rHmCvSM6+1EwlOmi6+WliPHjtAx11aX
	5bocI+4SL7hu5pTRNfWVKWkvpomGEX9vkIR0tXqCTGD72C9dRY1Se+eiyg6Bnke1
	lCuLo0Ih8guN4jfXkzvvh9oDSZNE4Wm4AsdWAuEg9s0PGDvZkPNLFUZ+bVp8PiH8
	rNl6BO0PeMWgMupwiRthKij0CJgjJHUqEEJ8AgzAf6qTU5ShzOZ5LTaC6fhLpBTX
	cE3yfA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e19wxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:34:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecffb6a384so21065e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794501291; x=1795106091; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3YTjxDP3eSAT7lqnpCK3wtx52mJHt1SDM95nbzIq8M=;
        b=MgbJYMzRItdnRyu9BRyjIWmoKci7pralpjX3nPjvj2SBooguv3s2L45Pyzr9Vits+O
         4QDr03TncgaNEATbr5DfBzZxpF/w9gosRlru/mh3e8QbKOcM3pioxw0tkSmnD+EzHV1i
         UTu1+9qjc750hNtFYzOSRSLXBlxQQUQIan5+6+Vjl73LW+kUkDXJ/1JiNOZawUSIdue+
         d7UsAtsaFFF1uub2NUxGFSQGJ+aRleM0HjZWfV0+psxDsBO83tXtq25eR8ZR65mwI2u8
         KzL+wVtaIkgZWeB3+5MOczlb18n/MZcJGOwdvJRdQanUe45V/+5YN0W98qTycv4ezxAc
         Rjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501291; x=1795106091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3YTjxDP3eSAT7lqnpCK3wtx52mJHt1SDM95nbzIq8M=;
        b=vLL2SLpgUnzrr2kzwbjtBAe3KN7S14bNCasxsjpwu2XsP7soM71d1rytv3/7iwlsFs
         /RkhvYKqqsDhOsyTAftOxdcpb9fHcMBbi9+wQMYLuYZbvvUGaoZosMltIaVPw8FXsweV
         /BEUabQXgvybqsxsU8FI7w4FnVTnRBqqKJCyeV0m1neVycg7YnsZtLqs6lG+4egj227g
         W7JrPziWrUBzTOQogZR1dearyOutr/LvrLjeV5GsVOB+1vxYE7tH/yS3KdTpj1NF9P1L
         qPej6dSe6KhHQdbMegl8E6Irf6/lzIYYTlxeuykjHPYP75IiSRJ4PBbC2Y9SUtEhmf4E
         gAwA==
X-Forwarded-Encrypted: i=1; AL+hErFbyQD4vNQsYhtjTDruBxMzHXwtEGgx4x3tNYN286+3voHXZwom4Whwl8IVHhKwghJUZR4OpgbogAHaovSmUb45@lists.infradead.org
X-Gm-Message-State: APuU4Z8TASiPs2KMSO8GaDe7XjTGKiBm20gL/dHkzHYIUDgZmboGUshB
	DL5bB+et/o6kws13h5Co/9hAWa2z4R6o/pjpG1CKS9RYP39u6+plyVg3tgwb+Fsj1xWQfsl8+DS
	M/AuZmUUjjpFgDCCTVdiLD42xgSJKPVYZBZLaukWN3vT8+eC51mey+7URWqAySKTdNeRAvwtWek
	nNUQ==
X-Gm-Gg: AYBFou0HVTQe2e2rW+R4iV17jnPhXjF0yLfrimN5VQ/cnvB/f6MsfmpHh0nIVhBXgH1
	GH1GjoBe/C3LjJ9D6XG1WeJlENDC5tRVipPQaOtVV/l0XDRmW371xIdz4E6u60DzMeopmubX+xy
	snTRboEm1gH8IfGv696tFJ53Q8ObLpPrH/ygChaRF+BVumos98k5G2NK4ZgxbulCGYubvHXAGd+
	NJ9aEPQRH1rKYacqnjNw8ZhZaGeVgP1Aq37Pmcpmu+ks0HjoyZOOavkRdzXpLNp61HfVclREzio
	ztoymQEJFr4k7MFxeHoItsbEcwDhysynAt81+4VXwWSHabKqn+G+57AG/Swyan0QgG5IFA7kNgm
	Yocj6tPklZ2jbpAKi0ILlTtNmN2d0Mgu65SDMR+oBHgjomDx14iCJSJtwXlxTDxk=
X-Received: by 2002:a05:6102:c0e:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d50611dc10mr2687097137.17.1794501290986;
        Thu, 12 Nov 2026 08:34:50 -0800 (PST)
X-Received: by 2002:a05:6102:c0e:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d50611dc10mr2687070137.17.1794501290373;
        Thu, 12 Nov 2026 08:34:50 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e423dfsm134664355e9.1.2026.11.12.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:34:49 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:34:13 +0100
Subject: [PATCH net-next v10 4/4] net: stmmac: rework stmmac_rx to support
 XDP rx multi-buff
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-stmmac-rx-mb-v10-4-d3d04b65c6bc@oss.qualcomm.com>
References: <20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc@oss.qualcomm.com>
In-Reply-To: <20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc@oss.qualcomm.com>
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
        bpf@vger.kernel.org, Nicolai Buchwitz <nb@tipi-net.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfXzZ0mVBETzD7E
 /u9kSfLQTqnABG4I1p74V3MgJx19Xv1W052Z5Okxrf/QQ2vKhbm6mcP2zo1JDigirJxMK9hQfSi
 funF2N/8ZwqCqazDwD9hRonY92egZ9JYz7O9DSewlK8+LL72fvzb45/5ghqDp8acvREJqKDwl/U
 88lzfY9j3+uhkrVyRIU8KcaGDmg9bl3trDqgfd7F4Xqku3XqV1z0S1pE1a9zogURyLPIFkbPQNE
 3lJLOEVkOe2RGIMlE0QfOAB6o5WHNDxQgvKh4SVtEOx5frZbK2LtQS39IyEjozinpr6RkMyEFQN
 p/dEnE0291VIn9UEpc+9142xtpV5IAIDJUDp51Xki87na1CTzfAwEaXeWhpEqsWX/DGUt16CqSF
 +eZ3eQQSMTXcpzTNw1QvlxzAVitEit7QaDNKnEklgYl0JMPHUhfTK6Y9FO2k6L1hZrbyuvyIEIs
 hPgTEyTnkgaFkF6oCvQ==
X-Proofpoint-GUID: evGw3ApJunI8bHxTiHAlWGBEoAvnLysz
X-Proofpoint-ORIG-GUID: evGw3ApJunI8bHxTiHAlWGBEoAvnLysz
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5eaab cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=v9h4JUQAhp93ei3YNAAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX9xTzrQIXtba/
 f+itzrNWDedTce2xCDujXiX/bdxxIxGIEod8TKU49GNKynQSmWrWACUuijGex2tgffechQKY06/
 vIQd9qpoShaf06bt/C1llOauM4RHPyQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083455_977976_5C7D9559 
X-CRM114-Status: GOOD (  27.68  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An earlier commit dropped frames split across multiple descriptors, or
using a second buffer, while XDP was enabled. This prevented the
per-descriptor XDP path from re-parsing frame tails and from applying FCS
handling to truncated buffers.

Rework stmmac_rx() to accumulate all the descriptors that make up a frame
in an xdp_buff, so the XDP program runs on the full (possibly fragmented)
packet instead of just the first buffer. Frames split across descriptors
or buffers are now passed to programs loaded with BPF_F_XDP_HAS_FRAGS;
programs without that capability continue to drop fragmented frames. When
the frame is not consumed by the program, assemble the skb from the head
buffer and the collected fragments with __xdp_build_skb_from_buff().

Note that XDP still rejects an MTU larger than ETH_DATA_LEN
(stmmac_xdp_set_prog(), stmmac_change_mtu()) and disables SPH, so an
ordinary frame fits in a single buffer. This path is therefore exercised
by frames that do span several descriptors (for example jumbo frames the
MAC admits through its jumbo-enable bit) and is groundwork for extending
XDP to jumbo/SPH; it does not enable XDP jumbo support by itself.

To do so, store the in-progress xdp_buff in rx_q->state instead of the
partially built skb, so the accumulated head and fragments survive a NAPI
poll boundary (mid-frame dma_own or dirty_rx break). The state is saved
only while a frame is in progress and cleared once it completes, leaving
it untouched when the poll does not process anything (e.g. netpoll invoked
with a zero budget).

In addition:
- advertise NETDEV_XDP_ACT_RX_SG, since the RX path can now deliver
  non-linear buffers to XDP;
- register the xdp_rxq with the fragment allocation size, so
  bpf_xdp_adjust_tail() can grow the tail of fragmented frames;
- build the skb with __xdp_build_skb_from_buff(), which passes
  xdp->frame_sz to napi_build_skb(), so skb_shinfo() lands on the same
  shared_info the fragments were accumulated into. xdp->frame_sz is the
  page_pool order-N allocation size (PAGE_SIZE << order, with
  order_base_2() rounding num_pages up), so the head truesize grows from
  num_pages * PAGE_SIZE: on 4K pages 12K -> 16K for an 8K buffer and
  20K -> 32K for a 16K buffer. This is more accurate but also affects
  non-XDP traffic and reduces the effective socket receive buffer for
  jumbo MTU users;
- carry the XDP metadata written with bpf_xdp_adjust_meta() into the skb
  from the accumulated xdp_buff via skb_metadata_set(), preserving the
  existing linear PASS path behavior and extending it to fragmented frames,
  so TC/BPF programs can read it through data_meta;
- attach fragments with xdp_buff_add_frag(), which initializes all the
  shared_info fields and takes care of the pfmemalloc bit;
- charge fragments the whole page_pool page size (xdp->frame_sz) as
  truesize instead of the old dma_buf_sz; with SPH/buf2 most frames carry
  a fragment, so skb->truesize grows by roughly 1.5x on 4K pages and 2x on
  64K pages, which reduces the effective socket receive buffer. The new
  value is more accurate now that a fragment is a full page_pool page, but
  it is a behavior change;
- release the buffers collected in the xdp_buff with __xdp_return_buff()
  when a frame is dropped on RX errors, instead of relying on
  dev_kfree_skb() recycling the skb frags; the latter no longer applies
  now that the head and fragments live in an xdp_buff rather than a
  partially built skb;
- drop the whole frame when it would exceed MAX_SKB_FRAGS, where the
  previous skb_add_rx_frag() calls were unbounded;
- strip the Ethernet FCS from the accumulated xdp_buff with the common
  xdp_buff_shrink_tail() helper for both linear and fragmented frames,
  instead of trimming the skb or the first descriptor length.

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 231 ++++++++++------------
 2 files changed, 110 insertions(+), 124 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index fcc395321816..e9ed1a3650e5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -133,7 +133,8 @@ struct stmmac_rx_queue {
 	dma_addr_t dma_rx_phy;
 	unsigned int state_saved;
 	struct {
-		struct sk_buff *skb;
+		struct xdp_buff xdp;
+		unsigned int n_descs;
 		unsigned int len;
 		unsigned int error;
 	} state;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 552840d29668..0295adafb439 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2195,8 +2195,10 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	else
 		dma_free_rx_skbufs(priv, dma_conf, queue);
 
-	dev_kfree_skb_any(rx_q->state.skb);
-	rx_q->state.skb = NULL;
+	if (rx_q->state.n_descs && !rx_q->xsk_pool) {
+		__xdp_return_buff(&rx_q->state.xdp, false);
+		rx_q->state.n_descs = 0;
+	}
 	rx_q->state_saved = false;
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
@@ -2316,10 +2318,6 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
 	num_pages = DIV_ROUND_UP(dma_buf_sz_pad, PAGE_SIZE);
 
-	rx_q->queue_index = queue;
-	rx_q->priv_data = priv;
-	rx_q->napi_skb_frag_size = num_pages * PAGE_SIZE;
-
 	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
 	pp_params.pool_size = dma_conf->dma_rx_size;
 	pp_params.order = order_base_2(num_pages);
@@ -2351,6 +2349,10 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 		goto err_free_buf_pool;
 	}
 
+	rx_q->queue_index = queue;
+	rx_q->priv_data = priv;
+	rx_q->napi_skb_frag_size = PAGE_SIZE << pp_params.order;
+
 	if (priv->extend_desc)
 		rx_q->dma_erx = addr;
 	else
@@ -2362,7 +2364,8 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	else
 		napi_id = ch->rx_napi.napi_id;
 
-	ret = xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev, queue, napi_id);
+	ret = __xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev, queue, napi_id,
+				 rx_q->napi_skb_frag_size);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to register xdp rxq info\n");
 		goto err_free_dma;
@@ -5547,8 +5550,8 @@ static int __stmmac_xdp_run_prog(struct stmmac_priv *priv,
 static struct sk_buff *stmmac_xdp_run_prog(struct stmmac_priv *priv,
 					   struct xdp_buff *xdp)
 {
+	int res = STMMAC_XDP_CONSUMED;
 	struct bpf_prog *prog;
-	int res;
 
 	prog = READ_ONCE(priv->xdp_prog);
 	if (!prog) {
@@ -5556,7 +5559,8 @@ static struct sk_buff *stmmac_xdp_run_prog(struct stmmac_priv *priv,
 		goto out;
 	}
 
-	res = __stmmac_xdp_run_prog(priv, prog, xdp);
+	if (likely(!xdp_buff_has_frags(xdp) || prog->aux->xdp_has_frags))
+		res = __stmmac_xdp_run_prog(priv, prog, xdp);
 out:
 	return ERR_PTR(-res);
 }
@@ -5888,6 +5892,25 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	return failure ? limit : (int)count;
 }
 
+static bool stmmac_build_xdp_frags(struct stmmac_priv *priv,
+				   struct stmmac_rx_queue *rx_q,
+				   unsigned int len, struct page *page,
+				   unsigned int offset,
+				   enum dma_data_direction dma_dir,
+				   struct xdp_buff *xdp)
+{
+	dma_addr_t dma_addr = page_pool_get_dma_addr(page) + offset;
+
+	dma_sync_single_for_cpu(priv->device, dma_addr, len, dma_dir);
+	if (!xdp_buff_add_frag(xdp, page_to_netmem(page), offset, len,
+			       xdp->frame_sz)) {
+		page_pool_put_full_page(rx_q->page_pool, page, true);
+		return false;
+	}
+
+	return true;
+}
+
 /**
  * stmmac_rx - manage the receive process
  * @priv: driver private structure
@@ -5901,21 +5924,20 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	u32 rx_errors = 0, rx_dropped = 0, rx_bytes = 0, rx_packets = 0;
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
+	unsigned int n_descs = 0, next_entry = rx_q->cur_rx;
 	struct stmmac_channel *ch = &priv->channel[queue];
 	unsigned int count = 0, error = 0, len = 0;
-	unsigned int next_entry = rx_q->cur_rx;
 	bool in_progress = rx_q->state_saved;
 	enum dma_data_direction dma_dir;
 	int coe = priv->hw->rx_csum;
-	unsigned int desc_size;
-	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
-	bool fcs_stripped = false;
+	unsigned int desc_size;
 	int xdp_status = 0;
 	int bufsz;
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
-	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
+	bufsz = rx_q->napi_skb_frag_size;
+	ctx.priv = priv;
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
@@ -5928,11 +5950,12 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	}
 
 	if (rx_q->state_saved) {
-		skb = rx_q->state.skb;
+		ctx.xdp = rx_q->state.xdp;
 		error = rx_q->state.error;
+		n_descs = rx_q->state.n_descs;
 		len = rx_q->state.len;
-		rx_q->state.skb = NULL;
 		rx_q->state_saved = false;
+		rx_q->state.n_descs = 0;
 	}
 
 	while (count < limit) {
@@ -5940,11 +5963,11 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		enum pkt_hash_types hash_type;
 		struct stmmac_rx_buffer *buf;
 		struct dma_desc *np, *p;
+		struct sk_buff *skb;
 		int entry, status;
 		u32 hash;
 
 		if (!in_progress) {
-			skb = NULL;
 			error = 0;
 			len = 0;
 		}
@@ -5992,19 +6015,11 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 				rx_errors++;
 		}
 
-		/* We do not support SG in XDP mode */
-		if (unlikely(!error && (status & rx_not_ls) &&
-			     stmmac_xdp_is_enabled(priv))) {
-			rx_dropped++;
-			error = 1;
-		}
-
 		if (unlikely(error)) {
 			if (status & rx_not_ls)
 				goto read_again;
 
-			dev_kfree_skb(skb);
-			goto next;
+			goto error_free_frag;
 		}
 
 		/* Buffer is good. Go on. */
@@ -6014,120 +6029,79 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
 		len += buf2_len;
 
-		/* Drop the packet if it is split over buf1 and buf2 on a
-		 * single descriptor if the interface is running in XDP mode.
-		 */
-		if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
-			rx_dropped++;
-			goto next;
-		}
-
-		/* ACS is disabled; strip manually. */
-		if (likely(!(status & rx_not_ls)))
-			len -= ETH_FCS_LEN;
-
-		if (!skb) {
-			/* Each frame starts here: reset the FCS handling */
-			fcs_stripped = false;
-
+		if (!n_descs) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
 			net_prefetch(page_address(buf->page) +
 				     buf->page_offset);
 
-			if (stmmac_xdp_is_enabled(priv) && !buf2_len) {
-				buf1_len -= ETH_FCS_LEN;
-				fcs_stripped = true;
-			}
-
 			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
 					 buf->page_offset, buf1_len, true);
-
-			ctx.priv = priv;
-			ctx.desc = p;
-			ctx.ndesc = np;
-
-			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
-			/* For Not XDP_PASS verdict */
-			if (IS_ERR(skb)) {
-				unsigned int xdp_res = -PTR_ERR(skb);
-
-				if (xdp_res & STMMAC_XDP_CONSUMED) {
-					page_pool_recycle_direct(rx_q->page_pool,
-								 virt_to_head_page(ctx.xdp.data));
-					buf->page = NULL;
-					rx_dropped++;
-					goto next;
-				} else if (xdp_res & (STMMAC_XDP_TX |
-						      STMMAC_XDP_REDIRECT)) {
-					xdp_status |= xdp_res;
-					buf->page = NULL;
-					goto next;
-				}
-			}
-		}
-
-		if (!skb) {
-			unsigned int metasize;
-
-			/* XDP program may expand or reduce tail */
-			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
-
-			skb = napi_build_skb(page_address(buf->page),
-					     rx_q->napi_skb_frag_size);
-			if (!skb) {
-				page_pool_recycle_direct(rx_q->page_pool,
-							 buf->page);
-				buf->page = NULL;
-				rx_dropped++;
-				count++;
-				goto drain_data;
-			}
-
-			/* XDP program may adjust header */
-			skb_reserve(skb,
-				    ctx.xdp.data - ctx.xdp.data_hard_start);
-			skb_put(skb, buf1_len);
-			skb_mark_for_recycle(skb);
-
-			metasize = ctx.xdp.data - ctx.xdp.data_meta;
-			if (metasize)
-				skb_metadata_set(skb, metasize);
 			buf->page = NULL;
 		} else if (buf1_len) {
-			dma_sync_single_for_cpu(priv->device, buf->addr,
-						buf1_len, dma_dir);
-			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
-					buf->page, buf->page_offset, buf1_len,
-					priv->dma_conf.dma_buf_sz);
+			if (!stmmac_build_xdp_frags(priv, rx_q, buf1_len,
+						    buf->page,
+						    buf->page_offset,
+						    dma_dir, &ctx.xdp)) {
+				if (!error)
+					rx_dropped++;
+				error = 1;
+			}
 			buf->page = NULL;
 		}
 
 		if (buf2_len) {
-			dma_sync_single_for_cpu(priv->device, buf->sec_addr,
-						buf2_len, dma_dir);
-			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
-					buf->sec_page, 0, buf2_len,
-					priv->dma_conf.dma_buf_sz);
+			if (!stmmac_build_xdp_frags(priv, rx_q, buf2_len,
+						    buf->sec_page, 0,
+						    dma_dir, &ctx.xdp)) {
+				if (!error)
+					rx_dropped++;
+				error = 1;
+			}
 			buf->sec_page = NULL;
 		}
+		n_descs++;
 
-drain_data:
 		if (likely(status & rx_not_ls))
 			goto read_again;
-		if (!skb)
-			continue;
 
-		/* Got entire packet into SKB. Finish it. */
+		/* ACS is disabled; strip manually. */
+		len -= ETH_FCS_LEN;
+		if (xdp_buff_shrink_tail(&ctx.xdp, ETH_FCS_LEN)) {
+			if (!error)
+				rx_dropped++;
+			error = 1;
+		}
 
-		/* Remove FCS if needed */
-		if (!fcs_stripped && pskb_trim(skb, len)) {
-			dev_kfree_skb_any(skb);
-			rx_dropped++;
+		if (unlikely(error))
+			goto error_free_frag;
+
+		ctx.desc = p;
+		ctx.ndesc = np;
+
+		skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
+		/* For Not XDP_PASS verdict */
+		if (IS_ERR(skb)) {
+			unsigned int xdp_res = -PTR_ERR(skb);
+
+			if (xdp_res & STMMAC_XDP_CONSUMED) {
+				__xdp_return_buff(&ctx.xdp, true);
+				rx_dropped++;
+			} else if (xdp_res & (STMMAC_XDP_TX |
+					      STMMAC_XDP_REDIRECT)) {
+				xdp_status |= xdp_res;
+			}
 			goto next;
 		}
 
+		skb = __xdp_build_skb_from_buff(&ctx.xdp);
+		if (!skb) {
+			rx_dropped++;
+			goto error_free_frag;
+		}
+
+		/* Got entire packet into SKB. Finish it. */
 		stmmac_get_rx_hwtstamp(priv, p, np, skb);
 
 		if (priv->hw->hw_vlan_en) {
@@ -6150,21 +6124,28 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (!stmmac_get_rx_hash(priv, p, &hash, &hash_type))
 			skb_set_hash(skb, hash, hash_type);
 
-		skb_record_rx_queue(skb, queue);
 		napi_gro_receive(&ch->rx_napi, skb);
 		rx_packets++;
 		rx_bytes += len;
 next:
 		in_progress = false;
-		skb = NULL;
+		n_descs = 0;
+		count++;
+		continue;
+error_free_frag:
+		if (n_descs)
+			__xdp_return_buff(&ctx.xdp, true);
+		in_progress = false;
+		n_descs = 0;
 		count++;
 	}
 
-	if (in_progress || skb) {
-		rx_q->state_saved = true;
-		rx_q->state.skb = skb;
+	if (in_progress || n_descs) {
+		rx_q->state.xdp = ctx.xdp;
+		rx_q->state.n_descs = n_descs;
 		rx_q->state.error = error;
 		rx_q->state.len = len;
+		rx_q->state_saved = true;
 	}
 
 	stmmac_finalize_xdp_rx(priv, xdp_status);
@@ -8206,6 +8187,7 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
 			    NETIF_F_RXCSUM;
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
+			     NETDEV_XDP_ACT_RX_SG |
 			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
 
 	/* Default qdisc num_tx_queues */
@@ -8532,9 +8514,12 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 
-	dev_kfree_skb_any(rx_q->state.skb);
-	rx_q->state.skb = NULL;
+	if (rx_q->state.n_descs && !rx_q->xsk_pool) {
+		__xdp_return_buff(&rx_q->state.xdp, false);
+		rx_q->state.n_descs = 0;
+	}
 	rx_q->state_saved = false;
+
 	rx_q->cur_rx = 0;
 	rx_q->dirty_rx = 0;
 }

-- 
2.56.0


