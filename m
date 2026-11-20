Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A775606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zX/bxERP;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX/6VN4e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMqH0AEm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=zX/bxERPUfFSct
	TaLS9tE9CdEP5Q9YRyh15zhxZzuTmXMjDpkhldPAN3KhlRkN8wbpF3Cuzw+GRwIMWPa5O0UEzq1xE
	/oZRU1MoSlBzBRoVJ2c1zaizJWlEh0QmT6c5Xw9j1NLpWLml5UzwEPF6AZN2xaM72yBby/B7p8jLB
	I5t9e6NP5MekwMDk7pQBuWbDkWGIXz5cPjZtAmwaU8tG2+LBgQobqTcvU6VzJgRnzqlyf0ECP1AqM
	g0SAHbqmcQbUaHcauMIkPf0fA4XWGxHC2QhnI9s6J0D+PKHonfuz5Q1M4bK/UhabQ+gngleSkW4en
	mKo40bYXy4bzHGslZSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFIk-0000000Dxpd-1Evm;
	Fri, 20 Nov 2026 03:28:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFIZ-0000000Dxiq-1fnV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:28:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0G4lP137612
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=KX/6VN4e3XhOxj1t
	6Exq2PHkGZ8+mGH5fZ8ShJNY6GeoDY+aDNcg5WEpZ+aP2/p+d2rU/nG0W/j3HP+k
	VPDX96mFhqiGiAXx0IkaoMIfcXDt8wNPuBiLbQN4TXc5mkg7D1jEZ7J9pUJsFQjX
	1zYpOfO/PaMbQ/zKIdUmWMLQo8mdMFj/z/kw292lMSUkZy14xRsPV0uo0nYFuSsi
	/NpyRC3CMfe/UbosFE27RrTq+hlNSXiNb7mitIszSUscrbJzPMugPtLlzqWvTfSu
	kkTcigOgiW/SLtnA3y0pyNRCpKxVYACD8EztE43ltbUyZVOl7e7etCrcTH1bakQZ
	WpBGBA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j20guc1vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:28:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cde00369ef5so330122a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 19:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145305; x=1795750105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=jMqH0AEmVWX3FgCjUVDaabZYblGnJVDaK4Kksm6eMLKa99AotLgEaUS2BnfFyZA3SJ
         34lPl8ISLq/4SZjf+ElNt4+3cDzk0yPWYxogqzQt9LhmxYyuY28+irUb6NE1Kg08k4gf
         qIDnzP1EOXT9VniYA+IrAxoKwBx094nTJbxeRz5+vWL7ja/7ixq573AsJP1S+RmR5y/M
         pBhxM59kBuJ8OLUYV4NBMFaZIguL5XWOmuTEGYmw9RWyn2aIqOlOBOnJgLsHQslU7nkB
         NehqTyVBwinOMa9WrFJLObtVi+diAYhOS7CqhLAJkKQJC6Zy54lVbYqNs0EnDO3WLcTF
         V48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145305; x=1795750105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=RIFUjRWnTkICJh1K+EBywIgqdRyW48J9YCDuffl79KxyvvIC88G3qInTN9JAXj6C8v
         iEXN1njzfegGpV9MVg9K8ksDST3yZ2VkC7K1PpT+Te0muk2A97U3t+l7nkEP3PsY81Lr
         2TxXKexD18ubXnxrAO2npuXwZcxh40xA/DcesWMS6kOA7eBLI3rusma0tCLb+Vvb0Geo
         vkGy7NUAQtqHgB1gskHj9R0lCQ3ACLHl+XUnOQstH8lJNKMvFI/MaKy1ETJGRpptFSk6
         Ar+W0VaJLhVq96wIKvW6JpC72eey4s2TK1tmnIPA3DrdYeZYAiG1wYwETZ1lO6J7W6pg
         LYtA==
X-Forwarded-Encrypted: i=1; AL+hErHmNKue1RgEHm07xgjXPGINM0xaPEdMu+n34WgO/Y1oj1CFRmEQ4ihT3qQND20v4Kuyxs+UGkIe7qiz8mV5a/Mu@lists.infradead.org
X-Gm-Message-State: APuU4Z9n7kJwowdgNXPXE0A7jH+8Cmrq64RoSRX0xIcYfGiH3OCAzy3j
	377a2YxdRLyJj8JSGsYY1kZLIitEYj1Tes42LfV3QNiKJ5Ou+PDKm6RqaZc9fLbXYqF9JK+7P3M
	U6C+TbfSSu99jPKo/J842sFU+o6jY60Qax3p44fAKPiknA2dSO8J16CHK6/R4t6U5LB16poCqHn
	VViA==
