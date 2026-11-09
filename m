Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D51C606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MMbq5YDD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GKXgB7yE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRzpxp/N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=; b=MMbq5YDDvEln81
	z0U1Tu0GsF5co4m4v7+dq+6ajhr9TY64toQ6IesIo5M9YPOAEEvqhjMUM2BVrywLSmTzhXE9Z6jCs
	Q0R6ebdCmX39/IFJNZeaqTauwy6sLSEiwZFn3aangmxX1n9ldByQe+oGAOMPMYNtRBd5yFFgvCQIz
	8fAlmIwC+FKBS1yv2f9JjELZA9CHAXN5YJqCNm+l9TNxP9vz1lBfCfCiyyLSMAWIFknwU8TeM5z7x
	+PqTwZEq7+0NUdmuY27uGa7m7Bpzxz2XLG4XO+5uVVNa2CakNlswJjVuXso5Jlkx948URh4+FeBJX
	nomVHrypveU9zPmZnR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMIP-00000000MZv-1pDO;
	Mon, 09 Nov 2026 10:08:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMII-00000000MUw-2IS5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:08:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v7TC562030
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 10:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=; b=GKXgB7yE4Mv1oFqh
	ygUrAW9IFXSMTPxl6YO+3eOOH0fhJAjY2hxHMaWH2FRvPjt8nsMCa84XY9v4WXaZ
	9EYp/3/XAsDP9/0RVEYAv0+Hs+rcTiM9eOouFGiH+VUUSPGh3prb7aZTwxOWNFd6
	AlGpj8YGcp2FJ7uEPL3Upt6vwpa0obnzZ0dOISjdmvvAapVDIVn/aRv5UinkfnB/
	u218ecYj2GtQCrJWBayTNGT/3bri9VotkQE3/hfV8UadgJM9DJMX2HHPSfc98zYw
	3RoCav7d40LsJJq3L7eXccu/7K2GYC7eaXtq9Snh/n1zKo0Ray9aOwHvUs/o1eF1
	1Zsv5A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdvxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 10:08:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so469831a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218884; x=1794823684; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
        b=SRzpxp/NwUZC7gv/1/2yCaZW0o28rC18ra0aD8r6g0/2yewPIMOjNHTqCwnatJurfZ
         ZXrCElYHZ7x3jdnQ+iRFmnigODkfJ3I70LLjvpmeVx9E+Yy3JhordRsoGC2dlRHrgMJT
         vlAQhXCUz12B6Xb1wZqoyAGa2Gi2Ystl8H61wmKev39he4zZJWMxDO2dtNpatdAvkmCR
         5Bfrb51qWaoOfHq/M82bQxF2ccJfSkGkRlyF03CYG2eQIpUB0gFbz3BGXKcq9WLy5yTx
         jllS8gaJDkOKWORGYiz2SSzdyoWKtgQeCxed5cqpXLmbvXz/mfYEfDo/DrEQ/2LiJhyp
         kuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218884; x=1794823684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
        b=mbV2c5Ml2ZWiE85WIOp+kkt6eXJBsrZJusLfLxQ27kJi83RTdwYAgvs6qOWc9jBiz+
         p3bhEAmboOKyvy9hblLVLs1hlITeMM7/VGraHdnb5qIhPdhN+NURh2nNKQJ4trB+JAOm
         CMCC2meW5BgXjhzp5nic6IJ+yTPDtTLX7f3Jc+eTi0O+4CEk00wPXMZGBfxxvuIBXVLo
         gZd3VSigS2MSURaqwI9q7Px4mWvIHGpWPa99+yAzmlZqFTMxrNJ7kjUFtGqzUHZTrS6n
         aDF2YRxnH7N4Y/UIo1FtrZaX5gZnZs6G85bCnT2uEkXMmRhpnIG5qcGvecp7/GLoMxCL
         R2/g==
