Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4524606A888
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LKtbRVs/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ7LyWkF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=corkCR6d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=; b=LKtbRVs/K/WJ2g
	3mBkHqJ8HhP0HHmxZqW97OzU5A8MGr+ISXNnM7No5XtCkbgmt/e7TVeIfy2Gh2+pW34Xzfsb7Do+q
	ogLtJocGq2RjqIiNquL80UY7M+vxt5d36Mn7rqexvsxJyk7l+bEL2QvF7YRI5feb/P+70rEAcOuoI
	nLwPYH63jG/yKvu+t06dt6i95j9tx+JmiqmXdwc5sQ2wLQujo8ZwAMTjeE5O+AfKgHG0Xkxb6SmXV
	5NmnYZRJXKrBrEuY9YhEAiYNaaLZvpLg2H1Cebwr/qsYj3zHkUUpddTa+irkxn+dMLBqb7MM/1V8d
	K6woTytsy4nYlQ889vVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadX-000000085a6-3Ymv;
	Wed, 18 Nov 2026 08:03:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadR-000000085WA-363y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:03:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Ux771959809
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=; b=VZ7LyWkFNR/adFAu
	rvraIXRtjke8TzSjKPCW6Mm9i+kqL4gkm3hTDZRuTOi/9KHmL2E5b96bseF3sumr
	QeY4im95/oe7RsHw/vLecTJMC0WbztHhxSc2Fjg8+699sUak3tmoP0cjgkPXcnYF
	R1f2+QWFe5rNDITKCPPVGROa2+keExyRO46hL9I6eSQi+nF6zxRxgcDwma0OFRAP
	pW30sLVvFavP/QOXKjcaEkCJLdVOya7bCct3YXVDQNhloQ/t7aQGg8rWaCwrlV1Z
	zMnZV8UeXGvhQuP0ae+MiCxWO7C3tq3KbMxdHYz0NvkvwEgu2+jqlb0aYzq6tg21
	d9NQRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hws7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:03:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so11376535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988996; x=1795593796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=corkCR6d1LjaMqXSeCVI/NXXpcf7FVoG65fUvs7YgeRnSZIVntUwcsYm/4XcnKe4zE
         0wPut6pYBKhbcZORwJAaE4J4CUMzJkBtuQqCl8vUXYeGC/NG93xqboz0BTW4kuF++lph
         8MbbzVX9FKbWHIFifQjo20HypQPmyRdK9t++oVhxwxPGu9ctz/ccD6/7EAST/CEnDIMk
         kpWVJSKxzNvCzudAxfN/YuzgIRz8fnscBZszTUSgM/6/NxFd4OP9hkeMO+fQSRdtU+WL
         x3AZRfBobvsidwE7VTMyJ5AG16PvfAF+yNVS9vfR7U+KL4Lu1gJ6rHHLHbHCZGAQlFR8
         2STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988996; x=1795593796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=I+m+rvh5Ebu2VLiS7aMPOUwek778JfuxiS+X0St3dVACuZ2hNCJORRjfmwiU58IepT
         SLaagctQIB4djpRNfJ6HMCF18Azb73GA3bIXqq7Ij9oUKF+aemJ0rjGL+eJOHZnyGslj
         V1cf2iBtGwh11aih2EDjXbygfeoQXI9tFNn9cLxN72wLdYOMsM3NekGyXNf3k/1l5ZEU
         Y+cKLkW5qb/HgNLhZi6IGvrWmH0hunpbuPP9WKCGtIsXeIzJ/OG2TWX5yVQll8qXlmp6
         27mzpZ40kbcSCTOF4rgxo1HthIZtIiUHvV+7Mx9Ujt62mqXN6gsfP+UYbCzBRUhi+02g
         u9nw==
X-Forwarded-Encrypted: i=1; AL+hErEUsTW+IbvyUcHzCMzJBor0uCsW445tcax1aAzqfgtvThDwkBqK3hk6HV6nzJyk23hVkGA1lov2ns/araLIeffH@lists.infradead.org
X-Gm-Message-State: APuU4Z9pKgadTBX7UcfG25/Fug3tAiLx2TfY4ZACXzfc++sykba4Jm2V
	Vn+Iu6w/doNpMOQqp7bHu5lardK3NtPg8MhAHF2d3K0uIuK5DSjRCX/AaEc4DiK7p3XJ4XD0ZdD
	r02+LYfJGJk6+N6qnfFEqoyitR4kHgBNMLQO/UhjbjurCQGlOzHJpMQ+fE67w5r5EiH+JXUiiAi
	9oHg==
