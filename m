Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D34606D809
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yUz9wXcn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpxvYk38;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dopG5sYe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=; b=yUz9wXcncMyYyG
	EU7tD1ajWGwnHkxcFPAz8Wzs1Opn7FX2t1u2MbxfaBQ9FdPHUFurAH2pEZlElmWfp37DXPo2PKcGa
	RbH+kXNuxox7lEsaCzqtLCgwm0ovzc4tS8ng3VX5/ZKUGtf7zX/kJPaVXpZJKaqTuxfu4ziMbHCGk
	3UUkvVU+0LWg3quj7Pqnh32iE89LJuWGOOYy+SazHhtAkkBZt4Pl75KPNbeR9+joHx6cY4ELiIWCo
	V0rQVTjxTcJ2pmpMBQyHLb317GBBTbKxTTovBIF4m+Tv8vIhzUiucWdDFBhRLihvlrnqeTTYd0Aq5
	jj9gISH0qUFEjJYhAL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMHw-00000000MG8-3iQw;
	Mon, 09 Nov 2026 10:07:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMHs-00000000MDH-17AQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:07:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99usgT550740
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 10:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=; b=BpxvYk38WwQFit5t
	MFSedYMf+M6QN4cY9tsRoTLUuEXXXias5NIYNgQDZSK4bjL9AGt9QMCGHJtab3tT
	kKWv7cFCV5TNdR0TcWWXQSUW3skkYk44cvXZAb0116+e5u1BNU4CENqYahNCZ2ji
	cUKyDGbgikgxNQ0kIsK2o4/cZf/KExK8EdAZjI9V5TgoMBv2Y5BvkEP0lQvaT5Ic
	ZdcVD4VVLybnO1Jp7a6gm0zL3lOQ7hvAD/AAVb3B/SD5cqBfImo61qjJv8k8ZzMv
	qmAKRsKYbSP3/zQejqt9G8pc4vkwDLpHIc6h2rUKD+ndJqJA5ZGplkMvz6Sj8Yy3
	X2x+Lw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2n6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 10:07:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1062815a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218858; x=1794823658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
        b=dopG5sYec/V2vTNypqzIXmnXd7HG5E3ufDK6Q7GbI+Tk1LheyTL5Y+tdjjE/ORr9T9
         h6X/wp/mPILu3PQI3TF3zEnuRs53cB+m1HBozofnk5L1/7Fuq79wvQ9ZUVybnAm48EiW
         VNfPw1UVFupNL7VPNLpxJDdJGuZxjkBNdvYaRYjSaOd+NrmSvX7bMs9p6cMB3WFUYIOL
         TRwraG0L320vTlA7Ln894+vjUxLplYIfo/gQxKBBlAstO/wbCwpRjb2pQNFhxRWGW1wC
         B/O09hF1AzmpHkAIxErq6tOjCybZ0uTxc8pU+RrEk7aDRNhLrNoVBSBJXQRA7JhQiJT/
         1m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218858; x=1794823658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
        b=xHgzvYq4nP4Cbl2qHhsvlnhvJY8jL1kNKhi5sJKVlC5yGIFDi3W5tWy8aCd7Obja3P
         4DDjzH6VJRhfzIO6nL79sqMAErmHfoMbRtR87Yy/rf3bzQegi297eE4nMME1Z3y8053n
         0lv4HRxX304oFhOJFZkw9pvTDmcw67NNmuIeHkgrctOZHN5p1t5mF9Sx9eI/gmbFMHLd
         pHr0ey2u7vkaRUtzE+IK/2UqkTOJYuTw+YGGWEfjdb2nMdy8mAl8JWv8PwIh8gVgNpIc
         Jf9WwCoET65UlseumgywqNP+kBpZqgFYQs5sKUXHXcLRcRbXqSgyMU35BJFQDYG81axf
         otSQ==
X-Forwarded-Encrypted: i=1; AL+hErHgwLF+bkDPtKX+d9RnCn7E73cAqO3wPsWfhCcknyKkqMQB0rdHZ2H/J9cBiEuUlaFAuUknU2G+5O2O8vWhuvOO@lists.infradead.org
X-Gm-Message-State: APuU4Z8v9fRd7LhzECoNqTIXrZCPSlF0sTP7NEwt84PfNBr0n2cGGdds
	NNqKahd1t43cCLMJAxYGSYf1KDKc3iryYy4+X/orm3kS1gF/r/DYvPSjhr4yotI0jURDSfzyaof
	ruf4U/IOJepdiFZ7qAJY20iHCZDnQSfa6OGK/GBskX7LedLgndCNXl/Kx5LVZ6Y3qEJLcLudbWW
	+Nxw==
