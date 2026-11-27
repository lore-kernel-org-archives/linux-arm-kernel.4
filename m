Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA7B60A261F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Ol61H3M;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OkdZKMFg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ufKoELyG5OJVjqqU3c/Qvt/pb5qRk+F+TxVqt+FkFmg=; b=3Ol61H3MQtpANc
	hInxw22uH7AuY5tGl7pxGkp+DRfnNADhm2tzJVUO8QJodoj5r/2Zb6ta6fwOXAMpCxeS7734mLG1K
	9UeqhD/toA5+Tbt2sNXs8jbsPmI5b0Eq6YtYgYp9Csd4gaCuFLB2bHg5d2v0+QKlnxHTy6F25mor2
	84AuDkb1i9iIvwBPtmRHHrFYJsMZkTnJWzKBpIh+4A9JNC4AQ8FWDz84sEw2iUEkIUr7qGcHJne8n
	/xBLNXVYgXe+sDjCQVL238v14Z5JNPJ8mnamMNvuyP8+TQsFQOtpXvR0cHMMWm0sVZBJOOKIMp309
	rCL374JXCDPjlhlIfpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrdP-0000000FISk-0IjO;
	Fri, 27 Nov 2026 08:48:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrdM-0000000FIRv-1BPo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:48:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GcNk1564733;
	Fri, 27 Nov 2026 08:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ufKoELyG5OJ
	VjqqU3c/Qvt/pb5qRk+F+TxVqt+FkFmg=; b=OkdZKMFggOe17aEGFaaCtZVdPNx
	9xdMstrsu23pgILp0qZOqHFDhMK3OBNFT4dUE+712Ikj/COgvv4zVjL80d/xDysX
	obmHVDWhrAEisiPtjKqSHJIySClLjeh2fn2YthXnRLdKfVDxaDAsdgx1FbLmex84
	LbqmBQRVP2MfVAgWPy44qwPgB31j0ueK0HKBkhDBMgtyVz2pE+FtXVJNoO2sarXx
	0/koXkp3+aB1dBXRDP30fk9zhzb1hkcJzZh59Y83a3uRoJurv/WcSYNh053D4B8q
	7YJJcXuJMOmCKtiiCgFZmAotIrui24GMKj+fQjSTbwEuqwKxfOM8pdSgmiA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74garjf4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 08:48:31 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR8mSCH003714;
	Fri, 27 Nov 2026 08:48:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mohis-hyd.qualcomm.com [10.147.253.64])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AR8mR6J003695
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 08:48:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4840500)
	id 963CA6AC; Fri, 27 Nov 2026 14:18:26 +0530 (+0530)
From: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Subject: [PATCH v2 2/4] iommu/arm-smmu-qcom: Use identity domain for Shikra q6apm DAI
Date: Fri, 27 Nov 2026 14:18:24 +0530
Message-Id: <20261127084826.916361-3-mohit.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127084826.916361-1-mohit.sharma@oss.qualcomm.com>
References: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
 <20261127084826.916361-1-mohit.sharma@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: ZLC_RWqU_nT0re1kPnz3DgEpv7EmtYN3
X-Proofpoint-GUID: ZLC_RWqU_nT0re1kPnz3DgEpv7EmtYN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX11F6Sps7mC1e
 deErkYJTWkPUladT0zOxaYlgUFYzF90RJUU3r796hzVZzTcpPkC8SmzO6uPrvj31wgsy0iugE5N
 251GdtjnUIY94TzsPHN9cXzWb94pH3+fLXMuWFVAWkqXeQg1sKgJXNbG8psH8RJWjPoYOwzXXJ2
 YftHBAZbXw3kHEDhrvkkCQM5NxPX+E2dS8Nlo1UAivZ3TICx8FM6SDj1xBv8XGjX4pKjvbVvy44
 97PFg5TOTxieSn4yaad1I9vmc1u0VqKCn9e1CkHd+rjbu6WTmzWuM52WyoVr9+2DXck7KvFO7Oq
 N/pxHkSUqXlklibJY2ZsOVsFkitffSeJgkQsuhnvYwzpOiZ4rtFFPyabxDJ9InEQZr6Nn/9PHbO
 4uB1vZsqF+3WvFNh8PLz+WO4Dh5x/jxG9eZ0glOdJPOtRDk/cRHem+5EW237nekZZFkmVkrCcKw
 MYIwsFjqMORoWQIXe0w==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b0943df cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=v-17ujD_Twj6ygAmxgMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/nnedxvKa/AO
 frhAmY3MuRREW0LMTSYV0XAIMe1lWtR4Mt0yzVk5y+8XnvDoV1jtLWeK/HRiLCapygQJUemnBYZ
 CQKtIa4adeqlJnTXitz98bTee3g3eGg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004844_435644_F939DC08 
X-CRM114-Status: GOOD (  12.20  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Shikra's q6apm DAI is hosted on the modem DSP under SMMU stream ID
0x1cc.  Its firmware consumes the SID-tagged shared-memory addresses as
physical addresses, so a translating domain leaves those addresses
unmapped and causes context faults when Linux owns the SMMU under EL2.

Add the Shikra q6apm DAI compatible to the Qualcomm SMMU client match
table.  This selects an identity domain for this stream while retaining
an SMMU mapping scoped to its own stream ID.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..09ea293052b2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -420,6 +420,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sdm670-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,shikra-q6apm-dais" },
 	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
-- 
2.34.1


