Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01B8606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hD4S5gIh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kiXE4TWu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BPSGfz4r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=; b=hD4S5gIh5XJlPR
	er3b0bs+Kvba/9bw+au7dWaUIWqp10ifAuzAcCENEFW9C9ZcncRorxJoFuKni5hgQmu/0+WMiV645
	Rj1ZzIfVDOVsG296BoTzJvWXsyVpUTitxIVrHI22qxLcPZa8p4EMF9Gg3yfMPKAh1T54sDhEbp6ZK
	ArTY9Sx2TauU0lIq0MT1Au/u/zXeVd8YWnYbm3ZMlX/CnujxbLB6Nl5iHvLaaSGIsqpb5xd0BGvJf
	7Ucx0baTTM7wPjGYHxF9hi+cpf/r/3+JJJl06PjCKViDyKcDkMz+x3MaqLAohkDzFEpa1DmnYd+8z
	+gnwFGb5aNS7l0oxNEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ04-00000004XBK-2vl0;
	Mon, 23 Nov 2026 18:42:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzU-00000004WeM-3w0K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:42:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3Tl2487357
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 18:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=; b=kiXE4TWuaPJqeD2t
	h5/8ACClAiCz7eFqtrQZDC16RNFSzy/h+qX9CjvCLoDew5m8VnIxYfr36Tq2kkYN
	fVoFEf8mk6Yb+13AwXOPnE4krInuMk9WHXW8jQP5wJQh/2j+9BRZG5U5FdGjWVk6
	mz1aXllFjyPULvPGpPgigklyrDq3AdFFwYKZJiLG4kjktJqG024FIXkrBL0ADEWL
	yUzCEwdOzBRqjhts9doL/FrdMGunnkxzjWLyHuLk8czeQNpgYFnYgD3NSWCKPpfJ
	63WfRfFd1v2FbICoM/POZNDojCkjP4XxtlQ4PhS2j0CK1farQkYQEoRfd1ehGPWd
	emmBxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy02xr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 18:42:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f03a137f6aso30877035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 10:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459331; x=1796064131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=;
        b=BPSGfz4rAag+v68duDa71EuvQOc4YNxAYm1x8JPcUsptL8wi8E2pfWrf3URq/X8ot0
         SfqPBfL5iGINsgCyFWYlnwDSW/KTqICF9ShODQ7LfWFd4WL72PMU/G7GaLI8kD+bAtb6
         ALREuyxpfXX5xLEPf80tGk5QwTualBBN78fcw05/rIxSzdsOvIBADmsmuwyFI47rgzxy
         NMNYNeXCEZjStfOtO+FG6WYBaumMlPcRrx1FLIPZbeCMuU7FvEdz08YeHjfg5tNNUPfV
         PuEX/puTdG+Fa5U5vQSxROCFcDCzhVg7/ZeYMqn8Hnwc06I6eso5YweFvi1v0rJcfNFq
         2xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459331; x=1796064131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=;
        b=zM7JYzcWgJ2MDfdDjpXAz4kCpjflaaBINHgVIHhUMeeucu5nXgCpnGuIyd2/Tb9FHa
         kq1OKqiiQj7u+WrEVD56tGWyu6fvrVJlsXBXej+rNtLeh3Kp8p1l3fQpfNtdpVWTQ/rT
         p2SHtsrXo/jePFPwChdYP74TAkF2BDF7wr7djVX6gXJBQzjwHtckECOZvueufvKEGCad
         sLThmQeZy5dkIbhDcMWJPwD3/3RYB5HV0IFWUlQzwdhxdzjpmolcPbnU4xfUpP+2WLKx
         arwpfFCMV1yKn3S87sK2+JGdVnp/E3GZO+uEkYU8FuFSo+0wVMvZHsG6oMnmtFIKrre3
         eb4Q==
X-Forwarded-Encrypted: i=1; AL+hErGejeu3lfXga7gAq2UuC1epnfZ66HUya/aItfFkmcLkeLzi9pkigiEwE+KRVbr69bc4liDzFYThpfiAVlyirEzq@lists.infradead.org
X-Gm-Message-State: APuU4Z9w8umBC+iXf81xii5OsQWIl3dtktsQSPbNFMZjp8wuJH9kjw0V
	vsfCqn+i8lJ6SehXSNDOQHk0QgLfWBqrySO/SoY/ziCs9aMRvDYjSPzKEuFg7ETfyJI1tFkjLMY
	L8nhi9kTDdZszdd1F8NGwWnYGQ+Fi95U7OwN9Ydq0qYlGRsem/YijrCyDNwqcofl1UgBu/jTcF+
	sZHA==
