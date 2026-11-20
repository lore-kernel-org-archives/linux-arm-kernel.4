Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646FB60A2609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CMdPXDjC;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTgvRwpe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOoteYpw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=; b=CMdPXDjC1tKEqW
	johC10GqVxCCrjjbFPDANm+FEA5WS+Z3d09RwtSowSa2qvJ5mLLFOhashmwIlgkcSqeDBwqD07riH
	MmoCRsK6lzxOIPuKoBCsRP8WrFlPZT0UwV2lW0R6AlI4QC1o0RpvbBKoSGaF/1nd2NquPZZ7xDgFb
	eq/mc4guQSwUKVrMgO6xDZG81YQgDmuc8OMxoIFU4hT1h5OQgeoR7XRdb4iC3ZM4Mme/8/0OMmj1j
	yjysUBJeDYbIB/s+vtDP6N8xRes2aNmbQFHrZbhssYyhAXiAybMAMtN9xTLo1ZpswLDaEDKlUPV6H
	cvrOrTOy7sX082+tIYYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFII-0000000DxYo-3LCs;
	Fri, 20 Nov 2026 03:28:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFIG-0000000DxXs-35lR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:28:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GTjk1048833
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=; b=cTgvRwpeF3+QIV7d
	Pu5QhM11BUSuihKko6tICmFRo/wZZ2eezWsxzoXxCW/WNwQfrlee+JNhfs5QeH5C
	CpDC/jCzH2kUmggOWzJ0vTC+sruCHog0+7miye77mxJ2oISvwc/ohuApQe7E2Vg3
	/EqPqHkuHRVL/ctluzilUi3rJwIfKOrynxxkVTPxdltXbRUe3DCUezTPKEF9r7ek
	6wUT39I2v86+FB5azyBPGNRXX/IQ8XAbe7PZQWrfgxHP3cGkWvKTBkHbG2MavEZo
	zfJBtzuz5o5CGkZjVPY4K7O30YOgP8+fLLnGTCaQS2K30pziAe+YdbMUiUM7YBWz
	xE520A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymmab5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:28:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so494790a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 19:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145288; x=1795750088; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
        b=XOoteYpwt/KWfetFnaI9ciRH0qEDPyB/JT4bHJBhavUobSjihX0u9mt4QAmMPC2kNc
         XQPtxfc8ftcopy1HO1LLUqXR1ZxtOJ1p0zQJBq+d//mpqMwLA3jnsOjEoN80RHM/OZXs
         D2pAq2YNEc/ra2K1ksgSKVz6+Mg8ErfRZs5tkBtPyNmeRaSvZ1MyXxUpvDRRWc9tOfja
         mo2iQFyJajIGEa7oaGc4jXh4r0INKpx3BUd+hgNdE5fSs2YKvRnjgMwarDgRp+UAPG7q
         Y68+d4JEk6c39ZQOuCag1VBdW3Y5NFIpQIAPW1j11BpXJ2KZzZ+WHbB3xi81T3w6Blb/
         IfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145288; x=1795750088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
        b=IJ2gq5G5VPgfsZLa7XGLMGAmd18CYa8cUHi2dAUx+LwLd1TKcwacBKYGxeYml1fdeE
         9/tDHDCoFtPN7E7ohgzk8mG0sLA/OC+Wo0amLMNfSDRWAsDsnAul07nWGIjUiOz81mzH
         MMq1fntGZsUDT4MexNCaMS7FyfsZLVoQaOGpesPl414837DOKCb29lxi4nvp306ebqYr
         9914HRPWeuEHBcan5BGJmwAGysyPhqPf7gpgyng70BZfWi3HHe62YPEdJ+bLYEDI08Pa
         JstGvE/uaK5jNWZtGrD8dSvbtP+5ZVvqQdl+QkvhLqbpaLCTxjbIi+VJmy0elZ4zdTU4
         T8jQ==
X-Forwarded-Encrypted: i=1; AL+hErEEVjOBI9vOW+uYaa9V1utsCYT4oNTvyMiZM7iZvUl/Yy8waJqz1xSsWNiToUnbv4Qwk/21ZS90v0po/FPjE0/+@lists.infradead.org
X-Gm-Message-State: APuU4Z/deK/Rr9e0Ytc+0K2H0E95XV1svxWsj3F0yl9aIP4Ca0TgsyjE
	q3x6VUy7/fwSN7f1OrXR6hdZH5li8ccAboWUZUIaNNV6wzdE2n5Y9Fih+rPDob7eI1HvX51H3yy
	WM/duG781f0jDk/XgEqelqMdCtILq0dF1DrMnqR4dFiDLQfklUMh6l6Xr+L+gG6GeO7WDZUzbDj
	PLNdFi1fWorUYT
