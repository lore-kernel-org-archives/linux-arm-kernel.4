Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417AB606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XC/+0iO8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nd5VU569;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CMwjofbQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=; b=XC/+0iO8rYA1q9
	7Vt28vX535d0IFdaidqneeRb1KdhTO6Ea8JBc+xS/WBISz5cKAaWpy/xzIju11UCgSzUp2hqyv6bl
	GM7qGZrO2vnYRhqfMVHlM/3QhpDBFitD0ngoYbhtjNR2MsacXyIMXkJUnhlyY6GwkSpn5aP+y+KPN
	kXLQviCELW0sAfoPVfW4x56YWN3jIImqmtDcZIQiiY5nNKpL4YhEykGk1Gf+8f074v+oconHUOcs+
	W7QbkHySAQMCUjUFRq14f2p5BoucOrrDJ1GZuICuw0IaxWRsKeHk6Ceq55+QDTw1iZaXyfgjGEcSc
	/rUwDNv4sqpeiUwGanAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnsZ-00000006EyE-1NXH;
	Tue, 24 Nov 2026 10:36:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnsT-00000006Ewm-1SIQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:36:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8R8Rn902021
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 10:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=; b=nd5VU569i6ST0NY0
	II1edUrFRr1iX2Q9D584qXkfV2Axjo7BIEniltgtR4mF3gjdfj1GdIZ9XTt8Lpaz
	OwrwvTklgA4zObqZFRA8DOxZvDQeYqdRVdwCLVnzO52jAytYcPk1xJiqsg2ezA19
	Z0RcYyl6kbMiAm6GZptYl83Z+1Gy2OR5N4SI6bg2bMF9S3mqFPYwMVbinIx2jP5M
	8f7RD9YMouxEgKHpuGV8m9dmbs4isXXlf2TIf/Wuy2a7KktqXSVfsvMxi+pVO1fs
	t1h0zrEk65U3mWDb72Y/5cV5o01g6mMgRogarZqttqGezeV6+FfkaGQhgAN05n+1
	7nQ8Cg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6stswt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 10:35:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f02c63901aso40479675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 02:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516556; x=1796121356; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=CMwjofbQMyyS7lmSVUcPCWgtSzAFgG46+LjCCXXXV1OBRBM9mcTWmFMWM6XDaVcQkl
         D9kUCBx7xoubVWuBABR3G2kcTdwJfBzY7Ao/iCpbFy14iVPAg55T4HBf04h0UjG7lZSC
         O+h1cPxM9YjT0mHSnzrANJJXBH+N0nWuxcrvcfBxNI31+PwUOl4ggaIIOmFGe4pIXfeQ
         9YwCrPDzaCyIqjHR2MixHdjnw+ZvIXlzR/FIgbsuvdlpbkmFvMLAJjkFWtxkavnFcjwW
         aTKend9oydV/mrzRBT1JRLh9fZ1SekxJQwg/STK78dGZs2nflhC1d3LyPNX73ajk6N4T
         k/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516556; x=1796121356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=iTczMaFJ1XqPBR6ePTKvXW/vQ0cMxCGLTQIjyTB4b9aMO8k48ABCGFAIK1421LgBAn
         FLHT8rzAgHr8njT3xTcPWwonumjfk9BlpZCjaS9bUdcJBTOrLNVZvp+qH2ziJrvw0GAb
         5tNBEwbPcShO4rqpj8UmtrO7XCFjjsUmmLrGYfgiP58PJyRBRv9xXJglhF/PoukeAfEn
         l7FvROrnQ+1ttdQ3WeRsLOTGThoiLPrDtkoWdD52CpVR5LzG9dgevxfFLC7ERBtjLbof
         DrQ5QEb+I2+TxTxZ+NXPa1nz8YoG32PhJyyClAFf9cwHwGZg+WlHtlqFEZhQUa5FtnIE
         EU1w==
X-Forwarded-Encrypted: i=1; AL+hErFDcGzxpxuHxGxELhaz1OkiexafTSvbUz9VnR7jXiXcfl2TFaeVlk+MUji2MJyNIIiMrrO9RLb82vbTpcoyZ5j8@lists.infradead.org
X-Gm-Message-State: APuU4Z9B6fOv3d/R7pLbDpyHxNznOIUOJWWAdeyhXMKl7pTqxmlCw3yh
	YnQmR4E6B9Yv1cDPNxx10QtFIs0ONRyRIsn1Ty9CmLt9ddIceSg86dNNkvZaas1SeDQJnrrE3Cf
	XBWrR2QY+rPghiqnSxdVp3swBAVKxxN5zTSsMssn5jm4OJeg47Wf+KxRIdC3MMZQUT4Pplbrp9P
	VmGQ==
