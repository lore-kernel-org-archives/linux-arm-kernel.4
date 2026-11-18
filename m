Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DCB606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 07:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b5EBMvAT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l5Jn+c3L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FxN2gFwC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=; b=b5EBMvATZ/Pg5s
	V+pq0N8BeQvhmv1OwXPMC3Fq7S277DRLFteNhpD1hIaM5VQ0I2Zg8KtMlZnTl8Msn3NBzkpqQrMTO
	pQuT8BjqaP1JcnCHVoahXU/bgjpJ9U13wApbuI0neo5bPkEH0sL9R3OlWWq5X3W+koUvWDGCmOhZZ
	HIrgm7Ru36osNNm3SNMer/LrTUsM7HgseYzyOsKu4qr7iESteUTTf/LKoZ2uRDY/Mn9mCsNW+ciqU
	1O2V5ST32bIWdotVsRMK5rsmELCLjmlwa7Om5lRWsFuQKDUEE+Ed9YKGAPCfFQ2OfhbiJV3D1sFeI
	DLQlEvkPKzgw1qfMGV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZhg-00000007xq0-3AJV;
	Wed, 18 Nov 2026 07:03:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZhe-00000007xp9-1HIA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 07:03:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1t41430590
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=; b=l5Jn+c3Lbvj79i1y
	26zcJSCI+fpe//GE1FNW8WYQBNsA+DE6eNgrbBl19vLEgJDzVE3dFgv02SFAR9vj
	LvcvlywwqXi3H3LjQvR9fy7kDb0p2sAinGgb124MRydFwkenJdcLPOIUCIKFYTb8
	jGbUW6l1gDkDExd9eRCgrjEvGzWD9iroHMSXMw728hejvbmFlGc64+HF8jXr+psV
	dOGrALCqa3TJutq+wZ9PBVu2+4x/L9tf7nzDnJq0MYL9dP7P2JnNimsHUgk20UNQ
	wplLK/G+VNRP3FEMthCB7cg25enSD9XQI/mIiLt0TKBp2m7f+NraTI7YKo+eaDyw
	8tQaOw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91qd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:03:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so10540745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 23:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985412; x=1795590212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=;
        b=FxN2gFwCUD7VfOSv60lyXb2VkxGykRaRK4WKwOE9Pc/AvmWHCYiXDkWjS33n7f9K/y
         slhRr0oRZSXLfmW6cQR9fKUktuW36gWxxhfgTsCuii0T+1Ex/f7qt2X8EwWShsGRDcRb
         F/KhhhQprxKhamuNw9+2ZG7iFJPOjx+HZJ30qsjNiAogACnlQxRXwhcbtEnqTiSFTkeM
         toYs1Gv0m8KXbhUuJFNCwa739cGlc03Hyq9un6xXxcnmuF1yoealUW/+zJGOgsd66J6a
         8z4WC70XvdyY9cdjNaLvtRjS7A82pg1qLv94x8W8QHU4p1o6RSJ9WEUCu8mL5OAwXWZM
         al5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985412; x=1795590212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=;
        b=XrdXwmRuMiwZt6q4sRZj1VTG4QHB6jw7p5l6Ngm+Hxoq6OEGEXd6sob57x8HQxe5vX
         2fXWZyM0do/pzsnaMf/WuzyPSYaooGR1/aLM32dfMmxR3oKSC1tD3qMTATT3xGvv66Lr
         jxVL5axRdIWfGWUN1qJsT/xENYbhQx6vH3noGSy5jgccurEoiLpdrm0p9aewRmul9LuC
         VIGTNE5XV3YDoSCtMTRv391AsE8Q/4dyKAeLwyuB9XSg+346THYcGmz/rl84+PZfJone
         c+rs2FtiyquiRlHLKeo93Lwkg9XkBXGB92Hf12g5VUbixbCu/9rNM0uHabxWmhm18B3T
         J9Mg==
X-Forwarded-Encrypted: i=1; AL+hErF/na5UKN/Rc5qWtuIyQcH1KUJrVyhlVrib06JxEdNTH8khk5K9Skj4fTG8xbwtjsCJ62JjXfcf98qygR0MmTvQ@lists.infradead.org
X-Gm-Message-State: APuU4Z80IlHjgVGaUZ+VEbnLYfHrDG5ZZV1UIHHVdhML/VyeE4gpQVj+
	FXNfd/AgQRqRYJ3RYm2lnDp33x3titpnLZ8Vlv+m0iLxa2bm/sWmTteayQ8U4ThMSxxl1ILCIqq
	b1N7CA52sOgAdPP/dAisivyGnfrFsUUHp4fmGwXij6jiRO/0hZJAvOVMZJXcwu3BWKQdvQM1wrg
	iNmTLYSU0o4pFV
