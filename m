Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2993A606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HpLC8wje;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UzCx1RMk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0XeA/aU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KlFzMLz14WgpPVwdqGiJVEqdnpE7naQqAvTjh6Xp/Ec=; b=HpLC8wje0cidoc
	jcVwSW2EJrzd4LjcInypgIvn695xO4doMEE0uxtTN4eCO40rUxQhs9npb2LE9c57G0Jj7DZColqQp
	dYonv3GcBMlwUqY6kJRHIbKhwA21rh1C/U8PWktGHgDH7TLydpNuErXCatfni4xOy7ryLeCmHWfoc
	xa2GuJhZI17Xd1OKehTiD2ZpMfjbhWVRa6CQz/oRWZbREEozP4lGYXA1o1E8Bk4kAEDEdY+J6aY2H
	31n8e2eGyZCJ/IEyZGDBY9zjx8PWErl5HgLqTuCr3yu2XDPrXEWZfYUCZR+RUpLq1XrJMficnCkcl
	BO/CgduCpDdUGS2r/muA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyc3-00000007xM4-3DwR;
	Tue, 24 Nov 2026 22:03:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyc1-00000007xLh-06rE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:03:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXG9M1767021
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KlFzMLz14WgpPVwdqGiJVEqdnpE7naQqAvTjh6Xp/Ec=; b=UzCx1RMkov5Kem7U
	3BzzQH68AKZijy5TeHM45Zd/N6KcX9LUEKYzYubhOhv5wO5L8EYA8VhXVZAy9bRK
	U7S429y+LtcbwtmMALeRdB6zov3FZU44zqKWkoZe/zrpB7s+nR8EtVNZi3B/mzHD
	VucNGJrx9nKSiBBmC5hYB9vj2+MPO8aJuCe1bZFfjrUQkXbzIPTX231AZZnrMii1
	d6MvIfU7vo3FWCYnLSGc7PEyuxe4YDynr1Mfe4vK5joclgfEGFzKEzGQZJy7mlUn
	ffTLXufMfLbOCXV6/T87PIKBe/SfI47+EA+Z/xj+JP8JjuuEuRt74Ry24EAOmEgJ
	Dc8GVw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs9792-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:03:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so7913220eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795557815; x=1796162615; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlFzMLz14WgpPVwdqGiJVEqdnpE7naQqAvTjh6Xp/Ec=;
        b=I0XeA/aUWU0QuIiEjPbqko26aKtoHOOJhTMQ9bihN2m8fh1jLolfp0zTDcn4Vp8N4+
         NzMOhxZ5eHRCAzQUmCEheIF/qkT8gq05u5Ul8gTSsKo3W2VcPd855k6wKn88y3su0L62
         b5IgonQkYN5emOPh5OaRiX5tGUkw9SPXBiwJRZwK2H/wbps4dBtPoVJtB0WJjdKkdiWc
         L3j6t9yG0UxVCCYGjDTMNJhWrXgs3vSTocVn9cupfMZqcCFKdMV/InvToMt08Sxe0DQo
         1D5NNvazhJBjkLgD4Rv1ZnBoUkmNA9JQrQWvykTtx8cI3cRg3vVY6Bt3aOuoqYOixiBO
         jMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557815; x=1796162615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlFzMLz14WgpPVwdqGiJVEqdnpE7naQqAvTjh6Xp/Ec=;
        b=H4fGkbpjMskf1gSz5EC9+M3clewnJcEJbg/tgfZIM9IMwCoBlevIQuXIStOb6nphU/
         cDAiwQl7cNs0IRalKXqgip2Gw0NUnp1tZlBT24jCSgzdnvQ1No8PmLf5A2aF8AhvHEyL
         NustkAeKw05RdjC/P0aqlecuOsYOgXkr+jhqCKXCa5S3Zy2/vWROvd9Qkv8eptfuoH5r
         lbavfYAs1lycYppgv1cmySvUd0lOixGx4FSvswqjgVxh4kPuUaIR6O49waV7fC12CuMl
         hggj8QhwpNa+7Eoh3AmBwGLWeqOSdfv5lH0akjhj4c8ta/PTTwankOvivFp/0p0EeW4t
         3DRw==
X-Forwarded-Encrypted: i=1; AL+hErGjYIu6/bp+yw1s4FgJihUrqXD4/dgvutcJUxmxVbxr58a29Z4kzsSs4Dl5SIFMWrI3N4jEkR2TwKoCC9S3TqBE@lists.infradead.org
X-Gm-Message-State: APuU4Z+Auta1k7heXbf6M+338iO86JdrQRvhus5xSoa92PrvBe7mezHu
	0LUK9ina+/hssaYKLgv+vS+j5HrfWo9+4ZXSNm/0iabDtrcwE3LADZTFk2SRPYu+S66k1hDjGER
	9yejwWO1d824FduN040CPnUHJFOisXavaoUP/7YZp4cKDqzMY76q6EftQhFQk9M4mRMXvXCCZyJ
	t+dA==
