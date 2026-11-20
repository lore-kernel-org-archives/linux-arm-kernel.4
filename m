Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6139B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hkZ4frsx;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BGkuzeGO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiypEfQh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=; b=hkZ4frsx3vb5Oh
	wLiXGbs5wNcnYiAD3y5aZC9TH+migblMQiR+/qO/pwuO8TfbWsRjcEq5+rSf3hoqSrTOHkWHyrPYP
	7RnVOXed3XlD0IPQ/dbS8qM6Ewm+9LDCwYi5GDjEqOlqZLMeNDa31ElBZu6fZsXT6XzPqi7XAUU0S
	zMHhzSts5S+luwddBzdYDDLNAqHX+j/qBc1kNaKrPAhJw9Yrw+Nx61MlCqao2r5uP63oy1jaAb89w
	ZIs+VZofHO2HAspFV96j1G1OUkF+hsvQFBbGCBGoveL7pF2JK3N3TQ7HDrFPuX1fO9tb4AvWyUzhR
	XcF5XqN5FaBAoywVIA9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFIX-0000000DxhT-0PVA;
	Fri, 20 Nov 2026 03:28:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFIS-0000000Dxew-3ESI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:28:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GFNF3826017
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=; b=BGkuzeGOJ3aM3hwZ
	bMax1U/qh4OrNonsZa52DOpUwDiS1t3VpeR8JvoNiWOXhCOQUg0q9nUjsxv/C9Fh
	mTvn8YfTUTN3yoF+CY6vHX2K5+6z38Yde0lz1amsDtDO4EkCVjupsiWeOvZvEcfX
	ISF4KCSn/UtsUAYb0VlMB4eyaUaQZ5AtY69/4tio0KsaJOWpWa48sr3DPYPLNzNi
	ChH5eY1tPn+mw5wfvVZ8jgjTSJAGCj/0n3AKxXBIz2oiWzbsGrS95+ace9st0I2M
	4/soKmdvhGBnm1uAX/LWElGFAZz/wjUzSoUdzRuF6OBzsTR24UPFa3US2YFNRBK/
	YUADDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yx6c1g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:28:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4162e1605so580896a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 19:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145299; x=1795750099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
        b=MiypEfQhIfQHh4cuj3gJTfjT1GRXKxdiTEQOzgZ4iV+C0qXyZP/D8SlatPAPx/U3wd
         JJ4B8YXf9gh/I19nXRD3v6x55cMgi8V953I2b2vsxQwPWRkBJprvSFb1Jj/mDDCaw9Zb
         CZdPiEOD1iw2BSmN2LzEVN8l9Q7RpL8V5tcz6XbeoPVOMkPRvGM7ilgcO4GDdrBy+isK
         e+i5xqHIXCk0glPTesho0jIOCSOPTwkX+uWu+rbuQm77WYDlSdRCCaaU2WrczUn7UyST
         0pbsRhb7HYgCoClgBDgakI1SbPqvbDY9Ciq6QObr5Peq2lzXUHD8JxhjLkE9KJaRRiNQ
         BKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145299; x=1795750099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
        b=yXtGCAJpdISmCnWid5u6QcfCmV81rtR3kRNzt8B1wKdzaqpUYqgqCTvHG3qxFsC1ve
         HHQkxbezZawYmi1gU/45ThUPZU8FmOBi3ZNf2D7ziaQDCN/gbTEJMYJwSPLtC8q+Wtlr
         6WQdeqh75Tf/B3ufIJcTks+YyhvijnBwCkD4sCuOiaWlXdCETQuif20f9CWqBKNzoh0a
         0h+lhRGYKwNophn3rktgSgk8meIwktHK1RxNouGl8+cAVcb9fzQPzra0e+tzAqqY2uD2
         QSG3sPFYmS42em5z3quIIwx9/0uNzXAo36xDHPQHrG1YkdQYmtHzKqhQf7iR8VmE+ErV
         nvOQ==
X-Forwarded-Encrypted: i=1; AL+hErFgQIoIqncTrSh+gmCp+iPQOywrhr8+IOWB3OIwhXQp8IDaO1LtJ0oGa1gteIuqGMtdd8Jh9UPjVEXrkcT9GVQa@lists.infradead.org
X-Gm-Message-State: APuU4Z+sLL13b1tYIKyrkW2gguUu7hzDA35sS3ddVXIIZdjLuWrj+8tv
	7XAwVzzn2rMG864JuGJpoM3MJ0VX4zvsQWAKAwqu9etZN6JTbj/JCHt5PcQa/91ybePZKtaHd/q
	T4rdZ2SwRJPa59BoSbB7MFqYhspGkLEaM/MtlStNuTLDqPuvgj0CxiqgGbpZ6oGk0tF7kPSLj+F
	QpZ8EppvNaGuW9
