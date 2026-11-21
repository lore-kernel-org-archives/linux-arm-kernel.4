Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A19F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 17:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VR0djzOG;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHoLdF8y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XrDiwyIB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJDEpf+rKRs=; b=VR0djzOGiqWYI+rQqpfKp2/bDW
	208ja6VuxTvuqKtUDDuXqmVUN8hhU86n4hgvxmmzffaiYInKv2QGdETiSX6ecHIzPjnLMNm8Jhh+W
	SDjMzXJ1+FAKZjKuuSmbM/9jBu1z8eEX0satNIDmSkL0b4iuDo2jOu7lWHtppGUuk40yphhru6wRv
	GUykXxJeNRvoYg0j2TAynXkT8kg1PzVULS2xl40vOWxN8zJWj+nm1pPtj8mWZIwyHQsD45WfailEa
	ipwF4Pmw8n1sRCbiM/t7071vdq+0A16K+WKe1sMyeur8LEGZ6oXO3ah/xeMH+bsxMaA1hYlFKQShm
	Rj0C5pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUoZM-0000000HY6C-0pKN;
	Sat, 21 Nov 2026 17:08:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUoZJ-0000000HY5r-1naY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 17:08:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFapVQ1140842
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJD
	Epf+rKRs=; b=KHoLdF8yM3GjkwU2sghWWXbPZ9Wwc5pI+VlNa0W44zI6ta2xvmU
	0w6ncLwksaAn1dXPKME3Lf9X1uUkfA60VrutbRNwc4o5sBw9sBOTg6QxsWt7jZXV
	MU0/vP3DDap8kv16mn7XqDHkjvvEmALAodcIm5DZ83LKj9BvLZyIjt6gg9pV34RR
	R+to5Winke2EUh19thpNccvOZZkHTK0U7SfeujUZmxNh6Q0MdQy3E5feiFzjefHA
	oz4u8vIE4W8vB2W+DC02vub/MVfl/uK9FXtCODyBAaKPXYCIKiY811FX/V7hnoZE
	3Jgra3BhmXBkHdPq1zJqrgT50jNTUVbAqgA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rsrun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 17:08:04 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-836caf085e0so27787147b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 09:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795280883; x=1795885683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJDEpf+rKRs=;
        b=XrDiwyIBxA+F+/TSw/o/aI/E6P6fjtDm0rgg33fOjrBHaP4noflz+Mbp+ZbecpNsQj
         0qBUlN/ggsnvrRaSaWeQnx4CGdD2BF/nPPBmxpNX0dsPx0Wc1Tcu06sZ0zMkEk8zXc9y
         rpe+MLNToZRKMTqUQxPwkJOeEMqcMjnInNSbyCw2dOmJiB6Pwjo9MuCynANjk5i07Qgb
         0KFy5u0D1jpEOuS0KeKsTb6qUkkveWxUg9GSc7VLkYNp3mInwKlfVCjYMHI81TapuHEF
         c6gGrW+zNiXbSWbaDct43M9nyFt6J8IGZ4GShqKi1VqtfcFL1G2w1qGrf7K9MxRVlLWv
         CXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795280883; x=1795885683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJDEpf+rKRs=;
        b=uwfXTPe8ezWC4DLGhLAQAH1bUdj65Czr8kmDMG91ozldRhIv5zSvPIFmMrl4YPLdF+
         Iu/x4GDlfg5G05SlaVrYhtmgVV9o1T99Awg518VFbR+QftVSA+JvE+0fi8MEcFcicvxX
         dcSrptpYo3gODvkXTYA/JpmDVzUY0mttIP9nF4mUU/slxs/HjPPcCx+pKyLw6r2dsLCX
         er3cfNtNZnun2AeyhdNgQ06jbeKJ/iqa/ccEWQ6lfjXCNlDxJSJN9t5G7IVp3GKgvJOa
         NTAsrwmeKAGP8rCNmOphAzjITculLyBvBkMOLN8+3tnYVoG+mcPD1sfliwy5lhgW07BA
         cpTQ==