X-Gm-Gg: AZFdTZeD0gG5R4oVDbVx/RWUhTB9UeX7VLAfBYUS8tfBICgbhHI1L6ssOTJDFTt7bQR
	xu60Adu09KZqr2LrW2xi1918+XeCxlRkUxSSvgxDBB5b7MqUshl6GW54zZhuusukxAnoi24ahEn
	lDo0n9YbKywsf4cqmrYUV6iBcjUhWq6IE2eUzeSaQbFNo5O0hQYLfz7qgOiumK4aMLQ3yA1IhUk
	ESzKL/kZ48XUS6HHUUms7nSV+9MxhF8577S3rEd+BsYDkKULXvyTDtGVgVpPCfvzth8VOGI0wZu
	hfGyvLnAQd3gfpGWdL/BoqR8ujhW7J3k2zszwiRO84pPgzfxFhMRUwRvZhEWHCnrEtoFuoP/FkP
	OdXWRrqu1W8smg0LuKjbnyhelOgNLXDFE6sPtMj0XlF7u4yGV06hPLxQmWo4t5iic4y3UH6NxuW
	0bDpXafBbjx3Kl0/7xzRVKnyA6lJaIm28exnTS
X-Received: by 2002:a17:90b:1802:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b41c95b11cmr12857516a91.56.1795516556182;
        Tue, 24 Nov 2026 02:35:56 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b41c95b11cmr12857489a91.56.1795516555701;
        Tue, 24 Nov 2026 02:35:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b75f2a4sm9162295a91.2.2026.11.24.02.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:35:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:35:31 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Eliza
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-add-coresight-nodes-for-eliza-v2-1-48926f5a97ed@oss.qualcomm.com>
References: <20261124-add-coresight-nodes-for-eliza-v2-0-48926f5a97ed@oss.qualcomm.com>
In-Reply-To: <20261124-add-coresight-nodes-for-eliza-v2-0-48926f5a97ed@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795516545; l=884;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=vrGfhI/rONVr+SjVSKO84RzqNkfc3HgXrWPOpBP57L0=;
 b=0caFFdqMB0Cj5f06j5kjvuYYRRB9lDSECWCdXqZAUoJjs1ejhFw5J4Vpt0kBAudKlQ+GBnRh/
 EAsQXJjwKM8Cj+2qUCMpVKWU3zA96cA+6yxeb9RrduvwU9ZdPlWgJsn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: VG0YdPUZjikBtOkPEzqkV01U5-kXjXMm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MSBTYWx0ZWRfXzWQaCkaj2MI9
 fvG5ZmgYzWqiUWnfqFft0OJm9KpwqHs2t8lfyGduAQzYirGtYDa7mmOsvH6auWoiJpZ+fUmWyVI
 ix5J8v9q5AdV9nj3FuHoSq3tKZHkWnU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MSBTYWx0ZWRfX0edGDsnq4B23
 u/okH5qUreRFmMyvrsLfFF5UboVZF2LHG4XC4KyOSPfVr7Sg8VVNbW8Eegn+ZSKACtjEv/khy9B
 68DcUNoxJ4D7irCCZKHkB800iJZI5okH4n/A7g+xbZhNYWeynK8ePcz22l+jKVTGBpJGHHJJoxP
 Z2jSESyHOLkobA62CitVF5+Sp2MM2OSRT5zs8xu4+6KoumnfirUsdUX2ryYOWswaXjxeOEUOAyK
 ScCIRdEZ8ArgxuCW04CxiOr6bTkGDV6GEDTft3NQi07k9fNPQInsXsRjf4ynh4PZV1c8ceVV53O
 6WZhdEfpppcC442y3hG+q58+71THPidQTDdv0SdZQT0+DvIg6DWdwytuqtavrtNdNNSjUxsNB7s
 uF0xdCHAojaXZfBdj5UpD9/9IdRjVV96bHeXdIyNjnGCrLH7gjlFNbeWSfhfJ/NAQPfMtJILGXD
 +vnim+VlVmwjeJFQ98g==
X-Proofpoint-ORIG-GUID: VG0YdPUZjikBtOkPEzqkV01U5-kXjXMm
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b05688c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iCxfB9uofQ-l6sdUC70A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_023559_191985_9C67DA58 
X-CRM114-Status: GOOD (  12.60  )
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

The CTCU device for eliza shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for eliza to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..23b290c097f7 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,6 +29,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,eliza-ctcu
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu

-- 
2.34.1