X-Gm-Gg: AZFdTZefzqaMuawEPNtii5efw/5dkqbUCbDTop6yvyQ+TY79m5FXSJX51WV5JW1BKB4
	pbIgRDp9xQlq3k6jn0sro3n5COTQZ24toNHyeV6RR6KECI1o4n+o2ar2Yjnyet1jrnMimcW5oyQ
	YLu1YhjRHQfPgHhzkxeHd3+gFPt1BWabNamafXPG8/k/STgkjjHETqGXjoW/Z1URImb3tGsCA0i
	nnauKolvWozSUwsiyxej+YVdSA2GXlknlbQ61OC9vXmO2dmxejphHPAyjfzprLiKRlEUD1l+ozL
	2CenhPSqyEZGnv3IgfHAEhBRjX2jmllTZu8En/b/0nqCqCgJV5JxfTG4grUi3uD6r0J6AMDLBNQ
	618iVWjF1ucH1HApjmRu2Q8rnSSvr3BGx464EG5eCAqBbkVGZ/zNwSNBCMvjzK2n5tzAFTmU4QI
	tPnyY=
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr112250885ad.7.1795459330686;
        Mon, 23 Nov 2026 10:42:10 -0800 (PST)
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr112250655ad.7.1795459330133;
        Mon, 23 Nov 2026 10:42:10 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm57984705ad.55.2026.11.23.10.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:42:09 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 00:11:45 +0530
Subject: [PATCH RFC net-next 1/2] net: stmmac: dwmac4: accept dribble-only
 receive frames
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-ethqos_rmii-v1-1-1754643d593c@oss.qualcomm.com>
References: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
In-Reply-To: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459319; l=1878;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=qpbnYxrkzjA1cVIRkiGDBuEbDdF9dtSRfsKcf+jguNA=;
 b=nhA8ar/wB3ULBVPX7fzZqrI64pxRKE9Ib6mlOq2jf8a7U7hiK8GWURoYdJ+ROoWsGMdTctC0j
 HIYvflh0ehDBUz3882jKWHsOwqnnqo1vFKthUCkfHmGQsHdKC4i/Wsw
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfXxX9hlqqe4pqc
 BgT4gQyZ9QedHAiCeW7Favoicytgb5v0SWFzzpGpFsuj7md1KWzipe4jkF9Mauu19OcCAoYn3cM
 gHFtFbOwFetWHWDhIFvZqMU0PFqByrdyYbfaSjHFK5+kIgHW7nqwq1C96AcAB4YeMWbEjXuVvII
 VziuI5YtYEFOdusA6AJ9CNkHE+NF/jdyKORUGJYihOCkByynSToIG4njd74Z7DmCbX3rs1xxUWv
 R+fnhnJky6TkIR85CKWmZcC4K5l2f3C5vMZF2FQ/pW94t99ywPD7tLOaZRdpVy7TLtYQB3mhbHI
 49XDyjewJakQR/RZ7kzBBxMr6AoQDb6JEjzs6AzBmJBnl7Ir28PpTROYgm4WJAsiMYTpEzT+kWU
 skfkHpS8rQ/lWrPS4M2hiaGmeN83j4/IerZgIOqfaxO/cNtho9w3yPAhcm6LeaFI8CBHW5KhOJU
 tLLb88PKQ1yJnS0G+qQ==
X-Proofpoint-ORIG-GUID: 8EU5BAPI51pagF_jYkl_jKAjFPkkI8bN
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b048903 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cAvw1yLwuy3AVl_ujVEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 8EU5BAPI51pagF_jYkl_jKAjFPkkI8bN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX0AEDCds3BEIT
 tpM+jX8T88JfGP9m7gwjOPYSeB50ojfLkIvu084yTfU8jhkmvF0oh9afSvx9p4Qw5o/9dNJDD0f
 DC4wQn8rGABbBDYv/EGcFwmQbsbMCek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_104213_155028_59462D07 
X-CRM114-Status: GOOD (  16.29  )
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

Commit 1cc5a735185a ("stmmac: do not discard frame on dribbling bit
assert") removed the packet drop condition for descriptors which report
only a dribble error for Normal and Enhanced descriptors, since a
dribble error with the correct FCS doesn't necessarily mean a bad
packet.

Do the same for dwmac4; accept receive frames with dribble-only errors
while still counting them in the error statistics.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 4 +++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index c6a8f8d73501..2549ffaf9cef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -102,7 +102,9 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes3 & RDES3_DRIBBLE_ERROR))
 			x->dribbling_bit++;
 
-		ret = discard_frame;
+		if ((rdes3 & RDES3_ERROR_SUMMARY_MASK) !=
+		    RDES3_DRIBBLE_ERROR)
+			ret = discard_frame;
 	}
 
 	message_type = FIELD_GET(RDES1_PTP_MSG_TYPE_MASK, rdes1);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
index fb1fea5b0e6e..8e8762f9e0c8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
@@ -120,6 +120,7 @@
 #define RDES3_RECEIVE_WATCHDOG		BIT(22)
 #define RDES3_GIANT_PACKET		BIT(23)
 #define RDES3_CRC_ERROR			BIT(24)
+#define RDES3_ERROR_SUMMARY_MASK	GENMASK(24, 19)
 #define RDES3_RDES0_VALID		BIT(25)
 #define RDES3_RDES1_VALID		BIT(26)
 #define RDES3_RDES2_VALID		BIT(27)

-- 
2.34.1