X-Gm-Gg: AZFdTZcXEAStyCCr1JL34WtwzCY1oq7fGYNjRTSwvM3dEaiyy9XT06dAkmgKM8+i7Qm
	Rtb5PByq3TCM4zFNjNyBjaU+ak6gn/nbHNKVZ93m9BQJ+Aw1a4iA1tzih8qONu7i/jrpfpEinja
	7q7RKJmFkDRv8LUtw77+VaSxazxC8KMDeIHF+Pp1wFfQ/IrQ0MkMaKiQIqipoER7WVD1/hvJ2OE
	eZEtSLOGMzRV3lRR8MntZDOn0AGpnOQSRLzL6GFcOxl9zSZM0Lb7ws+KcYVMPLB8N3av3FN4dKB
	ug5Ig6X4FP2f0AlTp6aGXOLKvebTv+6Xluiux/U4H5rU+EqXPhEkC6v1k2luJjwde7mfMKospyh
	am4V4giinEmYvrlsKnd1IvP+VrH+MXJ/6qCF+Zvhls/cMU683615iOvw0a5Synq57FQnECvuIHV
	nLKhQ+0AYjPJqCat47v3eFHd2zJs15Kiu/vgU=
X-Received: by 2002:a17:90b:1a90:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b41c92ce29mr1222886a91.29.1795145299331;
        Thu, 19 Nov 2026 19:28:19 -0800 (PST)
X-Received: by 2002:a17:90b:1a90:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b41c92ce29mr1222859a91.29.1795145298821;
        Thu, 19 Nov 2026 19:28:18 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:18 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:24 +0800
Subject: [PATCH v24 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-5-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uwbtQr5CO9y4m2VKIS5xp7McWK7MGYHbpK99F1KNat4=;
 b=SLkUvEcl7lYrBTAQnWJAgtuq8pF0GvPrnlMCcAOC5CGloPzizcu9FlAXBO83peJqAz5ZVR2RT
 RpydEuqrPC1D/0d4Dg8ktxut2A2fNeKKBSaptBEH3qUiFHJZBUew0P/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: TKKDpCVfz3s1p3jo5HybbBdSKf2rUe1-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX+PRGC2GgiJPu
 GinKXUSOMVh4W6pAUfS8f9JhNkOFmg0drplIh7cbNRop2pQba4GZvPXgYILAo2ZcfY6piwns39u
 GtnAXp7JA3dEMOwU7BNmuifjspHA27o=
X-Proofpoint-ORIG-GUID: TKKDpCVfz3s1p3jo5HybbBdSKf2rUe1-
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6affbe54 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX3BSVH9ojyp7/
 5gNEUNXx+pywYa4xtSZ34G8f1MnEiQyFlg+eoC+jDumbUfKqeJS5w2VsbSolgjTgvjALJ6NJHp8
 RJ+5+aIpMJcWRDWzf8UE5GevPmaBDQvw3FuQUbr8uPMwXnGGb9ZGKtq/5sK+pfZO1GQOwpB6pTt
 5fx4gPEvc32Q2H5qenYiFY7Nwj3Ax9GDNUu7a1zsr9cxwfABfSl2ut/XDisGOG+g7aLnHu1Fw3D
 Sm44+EWuH4UoX1wDcLLBgwl7Lqd+rmiXQ3mm19ZQTqb/LoPc53uxA4gKtCNfONXLVtCj0v19VuO
 36c0ruwbyDzYBaCgTQ0AiimaFqGb6DYwr+R6DredNnMkz44LIJ/PfcudG2tPV6uJfgxPFYVGKkL
 /bu7lc3D1QPD2QwVNiAlM4JRTiGPK82b8N4gkdELug5sJuRbJsAkzVeQOlIT88hlBAqLqfVY75/
 DM3hQHyi3QFPiwbyL/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_192820_827081_42D74809 
X-CRM114-Status: GOOD (  17.10  )
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
index ba6a686828d7..308762194e5d 100644
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
index e94bd74e7c08..6fc0b136bc05 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -476,6 +476,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


