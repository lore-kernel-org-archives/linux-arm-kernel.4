Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D4F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KUUYsqG+;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C7CUUPEI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIWifH/r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=KUUYsqG+Lz0Vfo
	VeXjBeVI/65Ww7XOEr5WMoxU4Uqr4ZYoT7gRVu44uIK9jqKG5D85HdDYjAh7t4MtabQ4VF9G+sj08
	Oru1BfWqqYl4AAIPA2Gb1gb1/Pm2Jks82nRc2GLMJJ10zm2OmL6am2gKyuI5Mki+wVaRipPr8Mman
	SFzKyWTaYPWnlx4Phyp4JHWEzvZJO2WGIpsk7uiDuAnjo432siCahPGY/dQ3JscVXfP0AjfejBowZ
	QI67v5GqOv99iabrb3Y6zhHUokSs0y1Fi3yFFL++6Cd/nd/3g5Fh1OgNXGprU5d6HQHHAdDIzAEQC
	dYcAdYlGKS18BcjLYLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrLM-00000001RT5-3IdX;
	Mon, 16 Nov 2026 07:41:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrLK-00000001RSb-2vsq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:41:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7enu11109781
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=C7CUUPEIpzkmWzJd67yoayePQmQ
	YpDCEcP8KXhTUTSy762GDvDTMugc/2sNZFLaAnRAra2zWfmQgY+BEbobMNnzSWPw
	aEqISYNOhevd75v/gBNiA8IAFQ99Eafty4mT7WAwzx7CulDXLU1yzMAzU0aOyFGO
	TRK3NS99nmhO725wfEgb7or/p9fzCCjV0GbEijrmKpXLKLv76p9dmPj53OgM+/Mc
	HwO5Sozjo5Cv67ELgkWenXvsV6Y3J8tc9TEUHXocHaXGa9UCzb+Wldu6zMJ0s1Y6
	bV2/TJswx9fDRMK39O0ESE8gVSZfFOhrNk1z1Or9iehcaq2ADzQDSTC4GIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc136h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:41:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so2104906eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814893; x=1795419693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=bIWifH/r1t51o5Oqj9LJsrFUXIwenN99R09i9QXPgbH/FqN4Fd6z7N1CSooaomWlcC
         Fwlf4ou/LUixy49azH/ENqQvj44+Qzy11k0Nh/puinquvXj26xAalUvL0HWvxJ9mrNLk
         SwTOsST+yktFkK06QP8dx9tA2jj97wKqqDh9xSg1P4yXgxrXX3kYcNYM1i8/WIAuo6rG
         up06VlsITnobrU4ucVi8PJHRMMuBfgIQZV+84rTJnTEbY81DiQJXp2hJIZT5nFTes/sD
         kly04eoQG0qaEb1XuBFJTnDlw+Uf54mNWIzI8xvZgKMyASoLi3cCu+mxEoUN05o8Z0gt
         kGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814893; x=1795419693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=AUIni0S9V8FTNQxltvTj/ji1eh4HefTWHEPCocmTlAIrLGxB3CWm290QtxQhr92MdL
         DLSqN+w/Jn7Yw2Qj4cSO2jS+X/HlYcsX1eBKsKMk/jp7vf5rFhHTNWP3EsXPUGJCdCXG
         pQSGwsU2/qSOAIksyqTvoE8lNxC4cDyVjfEBesEO0EnVPzkS0MAVKRGuMOYPSdBNJ5r0
         ThTX6CNKC40gvgBZKA276jI2aOvW6Ht9Xi7qeKgspb9nm4JxClZMzSkrM/hBaDmmQuME
         7Et2CQE0Pk37gfO3666HNqvygouEZYq4YAnDMfwr0aXsW4uLNn4FjbJiC3c08YjhNFxa
         fAJg==
X-Forwarded-Encrypted: i=1; AL+hErHA1eLGTTLmFNqCnZH8fiQ3Gq+A3LEieUPZQu4JA7sIVj/PF/mtA2dWJt5GJobvQJsoWENV5yXcUV+NIGbWZ58m@lists.infradead.org
X-Gm-Message-State: APuU4Z/0CT7iJsUQCjUR7jPnBLaGjsueNKFg4yvV7txYI+rbWiQsJ7iE
	kWHSd5R/TKGIDiNdJ7dWrf6PcYqP13oPKaYK4XW4ueP0VzgtLR4Cky+d0nZU0VbKgQ6FK2/hdDB
	VtN+O1el2+dmQKf4icbWS2zPZRalQvyoHlKlmUcSR54OzXaeulZVH9DlgKlg/CSVvATnP50cqnX
	NIyQ==