X-Forwarded-Encrypted: i=1; AL+hErFp5MuxS3cMJ7tZj1SC3g9kU3tjlT9ifqRwV6cC0fWGD4KPPj5LkcaU/NDZu+h/HTxuGDyefzJDhiUELiMoPtQ6@lists.infradead.org
X-Gm-Message-State: APuU4Z+k/FCN6M4oMGw/SdG0ez65R3gCf8BAZn9N4kg9lpm6fpp5CCF3
	ixHEUJuzAKZqWv4jHutbjbMJP8BsXIzDtKD31gVQ0pNvSQ7IZrafQgvc6LUniVhh8pY8ApLZUFs
	i6KKnjADcnDfKPTP5Nt/6byuzja5TmmQ/xR2x9UzPqirdLbiaGFobbwH5cnPyd3I3VflOR07F5C
	+25g==
X-Gm-Gg: AZFdTZdp/DSbqZRlBmA9fLMcsaSMT5aWHZXKSkPHyCTTWcQFA3gV/B8mWKX0bK/25dL
	WVs3BEAU8DKVV2i/oFlNmISZOavn/peQqV5TGDaMgN0E2GOFLNMgQgmkX5gVAQAheB6gSWlkjDi
	qLfFtRFA3djMKO9TFOIOBFFawBhJhOHUde1gTF+lG1rZwrSPGJWwDC3W8xHQell8v0JChsEX3uz
	xMSt8ZgTMEYLGws1I8zVcUQML1krBg62jk3xCYSjxYp52oZyphm8YAG05o4kO+7gfQGM8qb8TTr
	S3EoH1gwWnHrN5o7XfnvGhJLE3SMWXyz2JecDglzq2ZE5nR9V/bh+0GdqSnTUxEOgkPYKkNscoh
	iKWQ243t4XwFX2By3awzmeaUwMXyhvE7QPX88I/6ca3fUih9oyJe+xpJPF8nSgw==
X-Received: by 2002:a05:690c:620b:b0:8b4:c2c4:c5f4 with SMTP id 00721157ae682-8b5205537camr25045597b3.67.1795280883168;
        Sat, 21 Nov 2026 09:08:03 -0800 (PST)
X-Received: by 2002:a05:690c:620b:b0:8b4:c2c4:c5f4 with SMTP id 00721157ae682-8b5205537camr25045447b3.67.1795280882704;
        Sat, 21 Nov 2026 09:08:02 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm12945871f8f.53.2026.11.21.09.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:08:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next] net: stmmac: eic7700: Use syscon_regmap_lookup_by_phandle_args
Date: Sat, 21 Nov 2026 18:07:54 +0100
Message-ID: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=K2miH5rqAJRKMoflINTVIzDqG1cCAkCBPvqZkVe/Cxw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAc/psZcP9FJ5lY0nUMSWSWhVysfAnvNdWEi8V
 /DTgiMqbPmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawHP6QAKCRDBN2bmhouD
 19QBD/96ZEHrUEJ1Wt2vF2JDNxYNIqpgQn3W59iY8d6X1iKITuOmhcra0u586cS9kRhGt8+g5Lf
 GN8qLomatvA7zUx2yQNZzBWHLB33SclN3p5KdyjIJG3nJXqPPExxGw0K/Yiz18MafXmwFwAX023
 mfkGnxOPNV3Z1a6TTKKMMQ6k9t52GVrVVFJX0oQfevNQU3AkaPuRnJe26aitu/94RWhqTSYYmV6
 UoaEVPGoM34cjseqOp86ibCuqJ4qa7uiXLcJ+4fglk2NMcnYkw8AuVEx0Wf1nWJXSHQ0q/qGDTX
 t4ueEx5ia3F1fEoThkwVxolpGCVjMI9WtWgb9u9KmIdloyF3c5f1Jj8ZtIxVvu81q3PTwQdP7lZ
 3W7xaZYLFKTDNDsWGyO+K25d+eD3q9aoq7Bw3wKutb9wplJ/YlhZ63YIv0QYnY1zSsQXnCD6KGu
 anwp5Zg++bl0wVLBvS2hAdwVnocANkLY8gGjdWQXj/kDVW0vogjgnmdCi/UpiTG9gTeGnsP3YZg
 31Mcv2936IMA2gMj2cjR5FeCmx08UTRLCjmnzKfIeVs9v5Ca0XcAo01EBj9OK2vlYPgo1KxFT3m
 RWUbzV3iNCDdgbHJWHcGV4zBdcEYMYSkeZ3yKrjtBJVzHX4tAewuDWk2b9lAWM2AZGAoowLjgIU 7oE/rope89UpnsA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX/1F7fUYTHmqY
 YoJ/P+A2ctbA2ZTRGUkLdwNG8HLDz6Lp1MZQrciCVk9oeHWQU3NNkFx3KNbn5ESo/ivMaAZWo8v
 m3QbhhdDRh1xSqP8Y9PqyAFfu20XsxQ=
