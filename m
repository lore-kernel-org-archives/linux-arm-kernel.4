Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79099606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vpgoLTUb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SehWkOYm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTmFxeba
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=; b=vpgoLTUbJeVRs9
	0agOdWNyFEtSMz0hGu7UoGJMlyjy0K8ZvYVdBmtqI0xvkfgJ7kUTbnfitxTF3zfsHU3yHcA/c5WXG
	YUPALcd3ZHEEMEeq8D7tvm674+eDpjOh8SPKae4OY0eZenmqk/7qhxrh8RLOGu9EN1HJ1YdJJcCvc
	QAP0ni0wxoKv0gSb89qa3g4LzpjEmDjmaKEHViDgV926wgYbMdigtMwHQgzdjNC093hkUuNRVT3Ej
	+cwF5fFu21Es0aZdNVH+QaAzg/pzv0hPMGvpu2/NrCDre5U3yZBlkjaUuLEsslcM7/6mM3ENNxfGk
	3U2a9094N88laf8bHtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadK-000000085SB-1XDC;
	Wed, 18 Nov 2026 08:03:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadH-000000085QJ-20DU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:03:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2WPQu4060532
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=; b=SehWkOYmoajt8tEw
	4veZXGFfEZMpD+ItYPe41I4Fbc4E2QyfIfSZfedALy2uhobckkKevMcFExwRS7iH
	bJ1OxNFkMsNtteu76odrZK7K35E9J4G3OyhSbROpYqwWIwbdTSzgzmRpS2xizOHK
	v7CCIA/CjOWvgVjCEaBMB7JSr/us/l3/1H7RtiHcPbE2vZc1G/TF0noNfM6uPi9u
	sgTGRijbIyMvAVx4J53DIkOsUAGQ1Z562A1eHAmk+vAxRRVbWq0Oe6TbxH/QyIgn
	Ao8Rcaf9PXFlOzZ2WH+kyvfYoJ/9ruDiH7NbGVh3/HXgyr4vAEO2R3rcs8bw/oZo
	5yXx/A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchya0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:03:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so551010a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988985; x=1795593785; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
        b=NTmFxebaR3tLtOBT9rbYYEe+Rh1BXGkvnQ5+N9nL6j0Kek/mj/THLxlInIvNpZMXfD
         CaOfrYfJ0QKeK9gTlCFUCEypkZAHGHsZb+NfXeTUTCvEdm1z7kMUbP+aiZ3Eaj4JWDJz
         TNzXh2mCbxifKiiI+AfP9raG+nGEZvyW9x3de3jUI4FXp8SU3AEQjrLsASkdKMOIQj4W
         Vl2V/kAUkl0Kwe4Oifixa9oY0z8wmz90PeauU6syBnEegkz/WJ4yaew+THVWWFeMQkuW
         zqHb9mYoRZ1sXv/MZQN7+YvuLgDjr701DO3qe/E4MtUWnJEyX9VxUEvwEUC0Fcg1C0Ez
         KW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988985; x=1795593785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
        b=Cw/zHJDij+q15tBo8LuMlro5O6YTlHp+CrEcXF/e6dHhOxYfud/UAdd3oSwQ4PiYzj
         gTIYPHbFSj3utmlbP8bn2JXs40BMCxukuwm13vZnTX9t1kTh9ERY9aVczHbowoHu2xXe
         UtHZj/5rSpiVCLQPXwVvMAHwYOwv7i5eyaQBG5COcBWEGxD3fWloab8Y9obCxfhf4lIy
         oe6MaXZl3K7r7O+EPlWmhtPx4YavukxpS0DOzW8srjK0YbD+zy5CeHITRQeGpFG3zKNW
         oXTDJEcpiuanNcXFbTLyJjPmxqSvrzAVCy4e7Sd3JoKZ08lAUd5CKP7FrqCmC2WmHPIt
         arJQ==
X-Forwarded-Encrypted: i=1; AL+hErFGljEF871BrHfwKngDcwr/tE/lPgn3+ywON1dyKYInMuf5WC+cBa10aunAfxS44F34qJicF/qOm3Fpq9fi5v0T@lists.infradead.org
X-Gm-Message-State: APuU4Z+HTr5FbyN2D0NwKSOuwjrM+NzNNhGUQPP2+/ylktIjS5mwd0RK
	23BiYVqZdW6+aiUanFCrQ8Nr6KMMMJyttSMTPQwzBV/TsxWWX1UYcvkqLjWk1oRKE71Fs2nEIZw
	0p/NUUOpM0Kj69dirhvgb3bzM8EfLixml9hz6pJndrIeuncVDjPCb2Upanj3i5yMiRpgAvdG7cY
	D93A==
