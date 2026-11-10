Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF274606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=khbD8G4V;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dsq7N+Jh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AgTyG0xW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=; b=khbD8G4V6kchpY
	C56Z2XZlxrPo0z/zJ7TMYTinJCyVk6S56aWFHP6r7+xwhCfJt6+DX2y/z0RgLjXt1wj3jBqm0d003
	6lkO1dEuq3eLSdsNSEMiyf1fpq7kQWzbpJPW4o8ofoNrTyho+21JAVGJenNWlGO1F+/mmUIaJ0c7T
	RVyVAW60tZlgUVDam0svUPnMmiWRYDe+1ZimLIE2HUYCf3mA19at5e9xHZHvQiAk79DTaqhMHXFZ1
	/Uknigs1sqJhv0qUo+xI1sJq9wu17lWgG7yxcmkt6cWsDBl5hkq+7c/MJJ9v3e4XR+tMss9lTdb5v
	Hs/Xq7k748TQL+jmwFbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYt-0000000243T-0Sxc;
	Tue, 10 Nov 2026 01:22:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYn-0000000240W-21IN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:22:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jKsc1514170
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=; b=dsq7N+JhZMxNrVHK
	6avJUuU8XEYPugS+EB2pbkOQeq9tS8ttDck1z8A7L1yul5jIHwTYekIaQdUL40PM
	5eI1zQ7Zn+nK6BiIVKVz8tWTd/zaypIQ8N5bbHf5rgkxQVDtafCdPTSmUxmURJ1J
	KjhmyKGUZWn/ulqlrlAHJYFLr3fl/6OtYfnifwY2k8EMFHiJBofTPy6EHq3RDPXd
	jPPqImrLr8AOaCO1b751WfEFGQm+TQHi/XHnz/upu6dtqXArAYe96IN6nxNI6A5d
	1VJnk9K27deOwEpZ8s4ULqSRa06rFVVvkp28uUUvYyaR8O4yXJyuKLC/VRy2aqGk
	g+MFkw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydjwwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:22:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed02a00b24so14897335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273722; x=1794878522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
        b=AgTyG0xWqwZ6YCnnnSb0LGX4f2hbtzFVYv89EOqRX48s9fXkBUKkKL5TNHSbYyFIVs
         9e3YSnnOmv/ow+NhVp4UVVKaGeiDTmjuUCTqb+KkyyInshUmfNjxkj7jT0deusq4i0AJ
         pNUVRfiMeBU7HlOuNkBOpWUccsCEdRvYD9dtTUF/RMpP2Jrajsq6ZZ8iUviLt7P65EG5
         0d9933Y4AawYYaFEJVhZoxkuaeZpnfF8b4/3VRRIPceNFhlEb33Mxf66ebEm4E/h1LxT
         E5VLHLC16LVJR5d1+YN+RGcAuuZzolJhLTKg1pwmMSoekY4WpOypNisn7W0g+RpdxpTj
         4ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273722; x=1794878522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
        b=eslkApMO/q1Y5R7BP74U/6Y6WeWThmpdzsqB6jg7NBBd6KPMokM+C6LTOahedXZz/+
         tnIrxZMaaZnf9swYSDrpOzyZZNVP6Hub7bvn0Q3dHcNrJew7TRIZ4GuQMqvdnRqL2QCR
         4iZ1gYsxkA/Juk+r6rXKwG1M0S8mIlkFBQrZGQ5mtU+gEPhuBUy5cM/CzfhsuZ2JtSA7
         Zup9g5ybNKdYkWjsd9uCDWgWSoSkLurALQVFaiarVtFPgT8qc/yhH36LQZf4ZUDvpnIV
         Jhlt4sA0adFpZCFUjO408AsvFg9E1AA1+rK2q9yAurJ8+yyDOP4J/prp+PF+xTINWG9f
         Nb3A==
X-Forwarded-Encrypted: i=1; AL+hErHC0ICeegOoVE0oj4jJN1dkzj2rE7dj0LN4uumXAg0wHTWcjTtzxe+0R9JxCn/5zdtJJJUktBKnH94rWjbOpxDz@lists.infradead.org
X-Gm-Message-State: APuU4Z85bbkoH3KEhteig28Rh5LrB5/cAKwNg2rSByGKPAoS86rMCo/A
	DezTUfgyHR0wyUDHOZR9+R7RFTOOY3/eUQzusAx2OYN0MU3iBkxesnB30faSW10HneqXSrCIOKt
	7UmTHQ7Ftu9Tzsu11cBoGevkRv1pDlgkxKjinLcitriHwmhQEJHHra7ZrhbHqncqYfLM4usdl9u
	YzOA==
