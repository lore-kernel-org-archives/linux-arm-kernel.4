Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20332606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IwC3M1pr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ks5uzx72;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GcNSci0e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=; b=IwC3M1prdT95Ae
	hQnCBMjV9+Xl4u3taqKcsAWz9LN1QNlY56NM7Dvjvb0f3fRnJrrzUukjtTltw4IKXBfr1UYym1iBO
	ZRLtXy6ca1phPgtenme6ZWRL3EutRJHWlBMd9xSAJrUcsyimFVVWHvYsYMBAELa4lYtkR9Wbh26Fq
	xHSzCeVvoVhH6SyI4dbA4+3Q2zrFXNRNoXgxdUd+di5av3zbbUhTQ8SXCbe7uos5zwkngaVbIi5yl
	bV9gRj7YGdE0MwFbDfPJk0qDVFC5A9ZR5Qr6fzRMfb/LqTyqU9Sne8GAXV/AuHVkblNI2+H9FSOlW
	ickjtKp+zcOtrzfJ7GnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaZ3-0000000249x-1kuk;
	Tue, 10 Nov 2026 01:22:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYr-0000000242n-2ZX1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:22:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j2dV2828100
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=; b=ks5uzx72sfHyikhi
	PSIzhVv0Y9oG+Pw/MB4KISgSqt7mZFsVfdyYxO3jkdQJ5uCFIWRPyqSYrD0+o0Sf
	xwonhsBbjK2HcOGbJDSz0cT7tDvY53ca3WzgX0Bsbdm3KNVimOxpOm7XizwWqBYJ
	nsafU821axWY2OcVp/QRkkSF/DDd0OEYvYofDs55oiuYXSRS1btIZaDIAYQl2OfW
	kZg6cS0ak9GAlOBbnIEuJ5EwC4dBu4eXdprI/x53eF6D0NK45dLPz2f6GjLZ6fHC
	03D4TzCkgh42Z9wObg2ruF6L9Mzvy7IRxz5o2gsADbXnTIWa+Jj0b5QNEIswl3Jc
	k0tCYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qtnck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:22:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb2437d752so24088975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273728; x=1794878528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=;
        b=GcNSci0euTGiUueAv+ckduHOzzrcxMOxO77Fto/f2o2d2RN9fo9JzFtmgAIMY/2eTQ
         ofluc2PKXDz3yb3LhUre5/njIC9X/sSxQtV3CDNrzdyDG2wQtyDFdYIg+oCvVjJ6YscD
         oGnb3AZTHuKtw1tjbH585aqAcgp3PaT2r5c2cP7SC4ggvINQmAEARsz5tepbw5M8E7/T
         tDsAr9yaxYd60U/yQrgcORnfymCmNTgpsAvSa1hanzLaGVg3Yt0kOlQzJAwgaElXqrWd
         ZuuyxGBPEON40jzAYYESVjvowwwNVTFeOOhbYx3jK6voIsJx+sDM1jeq43al6qYkPzBJ
         FSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273728; x=1794878528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=;
        b=XmuNe1XGWHiM+Kw3U2m4UiOBMyDaHieaJni0cIFOrYiZikwYUnDIoE3Aa9CCDr/tp3
         FRpWbpDPAX4KAQz5I7g88i47djT58xYl4rw/d+cyX/v4RntC3ciDjtBdj63asE76qeWP
         v7EbkVloXPaOt3n9MR/grlMPofBZ73czGDjJGkDIKgVNlTpyS0DDtkQXUaSBhpXZOIae
         rUnXqszYdJzjNHnBnc8C+Z24UIKT9T0EHMUtwkTkp166wRPpiU1QHrAZzOrBWSuJT/S1
         +uKd1y9keJpCb1rmvLYq8NwTqOxxc4AunxOX+hZW1tPmVISjMMNfarfn0EmXgtZlU7KZ
         Rg1g==
X-Forwarded-Encrypted: i=1; AL+hErHH/xWoSRfhWrfXN6a/Xx2XPoYDlwlFnySSoJsZeGI0v8gfKrBovwp66VvyOEW0MMw/cSDu3gYNCUjodV02t8cw@lists.infradead.org
X-Gm-Message-State: APuU4Z8Oz0rbqoM+lF7P7QtB6mSAZJVloNrzmUggHrAbpJlHZGEJ6z6o
	+JBEnrm/QoMqOYgZpIp7NW7KZ0BKGN/p94DoDdlL0YISe5poVv2cR1vxvTZ0XI12AetI5Fq+zCO
	sIjNxpprfU6iYTmh4ISMbAP+Cs7nQ/QQQAVK14Ob5tWUxqg1t0URLF3dQiHt4/irBsKDl2RRXy9
	nMsQ==
