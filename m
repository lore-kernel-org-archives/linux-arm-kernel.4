Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBC2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0gPWyHeA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbaz58si;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cz+bFSln
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=0gPWyHeAc6+4w2
	B87SgIf8dEL6IS3MTF25QW174EKOV0KDgmO/7RH/V34Wn0f2YjnbBSwjfwjIV85wsKrhT/yNepuj5
	Ky+SrCk0/DFf10oE4a/9XoIVvv/sCeBuxFPHKoeSSK0pmRk08UKAlqILJlpvP0IZeNqd8EpDq2XXo
	enuVNuc53RgNcUrofDCzrP4qJcYHeIdxqatvWPWnAOVUPUfXFxmPYZfe+rlqkhhg2ZkQdmT59/pAh
	B2xjBrj26cFlo+F03LdxmyYJaX8YmjJtyutsyDCESQeFsSvlCcGpNVClBLEgGKzIKxvN0MryDYOQ/
	BKkOdCeGTgDhi4TvVkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcR9-00000002Gk4-2pbW;
	Tue, 10 Nov 2026 03:22:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcR7-00000002GjC-0R5x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:22:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jKB01514170
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=Cbaz58sibwWzB0b1
	DNPpR+nVrWn/Ft6CSpW8EdtDjOw51AeZKZdb3xxiO/rKgWhmSQWg/+6B6JLvAKTE
	44K4Qr3b7gO32xf+a6jNs3RVPt0MRA24MbnEtLlhxDrOt4R8ej7pSW2AD9q9ZfjI
	AADbCK7GgTl43gWxRJRwqqMbdjVjBCndjjzwyRPP6pmQMkjF6Ux4YFdlwj1JFFN4
	Tyq/XJKn1y+BjkpITIhdhZQz48OPC/o1gK0u+ggse6RkV6+MbiQheyAWgc1FTzUC
	RrGSJRFMTkd4DPdXrB/aZ39AXsnZDrzTNEXR8MJsLMMsDbq21geBJtVOYyiUCaB8
	RMikJQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydkb9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:22:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed077a15c3so15886135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280935; x=1794885735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=Cz+bFSlnKlJp/39EmHJNsv/gN6L1HJ9qr8DtTdVdbOKAoYvGN/d2U6KgY7ipugJTjs
         XzHF61SaipX8L88KjLV/s6P3RwOViGfRrpew0RmI1oQqWYl26khzdvkJQ/srQJT5o6vV
         QXE4DdaZqKVekV9MjSpgSBlAesXmbxUL349zpfdEb+gbps6iqSF615rJ0+TAX4oEcZcY
         aAe+8WKGekrKBoBYbTfJrf+i1dphssR2aJgbaBAdu64Auf9Svm842dbME6lzxBIg0V5n
         MISUCJYNW4QbzVx+RUX1jVse4K6BJyD5EDz1dmVQQgmjhwPtP4ulrckBdzHlHeToKCne
         Tw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280935; x=1794885735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=1Qg3F0sqtJKFKWrSuwSdMzfsVX1S9GFEL20InktTRUt864OpM6KlVKGE90q48FEx7J
         aWdRxfHqIxrEKc5sv2lM6T4stEb4EoSIA9EJXm/seyRTWWY/dIoiqHqS98Rzs0Eksk4M
         O9+FdoiF6ZTpLIM94DYG031uO88BTdGTN7XU43ZdxFaL6gGw+lK15pUqUnv+u9xwgPhl
         1BELkKuzLGLaOKiaoxCl81ipmep/VQ7/CJoWCEpF3qKFjvcf5ka2fy3lHQ+LsSYK3lz0
         ktvwV+vmq/AMXUp62zzLHuVedJcLrMvtAHi8iQS62Kq3aZWi/RPLdfToNCAi1uLw6Oeh
         uKsA==
X-Forwarded-Encrypted: i=1; AL+hErGNdQUdWGf3vejbGFwJnByLSvoPCSx0TYrSrOwXclaX28E86YTmG5fewwd1Kxn9xxmGMLZfmBCiP2hhPr4zTpnv@lists.infradead.org
X-Gm-Message-State: APuU4Z9I2uZhT4zfrDF5JvKGg9odPiAFultLIGd0NdUXJ294puTWIy7K
	qOQOJJocWVKczGkcXzlENEnTp8/uRZJTDNLXR4QOQ2WPDFN2dIdZlsOxEcWwLkeTq2cy7vPWUlC
	54cPZpIzDLw3WiW8DW42dVxGQNwq2hrFeREG2FyPU/XZyarDhLnDY0f8hVYsSrxAvKaKqc5uKdw
	CDYg==
