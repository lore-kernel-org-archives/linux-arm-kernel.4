Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ACA60A3810
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HkSJi9Y2;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1jPO6On;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBw+wI9m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=; b=HkSJi9Y23yiTR7
	4JEl2Tj9Eya18+aIxXp3NT2dHuQtO44nG9du52+UK6EOzZL2EaO1JoS8NYkQDmrxo33rFs/hzzTof
	AR/lU15UBxPPynkSDrzwFYI4BYPQfdoDrw1DRxOHxrjscgdEwJ6WCGvAtHbQV91sAHcXRYzySWudA
	Cp1njcSeVBLYukwNZLaiRUZJ6his0NcOKpWzkVzvtOEh2zp6UR/J8dOZGpJcDI/S7GTy8zNkOyas7
	hpoVHYHrwRobqyglDkil8KICd9vgRRajjiQfV+TVABbPfgVWp0C+PgkdFJ8bdaXFMn/a/qJOnnHcu
	y/l35SlSpc0Yxh9akJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYX-000000023qi-2Rdr;
	Tue, 10 Nov 2026 01:21:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYU-000000023qD-25oH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:21:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j5fJ1829540
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=; b=p1jPO6On48JanXFT
	4yaf1fBc21EJqjBXPey/FlyERlNs47OCky//WkyOr8qBcMHJm9pZx05M65oKFR94
	9pp56fv29jq7dyQaItr8OhmRlkL5pYIqkFS85kDtfWCbmVsxd6OseTWREmuyrMaH
	Q3glTqyO5ZQ/JMqHSJS16sTEpl0/0ykhhJWDofrzvRMXvsGUKwm1Apw29JJca4my
	6Szbx50Q/O3cUs4i22YUzIn4uYXUBW7RfB4os8JkZiV9hFuvnC5+iTv88kBgc70Z
	kDKr2b4b17KJQxTb2DPUCuKGR/GyF8KV5v9JrHfRwnY1puZrJJ6UK2CwTEcDDeX0
	Y7YS/w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5asw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:21:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e95f8543c9so21240685ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273704; x=1794878504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=;
        b=RBw+wI9mKQziBI33eMWUpiy9owdJRo58P7oKuOV3slZjSoQYfjUXRgFPEgWJYrKEqZ
         rVnb8RdS1o514IuXDxjKOIbEGh5JqwSvz6aWb8Aa1r7a6j76T11p/cZka0yjw7E4zgJf
         xQKl5a3h1VTeACBHcofFYRgUl2BUTeVwpRTCmGsxvxk+REkYrUroTL+gXAKWvibx7jaZ
         3fIeS6WIoex8iKyM1FO15GTOEa/UlzKcvAzp27AGr1PyfS5sGP8pcNzkEop56Dev9OfH
         qbCXsld3hslxcDeaMJuNubKLT/n0/NphuEemmgEn4JUa1RB8F7eQaULyRJblS4djzG06
         7fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273704; x=1794878504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OsmyLWTpTEekSmdchBDYkoo4OvvwuX662G1+ZK/wCY=;
        b=Ng0Qi+KNaD/JTl9sjhbL1Jg3E75/6S4JPQ+k/lyEy55ZKQp+Nt2YyxOWudxxnox78n
         l3qRO5/Vt03ifS82vgCxbeudPbXxrRp+ot1movZxr7PPd1BRoSAi4CranABP9CMJbe9I
         9VU5szsPkX4sfTjQzcfF1SdFF0ub+RgfEsET7T250TaqwRepgOZunHLnrSNrzhCRf4HO
         I/qAAJg3ii2fozgRcPWA5ANGMdSuB5SgTVut8/ju1ZDIdphVG/jcv7eSIenjR/Es3chd
         Mcr93UL6vDG9a5dPz7gQQ7PyOJhZj3oh3eEbYI5SknnBf7rSt3+nAUOQzlVZ/uBDjtCm
         oZfQ==
X-Forwarded-Encrypted: i=1; AL+hErG2GGBhD0WKyD3AqbDn18xya22DxfaGW6zZJMYapVqzt7NmoACtKOCTPFz8rhrvNnTN1nBCaMYcg3/46yunnPTH@lists.infradead.org
X-Gm-Message-State: APuU4Z/jTWQOgOKCJfg5b6bgAYPgbKejp4/PEiD1jnRW1S8WyAB79wle
	PwJJT70y4FyMrclxpDJwmgr3Pr2jKRSvUYH3CARmjs7lIlGMhI26oTeUJPiJ8azu6N50tBc8ChP
	XzUU6nIUiVoBR6GpVzkRPMm85rZhqxrmEhWjgIE1rE29X2HLpR+mNBMy4MJuZR0WdVtVT73I9W9
	DHCQ==