X-Gm-Gg: AZFdTZfNFXc59cOVex+eU7U5YDIwJp6GhDG8rx2pbBNJd3lWoQNA8knbBoB5Bn3iuiL
	vXOgGefVhvA5i/C0RxAJ0+oIdYKGo3iH2BiybxmNOgzWTn8nktd0R/RdtlGs29FRYFbHsEZZ2AP
	popDPuTG4u6Z16Hl1mC2MHR44kDRkp+TmVE0/VngAI/s5PYYBYCbkN6wEmW4bK3JiHwOP+S6mNV
	roH+HR5+DC6kx2ySsBLnskpswXp5F8u2Ftrx5vcl7wPmZRw3PRvl4CTzVosTU+zAWmF1DBxvIpu
	MYrdw7b8XXdzcowuibQSNP9QlGyGxgfHxe2IUGQTtS3uNgte4kYfynxSqoeRWfNbQRBi1CW1b0N
	qshS/YIwgH+kspsLK6yPsABmYBj2BCYkAu6WTd+md8YYRvTipLFgzr5Ean5F1xfxd5uXCm3YnT3
	IdAMpJq21bpmlO+WdOWEjGFB2kG9pCsEQmvvA=
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr1394903a91.19.1795145305141;
        Thu, 19 Nov 2026 19:28:25 -0800 (PST)
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr1394878a91.19.1795145304657;
        Thu, 19 Nov 2026 19:28:24 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:24 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:25 +0800
Subject: [PATCH v24 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-6-2d792c6b4819@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=R7aEuV4YZMkjdPvmUa9VoVKl7860e56ZDBGW7Tb8Eh2NeYdpDO9Vcv99ysIIYQzMJRHR/Bfft
 ovKS5/UvrrECKcu0MVYi0aYu3KSV9DDtSTIc7b96Yz+Pp6AXsL37ssK
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX+N1q0UBXeSM8
 JLG31RuUmd3b5HnI4nM1oGobnbgXHzpL1IrjwKTJFl7as8vDsYERaNSR+Rc6sxoxzTEvp/TD0qG
 kcJoCLrGkMd48cJZoK2tm0ONxickj2o=
X-Proofpoint-ORIG-GUID: whOXaN7f_70rbfCvIIUPYUJE-JCmepEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX5itfBh7tGZ/J
 O3WhY+8fmNouMVhOA35WTKfk/iUN1BUl6R57rVvMU3tyzcY5MkdMcQjf8XsyBU3ufAeYBDja45x
 uWsDSCTYQSP5cewsIiPtFVI0UW1JYJzNgZgKkBmBv5Yae3QfmMSSGYrnm9qI1A8IVtsIb2qzscg
 oCMo4TFyYZBwLTu7NlyXVEKZt4iBxX8C08BSYFq40ZsYGqm3PQaN6YvQheKH/oDbOH09Aeumki5
 1Cc/D0f3gO7hVvIdS7n/ae45KhDIZ1zns7D+WuCks9xtoT3ZqPPRfN8qxRTrbP6C/78tAMmyMgA
 iJUJsjW6LN+oyuMQ9ZO3nS8S5FeylOY06LlWQ/CT5LVGE3ZaAJFsE+UsHOaCmUUNZ3wIpIgeGsH
 L1ptpbgHO4jvfEbIYXtmDrlqP1KzlaMHek3h0pE2odx+Xgr7+tpnD/XKicbhLGmhqlYMwm5gJIS
 9mcXYcIBjgsVLpWfBiQ==
X-Proofpoint-GUID: whOXaN7f_70rbfCvIIUPYUJE-JCmepEi
X-Authority-Analysis: v=2.4 cv=XutvqlF9 c=1 sm=1 tr=0 ts=6affbe5a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_192827_583890_17778AC9 
X-CRM114-Status: GOOD (  13.56  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