X-Gm-Gg: AYBFou1Dx8Im8iOhjq5bn87Cup1c0eAHpIiJsuCZ34LXZAqhSN4iqmlsFZXFhuZ4H9m
	dyLUpDmD5/H9B01aLYJx5wGD9A1+Pf3h22pQVY1yfHbNDOhJAebXBu4bgfB9GuQiFZEyc0jL/+6
	aHNyCs9rFsAZlql7l68ccArxhjEXd5hC6TE0H0xVyK5Bmfmd2yi3xadkNbMhagNmDmcnFDvDzqb
	s/HK3V/ymSHfHe1nPfV0s53aEwyrkd0oKiyl/4bBYNoO/sujiQ3H6lpEOe40anbViyJzgIhba8E
	WlaThNz+8/Ig6P9NyDQpEWVZN0qrKl1rLK/eyQCFLPYIDwWNc3fbom5V642b+j4AwNPo5MPVMms
	Kg9DAHmO8nwCPAL2LEiN8ngkgMl7CIEMHxI1zhTnj8uhoa5xnJVswZvctvmNvoKqnDnTcSl8HyT
	ARY8FJCirDK2pdDQ9xzA1Vnvvtm9rvCeW1RGXr
X-Received: by 2002:a17:90b:224f:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b166d0512cmr1671703a91.41.1794280934776;
        Mon, 09 Nov 2026 19:22:14 -0800 (PST)
X-Received: by 2002:a17:90b:224f:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b166d0512cmr1671676a91.41.1794280934315;
        Mon, 09 Nov 2026 19:22:14 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:13 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:23 +0800
Subject: [PATCH v22 1/8] coresight: core: refactor ctcu_get_active_port and
 make it generic
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-1-05d48c0eb110@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280921; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=f8pPXp/NPBBf5arnW7j1D7MGNcEC1eM9jlHACtmmEjygK2LstAzouhm035tQzUlqqjXVnDHmY
 b3+9dIR3KzYC8O8lXd271su0g5mYtW91OCUj4q9M46oxk+UYGuVE43H
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXw5i+1QSpsIr8
 atHHnS77fiFoAWxE8RYb9xla4RPhWxwUPdJZ2CD72WopCYwlkbi39l7FtWwx26DjnD7Icmo+R+z
 e9KdsmsctXrCD+vKyLXuhjkYGmsHeBE=
X-Proofpoint-GUID: DBXdifIk4DRMOUvFRgUTkaWckpgfveGe
X-Proofpoint-ORIG-GUID: DBXdifIk4DRMOUvFRgUTkaWckpgfveGe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX1hNHatQWDH6r
 4mwlLco6ZJntoRvtPX5u7Ttb0dSWGIErOgytx6BB3Wzk3lToPmV7K9RKc1vwdRoF3KrhZzgnJs5
 Y3HGcq7gLbWe26hgoKm3GcZqa1t/hZ7yua8D5Q8K6VwPyAe06TpgDt05IE5WI7IvVYuCwhimC4i
 Jgre/UgfwldPu8fTCcZbC2pCQ8lie5ZONXzD78kveEi8+u5c/iuZf/E87tSH4qAPx3rbYYeaOLt
 eFPfVekukbfouleQUfxAH3JoT0A2TsFXbi53VH34K/vz1dyw5v9EBJt4QDm/Tvc6cxmS7I3TgFb
 aTo+0PR637FRJnwALGhjy26JXvLLYjWhCtaW6xdEH8LkRMDWvlqfTYoat/YEEUpFyHTaVMWmVTT
 0VP79CZre+URVlQzWYSXe80O/JDmBlwjWQbiqA7oklZf/er93UhbVN6MRXuV3jeb+fFLBmKpSM2
 6Dpurg7rMBweTcCPl8w==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af28de7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_192217_272774_4208F196 
X-CRM114-Status: GOOD (  23.18  )
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

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 21 ++----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..32e8b3e51519 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..739105acb0a1 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,8 +128,8 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
-	if (port_num < 0)
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0 || port_num >= ETR_MAX_NUM)
 		return -EINVAL;
 
 	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