X-Proofpoint-GUID: 6TtqmqShxaxVNg5PCTRc20t-grinOxU1
X-Proofpoint-ORIG-GUID: 6TtqmqShxaxVNg5PCTRc20t-grinOxU1
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b01cff4 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=8CrXmcB1Y8iGUmZwrFIA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfXx9tJs2iRW3lb
 suvJSlueri5NegRvAxnh6X313bOYgHWPhMSjHZEpmPACxLY1+zdPu4WO0+qYLyBgHwr3dETthBX
 AbU2SNif76u5H1t2DDBsYWfTmfpFtQHaHXmJDn0Uq0vP6egti3DNtmmcEwZrfq8MnzH/DJAMT11
 rCiwazd0rAxs5p5y4v40UWPdFWURMz7uXf5iN5qvTdFurR8/MtO386PSAm0cxPORmOzqj/Cu/vU
 qQ8cQzVF8AAFnV0a7F9Gusj9kIDqMhInOym8OwqAo2pWxe0S7k6KX2GL2/8tjlpVah7Vm0YZdGE
 0xCtRadHVk5613WOplQ+R32TOBi3Ro3ouLqaCe+FDjAd1O+OWjNSI8mulUUbh0NB9qCksNrHgeH
 3hVZtXQHqrg1BvOAN/GJfClw9nI26JnVOgjx6cRonId3bNCQ6cFK2LPzLHVacpk4hQ2c/RLy9+R
 VsW8MeOVLu8xIYHFCYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_090805_478234_5671A4A0 
X-CRM114-Status: GOOD (  14.77  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors of missing individual
syscon arguments, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.  OTOH,
syscon_regmap_lookup_by_phandle_args() already handles error case if the
number of arguments is too low, thus switch is safe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 30 +++++--------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
index c229275b11b3..287f717ab3ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
@@ -170,6 +170,7 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct eic7700_qos_priv *dwc_priv;
+	unsigned int hsp_args[3];
 	u32 delay_ps, val;
 	int i, ret;
 
@@ -254,33 +255,18 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
 	}
 
 	dwc_priv->eic7700_hsp_regmap =
-			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-							"eswin,hsp-sp-csr");
+		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+						     "eswin,hsp-sp-csr",
+						     ARRAY_SIZE(hsp_args),
+						     hsp_args);
 	if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
 		return dev_err_probe(&pdev->dev,
 				PTR_ERR(dwc_priv->eic7700_hsp_regmap),
 				"Failed to get hsp-sp-csr regmap\n");
 
-	ret = of_property_read_u32_index(pdev->dev.of_node,
-					 "eswin,hsp-sp-csr",
-					 1, &dwc_priv->eth_phy_ctrl_offset);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't get eth_phy_ctrl_offset\n");
-
-	ret = of_property_read_u32_index(pdev->dev.of_node,
-					 "eswin,hsp-sp-csr",
-					 2, &dwc_priv->eth_axi_lp_ctrl_offset);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't get eth_axi_lp_ctrl_offset\n");
-
-	ret = of_property_read_u32_index(pdev->dev.of_node,
-					 "eswin,hsp-sp-csr",
-					 3, &dwc_priv->eth_clk_offset);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't get eth_clk_offset\n");
+	dwc_priv->eth_phy_ctrl_offset = hsp_args[0];
+	dwc_priv->eth_axi_lp_ctrl_offset = hsp_args[1];
+	dwc_priv->eth_clk_offset = hsp_args[2];
 
 	ret = of_property_read_u32_index(pdev->dev.of_node,
 					 "eswin,hsp-sp-csr",
-- 
2.53.0