X-Gm-Gg: AYBFou0zjzotp2AWj6WUbPF27j0A+xcjqKbjfIXbgmPC+ljrji9QRHorfcAzMCAloV7
	Ii1tpaHKhcKRQpkKp16o6FisGB7g0aFW7j1L8z2cyqikQbbcFfugDGeyPAa83xSlLAgVY4A1W2/
	x4mVSQ5+bF4gJT+UvB+0sIGF/7tDwJOfeaDCFaVK4v17KJtArbSDNQDgpytOrlkjullNon9Pll3
	vfFoBASLb3wRjy0UeT+SoiWIjl/d5BhynmGmWctvytM4q+2Ez5LNFVRjnYfbKIsHfWrd/SNYvyk
	KwYMP+avPR20PeiecF44PosxKP5qY7EC9UDfbJiMDIf2v8ME1oEF3YXPrExD8hoaYpR+gUqCbuH
	Rj6gxTemvV0Wrv+bfLRhtJUQSQU/+xBDEw2TlFoI6jc7hTxPO54VTH0CR4eKNhpss7xsqrQoHA4
	PMZI/4qhQSS7JtGiLRGoT3vTU/+xWx4rP9ZAg=
X-Received: by 2002:a17:903:3708:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2edb8f95b9fmr9076515ad.1.1794273722126;
        Mon, 09 Nov 2026 17:22:02 -0800 (PST)
X-Received: by 2002:a17:903:3708:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2edb8f95b9fmr9076165ad.1.1794273721629;
        Mon, 09 Nov 2026 17:22:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:22:01 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:17 +0800
Subject: [PATCH v7 4/5] arm64: dts: qcom: sm8750: bind traceNoC on the
 platform bus
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-4-2f06905c77fe@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273690; l=1677;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=kZiNHGuoVNQkmFL0f1QJxaveTsNubLnCPGMK37H6F3U=;
 b=e3fMacKJRF3qjdJA+5qwXtZU3e/TGJVbSK8JjnWWrajul9wrlr2x33918PI81Yq/4MBAFZPAN
 GNkwgEpZYYAC0BEf8rSHydVrEwYZ7b9AW794RJSuX6CJPb9gfS1BoYv
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX6Yx8/djdvWjS
 AX+uLYyel0OmTWPGnTv7J0ApHirFpqZ3NF9GgidiZzY4jjinEWPEEuFlAK/3FRp1QvZFQ/xnrwm
 lJ9iq5yyKY7Fn8YqdTpqf1uujx+UuRM=
X-Proofpoint-GUID: eEXP5vL3dXtCS-GQQHKiLYMfss9f716q
X-Proofpoint-ORIG-GUID: eEXP5vL3dXtCS-GQQHKiLYMfss9f716q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXx4xFyw8oflOo
 UqISZbUaeL0lDXn4vQvBLtso+haaqwti1ipUf3gO0eOos968eJPhGDGXAXO9mWKpRvK/bFgC3sq
 3ZcgP/fozMBAUQYvlRxs0mrGSBwqSetUdrjpuctlbRsqW9qb8Ktwn0WRHagWF6h3xfsV/k0GCQA
 r4p719T+LluExgMuPbYYlPc8ifQ9fzX8P7fFLVI5g5kkV7/iH/NgPE0SyXMMLau2ASqQQVaQiBH
 j27iwtcKobPXCuMpcEsMy//EgWTTyZgZ18+Mmk9lnl9WZQVSFe6lIVwsaFt7E2o9AbXpzWd5BZV
 9JKCPWbjEChub6PfAjno7Q9INJVYRAUxB9gKe+yUTN7BLPxQW1c0Pib0hUV+mDLUT/dnwykMKhu
 iWQ0SXOfEGaFYkEjtkh3lRFLuUmfp8lqiRWHW+X7EX7narwbb+QrPd1L0qLfV62jZY9SFdHQgK5
 I08Xg5vEQ/Envzue+Ag==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af271bb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7Rut49xxg77_icr6qwgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_172205_655067_2B3DB069 
X-CRM114-Status: GOOD (  18.79  )
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

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..13f05c0d67f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5172,7 +5172,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