X-Gm-Gg: AZFdTZdGdHz2AZIhb6Ysk3ZoDojHY9PgNpgWGNcPm/E/9NBbN/QVIjtqn0qzjxPZ1pE
	TJkxFgxRcfZVVKc4SbYg0Rh7oqenfSoS5FpwR8JQ0IvvK/YEdz+guQvPdcj0GLkHfC2k4aoQ/DK
	McFw3+WQgDHd0cBp4oYtGPuUC/uYhMzZnE/AQKKXDVxnsTxOnzAzgppFKotAF0QRnzF/tybApUb
	Mqqwh1r3miQgDhGJrZzRy+juo9VqsrUxGO5F6hZpT+er2t7obe5H7ggNRfSH3Pl1szWDRIB7bur
	9BNGsjiTLh+zfkdwpOTlAiIrNftJBGyuZF3qaN550O5VXZ+DMAfdgqmivkauoxe2Wo1iuE5vwNW
	JaXyIr8Hj+vkZB0Da2m2rouCpnbq8KhwhMqcIEtYGPJ9n92SthQpe2wdR+ylfYZMGVM9g29KGt4
	uQXvLqloRll8gaw9FLbhfPhynCzSL2/CR7/0Ll+Q==
X-Received: by 2002:a05:7022:b056:20b0:160:a80f:3ed2 with SMTP id a92af1059eb24-1b5568652e2mr16315797c88.10.1795557814814;
        Tue, 24 Nov 2026 14:03:34 -0800 (PST)
X-Received: by 2002:a05:7022:b056:20b0:160:a80f:3ed2 with SMTP id a92af1059eb24-1b5568652e2mr16315759c88.10.1795557814237;
        Tue, 24 Nov 2026 14:03:34 -0800 (PST)
Received: from [10.71.45.247] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm37196527c88.1.2026.11.24.14.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 14:03:33 -0800 (PST)
Message-ID: <d8d31484-03d8-469f-9e1c-521f38393699@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:03:33 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5] net: stmmac: dwxgmac2: enable L2 split header
 support
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
        hongmei.xu@oss.qualcomm.com, abhishek.chauhan@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com
References: <20261120005243.3724402-1-sagar.cheluvegowda@oss.qualcomm.com>
 <179548403438.3135.1804854034587814346@kernel.org>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <179548403438.3135.1804854034587814346@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4NiBTYWx0ZWRfXyhgTmBtm22bh
 mkv7XCeHGCu4SI8yBWY5VCJVuTD3asX59z2Wlpi9xJ4wfJ00L43EhqBrpZFzyCIscVat1rCh1dw
 qt6NaEz/kI0TeHG9QfzehQf1eR4DicaOyEC/Xkh9L2b89iHGTBFPGci33XqOwxMMYrOVitHlFxG
 KbDhDb4b+uwxKcwjUpVZBQ216lzBpd7INYWZ14JeLikh8JtOtvkV9x2lRvt1/La+wVXTrFyD2GD
 VLP1eJYO8o8bolGS220RmmgNPK5iPp3xI9GUuWSKZtz6RuzsNFysA+C+NEsX7hX+ZP+rZ+Auwm1
 UdEMKHpXvYAVacIY4mpzTXjTQejOayJtI2FnTi2TID2tNcADKtIQLLK/8WdX1z0MPDnD0/ba6fr
 SZ1KHaguxbb+MYbmRzwbLc6zQrdDOkbeZsrcuPiOUEWOloCbtZOKH6LwVGevN87K7xnelpThFPH
 DNUSOULMvfsKr+Szlbg==
X-Proofpoint-GUID: YidHhlx9vED5OoyX7TTD_h3E8xxYYLTX
X-Proofpoint-ORIG-GUID: YidHhlx9vED5OoyX7TTD_h3E8xxYYLTX
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b0609b9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=RiAz6U-1Kj1GQVlvL0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4NiBTYWx0ZWRfX/9N4el3mx/y/
 2p5c3208D5mkmAQeZV+1kif8GjjIi6qVGmbJJdYj37u4+m4esZeRhYQ5UgbzoLS4sPA1iXn6G99
 RroCDHGsztkLv9jJl6LckVVDLMeLduk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_140341_187771_D5B06CF4 