X-Forwarded-Encrypted: i=1; AL+hErGJJhZUiHd8XfjRDj85ZzYvPA6PJuXtz7RAuh+g/2xfDmqAZTxz8SK3Xg72aOXl2SX6xfb8Isq4qPA/RJuH0mvt@lists.infradead.org
X-Gm-Message-State: APuU4Z9CLqUEKMvCIu1+06PH8nMCbRU093PivPYEkOZGiDXBzwuYKRJO
	szLVhV3awKJaYXWv7NYELM/yK7XdbNVZoTl9jMU0bATkUL4QaNCSGfE7WtA0hc3nYcGapUN7qxl
	hBGM3GXBvTa8BTvTfO97roF+bFxks0Zlesw+2EQU8xLbXaKBCRBHGl2A/lpqvAPyiODjXPOi/nk
	1biw==
X-Gm-Gg: AYBFou0ZsXB9eZ0cpn2vkyGBV1OLO4ks+AVPC7eEGgwBY2zZ59jOQAUqh702n/rhISs
	K5A6ME9WhXmzxRTSdtUZkpsS9+eH3Kp1qrxntdLhyH5vXhNSxapVIQOL6RmV96c7p5OtIz+afPY
	utCoWkQGohs6o2BxvKoLtOfpbD/zY2EAVBqlBVflAkoHGyluVJ3TAQS9+hDh+A7SdD20q/6qAPu
	s0eFenhraTydknWwBRunQYSnC4dZjYQQTxp9nvurYkKZgQHwvoHEENlF337s8PP81WmSH4t1e3F
	FulWvvvIgjiiqhoLgctP29Fjm1qd8zgTPhm0sMbWby0INKtCTUhROfI3rzdZCOSW3mkTqYWwBTU
	puGISkfdVMml5/QRk+5hEKrWSB88caEXNSOfsZrLQqcu+yWTwzPz0eW3h95XCe2MlEidj1x3dOO
	444SJJ9TxcxBEzIDezYR9EldqoxXeP
X-Received: by 2002:a17:90b:54ce:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3b12d57c488mr3115057a91.44.1794218884290;
        Mon, 09 Nov 2026 02:08:04 -0800 (PST)
X-Received: by 2002:a17:90b:54ce:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3b12d57c488mr3114999a91.44.1794218883733;
        Mon, 09 Nov 2026 02:08:03 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:08:02 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:38 +0800
Subject: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on
 DT platforms
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218819; l=4036;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=SVcR+hwi7W8WiyGR/9ZEtnITz44WeNpESQ+Zf8I0XbE=;
 b=JjDWgv0VXlw0PJfE0V93nb8oTc37DPPbjQTjoe3GHNpeRdv9e8sfXmLcZGGjGPiF9B66D54dx
 GKk8AyJt6vPAL351yRRkOtyss73IJPxqfW8q0RujnUA70L6H2N0pH+l
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: SeOymoEkHFvCA1Kbeb6u5ohwhk_7tvkA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX2vqHfRMDcqhJ
 gwDe/5lEXOgUWLHrCKemzU6Jeze36KVl2zgG7NAbW4ScLVfoHb5r/OaN6tQHkr88UlnM0Wed2AW
 qiJ/BtRDz0K+1OQ3fI5yDXcSJqpasFwMuZ3gD3Kdvy1b8UxkvkjB5ZT7KKz1pDaPBr3Q4GDQ+C3
 WDiMh3tv6gqmwJItIB/XGpqngkQjBZRkFtyjFajPApo38yktJOIfOBjK76uDQmHKZJOgrbaNqrP
 iKI9aG5Mqs3ITPW2xj1wGgYEgorjjQEiZx9bkfukt7JrdTZWI0JoQpfZpL7aoDNtZmeby6zVT7y
 dTVi+J+IONhMRj0i+WBRoKX+4bexKSUlUl2BxpxsNvwFkmVfWN+Yoni+aRgJrazZH4w7L8Fi8qZ
 GJpYYafE2iiSgbYaAijGw9x0lEQ52hJ/+bTTmGX+OlOlSW1IdAY1nxmAfIixGB6punB3blR7bWV
 je0HNrbK+gMSlN/TnDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX3mu3lH095oIa
 GbIXZPOeHajX/599LzBdngfD5W8BvgXcncjl2uz6w4dHEhBZmWH3P4ngJ4DxD4Xl0wlND/S5bZk
 l8py9yfjKt4GrwdhTRosP1eujkuKoCw=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af19b85 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YM9RNYZJZtWq5EK5GGEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: SeOymoEkHFvCA1Kbeb6u5ohwhk_7tvkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_020806_713812_85CF912A 
