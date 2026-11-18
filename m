Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8AE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mv758z9/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WdXe2tDZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c0k2JJ1W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=; b=mv758z9/U64Z7j
	ILM8zsDEhtYJiK0Sznb83MDXQq+OmhXSa2YM8+Y/ASeBALDKAZL8FB506Dk4fdlD74wBd5PJzPlxJ
	Br4gjbeG9FeDxeqaSz8ffDFGfKHFn10EEjwprUrE2cbIY12Ao3Q2osX+ot3kGE1Rl/1TW2YKQXJFF
	sK/tXOaDgdGg1Dl3MQVZbwi09HvBuuBemv6EiixJcceuTQre7LFSl1EmpLcHRodi9C5fniZEaRLBp
	xnSPqLFm5jwpc0GPQmymoZU6hWMPj+Bb5EA+R85Y0tpC27nJfyxeISYKtaZ4o7kkJF6CGh0Po8Kzu
	b9p3/Ctuyk5LB5zdolpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZi6-00000007y4M-1bz7;
	Wed, 18 Nov 2026 07:04:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZhu-00000007xw4-0RQI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 07:03:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvAl4059958
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=; b=WdXe2tDZ7AO7Dnmk
	un24RsBpgcptwArLeHZdZcJgWS9PpKr6H/ciP72hTBPG70SbDhmVShXoUC60Ne3f
	UFeoI4t8KykS/UjBiOk/pIGbfkiEiQHTJIZf6S3HjMCO0zp3cRRxBd4dwA5//ao0
	99MKczL3hODhJ+Z6eoyl3WJP3P6lyWI2uM9Qw2C15qFCrKWV00j32wbRZ7PmiGin
	bii6UqvLtUp5lWAv4VInwx0Qw2/EHjIZmGs/cYhsay6o4f2k2r6eroHDOQUbpxsi
	MF74hikY44h6NwxJ2pTNohT7zQbwhTvVQ9jong3JiyhR4Zieqog2Sz59AwDOfxBv
	HOl8MQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchr23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:03:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed02a00b24so6525825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 23:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985428; x=1795590228; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=;
        b=c0k2JJ1WJi4QKH3u/coGCOGVc7wIkpmf1eo8rdRAeFPcO2q9n+P1b9MNn1p+2G01hn
         lry1aNGKDhUoch5s/9rQaZwnp+f2LPTXtRapC0PIWcXVzN1v+jg/F7W6BtySsOwxhwY3
         8vlix1P+iOyY4gjpa1duDNsFKNg//k3tb/AGukvA5QPjtblg6HN/Fk7OP37tOy2h6uou
         BEs3j/F9N8DXkAmNfladvSjRp+aOTjzHEWvPnWZfyHutZkw7Jhu1aVQsuCm/JcffnLx9
         8U1armqdSUVPcXvHA+nAP3R4j1cLsC83UD3XsXFVOBo7ey/U1SpF8ih6GyuaLPNcpTiC
         4U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985428; x=1795590228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=;
        b=UUP7goF8tFVYbz+TuApFMVzUYgIKrE0Chkp2Tnw2qAAzg381N5e6IomK4PKAqrbMYM
         Y2MOtEFspB5F3HsVOL9daK0glBwEpmJtjqKwqzNEZ3CpOjj779qLXaTe8u9jBRxPWGPt
         TgM34ntcQ566rjmeCkVvcfPWYIp7XMhX4fqaOIohDVqsaMiTpah7XTwxyOUTpVQIYsto
         64xonYELCA8+roIHpclo01jSOd3ftrTBlGv9iNvDz5Q4dhxzHjOz7pqAJBdY6uRecGoU
         7mOybG8PP7q2k7J/a3zCRi1vSDKGAv/du0iPQan/jxhqj3geIGcy1oXl0rtUrxUowmOo
         fF4g==
X-Forwarded-Encrypted: i=1; AL+hErHg3QgJ5VwEbTn70umKVoIteirD5Fv0HpSkqoR2H0pe7rnhSoU4ol/NC3ZPtCZwBhfuT+MhlPkQIbV9GS+hMVsn@lists.infradead.org
X-Gm-Message-State: APuU4Z+M8VrZxxmNgp6uXQno2js/im5XsfPKOEc19fikTB0B5Rt5lOTn
	M7wGhzK/cocEsVvGRTUcd85vv0/TSrou27BE+CYs/dZctEATVIANkdeXtiCuvkeedBU/doKMizO
	0WcrbqOc6/aC4hxdfdcJsaBAbz4ihAzbjOxptfsrqaPk+bA/q/3jRraoHkuLY/qoqnGSyl+Iwj1
	fAfA==