X-Gm-Gg: AYBFou1TcGb7TUn/8aIjDuYE6TWzMUSw42UUttS0P0xTTJ9yW6hFVef2rM+SVvFvMT9
	KviA6Pt6H3WP68ET3KUjf5qTuAhdDFUGBlbqdGjqUmcpHZNkCdfx3FgZhjxgxRMfpXDpI3pcDP3
	6jJJznzjirNJhngnbD5/8oi3PtGuC6uBhfRkfVLgMFmpiRnA2qxulszZiaI3phz00ESkdiO3JBq
	cLMCGhKghf1aSrojPeRaQE90EruF2dHPAlnOeFf0Fgvq+DUMV78dAsmotWn5DUI2ChuFwQV1jyM
	vrzI0JE62kCNT6KwJJnPcb5BVSYCmLiDQBO2c9BImNF/c4854AToEjtfbmHWqpebNpTl3nk32vv
	hsWbHRIicXVXGWc1GsrpbzgCa9cVrWQniY4LLCmeUcxind3vwNb9vkUiYJfw4StY78StCGzR9t0
	cSyLTnrq5mJLfwRMUugkII7PdzzwBRfZA9b6g=
X-Received: by 2002:a17:902:ec8e:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2edb8f92cb5mr9829785ad.5.1794273728295;
        Mon, 09 Nov 2026 17:22:08 -0800 (PST)
X-Received: by 2002:a17:902:ec8e:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2edb8f92cb5mr9829585ad.5.1794273727903;
        Mon, 09 Nov 2026 17:22:07 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:22:07 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:18 +0800
Subject: [PATCH v7 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-5-2f06905c77fe@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273690; l=1759;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=rDavMIMltT2mlANTj80zr2Gtc/JIaNOjwXPyFgVLGy4=;
 b=qsRY1qzG5WPB4u2KTWjUNyIaRgus/vUYLvzSEQts5Yw5DwIacin+H9WhFx277CKwer9016nC9
 lMORX9mrWM8DzlfNouoyUmhfHmU4MmV7WywPUSacwz84NDiZYWAfUy3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX5sSXnImFUK4k
 fyf8mZhWbkU+8ll0VmHdjJXP9L5Fd4FK+ORcIQHnmyEbW9Zhc1wPmlOvNWvMnXw3AfP2x9rbozh
 lbNukaAkVQjkZgIC7XnlqP3vsC1CGFxJNFyKt7EqMduNCOdB/hsL6s6POplphTqKltkbclH7Aq4
 REhVmRBbPmDN0FlCtqqV0rVwAH52K+4ufpDNmkCgH5tvj3fLkEzM65IeGgwbKRFEfo0rlikY/Qe
 C6Y1vEAvX+fBYf1L7qfYnxsjLnBOgBsQ3NXtRl/o3PBOCd2ZzFdizrflk6WjAldETvObdTyZJKS
 cOUxR3hXXMBJvxhlwRYldPYv8MBuNWmPfvGzC4JiX8PUjp6zVtG6IVQZUIvwQMOlnJvQXzyeCdg
 h20K++z1PXTBDQJC/e4S6J24f86gjkUXHuzRTVF2/Q7mwrYJ7Ru8ry9dEnu0wHg6IVY6qafnCBc
 dYjW6wZkDqCXQbhZxgg==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af271c0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: _IKpDtfmeCflKU7QETgjf7qvmCxkGxhN
X-Proofpoint-ORIG-GUID: _IKpDtfmeCflKU7QETgjf7qvmCxkGxhN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX3u3igUui2zyE
 4to5tnvBSXwmL+r8MKEdJnYGUywck5OH2atIbHsQV2qSVTzrzX+Xe/IygTnf0y0+Sh/G1+CcZc2
 l97KaaODvOgHx6jZvRI+qZsAscpO1es=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_172209_683066_32C41114 
X-CRM114-Status: GOOD (  16.21  )
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

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It was marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
an ATID. As a result the aggregator had no trace ID and could not tag the
merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
the ATB sources within its subsystem (TPDMs and other ATB masters) and
forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-tnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..d94068aaa342 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -7269,12 +7269,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000 {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