X-Gm-Gg: AZFdTZemyA9mj0lGdu0Gq43sXVqVI3aYM3IGv4d2QLQvKJDmHvSbTU2VUUgMjAc9WZM
	cw8I9fIToYDb99875YYdOKlnQ/D2ZQR2Wjs1E0RW0V0pZjWk5uIPIXkLot4tiC+PC5MYdlESFxU
	jSfTus2ecFlzdS6lHG86A5+cI4A5Ngao9Y1xEbpOJzjDUsDsH8KSkLJhZYMwYOaoBtg9yieWygK
	gyUhU7xBRitBg6En0z9W82sL0RgC6CBOkXolPwZ9a9JfJCw4622YgGWcgTLkkbK21dASeUrn/AQ
	8nrq6cqeU5tWfp8XfSPCbxrzTx2YwGoAo82MAInlFiHvXh7y8PJJ0GO3pyuInjpPdDfU69BWxY8
	roZw1hMH6HGgL0irbO3fSgzXqIWlCbipRQM0bt8czv2a7ObK3PS8pirq5Gt9CWuCeHKcVflrlVJ
	mBBVvG7IGIPz3n+GLmsf0T1f0EJDdkP7lBY8vG
X-Received: by 2002:a17:90b:4b86:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b3d06a254dmr2025379a91.2.1794988995959;
        Wed, 18 Nov 2026 00:03:15 -0800 (PST)
X-Received: by 2002:a17:90b:4b86:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b3d06a254dmr2025342a91.2.1794988995479;
        Wed, 18 Nov 2026 00:03:15 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:14 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:26 +0800
Subject: [PATCH v23 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-5-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Y/FvSaBbedQq8aKjgsZpsJQaVI9vU9ZVyO2kbtYJAR8=;
 b=v/Mog1KV7xh6PV68yXz5es3jTQaT/IlBXzKBN79xPwXQMDsGepiTTjA4syW53LI1F4XU7A2FD
 rIV2BRtqNLZDKZJI76FHVufgwKArL6AhegcEcgtHm0dIas07ZAuy2Qf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd5bc4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bkVFDQE8JvcNnOfEZxrzcnt_DHzeF1g-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXx8fLint70cAe
 I1bGXs0fsXhpv4haKo3AHbDLDVpObOjHOjMogmRY1jXcWi5sBFcfejurLe8Z3+mKzYZZahxAOxt
 sVjLTnQmy6YtnKF1xnNDzAtKxwajfcISTLJAsPnQcsI/dOiwORrKHsRGWZOEtfTNoSJztaPOg/0
 uy+kCGTenCdzyb8RcpX5lJ4z2D6qUz+aK1Zby98VDKbOqbXnfOU2ZhYgmMM2+mol/p18XNv3Lzn
 /RinNhUBU5HNm/LYORFJNwm/0iiTH2YDau3WW2bmwMlATpH/7a3Y+a8BsXHLE4wj8R1AYlzMfWb
 RapxQwBBxIX8UbG6DDwWBfKHw5es/EXnFYIPo5WpT/6t1QhGsbe/3cFDnqSi1SBYuozFiOI26Z2
 uNv+maaJ1uCp9lTYDQU4t00efT6KWi6NdwcPTdUD9QIhEpoKQiu5g7sDJ9G7kRN885ZnCbk+buo
 PJiYIK4QkEDga/Pdlew==
X-Proofpoint-GUID: bkVFDQE8JvcNnOfEZxrzcnt_DHzeF1g-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX3wWF9Z6jtGd/
 rdXmNXKN0dSJMuJki3kr8omUfX69JKJTgOfhnsNi35zk5FN67PNqntc+EWJavVDPRG0wnG8EiSr
 UIxOmyjc+gRUcBhLFdxLj1cgSPof+t8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_000317_795096_BD501C55 
X-CRM114-Status: GOOD (  17.22  )
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