X-CRM114-Status: GOOD (  37.06  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/23/2026 5:33 PM, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Low]
> This isn't a bug, but should the commit message say that SPLM = L2OFST
> moves the split point for all split header traffic, and not only for the
> tagged or non-IP packets it talks about?
>
> Untagged and VLAN stripped IPv4/IPv6 TCP/UDP frames were previously split
> at the L3/L4 header boundary. With L2OFST they would be split right after
> the EtherType. Commit d10f1a4e44c3 describes the same change for dwmac4.
>
> stmmac_hw_setup() turns this on by default for every sph_capable XGMAC2
> with RX checksum offload enabled. stmmac_rx() would then build the skb head
> from the 14/18 byte MAC header only. The IP/L4 headers would have to be
> pulled from the buffer 2 page fragment.
>
> Could the commit message state that this changes the RX layout for IP
> traffic on existing XGMAC2 users, and ideally include some throughput
> numbers?
>
Agreed. In v6 I will state in the commit message that SPLM = L2OFST
splits every packet after the L2 header, including untagged IP
packets, which were split at the L3/L4 boundary before. I will also
add throughput numbers.

> [Severity: Medium]
> In hwif.c, the XGMAC2 entry and the XLGMAC entry both use
> .desc = &dwxgmac210_desc_ops. So this parsing change applies to every
> existing split header user, including XLGMAC, which never gets
> config_l2_split.
>
> |[ ... ] |
> Is this fixing an existing RX corruption bug inside a feature patch? If so,
> could it go in a separate patch with a Fixes: tag so that stable picks it
> up? The v5 changelog says the fix wording was removed on purpose. If the
> old behaviour can't actually be reached, could the commit message say the
> change is a no-op for existing configurations?

Agreed. I will send the FD/LD change as a separate fix to net and post
v6 on top of it.

> There is also the L2T branch further down. On XLGMAC, SPLM/SAVE_EN are
> never set, yet non-IP last descriptors with L2T != 0 now take HL from
> RDES2[9:2] >> 2. Are those bits guaranteed to be zero for frames XLGMAC
> never split? "The callback is not implemented for XLGMAC" in the commit
> message makes it sound as if XLGMAC is unaffected.

The databook description of RDES2 HL says: "If header length is zero,
it implies that the MAC did not identify and split the header and both
Buffer 1 and Buffer 2 are used for storing the packet". So for frames
the MAC did not split, HL is zero and hlen stays 0, as it does today.
I will make the commit message clearer that the XLGMAC MAC
configuration is not changed, but the descriptor parsing is shared.

> [Severity: Medium]
> Is RDES2[9:0] the right layout here for non-IP frames?
>
Yes. The databook table "Header Length Availability in RDES2"
(Table 13-28) says:
  FD=0, LD=1: HL not available
  FD=1, LD=0: HL is [9:0]
  FD=1, LD=1: IP packets, HL is [9:0]
              Non-IP packets, HL is [9:2]
The RDES2[1:0] AV status bits are only defined together with L34T,
which is only valid on the last descriptor. So the FD=1/LD=0 branch
follows the table, and I will keep it as is. dwmac4 uses a different
descriptor layout, so it is not a reference here.

> [Severity: Medium]
> What happens here to non-IP frames whose L2 type is 0?
>
> XGMAC_RDES3_L2T is GENMASK(19, 16), the same bits as XGMAC_RDES3_ET_LT, so
> this check really means "L2 type != 0". In the LT encoding, 0 seems to be a
> valid type: an IEEE 802.3 length encapsulated frame (LLC/SNAP, for example
> STP BPDUs).
>
> Suppose the MAC splits such a frame at the L2 offset with SPLM = L2OFST and
> SAVE_EN set. Then *len stays 0, and stmmac_rx_buf1_len() skips this branch:
>
> 	if (priv->sph_active && hlen) {
> 		priv->xstats.rx_split_hdr_pkt_n++;
> 		return hlen;
> 	}
>
> It returns min(dma_buf_sz, plen) instead, and stmmac_rx_buf2_len() returns
> 0. Wouldn't the skb then contain the split header followed by stale
> page_pool data from buffer 1, with the real payload in buffer 2 dropped?
>
> If HL is always 0 for frames the hardware doesn't split, could the L2T
> check be dropped so that RDES2[9:2] is read for every non-IP FD=1/LD=1
> descriptor? That would match the databook table cited in the commit
> message.

Agreed, this is a bug in this patch. L2T = 0 is an IEEE 802.3 length
packet (e.g. STP BPDUs), and with SPLM = L2OFST the MAC splits it like
any other packet, but hlen stays 0. As HL is zero for frames the MAC
did not split, I will drop the L2T check in v6 and read RDES2[9:2] for
all non-IP packets, and remove the now unused XGMAC_RDES3_L2T define.

> [Severity: High]
> This is a pre-existing issue that this patch didn't introduce, but the
> patch builds on it. When RX checksum offload is turned off,
> stmmac_set_features() now also calls
> stmmac_config_l2_split(priv, priv->hw, false). However, priv->sph_active
> is never cleared. It is only assigned at probe and in stmmac_xdp.c.

Right, this is pre-existing and also affects the other split header
capable cores, as stmmac_rx_buf1_len() keys off priv->sph_active while
the hardware state follows sph_en. I will look at it separately and
send a fix to net, as it is independent of this patch.

pw-bot: cr

Regards,
Sagar



