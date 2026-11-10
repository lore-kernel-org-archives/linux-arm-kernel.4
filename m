Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0976B60A2625
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKojx+zt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y9NeKlJA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f22FzFFb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=; b=IKojx+ztLPXsZB
	+oS1PnGhjCnUJu5KqBVzOSEC4vVKs/IlLwzR1JQHFFHpo7Ug6tQ1clo6ZSnjb91oNN6aX3WkL1pRn
	o1fA3Wn2zdZI75mrYSOV7IwHxGmKh0wECoJcY1JKFx3cC84iC9+kfXhJe14mUVf21Yr6LdyL34RkW
	y0xV/v4kx1HsXAjmiZ/aI7SWWtZs3CnbkkDjx7/lTG/AgPG3aSM43lLqHTa+pgLVafn3FA4QClAh7
	IjamgDe9uviTBDT2cLF+UIUubmKQECNHdMuqiCNDPp/SGzZmR5NRUf8svs+5S8KNtbfKeJKDPOp1F
	3hSExSAv+3zvGEts3eBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcRg-00000002H0U-20kj;
	Tue, 10 Nov 2026 03:22:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcRc-00000002GyM-12BB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:22:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jDOR764474
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=; b=Y9NeKlJArDDZik6u
	i9r+Gc4AC2GlTg+Dgud0mbuq6zicQ2UbTDtbGicesU80GkiWuOk7f8CwJo+CrPD1
	kftSTGmQaC6cTgf/pXCY84uVI1xGqg5Xc5Tdk1JELl1PaINFaPzrvMkJdVNd8tTI
	Ly2xub9qnwbaeyAT1sey7CvkJpP+0S0OEXxvFIC65F2LGEvNTn4RYgCkSxBhrT+4
	N/gZ9DRad6UblyX2S1wxN5mn5FfmDH/DEfvR4O76H9qJrDCRkGkhiLhtgiQf8DHz
	XWTgylQsN+cZqf9oVmvLjNquAH/PxcwXS8yliiL2aJPQIkWKJnFUWrmYxh5vWCgX
	GZ2AuA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkh5as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:22:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdba0aa55bcso916148a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280966; x=1794885766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=f22FzFFbTl7q0sSZ3le4d+t31n2R+GYbUVNdQLHuCqZ4PufrC9mnl/dws2nIfORpNT
         NgH2s8Ovj0fwXxvWNr9aSc7OUMj5Yf45BQB5s+/F4sKcKPl1sQbpRF9+mDFPWtTuPJ79
         wkOOvQta+AAtrkVZpC4U35MsHY8CvBdgbUnX+xCd95jJGGNrI6/ldZ2hzUFwC5zWDkyC
         gBOyykuFJiXAlqn2KyoKfBaHC2IE5VinmZ5e3/YEF2HA72yKcn/pNcPF1X572SdME7c5
         eITYaaSkX4v1+xoj0c7NqQ5hYtgP/xYdRMDOnH3dyu1s6HW2llB56Bet/8g4Tn3j2Kmw
         8unA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280966; x=1794885766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=0O3v1sxU6F43uS9q1JcpY71nwQecGOb5SZRE+HpM4vbsF6NWbp/nwSczFj2cQWdmyw
         tqCe8hccSltDxA2Qzj5Q/E8Ar+2lSuctJzABbR+EoakkejKw+JcpJ30PKbw3QYtkMTCf
         ZgUIN04SpTm8SPUU2yQ+aCvE7PLsmzGWKFnOSKhrMV3ecpPEJ3zM7X4rMCGnaahOScan
         mFB3B5pY/yzYigmXksYgyIoL7ay5e1rQunKXA0DSoPCd/AR97T+VJkA6UD7AWgiDcC3F
         TaMI4pXAiIcPLZ4eyaNrHjYqB8SM/lYKqlNLTN8nZep3w6ERjovV7GQ99vfyk2vaSmlM
         1nUw==
X-Forwarded-Encrypted: i=1; AL+hErHVUS9Agp5mnuYrA8Uv3eql5D4qdjEWIZlkGm+m6n0XfEnaz5EbudJ4FIEcujxMGFZ4Yn5rURV6abl+D4/iP92i@lists.infradead.org
X-Gm-Message-State: APuU4Z8rnKyu1rtOjTqiPuhDyj+nwx6oh7b4bseIa0oohXAJLFy6jDGB
	RStksFqq+ONR56pegjbkEXnAHzTVI3XGP+REl4bf0tqYBDrm32L7XFZFBKWHf76aU3QMRuNckM2
	3qShRYmD3z/KwO7TFRlMzds6TZTLbBOZrYAiRRCctz3hNUU7bSlSJASDBKWXb9pueUB15/ej4UQ
	UCJQ==