X-Gm-Gg: AZFdTZeDWz8lA4BJwy/n6vwn9LIgKDuMir2REMdhf+7aogQBVkQFnFn63G45LcstqfR
	RHZKk1vMxLxZVZa1+ATXwXZ7LtmnJo8W3pRmlBT+2IrmQtMrtrjXK3l9wOZeVZC/ygBcGc5PVYb
	liBh7KdDS6u/lefbWqTVA6N8L9SF1bP8T34xVjXjomEHZHvBUvTTguTucj1HWuNKP8E7+/O43tY
	9k794P58uEblSX4b/lVhbtGyUratkYhanUMNfgNaHyMrIFNOLpj4GIIDZe7EHYbf7ANzlEEkK0Z
	tglimWTrfhkUaW4UkRH4O8HuxVPbSqkyU1CRq7dJiWjCiAz2GA+0/Gzss8aeL1K6cIiER3lUqE/
	qJnIIjTpXSwGD4IgxqBgYZBTfr6oFo/9JzNmFyadUkb5tW4wvr+fjjLXQijpEL2XVj757I+CMD8
	m8j2ETz/8s4hL8Pe6CtRJPp1bRGn3aI4cXvyUP
X-Received: by 2002:a17:902:e842:b0:2ed:45eb:51d2 with SMTP id d9443c01a7336-2eff753ebb5mr17146155ad.47.1794985412426;
        Tue, 17 Nov 2026 23:03:32 -0800 (PST)
X-Received: by 2002:a17:902:e842:b0:2ed:45eb:51d2 with SMTP id d9443c01a7336-2eff753ebb5mr17145685ad.47.1794985411966;
        Tue, 17 Nov 2026 23:03:31 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:31 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:43 +0800
Subject: [PATCH 1/4] dt-bindings: arm: coresight-tnoc: Allow
 arm,primecell-periphid
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-fix-tracenoc-probe-v1-1-0298dc5f05ac@oss.qualcomm.com>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=937;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=TeVraIqhbDFHZcEPeLmrE50XglecDEumWkgYuypCThA=;
 b=byINxjI5qiUFjrVT8Bd6ZQoPOic+g2n5taWi2o8FjBhnbse+GRwC2RK/L16P/24gQhz/+MsYT
 yuyGYk7udgmBt9gJSil/WahGpzjntj7Es9LQKr4S183cz/GRtlfCrHm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX70Uv21PKeCzM
 sgb+RGV/b805PHOflgJBoScYYDAKWUi03vBUHV9ycev8m23++ndn/SkJN3HgUxbvUbKcR4YlScR
 xirSmHCN53uRpRTh4b3smPOU3WKzn3nKP3408wWv90dsxv7ypseYzcXH9FkXLcn+UbfZ+638SA8
 p3CfrhUEBBDMpInSQUEAex7oNumz4AYIexxcngfvdYZY6pjjzeYola8ia4xzcH7k6eUYhnHD+GY
 KNCNPSjDFsTFHgygQtFGK0NjDqvu3YXVrET+B17px2ONOBrlDN9P8gThVfj9DDpBb4knhvU6Koh
 Qrbe9AjyFI8V+Fx1OX2rNqeB8fIKuANRsgL+5V/VCAWKRJxThDJAalYtSIh7vDsYu1/DKHA8Qqf
 5RV+WwIRgaHzVEhxqNwFXe7YyAgqw0+dTEAGKXt5MyMofTyaxrsjgiTVxRLtpATG7I9x0YJGPf9
 5c8CIC1YSi0+FsuAS/g==
X-Proofpoint-GUID: R9S4uqZN3oNDfn43vRIGR7GUFnqObT-6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX4sDxR2dgatlC
 Em2lNW6u62heA5tTsl3d0quRMrF4zAxncRnV6+5kCY4o6hO9DLk+GBTwA2rsDI0Ipl941fEjHwu
 iIBvsWSCqrCp/y/gU34XG7ywcdRPHfs=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd4dc5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bweLdJAXwlOP5iKYJ70A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: R9S4uqZN3oNDfn43vRIGR7GUFnqObT-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_230334_379065_1240DC2E 
X-CRM114-Status: GOOD (  13.26  )
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

Reference /schemas/arm/primecell.yaml and switch to
unevaluatedProperties so that the TNOC device accepts the common primecell
properties, including "arm,primecell-periphid", as the other CoreSight
devices do.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index 37147124449e..99ff8d30f34b 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -78,7 +78,10 @@ required:
   - in-ports
   - out-ports
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/arm/primecell.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.34.1