X-Gm-Gg: AYBFou2zHTQWLT1DKpini/pgjgBJZ/U5SE1nKqjlUx79lLqPk2s1FW4CCdFq8UYdsJv
	eLULeefDYSrC5ath1gep3YtMThHzrlz2jx2/om2vHfh2AcalGuIwTkY+n935I9FnnbLDgXEd+ZX
	Yl8/dyx+HQn1+tFh2CP/anuDYKoNUFFt0oHcUTbxwnckXU6E1UYDC9WhmSuyxJRVw3SVG7lKwc5
	LMPyPX1JH58qlcV8BAiN/xuCQRMDf2xJZddfGJZBYpsaAP6WRPA53BUdNSyxLaHy3WNVbfLLyvZ
	zIodE/xo+sIszeFmmDXWS4hkrj0RfD0YXCzltj0ArEjWWAUGL2mJhiM5bcuwqudZ7IHMuKqhWlV
	j4HFvn5ps8wzBvagRLyTXk1M7iLp1hlYiMkoEZp80tny5Wi+L8Q8h4uOGb57MmzNflJiDpM/moV
	Sf9DavML9ELqhA8iEReaDEIEXedAss
X-Received: by 2002:a17:90b:4a4a:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b12d4c6db8mr3421403a91.36.1794218857999;
        Mon, 09 Nov 2026 02:07:37 -0800 (PST)
X-Received: by 2002:a17:90b:4a4a:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b12d4c6db8mr3421362a91.36.1794218857503;
        Mon, 09 Nov 2026 02:07:37 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:36 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:35 +0800
Subject: [PATCH v5 3/7] dt-bindings: arm: Add MPAM MSC binding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-3-150335a79381@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218816; l=3700;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=e/4WBMxVgry2cHgimqp2+MIUEtdd8lkn+3G7LQuRoRM=;
 b=f7oXCWEU+g/ZNdVHeD/l8+NR/IDH0Sl7swroTY77eRl2qzAAyGazVFI9LO/ffeLo635HtNwpP
 bhjjbeLvUOUB7vajoa9VGVl80HYysz7epaRiuR2ArhXChsm7QQ/KZhH
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX7ccEqhHl4cHA
 Eql/jPjcGcKqeQfQaSqLVgKUn5y8BZfx5O1YliMe3VkKaEO+hKOnZCtOrAj9aRrWH1T1uPQKzUb
 1sbYO95QrcOrAeEBiuh3fNKb0ARifoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX6wB5Rlqgt2H7
 P9RTukV2yJ9xHKKgW/5Q/rSAsHwRmpFVSmcmoImk00Za1Oiwm1KoSHA0m46cyIeQ6PTfa04jq/z
 BbMFlKcsegZLs7scmu7ID4gX6IILMYmhyqgSfrg2o8BDjN8GEu0IpmNaZE+zUfQBa/vZLU5iH7h
 ajYHQMesHzLxT/UVTYEHS2+TflvbvwY2STUViqmlvxU5eNUZ4rl5XwduPw+u0g0lruqZ/8c/JNS
 WtALpJ2v3gG/kdvpaSDrQoqfjo4r7OYEo72JdiojbjaPCedmfHE2byaoKDvjKti97MyBEzbZQay
 WVDw7kdBLbMwr+OcVpJHDM2jx5KAXUWR5mVghTl4JqLLNZGixMEAgdUnrGlEs8LrISx2+98oUtu
 zGYBX2MrLQ/Vv+jrMjTi+5RctXQN5ZzQQ4d864lH2JyKAaozhIcOYCp46l/YgusU/Tytiy1JDJ4
 7ydN/FViQLcLTnt3p3w==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af19b6b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UiIo4169r_Lw2UoxLg4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: XDgaqsmvXohitCyQSlxUeQmgb8ygcC_X
X-Proofpoint-ORIG-GUID: XDgaqsmvXohitCyQSlxUeQmgb8ygcC_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_020740_446260_565BBE49 
X-CRM114-Status: GOOD (  19.58  )
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

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will usually
be a sub-block of something else such as a memory controller or cache
controller. A memory-controller MSC may also stand on its own as a
top-level node, without being nested under a dedicated controller
node.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

This binding covers only the properties currently used in practice; it
can be extended as additional features are needed.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
  standalone arm,mpam-msc and the two-item combination; fix schema
  field order and yamllint spacing; reduce to minimal binding covering
  only properties in current use, dropping RIS child nodes, the
  explicit arm,mpam-device phandle form, cpus and interrupt-names;
  replace the memory-controller example with a new top-level one,
  showing the MSC as a direct child of the root node ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..b52599b47a1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+properties:
+  compatible:
+    oneOf:
+      - const: arm,mpam-msc                   # Further details are discoverable
+      - items:
+          - const: arm,mpam-memory-controller-msc
+          - const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+        reg = <0x0 0x30000000 0x0 0x2000>;
+        ranges = <0x0 0x30000000 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@0 {
+            compatible = "arm,mpam-msc";
+            reg = <0x0 0x2000>;
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+    ddr_msc: msc@40000000 {
+        compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
+        reg = <0x40000000 0x1000>;
+        arm,not-ready-us = <10>;
+    };
+
+...

-- 
2.34.1