X-Gm-Gg: AYBFou0EAEcP1WZHh8Kv0TwoiM+NtOOrUpBQVCE/snis4OFS6sqR+3FxBcRRgAaWc7K
	qSL+B42rHEk909BAn/gX4eZGj0qrWXKi/WcbBYw/75rmdZz8t6c2MZqvtA/ZiT6mX80/jOqJq8u
	naxNNWLmGSXs38VkT3Jk5K5pamhZmwOsMqVfyE6TGTAzQPjEekeSgXBSSQtKhyj3markq8/UzNx
	hMqWccOLlqHRuDD0GRuPuy/WG+RMA1fGXHbgy450cx2g3G413xkPj6sIqVv7thbGJ0dVgFE6EZN
	Ou/zSSdw0F8TstKAhVdBdekV995iM/OZZwzmRnLf6FA5+oUt0xF7lnGGvNvfGPk4ec+04cb9YpZ
	glQEuhCJ/tEY6JNRUCfh0Q1vrvXe+e/7XwnIR6yKq7a65/a14n0gtl89K4r9b2wrHOgJvcokVrN
	xwb3uWX21LjKfDsXWOE5abTOR+6hivN7E5AKgK
X-Received: by 2002:a17:90b:48d0:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3b166cd0dfemr1871314a91.41.1794280966192;
        Mon, 09 Nov 2026 19:22:46 -0800 (PST)
X-Received: by 2002:a17:90b:48d0:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3b166cd0dfemr1871273a91.41.1794280965687;
        Mon, 09 Nov 2026 19:22:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:44 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:27 +0800
Subject: [PATCH v22 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-5-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Y/FvSaBbedQq8aKjgsZpsJQaVI9vU9ZVyO2kbtYJAR8=;
 b=V6M7HUx9Kms3500hr5WZuGK8cd06NyCwD55SfWh+pDqabilgAIs6G7iRqWoYD5IMsLKodsx0c
 g6c8d2cIg19D5JiY8rMe9D+/kgU65OIqoDGzzMAuOw5l76/ZxcXBWLu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: lcYGKhLG3q6_TFnufahCbKO7MU9pa2Tx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX5Y7/0qxdObxK
 tivA5jeE+BLoMnjYU0vB4J/jtVERHyfSGopf+QGEO/chIodmdj+tNXcCJtoIvEzyj85kC1IkXJp
 MunlTgDpLIP6RJNgX7n7B7U25JRVJr8=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af28e07 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: lcYGKhLG3q6_TFnufahCbKO7MU9pa2Tx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX0+0lLE0E/yBp
 QLtzgP0ZU+QsZSOCHOgVzZ2HcOkUKNzRm2QiXBUSXVYl3VppCIk8LfLrF2Su7vPHFhZT2Keu2xn
 sAChkxLzLrg812IbNP9Svjnsu7RW09bLHsFn77xU+pmEodIb8XeoBCl1mJRNdC/JttbasoQrcUt
 iYCTQ6B8JCi0hmT6KZgF4TR48SSPM+mwVynaSnztWHWTQovCRuIAS9H6vswgdcEw5c9pOCfqI+w
 IdaPe/SOobBdvJCHexMMSDaterptbO8aQKuM/6PlPYY6b0FNhQ8d0zHof12ezs7R9Sm+zpC9xNN
 cJVYqevTsgFdUX8vLD3fq+59VTNIJmBst/8J95nmad9ISim6nY86YRbNv6onGbRRgrfpNfetnKQ
 8MQLO7z126LwIe68CSkWIbGcuNjInedJOvRujY8T0GHKh22SMj13Fq0cj4LTFm3Dwr5ThFHAydg
 K3kq61dA3HDKmj+2QWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_192248_446424_9E6132B0 
X-CRM114-Status: GOOD (  17.76  )
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

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5032f5598e15..cc341cdf8d8e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 36c80918958f..2345bdbb0b9d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -474,6 +474,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