X-Gm-Gg: AZFdTZcOU4TYR5Z2AuPbVh387cbMHw/d1wz/lCuVTqSw0Uc9jdoBQSSBAb8U5zxznSS
	9QPPw+XyDbAE4sW5Y0XmF1NV4eIGkS2HC4MzjVZcYa8sLWMktS7SU0FQg2FqXa7BbrH3NzdboB4
	RAT/m0aGJAVfSRHh7c9loDbRCOnLbrWiP10QhzcSC9ZdkeRX9/lwaX16Q32jPB2Xee0UR40R2rc
	ErUEwuWXRo4proW/gsVEbN02/0UPJPDtbI5sVfw6VsvKqG912PdMnLhX62sUSNQSFsXaiMx02iH
	FF5wGJiUku2t6AQKhnKDygirD8JndPQX2kAGlTF5OMGu4nP1kInQMMG3+hdzBEkrygdNDhG3wru
	QVL6hNzhIDzFPCT5sF8ZiCXlTsHX2oEdMrz7Ja2b4M7BuN+cIzFDo2tEIbvhNIdcYJ8nAkSsbGE
	z6yEIWZeGrfgXKTB+7HNMzIHWC44/P7twbJYRp
X-Received: by 2002:a17:90b:3888:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b3d07e3b43mr1977312a91.61.1794988985067;
        Wed, 18 Nov 2026 00:03:05 -0800 (PST)
X-Received: by 2002:a17:90b:3888:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b3d07e3b43mr1977275a91.61.1794988984413;
        Wed, 18 Nov 2026 00:03:04 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:24 +0800
Subject: [PATCH v23 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-3-67fd9db6bc0e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988960; l=4507;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=PnAggtb/hoPMxGkHLkimiPJx33tOJTrsVEFsbWRzHrM=;
 b=kvEbku2KDnvoJLBsObLlNuF1g/Oz7j2QHJyBoax56i1IV6LPPWoPLveh724YxNNEmDFo9Kg+x
 QwGjkAhsSVkCO+wEPUF+4BtDr1nqjHBDAvTRovfhxme0L9Cd/eJgXWV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5bba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TPt5YZYWydgKV8fuSqQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: g71fFxNYSF-ccpwkf2X2kEBJGu8eu3PB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXxA5heLOOxqJq
 ZcagartcVjJcsOVyaKX0fkivdKcp9rygViteKLeDztEQtZD9oK6b4jWibzaWM4un9AM9Lhn14sp
 YqXFVduwRxYYWC3GJM2j8D3ePge5Td4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXx/0JwSHI+7TP
 NUZQyRHIwjsFEz6yFeRIM3ZYQhqdJs+DyBV86XbiYKWyfLT0cQ9xARfVK9pd16wyGVuNr7svKfE
 F0dW+VKQvg822RJlX61e/jsD2yYWMIQ1TZtBFE6aATyq9BUcA46LwcNITyIJt/bZ+1Id1HYoJKE
 jxS6E6XZCCL8Dh6FdHlq4OxyK6QaHh96y41wrCBEK9csZzbALo3Ee2TX6IFq7fN7J0RZ7CYNaMW
 D75eSRazxNKyDyXl7twbfNQ9KoT7kVF206E7Na1MtiyOhYvFnXAFHH1jYDQJQoNeVo8SJ7qcDF+
 v6xU8sJG0IY6cnIbUl5Rf868paKH6RUacCgntn8SbgZ7719qkOfJ9c1DMoCx84oXANBtqRp1tyF
 c3RbrN0giMGqKo+RsVAJV+wSX6F+uVf9rwU/G98K3rZqxmPA6GCElx4O/H+M/uYzcdlKPfYclfp
 SBp4CJM1LSE4K9WxXKQ==
X-Proofpoint-ORIG-GUID: g71fFxNYSF-ccpwkf2X2kEBJGu8eu3PB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_000307_641085_901C198B 
X-CRM114-Status: GOOD (  25.44  )
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
index e9213f456834..5032f5598e15 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode or there is no free buffer. The ETR is left untouched in both
+ * cases.
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
+		else if (!picked_node && nd->is_free && !nd->reading)
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
+	curr_node->is_free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->is_free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	tmc_etr_reset_sysfs_buf(drvdata);
+	if (__tmc_etr_enable_hw(drvdata))
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
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
index 7c604b9f92e5..30b15c38b080 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			is_free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1