X-CRM114-Status: GOOD (  21.14  )
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

From: Shanker Donthineni <sdonthineni@nvidia.com>

The MPAM DT path only handles cache MSCs. Memory-controller MSCs
cannot be probed yet.

Add support to discover memory-controller MSCs from the device tree:
derive the component id from the NUMA node and create a 'memory' class
RIS, and treat a memory parent as accessible from all CPUs.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: split out of a bigger patch, added affinity piece ]
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context offset conflicts; use u32 instead of unsigned long
  for component_id and compare against ~0U; remove the unused memory
  node reference in the arm,mpam-memory-controller-msc path ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 54 ++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 78caa8ae1349..e0ac6ef83d6e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -365,10 +365,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 				  u8 ris_idx)
 {
 	int err = 0;
-	u32 level = 0;
-	u32 cache_id;
+	u32 class_id = 0;
+	u32 component_id = 0;
 	struct device *dev = &msc->pdev->dev;
+	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
 	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *memory __free(device_node) = NULL;
 	struct device_node *parent __free(device_node) = of_get_parent(np);
 
 	if (of_device_is_compatible(np, "arm,mpam-cache")) {
@@ -377,27 +379,47 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 			dev_err_once(dev, "Failed to read phandle\n");
 			return -EINVAL;
 		}
+		type = MPAM_CLASS_CACHE;
+
 	} else if (of_device_is_compatible(parent, "cache")) {
 		cache = of_node_get(parent);
+		type = MPAM_CLASS_CACHE;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
+		memory = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!memory) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+		type = MPAM_CLASS_MEMORY;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
+		type = MPAM_CLASS_MEMORY;
 	} else {
-		/* For now, only caches are supported */
-		cache = NULL;
-		return err;
-	}
-
-	err = of_property_read_u32(cache, "cache-level", &level);
-	if (err) {
-		dev_err_once(dev, "Failed to read cache-level\n");
+		/*
+		 * For now, only caches and memory controllers are
+		 * supported.
+		 */
 		return err;
 	}
 
-	cache_id = cache_of_calculate_id(cache);
-	if (cache_id == ~0U) {
-		dev_err_once(dev, "Failed to calculate cache-id\n");
-		return -ENOENT;
+	/* Determine the class and component ids, based on type. */
+	if (type == MPAM_CLASS_CACHE) {
+		err = of_property_read_u32(cache, "cache-level", &class_id);
+		if (err) {
+			dev_err_once(dev, "Failed to read cache-level\n");
+			return err;
+		}
+		component_id = cache_of_calculate_id(cache);
+		if (component_id == ~0U) {
+			dev_err_once(dev, "Failed to calculate cache-id\n");
+			return -ENOENT;
+		}
+	} else if (type == MPAM_CLASS_MEMORY) {
+		err = of_node_to_nid(np);
+		component_id = (err == NUMA_NO_NODE) ? 0 : err;
+		class_id = MPAM_CLASS_ID_DEFAULT;
 	}
 
-	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
 }
 
 static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
@@ -2574,6 +2596,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 	} else {
 		if (of_device_is_compatible(parent, "cache"))
 			get_cpumask_from_cache(parent, &msc->accessibility);
+		else if (of_device_is_compatible(parent, "memory"))
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
 		else
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
 	}

-- 
2.34.1


