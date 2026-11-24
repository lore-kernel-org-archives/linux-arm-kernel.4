Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51601606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MAXLSLVq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avSY7g7K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jg9zMC1K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=; b=MAXLSLVqpmRlkI
	RLjK7zkPtkKVpqbXboTn2lnEqDlyjW2gK6wlb+O388GqwfhKgBgqGcFyxPJVFKh1i8hZGOxfOBF6n
	FQJ6GlEHhXYfZJr0KnG9ONTJxS8HSF5sHdKVoSzfl/9Z4JW9EcWiOLpUfGpmVK2Xe5v5ds9V/Ox80
	z9oM08pfdz2bMn3LT7fvdOedbP19fefyUwadrsz/T7Kix2/TbcgO/HAdo6dw9lzKmCs2cLRmzJdy+
	RG2b3NBv4GPQwoQOqvaMdu78qiKImXkAqIZYoqg6CZRn/49+FeAPw4hqxoSQCjKc8zlLQfwhoR7Av
	taD7JH0Wo9WPGF4Mqy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVe1R-00000005EzP-1P8G;
	Tue, 24 Nov 2026 00:04:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVe1H-00000005Evo-1yD1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 00:04:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuq9c2862163
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tkSEjYs0iAZ
	II4zNsyDNS7uDKaKgENnoiGQDdLvw080=; b=avSY7g7K+veGUjaoH+V+9C6Dj9q
	/3J37fz3iFIuXjNgbV+odze9uz5j6gvfLI/pXYl1+xn6I/SjUNGdx7jfbrmDEx5D
	ppoz9gXGDMr8/MFAEUQ5m+jkZTsd6PFRtPlrOgel/MnN866r8L+4QlBwlvdODSXx
	x7B/tzE2NjyHDpiIglB7ZDfLTXOwWqOD2KK9S+Pip8sZiHCcWzo33y9DRIhwv6QG
	akhEF2BmRga6co4uRbY7XSF60UPDuAWu7YCQiY++gx/PMgN/A3eexBggQ6n4rXBo
	tuyMFrEeBE8nyX7pggQzpyAFTcrUY3eaVsfD3RX5w3wjWRDrjbbDfM9zSqw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7utyj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:04:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso6950292eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 16:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478661; x=1796083461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
        b=jg9zMC1Kz84yH0TVXd1OqHetsJ7urdQtqxU/cWyBKcul0NUrQLQyDv/fF7SnrvdYOD
         Q9q+i4UFreh6FUmnn87lIAdYva0N/vRUk1yVyDeJ3SlZMS9tys6CNze3AKWbM/NpcRV+
         ZJ0CLW2WHjmgQfIEfJ/DNJrXqL6iHDZkTFCjdQYzwgIiASgWyW+wNcQpAG/TSTI5vv3M
         LK57lXx8ofM3iFTZNQrrQiwskFJ7qhi+lNQahkd+leP8t3gNtZol6Yr1V/vh4rfN6BFR
         hZK3bZAJubAM5SFnDOVGgTH8cz/u11DEH2SaVx8effA4DW30d1AOr3kOEzXapwsj19ku
         Hi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478661; x=1796083461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
        b=b/R0rQnlHyaql6P4fW94mkL3yBfxGltJ4Im66oDYHJgrRNpsL7psu7IoV0OPcbRu5R
         TgVw2KRHMJ2NXKIvg8Cn1cejZaG8l4rv/tzQwjvtucryUHBWdlAMfJ6sp3cEcCYYnafz
         7TLUUhau+ATc4TRv3ovtq9occo2PR83S2SlZz+3gCgPBGapZxLR5N93ZlVtINy7gGdPg
         Bkiw+J9aEGQXfJR0rL0IRjcPFZP7SwB/wxIZSWsGB1jBoBM4+awTqc8E3Ijt2SU3Vs1/
         uoZ7wxJGUlXs69lZBYUsm5Gf27M4Dv3h+DL3MtEdQz34TzpCKhRcDbCBaDoLNCk35euu
         8CGg==
X-Forwarded-Encrypted: i=1; AL+hErFqPHE0MGAZb6G7pusaLbs8aH85peaqJf5/l41Oe4sDGufIHUR+8s/NdWGqRXoEV7IJt7nHoprc9MWnt6Y90V+p@lists.infradead.org
X-Gm-Message-State: APuU4Z9mNivXYaU2SZI3+3ihyOgAOakUIDH7qgAoyT/7Id2lxTWJ+g8z
	F66GB/aPiHyoIH0to3VYSGeX9wvZ9FYWZ2REK9RbrSXHG2yOuG+LoKvIsDr3G3kJH8wj9cbdqY5
	CQ/p3tcpki+qVvWIHRV8mRCJnHFv+q6wPN7gnZHWxQyDYmP1S3miOsYSVdX8kqoqsEEfOJN3Vw3
	HIzg==