X-Gm-Gg: AYBFou36itEZloWrah6KmT637+DuqTmqR9qxSrW6sz+nIr5egqJu940S0sjit0j7gJw
	7zTBcYVdJvqll6oY7TnPueLxZzEhh+yMt0VtfmDgx/0vWAjEg3rSkHweHMInIoNvYlzyggN+xRW
	BoFHijAI1ag8tEoPfPU0ycfo155Y7YCGqvFKa1b9t+VbRnArbGWLqZyNXgBF6UoAK0H18g8hSYq
	Ej7K+TVxSvgeHJe9t4IxdhA8jhKANyXR6pgTx5txPObRXQTKBsIv6a4kEssBR+2VMjTV16Wg9dz
	JXHbVIVb5ozS6ulRx0Htr2nwNGwVBnTffn21clLvntw17Gz6cUmB7iVVDPE5QR33E51Wa23vtFI
	YWZ+ZDVvh/2a26fqxX/fFkduC0E3HirzhEv8mBVsXCfQ6SPdZpRCQ8KrwA2CyyXGNjJoRMWcGZV
	YkrZcF5T2gZ1HofnAGQNkKtknnoj9sJH3dqh0=
X-Received: by 2002:a17:903:370b:b0:2e6:7c6:8d40 with SMTP id d9443c01a7336-2edb9112334mr8824575ad.27.1794273703919;
        Mon, 09 Nov 2026 17:21:43 -0800 (PST)
X-Received: by 2002:a17:903:370b:b0:2e6:7c6:8d40 with SMTP id d9443c01a7336-2edb9112334mr8824235ad.27.1794273703462;
        Mon, 09 Nov 2026 17:21:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:21:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:14 +0800
Subject: [PATCH v7 1/5] dt-bindings: arm: coresight-tnoc: Bind on platform
 bus instead of AMBA
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-1-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273689; l=1976;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=2oxHkcQaQLeTvUlBWCfoatURBNLE9gB2lsW6YGYzHBI=;
 b=Gt3daX0ozggC7r0JYsXI4bbRCKxGFVnSXpJ65M7c6iDL5mtDLeNtwHK3Nkqy4uu8ntIqlojAQ
 XjWzMxsf+jZDHd6Gr2sxsnQ8RRbkmOCY2cccxVG2zxg5Qw7M5l9u+fx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: RCS3An8QkIC7m2QAMiyPaPsGnV7_AxHd
X-Proofpoint-GUID: RCS3An8QkIC7m2QAMiyPaPsGnV7_AxHd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXyiJ8fSyr9G+5
 jyG9iYARdX/atNn3VMXKY9FJjl7iION/InqyMxkM9MV6Cu96eUPjZHulx09dMIsgJy3W0dzyYYb
 3i2kFO8iwPmyx34hZnOhtCZ+xy/GYIs=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af271a9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vX9vLbfq_6l8qkBHxBYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX5Dduz2iv+GKk
 2F/iyvaynC5VF2evqlWT94y9U4Eau1vLvM3wv36yLh8j8ZbDf/iJrdaAQgLKRhAES7pObEgYcP+
 0dyHCRa6va3z26j2Adisuz8wRye1PDdXfxh8K7x0HDpo2NQpMfuY4lEwctDdb9nfC+iF+zUoNSf
 x8WSpgIRnbrh+hdA1IC7iPGKdM4rhnvDm/vYIztRgRCrOPawv9wwaZ+seepXxwsrgWaLe8SMBsj
 0SIIDhFcE+CO+IEX6Abwb8v2qRLMv/8aLi/Y0wf6FcnYxXRSVazJ6kQfJLTfosdMwHICok2rj9P
 KVpSix1iRjdlGHft4FfqoNHU/RR5I0//2MFkaruSdGz9XBohPz8eMd5c5Q/NUiPoppF1VR8p9S2
 kUWDYVVEXjV89CBOj3oDNxar8XxtEtfrDpPZy0/1oFjoyJQbO000CYrnKF8GUxd1hbAcVHdIn75
 OBs81acZgh0t93TmVUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_172146_662887_DE6DC3F3 
X-CRM114-Status: GOOD (  15.17  )
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

The Aggregator TraceNoC hardware exposes CID registers, but the Component
ID value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID. As a result, the device cannot be identified on the AMBA
bus.

Describe the Aggregator TraceNoC with a dedicated single
"qcom,coresight-tnoc" compatible instead of the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell". This creates the device on the
platform bus so it is bound by the platform driver through its compatible
string rather than as an AMBA device.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index 37147124449e..625801e3d3bb 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -22,24 +22,12 @@ description: >
 
   Note this binding is specifically intended for Aggregator TNOC instances.
 
-# Need a custom select here or 'arm,primecell' will match on lots of nodes
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - qcom,coresight-tnoc
-  required:
-    - compatible
-
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    const: qcom,coresight-tnoc
 
   reg:
     maxItems: 1
@@ -83,7 +71,7 @@ additionalProperties: false
 examples:
   - |
     tn@109ab000 {
-      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      compatible = "qcom,coresight-tnoc";
       reg = <0x109ab000 0x4200>;
 
       clocks = <&aoss_qmp>;

-- 
2.34.1