X-Gm-Gg: AZFdTZebNIcIDALQywyVdC9eq3w35ozU24lvd3lPcow6/IJTjI52u8nbw9RvoO0OhZt
	lyk7DyEsUTt77BONqKHWd5fw3TdPPr2XwYEOMaQRxbrN4R0S3+w8UjF2/TrjnMkGYYLkZJDTeCf
	0Av4wvxGWB0I1umcP6tRno6DrhvRNMbrMT3kx+Cbzbze7/6N/o9WdMcNlLpQ4X8/lufrI6cVp6R
	zqCiqECdzqSn66wbXpbEorqJT8/AVXZ2NwFh0cAZudbi+uiOzcM0d9NuyPZaGujTqmKFnbmtkwb
	UOdXknzZg7ao6YJ+6i7b6x7wIrAyEItohRXq4mFnJrSy5GboY4WK0mP6faBCZEYoMObZCLU0KPu
	TCXtyoPrTKMxuV5TzllD54Qvv0snWuyvKN9HMFyw+sqUS/O2llci7hwIBBngMJAtXbS8BGxNP/M
	GiDNSanRI9QXSidAdJsNq+Py7vbSEEeNes6bY=
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr1309316a91.12.1795145287562;
        Thu, 19 Nov 2026 19:28:07 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr1309278a91.12.1795145286997;
        Thu, 19 Nov 2026 19:28:06 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:06 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:22 +0800
Subject: [PATCH v24 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-3-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=4632;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/q3hbenfKTr48S8hdFy6BvVzZpTiff3UFj41MW4quZo=;
 b=2snsCrbr5ig562qt2nrm4F1CzkE9z8o+PNcmagxqr39xyOfSXGpqg1f2NCVaTJLHlq/eAWlUL
 tL1paZ1DM7CCpeXMEveFSPZpT8TiCLqVVInmWYXsf/8TP0oZMfTR8LF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX7YpXEAJZd6BG
 F2z6wrPlter+YzGsUJ5vc2mypQgRZXDA6nz/4zVAjOH32Pjz/NSfapV8b88ccoyeuYrktqD6F85
 IyPKZy6Jcl6UWePatStaNCEk4yb1gDo=
X-Proofpoint-GUID: gWLZIUonirEUq2K-TeTSEtIO9b1qu-D5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX/i2ijoO9Ds6D
 TiuYORnRO+xuawJC+Q1GK0ROb26+cqlbX2I9wGOuSz287GrsTU9g1zwN4WwHtP34cVy1DQ5vHr+
 04VaamyOiAQDg89F8wW7iNQUFZIlO/d8/vQy3kMmig5DICgNR0WFbs9H+ejskPwFkpoJRvnho2/
 O+yCr+A7cVeAXxp2wWgk6scV4CcoevSPgWqyr6jjrw+FrcdPhFZ3l4Fvl6KPzQyD+4YdbB9q7Kx
 WY81ULZb8yvXCaOe7BkNizzUUv32Ytd1QgP6Gz25JH8yNPpgizgeYFWJn6ZaEaJeZVifq3ek3kH
 0eLNAtsmYYJKiJHxxqEv/yJAV8f2yAGFdZ+yGZOFaISnoFFmvf8XTsv8bxVyWubv4iqXaWR1wdu
 BpKU3ZoK6KV5wDSGbw6YZPpKuByYcmi2ecrOHxuEHITegAXktg+pbdrOZGUs8IEVNCkA3P2LEyF
 rwSmlKS/6FG/X3IOcaw==
X-Proofpoint-ORIG-GUID: gWLZIUonirEUq2K-TeTSEtIO9b1qu-D5
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6affbe48 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=z-iXM9TJyjA7tvrExkUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_192808_792144_F3FA975F 
X-CRM114-Status: GOOD (  27.08  )
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

Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
etr_buf_list without disabling the sink. It returns the node of the
switched out etr_buf, so its synced data can be read while the ETR keeps
tracing into the new one.

Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
done in one critical section. Otherwise tmc_disable_etr_sink() can run
in between and leave drvdata->etr_buf out of sync with the hardware.
Provide the sequence as a TMC helper, so callers don't need to know
about the locking of the ETR state.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 03eead4176d2..ba6a686828d7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode, there is no free buffer, or the ETR fails to restart. The ETR is
+ * left untouched in the first two cases. If the ETR fails to restart, the
+ * switched out buffer is kept as the current one.
+ */
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		goto out;
+
+	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf)
+			curr_node = nd;
+		else if (!picked_node && nd->free && !nd->reading)
+			picked_node = nd;
+	}
+
+	if (!curr_node || !picked_node) {
+		curr_node = NULL;
+		goto out;
+	}
+
+	__tmc_etr_disable_hw(drvdata);
+
+	/* The switched out buffer is free again once it has been read */
+	curr_node->free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	if (__tmc_etr_enable_hw(drvdata)) {
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
+		/*
+		 * The ETR is not programmed with the picked buffer, and it may
+		 * retain the pointers of the switched out one. Keep using the
+		 * switched out buffer, so a later sync matches the hardware.
+		 */
+		picked_node->free = true;
+		curr_node->free = false;
+		curr_node->reading = false;
+		drvdata->sysfs_buf = curr_node->sysfs_buf;
+		drvdata->etr_buf = curr_node->sysfs_buf;
+		curr_node = NULL;
+	}
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return curr_node;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index ff2dbd85415e..917f88ccc00c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -467,5 +470,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1