X-Gm-Gg: AZFdTZdOCqclhMc8f5yNN6sOCvt3mE6ZVIp0y2qRHTXkeDhI6G6uqN5CrmyPxxeFBFs
	32BjNPIWInltNC3OiYCrEfrpoyUhNjWSQOqsBmGyb6NgKPoMmqeydeSv/1ZJNiRkWOIvh7yEsRc
	m00cEo1dnbqFcNI/CP78HM52+6Gn/AXCUcuSVHmHqPg7ZOsf8L7mzJXQmjVBEN4P3mfoXVnz23l
	M4n47eOKAzkbWQF2StE/mN5diL/FLX/IkilxxF5+dx4deuxumgmu/vaGYK6dJyev/gaZX7KAYOX
	rvFRcpdYylYJfOIcGttGqyavatYXGahA9wddC0svBvXff37GyXjpJCpWOVtsKYLYoXricNmQ4g7
	skhRnVhz6IzxmRQMiD9QyFttTfnjLgZndG66gi5zsT8buqYk/+iIr9GFTNlMIG0fvI9B7Z0XJH0
	2MV2Zb8d3QH55zFRdtjc3QEBcNvoMEaVbBI+c=
X-Received: by 2002:a05:7300:8816:b0:385:5b47:8aad with SMTP id 5a478bee46e88-38570451daemr14414809eec.19.1795478661436;
        Mon, 23 Nov 2026 16:04:21 -0800 (PST)
X-Received: by 2002:a05:7300:8816:b0:385:5b47:8aad with SMTP id 5a478bee46e88-38570451daemr14414791eec.19.1795478661002;
        Mon, 23 Nov 2026 16:04:21 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:20 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: j.raczynski@samsung.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cs0617.lee@samsung.com,
        k.domagalski@samsung.com, k.tegowski@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        sagar.cheluvegowda@oss.qualcomm.com
Subject: [PATCH net-next v2 3/3] include/stmmac: Increase max DMA/MTL channel count from 8 to 16
Date: Mon, 23 Nov 2026 16:04:15 -0800
Message-Id: <20261124000415.4067701-4-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZeLfJtg7VZBLdrje4jgOeD5L4mdkgfIK
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04d486 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=H7QzycyVpUVBSTYqnZAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ZeLfJtg7VZBLdrje4jgOeD5L4mdkgfIK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX9Wv7jMZg9qyw
 ewrheMBw5Wbbyx5dftBnRNs5Ll5t/CwqCj1mfvrp7orgD8ApwPeHnuf/4lTKl4k4xBUCfyY9JiV
 m4L4O739cmLW8qh0XvPeCzByxui9mJI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX0O6z3a+Dj+7l
 LcA2Pfo0Un8mwA9UYCOOjnuxKrP/Fno/zRGicCRfwrS3DqsQuka2OXQOCELAKC2CDNhlOEYzSTY
 KmkeynTGKnTLYMGM0TFYHPp86bt/IusNE9g+i8Hrh120wmmcRBKmj7+LDO+bIi7JkZTVv1oTJh1
 fJLhum5OgNRa8Ub4aXYCILtGVkwc+Ik+cxDokVfBYR5xd+Njm9OU5mHrmvF0aqyG8bPzszke1FQ
 7adOotRv44huVu3KAWkXJqbYsWaGbMRRXKANxNEsPyts5KQ6Al86njEyn/ijJ2uRe0ajAV6F1k9
 9ctmcTFsFEKPAt/XY7hmPujfUs2VgM7Os9ADIL+iIt3wsb9LIH1HwhWl+ASEe9XXAIJtPWTLG/v
 LCuubZu1xyvr/zz8I1QZr9YLU+5xb1FOR7nGMu/gUXlQkJwzKHPXt7tqOYUlR1bkbfYkGCweE28
 oYz/1X8XtoAwjWPkBxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_160426_577824_4EE50554 
X-CRM114-Status: GOOD (  14.12  )
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

From: Jakub Raczynski <j.raczynski@samsung.com>

Newer XGMAC hardware does support up to 16 DMA/MTL queues.
Add support for these after previous modifications of driver to accommodate
for that.

Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 include/linux/stmmac.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..b91c8d069dc2 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -15,9 +15,9 @@
 #include <linux/platform_device.h>
 #include <linux/phylink.h>
 
-#define MTL_MAX_RX_QUEUES	8
-#define MTL_MAX_TX_QUEUES	8
-#define STMMAC_CH_MAX		8
+#define MTL_MAX_RX_QUEUES	16
+#define MTL_MAX_TX_QUEUES	16
+#define STMMAC_CH_MAX		16
 
 #define STMMAC_RX_COE_NONE	0
 #define STMMAC_RX_COE_TYPE1	1
-- 
2.34.1