X-Gm-Gg: AYBFou31eSOOg+d1DO+zyTavrYeJZzyEts07NwMcEE/HZ+6Mtojwcnl+JHpI+wypVZm
	R3NfsGdAEtV7NBd0j3C2fRu6ZaafQdtAHYslXH6Yq3OS+cd6W4BDM/EMpwd29gjLZVRxxj2KRJL
	k2lxlgBnPB2fnjT3mwJ/NM9uNos6Z7CISOWrHlvJbbYFFi4YM2taNg918sWA5ifYteGCtfVtNLJ
	hz7EQBt8a20jGY+BEEvG4IL0EY1JcHXNwQUij7WrmDmJ9pIgq8LNULqnVY8NQiXFJdhMJ4CsjKJ
	Dh6Ed9PXbkZt0+BL4lOk/3eTOIPFdvbDY8v467fzxJ3IMh0vKYHFlVWYT+z1XTWVZReqJqyQOs0
	Y/WAiJoCSEESiqaZLwMXc/Y3XFfNGF/TMfnAqgh/kMGTggsvB3Ce6e0BehFrDW0HyCvJdPpP3bD
	hvQk1Q6BHTI19PatsSOOgwPzUa7TfF4IoS9A==
X-Received: by 2002:a05:693c:87c2:10b0:36c:a3ae:936e with SMTP id 5a478bee46e88-377e093dc83mr12381530eec.5.1794814893287;
        Sun, 15 Nov 2026 23:41:33 -0800 (PST)
X-Received: by 2002:a05:693c:87c2:10b0:36c:a3ae:936e with SMTP id 5a478bee46e88-377e093dc83mr12381500eec.5.1794814892520;
        Sun, 15 Nov 2026 23:41:32 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:32 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v18 1/8] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Mon, 16 Nov 2026 15:41:11 +0800
Message-Id: <20261116074118.822731-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX6n/1k602lEQ2
 MNWl4qTzAzANTJNKLjP+LE4ZMKqyODir5Llvi4m39y+nIQataCJ6+bTCctp4HZ6fLeDAv6FpTIp
 TcVlKR2yA+uAp+mOWMnsh0TNSFZyEcc=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afab3ae cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: mulHPIflmHkn9sFs3tc9V-Y-kRinPJCq
X-Proofpoint-GUID: mulHPIflmHkn9sFs3tc9V-Y-kRinPJCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX80xJI2v1AOlm
 N5pp2pxdhay2dRY+1LuLCvfwyV+ixVVnZXq+gEJw9bp+r2f7UvCgC42baTodub/o6I1tD/Ae1q3
 QqBzOtvNwxWoOkGO6DO30Pq64XSK6UfxL7AH2Dji1Uu58N5ot5ycLLWMhVbwnwRR6cHs8zNNs9r
 ufOyMcoVNMCua+Pj7b11gEu6l/LjMXWsWALeB0ptsXtvj8+8RhDavCMn0BnYxI9WjqKNZegHREV
 7Nq4U98dfdwPSzHUMBeuJ3CjiUHoEyYvbfaHBV9KsAa3ROimZMTl7/zDiOCYcbzoE7T2TLBU4Jh
 BD6LFMIp1V0noUelL2UMPQuG215kGGenzXYsCLhBFSwJEth8u8eNyrcWBQqJIHfV7HZdCvEa8rK
 +mAStzLCX+lwmwIURwbvcSBEzAWSZeBGWsdtZMuM4+Y3l26AC2lrB2VSLnBMqouOVkWTkb8LMWM
 /m4MOWi9RADV1HTLoIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_234134_753102_24385028 
X-CRM114-Status: GOOD (  21.69  )
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

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..76440f2497b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to identify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Songwei Chai <songwei.chai@oss.qualcomm.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,tgu
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+    };
+...
-- 
2.34.1