X-Gm-Gg: AZFdTZcvo/nkWuTLKcfJQeYLDgNgGVFDC6NYWfoqGIuAz9lqPd5k/r8mNXyzjpsY6lB
	cES9VjhF4PGr/t9juHG1C/OB8TXjnlYg50H65h9knBpqgM11vuUEL9no9j/AY3Iu7bmTpjU0CCn
	I3a2UIAs+EWamPTGltbMD/0fkexLoaY7fPsRotZuvZZbiO+ocBE3sdbfMMeCHxkkSwKXeSwg2rn
	Tk2fuTKfSxqNvwEdtTMkRX4BqBfWwmYB/xDQndb8+5lyIt5BoQ48VeOLxcthOaXKLt+5Iwg3Uw4
	tZpdMRC5cNO7SIHPr/isV0LcXlCUhzPQn4P2ldf1AeDoYblcuLfeU6sYDBVYC/+ePJGKvaQvZCm
	e40LArO0DN+8KsypKm6gxxXNBifnsBWpRSKILDleOXGWZRst+Hw2zyrVUP7uFJYq+f5SIY/on74
	rf7zHR27U/tDwMmlpqhv4W91RGqmxdpjd0pi4q
X-Received: by 2002:a17:903:32c1:b0:2e9:79db:449c with SMTP id d9443c01a7336-2eff758e055mr14931195ad.47.1794985427888;
        Tue, 17 Nov 2026 23:03:47 -0800 (PST)
X-Received: by 2002:a17:903:32c1:b0:2e9:79db:449c with SMTP id d9443c01a7336-2eff758e055mr14930935ad.47.1794985427423;
        Tue, 17 Nov 2026 23:03:47 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:46 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:46 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-fix-tracenoc-probe-v1-4-0298dc5f05ac@oss.qualcomm.com>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=1737;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=mkChMr5QJ/I0Rmy95rl3BK7GGoBPcuQy2FyYA5pTSnM=;
 b=Bs0qa1GAKffiP3TzUW1yvs8s3AtA3FM3Teo4ZoHZqa3aWneuzLoi+acavijCagjS60VI3FNG6
 cbJ/3P1xwDvCdDipCwe98kdwXeJ5/P9mnqV+1mZ//dZpPW7Ja6K4VmE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd4dd4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ij8A9LZYLNJric6HJrgQU5IeHRtXr6zL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX2u8WMCE9dr1D
 Eo5Xv3OieYuHvggdNFrX5q9l6hSpdH4yUMafB4Nr9bmzW/Ywgt2Wesdlgcr1/VFZFqJ3QLvN0Qt
 hM6CNcVSJ8+5Pkt7ii6q8spRV2AlsO4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX/7+ggK1EYTMC
 sikUQqhq2N0MBhoo2zKJYNQBQ/qwBGhYjrT+IQoCxOzyjUqDxP34DzlhE9zXFSmCmHyj0zwhLWW
 uq1dQoWCRppIjKnuycFRZT0nT+vTXfwM5Y+Iq6afi69dOK/sUU6RYbxfsKnEb/7Zq8rDPaRCsza
 6hmrEU8W9PrwNMK2m6rYbSf8tVVKZ9x/By5xVeQErNJv7lExxmZ1r+9nKuMytithGlxhdryd4ij
 rL1EuS5rn2Exq5/NTpW3tO7fCQzC7uWQf+y8GmShh+lwPK4d8q9V5kjN3gAPDfua/N0b0ZMbZL9
 N4Ct3fs/l581G+8WmlVtc6Z/z6pNaESWGw+1WP9zIOU6JsgO9f80lx2NLz9Jy7/seSBCOjIBTG4
 C2o8ZFUvcxIBKZhfLl97UVfMTxbf+RC8CHxWfK9F1CRSKZBaIxbW1o3tfPv1vxiEzs2JcoH/4/o
 KBpR5wqH8XQnURe2jMg==
X-Proofpoint-ORIG-GUID: ij8A9LZYLNJric6HJrgQU5IeHRtXr6zL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_230350_276394_75C5E10A 
X-CRM114-Status: GOOD (  16.01  )
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

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It was marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
an ATID. As a result the aggregator had no trace ID and could not tag the
merged trace.

Switch the node to "qcom,coresight-tnoc", "arm,primecell" so it is
described as the Aggregator TNOC it is and is assigned a system trace ID.
Rename the node to "tn" and use the "apb_pclk" clock name as required by
the Aggregator TNOC binding.

The Component ID returned by the hardware is 0x00000000 instead of a
valid AMBA Component ID, which would make the AMBA probe fail, so also add
the "arm,primecell-periphid" property to have the AMBA bus use the
specified peripheral ID instead of reading it from the device.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f..323207989d25 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -7389,12 +7389,14 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000 {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
+
+			arm,primecell-periphid = <0x000f0c00>;
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


